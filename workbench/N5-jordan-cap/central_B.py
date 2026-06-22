"""central_B (run 50): refine the reduction into its provable pieces. jdef is ADDITIVE in B
(banked: jdef_add_right). So jdef(A, E+Y) = jdef(A,E) + jdef(A,Y). Test the two pieces:
  (i)  jdef(A, E) = 0   when E is a CENTRAL diagonal matrix (B = scalar*I-like)?
  (ii) jdef(D+X, Y) = jdef(X,Y)  (central diagonal drops from the FIRST arg)?
Also test the cleaner global claim: jdef(A, c•I) = 0 for central scalar c (B = central
multiple of identity). And whether jdef(A+cI, B) = jdef(A,B) for central c (1st-arg central
scalar shift). Knowing exactly which sub-identities hold tells us the Lean lemma chain.
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
rng=random.Random(9)
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
def cI(t): return [[zscalar(t) if i==j else zzero() for j in range(3)] for i in range(3)]

def randA():
    return madd(Dpart([rng.randint(-3,3) for _ in range(3)]),Xpart(tuple(rndZ() for _ in range(3))))

checks={}
def test(name,fn,N=100):
    ok=True
    for _ in range(N):
        if not fn(): ok=False; break
    checks[name]=ok
test("(i) jdef(A, E_centraldiag) = 0", lambda: miszero(jdefM(randA(), Dpart([rng.randint(-3,3) for _ in range(3)]))))
test("(i') jdef(A, c•I) = 0", lambda: miszero(jdefM(randA(), cI(rng.randint(-3,3)))))
test("(ii) jdef(D+X, Y) = jdef(X,Y) [central diag drops from 1st arg]",
     lambda: (lambda D,X,Y: miszero(msub(jdefM(madd(D,X),Y), jdefM(X,Y))))(
        Dpart([rng.randint(-3,3) for _ in range(3)]), Xpart(tuple(rndZ() for _ in range(3))), Xpart(tuple(rndZ() for _ in range(3)))))
test("(ii') jdef(A + c•I, B) = jdef(A,B) [central scalar shift 1st arg]",
     lambda: (lambda A,B,c: miszero(msub(jdefM(madd(A,cI(c)),B), jdefM(A,B))))(randA(), randA(), rng.randint(-3,3)))
test("(iii) jdef(A, B+c•I) = jdef(A,B) [central scalar shift 2nd arg]",
     lambda: (lambda A,B,c: miszero(msub(jdefM(A,madd(B,cI(c))), jdefM(A,B))))(randA(), randA(), rng.randint(-3,3)))
for k,v in checks.items(): print(f"{v}  {k}")
