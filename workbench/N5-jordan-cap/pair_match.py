"""pair_match (run 59): for each BB1 entry, get LITERAL bracketed monomials, then find a
perfect matching into pairs (m_i, m_j) with m_i + m_j = 0 OR m_i - m_j = 0 in the faithful
Zorn model. Each such pair is a 2-monomial degree-4 identity = a bounded `ext;ring` lever.
If the entry's monomials perfectly match into such zero-pairs (respecting their entry
coefficients), the entry closes as linear_combination of those pair-levers."""
from fractions import Fraction as F
from collections import defaultdict
import sys, random, itertools

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

# free-algebra entry to get literal monomials with coeffs
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

rng=random.Random(99)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def ev(m, env):
    if isinstance(m,str): return env[m]
    return zmul(ev(m[0],env), ev(m[1],env))
# precompute Zorn value of each monomial across N envs
def monvals(mons, N=40):
    envs=[]
    for _ in range(N):
        env={s:rndZ() for s in ['a','b','c','p']}
        for s in ['a','b','c','p']: env[CONJ[s]]=zstar(env[s])
        envs.append(env)
    vals={}
    for m in mons:
        vals[m]=tuple(ev(m,e) for e in envs)
    return vals,envs
def vzero(vs): return all(zis0(v) for v in vs)
def vsub(va,vb): return tuple(zsub(a,b) for a,b in zip(va,vb))
def vadd_(va,vb): return tuple(zadd(a,b) for a,b in zip(va,vb))
def vscalc(c,va): return tuple(Z(c*z.a,vscal(c,z.v),vscal(c,z.w),c*z.b) for z in va)

def mstr(m):
    if isinstance(m,str): return m
    return "("+mstr(m[0])+mstr(m[1])+")"

i,j=int(sys.argv[1]),int(sys.argv[2])
E=D[i][j]
mons=list(E.keys())
print(f"entry ({i},{j}): {len(mons)} literal monomials, coeffs={sorted(set(E.values()))}")
vals,envs=monvals(mons)
# verify entry sums to zero
tot=tuple(zzero() for _ in envs)
for m,c in E.items(): tot=vadd_(tot, vscalc(c,vals[m]))
print("  entry total zero:", vzero(tot))
# find zero-summing pairs: c_i*m_i + c_j*m_j = 0  (coefficients from E)
mc=list(E.items())
n=len(mc)
adj=defaultdict(list)
for x in range(n):
    for y in range(x+1,n):
        m1,c1=mc[x]; m2,c2=mc[y]
        s=vadd_(vscalc(c1,vals[m1]), vscalc(c2,vals[m2]))
        if vzero(s):
            adj[x].append(y); adj[y].append(x)
# backtracking perfect matching into zero-pairs
def match(remaining):
    if not remaining: return []
    x=min(remaining)
    for y in adj[x]:
        if y in remaining:
            sub=match(remaining-{x,y})
            if sub is not None: return [(x,y)]+sub
    return None
res=match(frozenset(range(n)))
if res is None:
    print("  NO perfect 2-monomial zero-matching. Degrees:", {x:len(adj[x]) for x in range(n)})
else:
    print(f"  PERFECT MATCHING into {len(res)} zero-pairs:")
    for x,y in res:
        m1,c1=mc[x]; m2,c2=mc[y]
        print(f"    {c1:+}*{mstr(m1)}  {c2:+}*{mstr(m2)}   (= 0)")
