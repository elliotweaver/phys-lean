"""decomp_entry2 (run 58): for entry (i,j), test which atom-word associator-differences are
INDIVIDUALLY zero (provable standalone by ext;ring as a bounded lever) vs which must cancel
COLLECTIVELY. For the collective ones, find the minimal grouping (pairs/triples summing to 0)
so each group becomes ONE transport lever provable by ext;ring."""
from fractions import Fraction as F
from collections import defaultdict
import sys, itertools, random
# exact Zorn model
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
rng=random.Random(2024)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))

# free-algebra entry to get the monomial structure (reuse decomp_entry's machinery)
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
def flat(m):
    if isinstance(m,str): return (m,)
    return flat(m[0])+flat(m[1])

# evaluate a free monomial in Zorn given a var->Z map
def ev(m, env):
    if isinstance(m,str): return env[m]
    return zmul(ev(m[0],env), ev(m[1],env))
def ev_vec(vec, env):
    r=zzero()
    for m,c in vec.items():
        t=ev(m,env)
        r=zadd(r, Z(c*t.a, vscal(c,t.v), vscal(c,t.w), c*t.b))
    return r
def vec_is0(vec, trials=200):
    for _ in range(trials):
        env={s:rndZ() for s in ['a','b','c','p','A','B','C','P']}
        # enforce conjugate ties: A=star a etc
        for s in ['a','b','c','p']:
            env[CONJ[s]]=zstar(env[s])
        if not zis0(ev_vec(vec,env)): return False
    return True

i,j=int(sys.argv[1]),int(sys.argv[2])
E=D[i][j]
groups=defaultdict(dict)
for m,v in E.items():
    groups[flat(m)][m]=v
words=sorted(groups,key=str)
print(f"entry ({i},{j}): {len(words)} atom-word groups")
# each group as a vector
gvecs={w:dict(groups[w]) for w in words}
indiv=[]
for w in words:
    z=vec_is0(gvecs[w])
    indiv.append((w,z))
    print(f"  group {''.join(w)}: individually zero = {z}")
nz=[w for w,z in indiv if not z]
print(f"\n{len(nz)} non-individually-zero groups; searching minimal cancelling combos...")
# try pairs, triples summing to zero
for r in (2,3,4,5,6):
    found=False
    for combo in itertools.combinations(nz,r):
        # try all +-1 sign assignments
        for signs in itertools.product([1,-1],repeat=r-1):
            ss=(1,)+signs
            vec={}
            for s,w in zip(ss,combo):
                vec=add(vec,{m:s*c for m,c in gvecs[w].items()})
            if vec and vec_is0(vec):
                print(f"  CANCELS (r={r}): " + " ".join(f"{'+' if s>0 else '-'}{''.join(w)}" for s,w in zip(ss,combo)))
                found=True
                break
    if found and r>=2: pass
print("done")
