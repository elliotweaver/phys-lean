"""struct_probe (run 50): two cheap structural facts that shrink the node.
(1) Is jdef(Hm,Hm) HERMITIAN? (Jordan products of Hermitian matrices are Hermitian, so
    the defect should be too -> lower triangle = star(upper), and DIAGONAL entries are
    self-adjoint = REAL scalars.) Confirm in the exact Zorn model.
(2) For each independent entry, what octonion LAYER does it live in before being 0?
    (diagonal entries: real only? off-diagonal: full?)
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
def Hm(diag,off):
    d0,d1,d2=diag; a,b,c=off
    return [[zscalar(d0),a,b],[zstar(a),zscalar(d1),c],[zstar(b),zstar(c),zscalar(d2)]]

# perturb: break the Jordan identity by using octonion (non-real) diagonal to study structure
def Hm_oct(diagZ,off):
    a,b,c=off
    return [[diagZ[0],a,b],[zstar(a),diagZ[1],c],[zstar(b),zstar(c),diagZ[2]]]

# (1) Hermitian? Use a NON-Jordan instance (octonion diagonal) so jdef != 0, then test symmetry.
herm=True; diagreal=True
for _ in range(50):
    dZ=[rndZ() for _ in range(3)]; eZ=[rndZ() for _ in range(3)]
    off1=[rndZ() for _ in range(3)]; off2=[rndZ() for _ in range(3)]
    A=Hm_oct(dZ,tuple(off1)); B=Hm_oct(eZ,tuple(off2))
    D=jdefM(A,B)
    for i in range(3):
        for j in range(3):
            if not zis0(zsub(D[i][j], zstar(D[j][i]))): herm=False
    for i in range(3):
        di=D[i][i]
        if not zis0(zsub(di, zstar(di))): diagreal=False
print("(1) jdef(Hm,Hm) is HERMITIAN (D[i][j]=star D[j][i]):", herm)
print("    diagonal entries SELF-ADJOINT (real scalars):", diagreal)

# (2) layer structure of each entry, on the non-Jordan instance (so nonzero):
def layers(x):
    return ("re" if x.a!=0 else "")+("v" if any(c!=0 for c in x.v) else "")+\
           ("w" if any(c!=0 for c in x.w) else "")+("b" if x.b!=0 else "")
A=Hm_oct([rndZ() for _ in range(3)],tuple(rndZ() for _ in range(3)))
B=Hm_oct([rndZ() for _ in range(3)],tuple(rndZ() for _ in range(3)))
D=jdefM(A,B)
print("(2) nonzero layers per entry (non-Jordan octonion-diagonal instance):")
for i in range(3):
    print("   ", [layers(D[i][j]) or "0" for j in range(3)])
