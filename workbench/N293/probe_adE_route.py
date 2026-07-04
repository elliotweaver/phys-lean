"""
N293 — THE adE ROUTE (dissolution candidate). Discovered: kAB = adE([slotA u1, slotB 1]).
Test whether the ENTIRE closure reduces to matrix commutators:
  (1) Does innerMul A B = adE(A*B - B*A) hold as OPERATOR for each relevant slot pair?
      (kAB,kBC,kCA,famA,famB,famC)
  (2) Is ⁅adE K1, adE K2⁆ = adE(K1 K2 - K2 K1) for the specific K's? (Lie-hom on these matrices)
  (3) Does the matrix identity K_AB*K_BC - K_BC*K_AB = K_famB hold? (by ext)
If (1)-(3) all hold, the closure is a pure matrix-commutator identity — NO Jacobi/mixed-Leibniz.
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,DIM,m2v,op_cols,comm_cols,Lmul,innerMul,cols_eq,cols_zero,cols_scale,
    cols_sub,innerMul_apply,mat_eq,mat_zero,flat,basisM,apply_cols,unflat)

def adE_apply(K,X): return msub(mmul(K,X),mmul(X,K))
def adE_cols(K): return op_cols(lambda X: adE_apply(K,X))
def mcomm(A,B): return msub(mmul(A,B),mmul(B,A))   # matrix commutator A*B-B*A

# (1) innerMul A B == adE(A*B-B*A) for each slot pair?
pairs = {
 "kAB=innerMul(sA u1)(sB 1)": (sA(u1),sB(one)),
 "kBC=innerMul(sB u1)(sC 1)": (sB(u1),sC(one)),
 "kCA=innerMul(sC u1)(sA 1)": (sC(u1),sA(one)),
 "famA=innerMul(sB 1)(sC 1)": (sB(one),sC(one)),
 "famB=innerMul(sC 1)(sA 1)": (sC(one),sA(one)),
 "famC=innerMul(sA 1)(sB 1)": (sA(one),sB(one)),
}
print("(1) innerMul A B == adE(A*B - B*A) as OPERATOR:")
Ks={}
for nm,(A,B) in pairs.items():
    K=mcomm(A,B); Ks[nm]=K
    print(f"  {nm}: {cols_eq(innerMul(A,B), adE_cols(K))}")

KAB=Ks["kAB=innerMul(sA u1)(sB 1)"]
KBC=Ks["kBC=innerMul(sB u1)(sC 1)"]
KCA=Ks["kCA=innerMul(sC u1)(sA 1)"]
KfA=Ks["famA=innerMul(sB 1)(sC 1)"]
KfB=Ks["famB=innerMul(sC 1)(sA 1)"]
KfC=Ks["famC=innerMul(sA 1)(sB 1)"]

# (2) ⁅adE K1, adE K2⁆ == adE(K1 K2 - K2 K1)?
print("\n(2) ⁅adE K1, adE K2⁆ == adE(K1*K2 - K2*K1) (Lie-hom on these matrices):")
tests2=[("kAB,kBC",KAB,KBC),("kBC,kCA",KBC,KCA),("kCA,kAB",KCA,KAB)]
for nm,K1,K2 in tests2:
    lhs=comm_cols(adE_cols(K1),adE_cols(K2))
    rhs=adE_cols(mcomm(K1,K2))
    print(f"  {nm}: {cols_eq(lhs,rhs)}")

# (3) matrix identities: K_AB*K_BC - K_BC*K_AB == K_famB ? (and cyclic)
print("\n(3) matrix commutator identities (by direct matrix eq):")
print("  [KAB,KBC] == KfB ?", mat_eq(mcomm(KAB,KBC), KfB))
print("  [KBC,KCA] == KfC ?", mat_eq(mcomm(KBC,KCA), KfC))
print("  [KCA,KAB] == -KfA ?", mat_eq(mcomm(KCA,KAB), [[oneg(KfA[i][j]) for j in range(3)] for i in range(3)]))

# Show the K matrices (are they central/simple?)
def showmat(K,nm):
    print(f"  {nm}:")
    for i in range(3):
        row=[]
        for j in range(3):
            v=flat(K[i][j])
            row.append(str([int(x) if x==int(x) else x for x in v]) if any(x!=0 for x in v) else "0")
        print("    ",row)
showmat(KAB,"KAB=[slotA u1, slotB 1]")
showmat(KfB,"KfB=[slotC 1, slotA 1]")
