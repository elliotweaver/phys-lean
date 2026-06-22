"""verify_run64e: confirm the MASTER coefficient identity and A_Hm diagonality.

(I)  jdef(A, E)_ij == 2(e_i-e_j) * (A*(A*A) - (A*A)*A)_ij   for E=diag(e_i central), ANY A.
     Derived using ONLY centrality of e_i + matrix distributivity (no alt). Test for A=Hm.
(II) A_M := M*(M*M) - (M*M)*M  is DIAGONAL (off-diag entries vanish) for M = Hm (full, with
     central diagonal) and for M = Xz (zero-diag). If so: jdef(Hm,E)=0 by (I) [off-diag killed
     by A_Hm diagonal, diagonal killed by (e_i-e_i)=0 coeff].
(III) piece B structure: jdef(Hm, Y) for Y zero-diag Hermitian -- residual vs jdef(X,Y).
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
rng=random.Random(23)
def rndZ(): return Z(F(rng.randint(-3,3)),tuple(F(rng.randint(-3,3)) for _ in range(3)),
    tuple(F(rng.randint(-3,3)) for _ in range(3)),F(rng.randint(-3,3)))
def mz(n=3): return [[zzero() for _ in range(n)] for _ in range(n)]
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
def assoc_mat(M): return msub(mmul(M,mmul(M,M)), mmul(mmul(M,M),M))  # A_M = M(MM)-(MM)M

ci=cdiag_hm=cdiag_x=cB=cpieceA=0
N=300
for _ in range(N):
    d=[rng.randint(-3,3) for _ in range(3)]; e=[rng.randint(-3,3) for _ in range(3)]
    D=Dpart(d); E=Dpart(e)
    off=tuple(rndZ() for _ in range(3)); X=Xpart(off); Hm=madd(D,X)
    offY=tuple(rndZ() for _ in range(3)); Y=Xpart(offY)
    # (I) coefficient identity for A=Hm
    AHm=assoc_mat(Hm); JHmE=jdefM(Hm,E)
    for i in range(3):
        for j in range(3):
            if not zis0(zsub(JHmE[i][j], zsc(F(2*(e[i]-e[j])), AHm[i][j]))): ci+=1
    # (II) A_Hm diagonal? A_X diagonal?
    AX=assoc_mat(X)
    for i in range(3):
        for j in range(3):
            if i!=j:
                if not zis0(AHm[i][j]): cdiag_hm+=1
                if not zis0(AX[i][j]): cdiag_x+=1
    # piece A: jdef(Hm,E)=0
    if not miszero(JHmE): cpieceA+=1
    # (III) piece B: jdef(Hm,Y)=0 ?
    if not miszero(jdefM(Hm,Y)): cB+=1

print(f"exact Zorn, {N} samples:")
print(f"(I)  jdef(Hm,E)_ij == 2(e_i-e_j)(A_Hm)_ij  [master coeff identity] : mismatch = {ci}")
print(f"(II) A_Hm = Hm(HmHm)-(HmHm)Hm off-diag nonzero (should be 0)       : {cdiag_hm}")
print(f"     A_X  off-diag nonzero (should be 0)                           : {cdiag_x}")
print(f"piece A: jdef(Hm,E)=0 [central 2nd arg]                            : nonzero = {cpieceA}")
print(f"piece B: jdef(Hm,Y)=0 [zero-diag Hermitian 2nd arg]                : nonzero = {cB}")
