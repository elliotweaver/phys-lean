"""
N303 SELECT probe — how the FOLD-ROOT-DRESSED family-BREAKING coset (N292/293, kAB/kBC/kCA)
acts on the ISOSPECTRAL MASS-TEXTURE module L₀ (N301/302).

The two banked halves have NEVER been connected:
  · family so(3): famC = innerMul(slotA 1)(slotB 1)  — REAL slots. N301: famC carries the
    diagonal mass-splitting mover Lmul(Dg t) → the REAL off-diagonal mixing mover
    Lmul(slotC ((t2-t1)•1)).
  · fold-root-dressed coset (su(3)/so(3) breaking, N292/293): kAB = innerMul(slotA u1)(slotB 1)
    — u1-DRESSED slots. Its action on the mass module Lmul(Dg t) is UNCOMPUTED.

HYPOTHESES to measure:
  (H1) kAB carries the diagonal mass-splitting mover to a u1-IMAGINARY off-diagonal mixing mover:
       ⁅kAB, Lmul(Dg t)⁆ B = Lmul(kAB(Dg t)) B  (N296 equivariance, kAB∈f₄), with
       kAB(Dg t0 t1 t2) = slotC ((t2-t1) • u1)   [the u1-analog of famC's (t2-t1)•1].
  (H2) kAB is ISOSPECTRAL (free, since kAB∈f₄ by N302): rtr(kAB A)=0, rtr(jb A (kAB A))=0,
       rtr(jb (jb A A)(kAB A))=0 for Hermitian A.
  (H3) THE su(3)_flavour COMPLETION: {famC (real mixing), kAB (imaginary mixing)} — the mass
       module carries the REAL and IMAGINARY off-diagonal mixing directions; the fold-root u1
       COMPLEXIFIES the real so(3) rotation into the full su(3)_flavour action on L₀.
  (H4) Does the su(3) action DISTINGUISH a direction (lift the isospectral degeneracy)? Test the
       joint orbit: is there a distinguished (fixed) element? (Expected NO — all in f₄, isospectral;
       masses are su(3)-orbit invariants — the honest route-finder result.)
"""
import numpy as np
from fractions import Fraction as F
def make_level(mul,star,add,sub):
    def lmul(z,w):
        (a,b)=z;(c,d)=w
        return (sub(mul(a,c),mul(star(d),b)),add(mul(d,a),mul(b,star(c))))
    def lstar(z):
        (a,b)=z; return (star(a),lneg(b))
    def ladd(z,w):
        (a,b)=z;(c,d)=w; return (add(a,c),add(b,d))
    def lsub(z,w):
        (a,b)=z;(c,d)=w; return (sub(a,c),sub(b,d))
    return lmul,lstar,ladd,lsub
def lneg(z): return (lneg(z[0]),lneg(z[1])) if isinstance(z,tuple) else -z
C=make_level(lambda x,y:x*y,lambda x:x,lambda x,y:x+y,lambda x,y:x-y)
Hl=make_level(*C); Ol=make_level(*Hl); O_mul,O_star,_,_=Ol
def flat(z):
    ((za,zb),(zc,zd))=z;(a,b)=za;(c,d)=zb;(ee,f)=zc;(g,h)=zd
    return [a,b,c,d,ee,f,g,h]
def unflat(v):
    a,b,c,d,ee,f,g,h=v; return (((a,b),(c,d)),((ee,f),(g,h)))
def basis(i):
    v=[F(0)]*8; v[i]=F(1); return unflat(v)
e=[basis(i) for i in range(8)]
Tt=np.zeros((8,8,8)); Sst=np.zeros((8,8))
for i in range(8):
    for j in range(8):
        cc=flat(O_mul(e[i],e[j]))
        for k in range(8): Tt[i,j,k]=float(cc[k])
    cs=flat(O_star(e[i]))
    for k in range(8): Sst[i,k]=float(cs[k])
def omul(x,y): return np.einsum('ijk,i,j->k',Tt,x,y)
def ostar(x): return Sst.T@x
def reQ(o): return float(o[0])
I8=np.eye(8)
u1v=I8[1]                                  # u1 = first imaginary unit
def zero_mat(): return np.zeros((3,3,8))
def mat_mul(A,B):
    R=zero_mat()
    for i in range(3):
        for j in range(3):
            for k in range(3): R[i,j]+=omul(A[i,k],B[k,j])
    return R
def jb_mat(A,B): return mat_mul(A,B)+mat_mul(B,A)
def jprod(A,B): return 0.5*jb_mat(A,B)
def Lmul(A): return lambda X: jb_mat(A,X)
def innerMul(A,B): return lambda X: jb_mat(A, jb_mat(B,X)) - jb_mat(B, jb_mat(A,X))
def jTr(M): return reQ(M[0,0])+reQ(M[1,1])+reQ(M[2,2])
def rtr(M): return jTr(M)   # deep-real trace on Hermitian = reQ∘trace
def one_oct():
    v=np.zeros(8); v[0]=1.0; return v
def Dg(t0,t1,t2):
    M=zero_mat(); M[0,0]=t0*I8[0]; M[1,1]=t1*I8[0]; M[2,2]=t2*I8[0]; return M
def slotA(a):
    M=zero_mat(); M[0,1]=a.copy(); M[1,0]=ostar(a); return M
def slotB(b):
    M=zero_mat(); M[0,2]=b.copy(); M[2,0]=ostar(b); return M
def slotC(c):
    M=zero_mat(); M[1,2]=c.copy(); M[2,1]=ostar(c); return M

famC = innerMul(slotA(one_oct()), slotB(one_oct()))
kAB  = innerMul(slotA(u1v),        slotB(one_oct()))   # fold-root-dressed breaking generator

