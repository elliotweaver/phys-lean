"""
N285 SELECT — followup: is jdef = 0 on the FULL M₃(O), or only on the Hermitian arena H₃(O)?
This determines whether N284's `jDer` (Jordan-derivations of jb on the FULL matrix space)
is derivations of a genuine Jordan bracket or of a non-Jordan bracket.

Reuses the exact octonion arithmetic.
"""
from fractions import Fraction as F
import random

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
    def n(z):
        return (n(z[0]), n(z[1])) if isinstance(z, tuple) else -z
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
def Orand(): return unflat([F(random.randint(-3,3)) for _ in range(8)])
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
def Mstar_t(A): return [[O_star(A[j][i]) for j in range(N)] for i in range(N)]
def jb(A,B): return Madd(Mmul(A,B),Mmul(B,A))
def jdef(A,B): return Msub(jb(jb(A,B),jb(A,A)), jb(A,jb(B,jb(A,A))))
def Mrand(): return [[Orand() for _ in range(N)] for _ in range(N)]
def Mherm():
    A=Mzero()
    for i in range(N): A[i][i]=unflat([F(random.randint(-3,3))]+[F(0)]*7)
    for i in range(N):
        for j in range(i+1,N):
            o=Orand(); A[i][j]=o; A[j][i]=O_star(o)
    return A
def is0(A):
    return all(all(x==0 for x in flat(A[i][j])) for i in range(N) for j in range(N))

random.seed(7)
import sys
print("=== jdef on FULL M₃(O) (general A,B)? ==="); sys.stdout.flush()
ff=sum(0 if is0(jdef(Mrand(),Mrand())) else 1 for _ in range(25))
print(f"  {ff}/25 general pairs have jdef ≠ 0  => jb is {'NOT' if ff>0 else ''} Jordan on full space"); sys.stdout.flush()
print("=== jdef on HERMITIAN H₃(O)? ==="); sys.stdout.flush()
fh=sum(0 if is0(jdef(Mherm(),Mherm())) else 1 for _ in range(25))
print(f"  {fh}/25 Hermitian pairs have jdef ≠ 0  => jb IS {'NOT ' if fh>0 else ''}Jordan on H₃(O)"); sys.stdout.flush()

# find a SMALL explicit witness for full-space derivation-defect nonzero (for a bounded Lean W8 teeth)
print()
print("=== hunt a MINIMAL non-Herm witness where innerMul is not a full-space derivation ===")
def slot(i,j,a):
    A=Mzero();A[i][j]=a;return A  # NON-symmetric single-entry (not Hermitian)
def innerMul(A,B):
    return lambda X: Msub(jb(A,jb(B,X)), jb(B,jb(A,X)))
def deriv_defect(D,X,Y):
    return Msub(D(jb(X,Y)), Madd(jb(D(X),Y), jb(X,D(Y))))
one=unflat([F(1)]+[F(0)]*7)
u1 =unflat([F(0),F(1)]+[F(0)]*6)
# try single-unit entries at various positions
found=None
positions=[(0,1),(0,2),(1,2)]
units=[one,u1]
import itertools, random as _r
_r.seed(3)
trials=0
for _ in range(4000):
    pa,pb,pc,pd=[_r.choice(positions) for _ in range(4)]
    ua,ub,uc,ud=[_r.choice(units) for _ in range(4)]
    A=slot(*pa,ua); B=slot(*pb,ub); X=slot(*pc,uc); Y=slot(*pd,ud)
    dd=deriv_defect(innerMul(A,B),X,Y)
    if not is0(dd):
        found=(pa,ua,pb,ub,pc,uc,pd,ud,dd); break
if found:
    pa,ua,pb,ub,pc,uc,pd,ud,dd=found
    def uname(u): return {tuple(flat(one)):'1',tuple(flat(u1)):'u1',tuple(flat(unflat([F(0),F(0),F(1)]+[F(0)]*5))):'e2O'}[tuple(flat(u))]
    print(f"  witness: A={uname(ua)}@{pa}  B={uname(ub)}@{pb}  X={uname(uc)}@{pc}  Y={uname(ud)}@{pd}")
    nz=[(i,j,flat(dd[i][j])) for i in range(N) for j in range(N) if any(x!=0 for x in flat(dd[i][j]))]
    print(f"  nonzero defect entries: {[(i,j) for i,j,_ in nz]}")
    for i,j,v in nz: print(f"    ({i},{j}) = {v}")
else:
    print("  no single-unit witness found (would need bigger search)")
