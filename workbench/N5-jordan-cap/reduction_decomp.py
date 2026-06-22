"""reduction_decomp (run 62): find the STRUCTURAL decomposition of the central-diagonal
reduction jdef(Hm)(Hm) = jdef(Xz)(Xz) that minimizes the alternativity burden.

Model A: scalars central, octonions FREE non-associative (alternativity FAILS).
Model B: exact split-octonion Zorn (alternative + composition).

We test a LADDER of sub-claims to locate exactly which pieces hold by centrality alone
(provable cheap, Model A zero) vs which need alternativity (Model B zero only). Strategy:
peel the diagonal in BOTH arguments via additivity + per-piece vanishing, isolating the
smallest associator-needing core.

Sub-claims (A = Hm with diagonal D + offX; B = Hm with diagonal E + offY):
 (1) jdef(D+X, E+Y) - jdef(D+X, E) - jdef(D+X, Y)            [add_right: 2nd arg, EXACT-additive, =0 both models]
 (2) jdef(D+X, E)                                            [2nd arg purely central diagonal]
 (3) jdef(D+X, Y) - jdef(X, Y)                               [drop central D in 1st arg, 2nd arg zero-diag]
 (4) jdef(X, Y)                                              [the banked core]
So jdef(Hm,Hm) = (2) + [jdef(X,Y) via (3)] given (1). Test (2) and (3) in both models.
"""
from fractions import Fraction as F
import random
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
def zsc(c,x): return Z(c*x.a,vscal(c,x.v),vscal(c,x.w),c*x.b)
def zmul(x,y):
    a=x.a*y.a+dot(x.v,y.w)
    v=vadd(vadd(vscal(x.a,y.v),vscal(y.b,x.v)),vscal(F(-1),cross(x.w,y.w)))
    w=vadd(vadd(vscal(y.a,x.w),vscal(x.b,y.w)),cross(x.v,y.v))
    b=x.b*y.b+dot(x.w,y.v)
    return Z(a,v,w,b)
def zstar(x): return Z(x.b,vscal(F(-1),x.v),vscal(F(-1),x.w),x.a)
def zis0(x): return x.a==0 and x.b==0 and all(c==0 for c in x.v) and all(c==0 for c in x.w)
def zscalar(t): return Z(F(t),(F(0),)*3,(F(0),)*3,F(t))
rng=random.Random(7)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def mz(n): return [[zzero() for _ in range(n)] for _ in range(n)]
def madd(*Ms):
    n=len(Ms[0]); R=mz(n)
    for M in Ms:
        for i in range(n):
            for j in range(n): R[i][j]=zadd(R[i][j],M[i][j])
    return R
def mneg(A): return [[zsc(F(-1),x) for x in row] for row in A]
def msub(A,B): return madd(A,mneg(B))
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=zzero()
            for k in range(n): s=zadd(s,zmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def miszero(A): return all(zis0(A[i][j]) for i in range(len(A)) for j in range(len(A)))
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))
def Dpart(d): return [[zscalar(d[0]),zzero(),zzero()],[zzero(),zscalar(d[1]),zzero()],[zzero(),zzero(),zscalar(d[2])]]
def Xpart(o): a,b,c=o; return [[zzero(),a,b],[zstar(a),zzero(),c],[zstar(b),zstar(c),zzero()]]

c2=c3=0
n=300
for _ in range(n):
    dD=[rng.randint(-3,3) for _ in range(3)]; dE=[rng.randint(-3,3) for _ in range(3)]
    X=Xpart(tuple(rndZ() for _ in range(3))); Y=Xpart(tuple(rndZ() for _ in range(3)))
    D=Dpart(dD); E=Dpart(dE); DX=madd(D,X)
    # (2) jdef(D+X, E) : second arg purely central diagonal
    if not miszero(jdefM(DX, E)): c2+=1
    # (3) jdef(D+X, Y) - jdef(X, Y) : drop central D in 1st arg, 2nd arg zero-diagonal
    if not miszero(msub(jdefM(DX, Y), jdefM(X, Y))): c3+=1
print(f"Zorn(exact, alternative) over {n} samples:")
print(f"  (2) jdef(D+X, E)=0           [2nd arg central diag]   : nonzero count = {c2}")
print(f"  (3) jdef(D+X, Y)=jdef(X,Y)   [drop 1st-arg central D] : nonzero count = {c3}")
