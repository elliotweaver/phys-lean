"""reduce_rewrite: prove each jdef H3 entry = 0 by a REWRITING system that uses ONLY
operations portable to Lean as rewrites with the banked lemmas:
  (R1) alternativity normal form: we DON'T pick a normal assoc; instead we use the
       associator-alternating laws as needed.
  (R2) Cayley-Hamilton (degree lowering): replace any subterm  x*x  by  Tx*x - Nx
       where Tx=x+star x (central), Nx=x*star x (central real). Applied to atoms.
  (R3) centrality: trace Tx, norm Nx, bilinear Bxy=x*star y+y*star x are CENTRAL & REAL,
       so they commute & associate freely.

Goal: confirm the FULL entry reduces to 0 under these, and emit the move sequence.
We model the algebra with EXACT Zorn octonions for VALIDATION at each step (so the
rewrite system is provably sound), and track structure symbolically.

Simplest faithful approach: just confirm that the identity
    jdef(A,B) = 0
holds and that the THREE ingredient-classes (alt, CH, centrality) are individually
SOUND in the model — then the Lean proof is `linear_combination` over the ASSOCIATOR
basis AFTER CH-rewriting all squares. Test: after replacing every a*a-type square via
CH, does the residue lie in the alt-law span?
"""
from fractions import Fraction as F
from collections import defaultdict
import random, time

# ===== exact Zorn model for soundness validation =====
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
rng=random.Random(2024)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))

# ===== symbolic free algebra (tree monomials) =====
STAR={'a':'A','b':'B','c':'C','p':'P','q':'Q','r':'R'}
for k,v in list(STAR.items()): STAR[v]=k
def is_leaf(m): return isinstance(m,str)
def star_tree(m):
    if is_leaf(m): return STAR[m]
    l,r=m; return (star_tree(r),star_tree(l))
def add(*xs):
    r=defaultdict(F)
    for x in xs:
        for m,v in x.items(): r[m]+=v
    return {m:v for m,v in r.items() if v!=0}
def neg(x): return {m:-v for m,v in x.items()}
def sub(x,y): return add(x,neg(y))
def mul(x,y):
    r=defaultdict(F)
    for mx,cx in x.items():
        for my,cy in y.items(): r[(mx,my)]+=cx*cy
    return {m:v for m,v in r.items() if v!=0}
def E(m): return {m:F(1)}
ZERO={}
def mz(n): return [[dict(ZERO) for _ in range(n)] for _ in range(n)]
def madd(A,B): n=len(A); return [[add(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=dict(ZERO)
            for k in range(n): s=add(s,mul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def mneg(A): return [[neg(x) for x in row] for row in A]
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdef(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Hm_zero(off):
    o01,o02,o12=off
    return [[dict(ZERO), E(o01), E(o02)],
            [E(STAR[o01]), dict(ZERO), E(o12)],
            [E(STAR[o02]), E(STAR[o12]), dict(ZERO)]]

A=Hm_zero(('a','b','c')); B=Hm_zero(('p','q','r'))
D=jdef(A,B)

# ===== evaluation in Zorn (for soundness) =====
VAL={}
def fresh_vals():
    VAL.clear()
    for L in 'abcpqr':
        VAL[L]=rndZ(); VAL[L.upper()]=zstar(VAL[L])
def ev(tree):
    if is_leaf(tree): return VAL[tree]
    return zmul(ev(tree[0]),ev(tree[1]))
def evx(x):
    t=zzero()
    for m,c in x.items(): t=zadd(t, zsc(c, ev(m)))
    return t

# sanity: each entry is zero in model
fresh_vals()
print("entries zero in Zorn model:", all(zis0(evx(D[i][j])) for i in range(3) for j in range(3)))
