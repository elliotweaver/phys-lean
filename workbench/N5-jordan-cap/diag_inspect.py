"""diag_inspect (run 50): the FULL Hm with CENTRAL REAL diagonals (ocR d_i), not the
zero-diagonal model all prior workbench used. Two jobs:
  (1) NUMERIC: confirm jdef(Hm,Hm)=0 in the exact Zorn octonion model with random real
      diagonals + random octonion off-diagonals (the target is a THEOREM for the real
      carrier, not just the zero-diag stand-in).
  (2) STRUCTURE: per independent entry (3 diag + 3 off-diag), count monomials and
      atom-multisets, separating by how many central-diagonal scalars each monomial
      carries (degree in d/e). Diagonal scalars are CENTRAL: a monomial with k diagonal
      factors = (scalar) * (octonion word of degree 4-k in off-diagonals). Lower octonion
      degree = structurally simpler. This shows which entries are cheapest.
"""
from fractions import Fraction as F
from collections import defaultdict
import random

# ===== exact Zorn split-octonion model (alternative, composition) =====
def dot(u,v): return u[0]*v[0]+u[1]*v[1]+u[2]*v[2]
def cross(u,v): return (u[1]*v[2]-u[2]*v[1],u[2]*v[0]-u[0]*v[2],u[0]*v[1]-u[1]*v[0])
def vadd(u,v): return tuple(u[i]+v[i] for i in range(3))
def vscal(s,u): return tuple(s*u[i] for i in range(3))
class Z:
    __slots__=('a','v','w','b')
    def __init__(s,a,v,w,b): s.a=a;s.v=v;s.w=w;s.b=b
def zzero(): return Z(F(0),(F(0),)*3,(F(0),)*3,F(0))
def zadd(x,y): return Z(x.a+y.a,vadd(x.v,y.v),vadd(x.w,y.w),x.b+y.b)
def zsc(c,x): return Z(c*x.a,vscal(c,x.v),vscal(c,x.w),c*x.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
def zscalar(t): return Z(F(t),(F(0),)*3,(F(0),)*3,F(t))  # real central scalar t*1
rng=random.Random(7)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))

def mz(n): return [[zzero() for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[zadd(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mneg(A): return [[zsc(F(-1),x) for x in row] for row in A]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=zzero()
            for k in range(n): s=zadd(s,zmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

def Hm(diag, off):
    d0,d1,d2=diag; a,b,c=off
    return [[zscalar(d0), a, b],
            [zstar(a), zscalar(d1), c],
            [zstar(b), zstar(c), zscalar(d2)]]

# (1) NUMERIC validation on the REAL carrier
ok=True
for _ in range(200):
    dA=[rng.randint(-3,3) for _ in range(3)]; dB=[rng.randint(-3,3) for _ in range(3)]
    a,b,c,p,q,r=[rndZ() for _ in range(6)]
    A=Hm(dA,(a,b,c)); B=Hm(dB,(p,q,r))
    D=jdefM(A,B)
    if not all(zis0(D[i][j]) for i in range(3) for j in range(3)): ok=False; break
print("(1) jdef(Hm,Hm)=0 on the REAL-diagonal carrier (Zorn, 200 random samples):", ok)

# control: octonion (non-real) diagonal should FAIL
def Hm_oct(diagZ, off):
    a,b,c=off
    return [[diagZ[0], a, b],[zstar(a), diagZ[1], c],[zstar(b), zstar(c), diagZ[2]]]
badcount=0
for _ in range(50):
    dZ=[rndZ() for _ in range(3)]; dZ=[zadd(x,zstar(x)) if False else x for x in dZ]
    a,b,c,p,q,r=[rndZ() for _ in range(6)]
    A=Hm_oct(dZ,(a,b,c)); B=Hm_oct([rndZ() for _ in range(3)],(p,q,r))
    D=jdefM(A,B)
    if not all(zis0(D[i][j]) for i in range(3) for j in range(3)): badcount+=1
print("(2) control: octonion (non-real) diagonal FAILS jdef=0 in", badcount, "/50 samples (want >0)")

# ===== symbolic structure with CENTRAL diagonal scalars =====
# off-diagonal generators a,b,c,p,q,r (free, non-assoc, with star); diagonals d0..,e0.. central.
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
DIAG={'d','e','f','g','h','k'}  # d0->'d',d1->'e',d2->'f', e0->'g',e1->'h',e2->'k' (central, self-star)
def is_leaf(m): return isinstance(m,str)
def is_diag(m): return is_leaf(m) and m in DIAG
def star_tree(m):
    if is_leaf(m): return m if m in DIAG else STAR[m]
    l,r=m; return (star_tree(r),star_tree(l))
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def E(m): return {m:F(1)}
ZERO={}
def smz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def smadd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def smmul(A,B):
    n=len(A); C=smz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def smneg(A): return [[neg(x) for x in row] for row in A]
def sjb(A,B): return smadd(smmul(A,B),smmul(B,A))
def sjdef(A,B):
    AA=sjb(A,A); return smadd(sjb(sjb(A,B),AA), smneg(sjb(A,sjb(B,AA))))
def sHm(diag, off):
    d0,d1,d2=diag; o01,o02,o12=off
    return [[E(d0), E(o01), E(o02)],
            [E(STAR[o01]), E(d1), E(o12)],
            [E(STAR[o02]), E(STAR[o12]), E(d2)]]
A=sHm(('d','e','f'),('a','b','c')); B=sHm(('g','h','k'),('p','q','r'))
D=sjdef(A,B)
def leaves(m,acc):
    if is_leaf(m): acc.append(m)
    else: leaves(m[0],acc); leaves(m[1],acc)
def octdeg(m):  # number of off-diagonal (non-central) leaves
    acc=[]; leaves(m,acc); return sum(1 for x in acc if x not in DIAG)
print("\n(3) per-independent-entry structure of jdef(Hm,Hm) WITH central real diagonals:")
for (i,j),name in [((0,0),'diag00'),((1,1),'diag11'),((2,2),'diag22'),
                   ((0,1),'off01'),((0,2),'off02'),((1,2),'off12')]:
    E_=D[i][j]
    bydeg=defaultdict(int)
    for m,c in E_.items(): bydeg[octdeg(m)]+=1
    sigs=set()
    def msig(m):
        acc=[]; leaves(m,acc); return tuple(sorted(x for x in acc if x not in DIAG))
    for m in E_: sigs.add(msig(m))
    print(f"  {name} ({i},{j}): {len(E_)} monomials, octonion-degree histogram {dict(sorted(bydeg.items()))}, distinct off-diag multisets {len(sigs)}")
