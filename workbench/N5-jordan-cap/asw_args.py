"""asw_args (run 58): print the EXACT asw(x,y,z) argument triples for each cancelling pair
of a given entry, so the Lean linear_combination can be written precisely.
For each atom-word group g (= 2*(br1 - br2) = an associator [u,v,w]), and we pair them.
We directly fit each entry as sum_k 2*asw(x_k,y_k,z_k) by matching."""
from fractions import Fraction as F
from collections import defaultdict
import sys, itertools, random
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd(u,v): return tuple(u[i]+v[i] for i in range(3))
def vscal(s,u): return tuple(s*u[i] for i in range(3))
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd(x.v,y.v),vadd(x.w,y.w),x.b+y.b)
def zsub(x,y): return Z(x.a-y.a,tuple(x.v[i]-y.v[i] for i in range(3)),tuple(x.w[i]-y.w[i] for i in range(3)),x.b-y.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
rng=random.Random(7)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def asw(x,y,z):
    return zadd(zsub(zmul(zmul(x,y),z), zmul(x,zmul(y,z))),
                zsub(zmul(zmul(z,y),x), zmul(z,zmul(y,x))))

# build entry value as a Zorn function of (a,b,c,p)
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def fmul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
CONJ={'a':'A','b':'B','c':'C','p':'P'}
for k,v in list(CONJ.items()): CONJ[v]=k
def star_mon(m):
    if isinstance(m,str): return CONJ[m]
    l,r=m; return (star_mon(r),star_mon(l))
def fstar(x): return {star_mon(m):v for m,v in x.items()}
def E_(x): return {x:F(1)}
Z0={}
def mzero(): return [[dict(Z0) for _ in range(3)] for _ in range(3)]
def madd(A,B): return [[add(A[i][j],B[i][j]) for j in range(3)] for i in range(3)]
def mmul(A,B):
    C=mzero()
    for i in range(3):
        for j in range(3):
            s=dict(Z0)
            for k in range(3): s=add(s,fmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Xz(o01,o02,o12):
    z=lambda s: E_(s) if s else dict(Z0)
    return [[dict(Z0), z(o01), z(o02)],
            [fstar(E_(o01)) if o01 else dict(Z0), dict(Z0), z(o12)],
            [fstar(E_(o02)) if o02 else dict(Z0), fstar(E_(o12)) if o12 else dict(Z0), dict(Z0)]]
A=Xz('a','b','c'); Bm=Xz('p',None,None)
D=jdef(A,Bm)
def ev(m,env):
    if isinstance(m,str): return env[m]
    return zmul(ev(m[0],env),ev(m[1],env))
def ev_vec(vec,env):
    r=zzero()
    for m,c in vec.items():
        t=ev(m,env); r=zadd(r,Z(c*t.a,vscal(c,t.v),vscal(c,t.w),c*t.b))
    return r
def entry_val(i,j,env): return ev_vec(D[i][j],env)

# candidate asw arg atoms: leaves and their products (built from env)
def build(expr,env):
    # expr is a nested tuple of leaf names / 'S'+leaf for star
    if isinstance(expr,str):
        if expr.startswith('S'): return zstar(env[expr[1:]])
        return env[expr]
    return zmul(build(expr[0],env),build(expr[1],env))

i,j=int(sys.argv[1]),int(sys.argv[2])
# candidate single-leaf-or-conj args and degree-2 compound args
leaves=['a','b','c','p','Sa','Sb','Sc','Sp']
comps=[(x,y) for x in leaves for y in leaves]
cand=leaves+comps
# search: find a small set of asw(x,y,z) (with 2x coeff) summing to entry.
# Greedy/randomized: try all triples whose total degree = 4 and see which match a sub-part.
# Simpler: we KNOW entry(0,1)=2*(asw(a,Sp,b*Sc)+asw(?)+asw(?)). Just brute search triples of degree summing 4.
def deg(e):
    if isinstance(e,str): return 1
    return deg(e[0])+deg(e[1])
trip=[]
for x in cand:
    for y in cand:
        for z in cand:
            if deg(x)+deg(y)+deg(z)!=4: continue
            trip.append((x,y,z))
# evaluate target and each asw over a few random envs, solve linear system over rationals via pivot
import itertools as it
def envgen():
    env={s:rndZ() for s in ['a','b','c','p']}
    for s in ['a','b','c','p']: env['S'+s]=zstar(env[s]); env[CONJ[s]]=zstar(env[s])
    return env
# represent each asw and target as a long coordinate vector over many envs
ENVS=[envgen() for _ in range(40)]
def covec(fn):
    out=[]
    for env in ENVS:
        z=fn(env); out+= [z.a,z.b]+list(z.v)+list(z.w)
    return out
tgt=covec(lambda env: entry_val(i,j,env))
# build asw covectors lazily; incremental pivot to express tgt
rows=[]; names=[]
for (x,y,z) in trip:
    rows.append(covec(lambda env,x=x,y=y,z=z: asw(build(x,env),build(y,env),build(z,env))))
    names.append((x,y,z))
# solve tgt = sum c_k rows[k] by least-pivot Gaussian over Q
import numpy as np  # use float pivot to FIND support, then verify exact
Amat=np.array(rows,dtype=float).T
b=np.array(tgt,dtype=float)
# least squares + round
sol,res,rk,sv=np.linalg.lstsq(Amat,b,rcond=None)
support=[(names[k],round(sol[k],3)) for k in range(len(names)) if abs(sol[k])>1e-6]
print(f"entry ({i},{j}): lstsq residual={res if len(res) else 'NA'}, support size={len(support)}")
for nm,c in sorted(support,key=lambda t:-abs(t[1]))[:20]:
    print(f"   {c:+}  asw{nm}")