def commutator(T,S): return lambda X: T(S(X)) - S(T(X))

rng=np.random.default_rng(11)
def herm_rand():
    M=zero_mat()
    for i in range(3): M[i,i]=rng.standard_normal()*I8[0]
    for (i,j) in [(0,1),(0,2),(1,2)]:
        a=rng.standard_normal(8); M[i,j]=a; M[j,i]=ostar(a)
    return M
def A2(A): return jprod(A,A)

print("="*70)
print("H1 — kAB carries the diagonal mass-splitting mover to WHAT off-diagonal?")
t0,t1,t2 = 0.3, -0.7, 1.1
Dgt = Dg(t0,t1,t2)
kAB_Dg = kAB(Dgt)
# compare to famC(Dg) = slotC ((t2-t1)•1)
famC_Dg = famC(Dgt)
pred_famC = slotC((t2-t1)*one_oct())
print("  famC(Dg t) == slotC((t2-t1)•1)?      resid=%.2e" % np.abs(famC_Dg-pred_famC).max())
# hypothesis: kAB(Dg t) = slotC ((t2-t1)•u1)   (u1-imaginary mixing)
pred_kAB_u1 = slotC((t2-t1)*u1v)
print("  kAB(Dg t) == slotC((t2-t1)•u1)?      resid=%.2e" % np.abs(kAB_Dg-pred_kAB_u1).max())
# also test other coefficient patterns just in case
for lbl,coef in [("(t2-t1)",(t2-t1)),("(t0-t2)",(t0-t2)),("(t1-t0)",(t1-t0))]:
    for slotf,sname in [(slotC,"slotC"),(slotB,"slotB"),(slotA,"slotA")]:
        pr = slotf(coef*u1v)
        r = np.abs(kAB_Dg-pr).max()
        if r < 1e-9:
            print("  MATCH: kAB(Dg t) = %s(%s•u1)   resid=%.2e" % (sname,lbl,r))
print("  raw kAB(Dg t) nonzero entries:")
for i in range(3):
    for j in range(3):
        if np.abs(kAB_Dg[i,j]).max()>1e-9:
            print("     (%d,%d): %s" % (i,j, np.round(kAB_Dg[i,j],4)))

print("="*70)
print("H1b — equivariance ⁅kAB, Lmul(Dg t)⁆ B = Lmul(kAB(Dg t)) B  (N296, kAB∈f₄)")
B = herm_rand()
lhs = commutator(kAB, Lmul(Dgt))(B)
rhs = Lmul(kAB(Dgt))(B)
print("  resid=%.2e" % np.abs(lhs-rhs).max())

print("="*70)
print("H2 — kAB is ISOSPECTRAL (should be FREE since kAB∈f₄ by N302)")
A = herm_rand()
TA = kAB(A)
print("  rtr(kAB A)                = %.2e" % rtr(TA))
print("  rtr(jb A (kAB A))         = %.2e" % rtr(jb_mat(A,TA)))
print("  rtr(jb (jb A A)(kAB A))   = %.2e" % rtr(jb_mat(A2(A)*2, TA)))  # jb A A = 2 A∘A; use jb
print("  rtr(jb (jbAA)(kAB A)) v2  = %.2e" % rtr(jb_mat(jb_mat(A,A), TA)))

print("="*70)
print("H3 — su(3)_flavour completion: famC=REAL mixing, kAB=IMAGINARY mixing")
print("  famC(Dg t)= slotC((t2-t1)•1)  [REAL];  kAB(Dg t)= slotC((t2-t1)•u1) [IMAG]")
print("  => the fold-root u1 COMPLEXIFIES the family so(3) rotation on the mass module.")
# confirm: is kAB the 'u1-dressed famC'? test kAB(slotC c) back to a diagonal (the reverse leg)
c = rng.standard_normal(8)
kAB_slotC = kAB(slotC(c))
famC_slotC = famC(slotC(c))
print("  famC(slotC c) diagonal? nonzero entries:")
for i in range(3):
    for j in range(3):
        if np.abs(famC_slotC[i,j]).max()>1e-9:
            print("     famC (%d,%d): %s" % (i,j, np.round(famC_slotC[i,j],4)))
print("  kAB(slotC c) nonzero entries:")
for i in range(3):
    for j in range(3):
        if np.abs(kAB_slotC[i,j]).max()>1e-9:
            print("     kAB  (%d,%d): %s" % (i,j, np.round(kAB_slotC[i,j],4)))

print("="*70)
print("H4 — does the joint {famC,kAB} action DISTINGUISH a direction / fix an element?")
print("  (both in f₄ ⟹ isospectral ⟹ NO change of spectrum. masses = orbit invariants.)")
# test ⁅famC, kAB⁆ — the bracket of real and imaginary mixing (should land in f₄, in su(3))
br = commutator(famC, kAB)
# apply to slotA 1 to see what it is
print("  ⁅famC,kAB⁆(slotA 1) nonzero entries:")
brSA = br(slotA(one_oct()))
for i in range(3):
    for j in range(3):
        if np.abs(brSA[i,j]).max()>1e-9:
            print("     (%d,%d): %s" % (i,j, np.round(brSA[i,j],4)))
# is it a diagonal (Cartan) generator? that would be the su(3) Cartan (the mass-eigenvalue direction!)
print("  ⁅famC,kAB⁆(Dg t) nonzero entries:")
brDg = br(Dgt)
for i in range(3):
    for j in range(3):
        if np.abs(brDg[i,j]).max()>1e-9:
            print("     (%d,%d): %s" % (i,j, np.round(brDg[i,j],4)))
