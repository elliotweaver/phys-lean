"""
N285 SELECT — the PRECISE membership test that the selection hinges on:
Is innerMul(Hermitian A, Hermitian B) in N284's full-space jDer?
  jDer membership = IsJordanDerivQ T = (∀ X Y : FULL matrix space,
      T(jb X Y) = jb (T X) Y + jb X (T Y)).
So test: Hermitian A,B  ×  GENERAL (non-Hermitian) X,Y.
If defect ≠ 0 for some general X,Y  =>  innerMul(Herm) ∉ N284.jDer (premise holds).
Reuse N283's exact octonion arithmetic (correct nested CD add/sub).
"""
from fractions import Fraction as F
import random, sys

def R_mul(x, y): return x * y
def R_star(x): return x
def R_add(x, y): return x + y
def R_sub(x, y): return x - y
def make_level(mul, star, add, sub):
    def lmul(z, w):
        (a, b) = z; (c, d) = w
        return (sub(mul(a, c), mul(star(d), b)), add(mul(d, a), mul(b, star(c))))
    def lstar(z):
        (a, b) = z; return (star(a), lneg(b))
    def ladd(z, w):
        (a, b) = z; (c, d) = w; return (add(a, c), add(b, d))
    def lsub(z, w):
        (a, b) = z; (c, d) = w; return (sub(a, c), sub(b, d))
    return lmul, lstar, ladd, lsub
def neg_gen():
    def n(z): return (n(z[0]), n(z[1])) if isinstance(z, tuple) else -z
    return n
lneg = neg_gen()
C_mul, C_star, C_add, C_sub = make_level(R_mul, R_star, R_add, R_sub)
H_mul, H_star, H_add, H_sub = make_level(C_mul, C_star, C_add, C_sub)
O_mul, O_star, O_add, O_sub = make_level(H_mul, H_star, H_add, H_sub)
def Ozero(): return (((F(0),F(0)),(F(0),F(0))),((F(0),F(0)),(F(0),F(0))))
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(e,f)=zc;(g,h)=zd;return [a,b,c,d,e,f,g,h]
def unflat(v):
    a,b,c,d,e,f,g,h=v;return (((a,b),(c,d)),((e,f),(g,h)))
def Orand(): return unflat([F(random.randint(-2,2)) for _ in range(8)])
N=3
def Mzero(): return [[Ozero() for _ in range(N)] for _ in range(N)]
def Madd(A,B): return [[O_add(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def Msub(A,B): return [[O_sub(A[i][j],B[i][j]) for j in range(N)] for i in range(N)]
def Mmul(A,B):
    C=Mzero()
    for i in range(N):
        for j in range(N):
            acc=Ozero()
            for k in range(N): acc=O_add(acc,O_mul(A[i][k],B[k][j]))
            C[i][j]=acc
    return C
def jb(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def innerMul(A,B): return lambda X: Msub(jb(A,jb(B,X)), jb(B,jb(A,X)))
def deriv_defect(D,X,Y): return Msub(D(jb(X,Y)), Madd(jb(D(X),Y), jb(X,D(Y))))
def Mrand(): return [[Orand() for _ in range(N)] for _ in range(N)]
def Mherm():
    A=Mzero()
    for i in range(N): A[i][i]=unflat([F(random.randint(-2,2))]+[F(0)]*7)
    for i in range(N):
        for j in range(i+1,N):
            o=Orand(); A[i][j]=o; A[j][i]=O_star(o)
    return A
def is0(A): return all(all(x==0 for x in flat(A[i][j])) for i in range(N) for j in range(N))

random.seed(99)
print("PRECISE membership: innerMul(Herm A,B) tested on GENERAL X,Y (the jDer quantifier)"); sys.stdout.flush()
fails=0
for _ in range(60):
    A,B=Mherm(),Mherm()
    D=innerMul(A,B)
    X,Y=Mrand(),Mrand()   # GENERAL, non-Hermitian
    if not is0(deriv_defect(D,X,Y)): fails+=1
print(f"  {fails}/60 (Herm A,B ; general X,Y) had NONZERO derivation defect"); sys.stdout.flush()
print(f"  => innerMul(Herm) is {'NOT in' if fails>0 else 'IN'} N284's full-space jDer"); sys.stdout.flush()
