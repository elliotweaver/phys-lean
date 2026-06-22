"""central_split (run 50): THE REFRAME. The diagonal of Hm is CENTRAL (banked tr/nrm/ocR).
Write A = D + X (central diagonal D, zero-diagonal Hermitian off-part X), B = E + Y.
CLAIM: jdef(A,B) = jdef(X,Y) exactly. I.e. the central diagonal contributes NOTHING to the
Jordan defect (central elements act as scalars, scalars preserve the Jordan identity).
If TRUE, the entire H3 cap reduces to the SMALLER zero-diagonal core jdef(X,Y)=0, and the
reduction itself is provable in Lean from banked centrality (cheap). Test in exact Zorn.
Also test intermediate claims to know exactly which reduction lemmas Lean needs.
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
rng=random.Random(3)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def mz(n): return [[zzero() for _ in range(n)] for _ in range(n)]
def madd(*Ms):
    n=len(Ms[0]); R=mz(n)
    for M in Ms:
        for i in range(n):
            for j in range(n): R[i][j]=zadd(R[i][j],M[i][j])
    return R
def msub(A,B): n=len(A); return [[zsub(A[i][j],B[i][j]) for j in range(n)] for i in range(n)]
def mscal(c,A): return [[zsc(c,x) for x in row] for row in A]
def mneg(A): return mscal(F(-1),A)
def mmul(A,B):
    n=len(A); C=mz(n)
    for i in range(n):
        for j in range(n):
            s=zzero()
            for k in range(n): s=zadd(s,zmul(A[i][k],B[k][j]))
            C[i][j]=s
    return C
def miszero(M): return all(zis0(M[i][j]) for i in range(len(M)) for j in range(len(M)))
def jb(A,B): return madd(mmul(A,B),mmul(B,A))
def jdefM(A,B):
    AA=jb(A,A); return madd(jb(jb(A,B),AA), mneg(jb(A,jb(B,AA))))

def Dpart(diag): d0,d1,d2=diag; return [[zscalar(d0),zzero(),zzero()],[zzero(),zscalar(d1),zzero()],[zzero(),zzero(),zscalar(d2)]]
def Xpart(off):
    a,b,c=off; return [[zzero(),a,b],[zstar(a),zzero(),c],[zstar(b),zstar(c),zzero()]]
def Hm(diag,off): return madd(Dpart(diag),Xpart(off))

ok_full=True; ok_split=True
for _ in range(200):
    dA=[rng.randint(-3,3) for _ in range(3)]; dB=[rng.randint(-3,3) for _ in range(3)]
    offA=tuple(rndZ() for _ in range(3)); offB=tuple(rndZ() for _ in range(3))
    A=Hm(dA,offA); B=Hm(dB,offB)
    X=Xpart(offA); Y=Xpart(offB)
    if not miszero(jdefM(A,B)): ok_full=False
    # CLAIM: jdef(A,B) == jdef(X,Y)
    if not miszero(msub(jdefM(A,B), jdefM(X,Y))): ok_split=False
print("jdef(Hm,Hm)=0 (full, real diag):", ok_full)
print("CLAIM jdef(Hm,Hm) == jdef(Xoff,Yoff) [central diagonal contributes nothing]:", ok_split)

# Also: is jdef(X,Y)=0 itself for zero-diagonal Hermitian X,Y? (the reduced core)
ok_core=True
for _ in range(200):
    offA=tuple(rndZ() for _ in range(3)); offB=tuple(rndZ() for _ in range(3))
    X=Xpart(offA); Y=Xpart(offB)
    if not miszero(jdefM(X,Y)): ok_core=False
print("reduced core jdef(Xoff,Yoff)=0 (zero-diagonal Hermitian):", ok_core)

# finer: does jdef(D+X, B) == jdef(X,B) for ANY B (central D drops)? and jdef(X,E+Y)==jdef(X,Y)?
ok_dropA=True; ok_dropB=True
for _ in range(100):
    dA=[rng.randint(-3,3) for _ in range(3)]
    X=Xpart(tuple(rndZ() for _ in range(3))); B=Hm([rng.randint(-3,3) for _ in range(3)],tuple(rndZ() for _ in range(3)))
    D=Dpart(dA)
    if not miszero(msub(jdefM(madd(D,X),B), jdefM(X,B))): ok_dropA=False
    E=Dpart([rng.randint(-3,3) for _ in range(3)]); Y=Xpart(tuple(rndZ() for _ in range(3)))
    if not miszero(msub(jdefM(X,madd(E,Y)), jdefM(X,Y))): ok_dropB=False
print("jdef(D+X, B) == jdef(X,B)  [central D in 1st arg drops]:", ok_dropA)
print("jdef(X, E+Y) == jdef(X,Y)  [central E in 2nd arg drops]:", ok_dropB)
