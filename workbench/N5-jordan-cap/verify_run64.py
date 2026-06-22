"""verify_run64: reconfirm the structural claims this run rests on, exact Zorn split-octonion.
(a) jdef(D, B) = 0 for ANY B when D central-diagonal  [the clean strong lever].
(b) jdef(X, E) = 0 for X zero-diag Hermitian, E central-diagonal.
(c) jdef(X,E)_{ij} == 2(e_i-e_j)*A_X,{ij}, A_X = X(XX)-(XX)X  [my derivation].
(d) off-diagonal A_X,{ij}=0 for zero-diag Hermitian X; what about diagonal A_X,{ii}?
(e) reduction (I): jdef(D+X, B) = jdef(X, B) for any B.
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
rng=random.Random(11)
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
def Bgen():  # arbitrary (non-Hermitian) octonion matrix
    return [[rndZ() for _ in range(3)] for _ in range(3)]

ca=cb=cc=cd_off=cd_diag=ce=0
N=300
for _ in range(N):
    d=[rng.randint(-3,3) for _ in range(3)]; e=[rng.randint(-3,3) for _ in range(3)]
    D=Dpart(d); E=Dpart(e)
    X=Xpart(tuple(rndZ() for _ in range(3)))
    B=Bgen()
    # (a) jdef(D,B)=0 any B
    if not miszero(jdefM(D,B)): ca+=1
    # (b) jdef(X,E)=0
    if not miszero(jdefM(X,E)): cb+=1
    # (c) jdef(X,E)_{ij} == 2(e_i-e_j)*A_X,{ij}
    AX=msub(mmul(X,mmul(X,X)), mmul(mmul(X,X),X))
    JXE=jdefM(X,E)
    for i in range(3):
        for j in range(3):
            lhs=JXE[i][j]
            rhs=zsc(F(2*(e[i]-e[j])), AX[i][j])
            if not zis0(zsub(lhs,rhs)): cc+=1
    # (d) A_X off-diag / diag
    for i in range(3):
        for j in range(3):
            if i!=j:
                if not zis0(AX[i][j]): cd_off+=1
            else:
                if not zis0(AX[i][j]): cd_diag+=1
    # (e) reduction (I): jdef(D+X,B)=jdef(X,B)
    if not miszero(msub(jdefM(madd(D,X),B), jdefM(X,B))): ce+=1

print(f"exact Zorn, {N} samples:")
print(f"(a) jdef(D,B)=0 for ANY B (central-diag first arg)        : nonzero count = {ca}  (0=clean centrality lever)")
print(f"(b) jdef(X,E)=0 (zero-diag first, central-diag second)    : nonzero count = {cb}")
print(f"(c) jdef(X,E)_ij == 2(e_i-e_j)*A_X,ij  (my derivation)    : mismatch count = {cc}")
print(f"(d) A_X = X(XX)-(XX)X : off-diag nonzero={cd_off}, diag nonzero={cd_diag}")
print(f"(e) reduction (I) jdef(D+X,B)=jdef(X,B) any B             : nonzero count = {ce}")
