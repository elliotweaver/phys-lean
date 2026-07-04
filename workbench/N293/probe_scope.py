"""
N293 — determine the SCOPE of the mixed-Leibniz operator identity
    ⁅innerMul A B, L C⁆ == L(innerMul A B (C))   [all X]
to decide the Lean lemma shape. Test C = generic Hermitian, generic non-Herm,
and whether it needs A,B Hermitian. Also decompose the two needed brackets via lie_lie
to the base brackets to see the CLEANEST Lean path.
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,DIM,m2v,op_cols,comm_cols,Lmul,innerMul,cols_eq,cols_zero,cols_scale,
    cols_sub,innerMul_apply,mat_eq,mat_zero,flat,basisM,apply_cols,kAB,kBC,famA,famB,famC,unflat)

def Hm(d0,d1,d2,a,b,c):
    # Hermitian matrix: diag real (ocR), off-diag a=(0,1),b=(0,2),c=(1,2)
    M=M0()
    M[0][0]=unflat([F(d0) if k==0 else F(0) for k in range(8)])
    M[1][1]=unflat([F(d1) if k==0 else F(0) for k in range(8)])
    M[2][2]=unflat([F(d2) if k==0 else F(0) for k in range(8)])
    M[0][1]=a; M[1][0]=ostar(a)
    M[0][2]=b; M[2][0]=ostar(b)
    M[1][2]=c; M[2][1]=ostar(c)
    return M
def gen(*vs):  # generic octonion from 8 ints
    return unflat([F(x) for x in vs])

# generic Hermitian C
Cherm = Hm(2,-1,3, gen(1,2,0,1,0,0,1,0), gen(0,1,1,0,2,0,0,1), gen(1,0,0,3,0,1,0,0))
# generic NON-Hermitian C (arbitrary matrix)
Cnh = M0()
Cnh[0][0]=gen(1,1,0,0,0,0,0,0); Cnh[0][1]=gen(0,1,0,0,0,0,0,0); Cnh[0][2]=gen(1,0,1,0,0,0,0,0)
Cnh[1][0]=gen(0,0,1,0,0,0,0,0); Cnh[1][1]=gen(2,0,0,0,0,0,0,0); Cnh[1][2]=gen(0,0,0,1,0,0,0,0)
Cnh[2][0]=gen(1,0,0,0,1,0,0,0); Cnh[2][1]=gen(0,0,0,0,0,1,0,0); Cnh[2][2]=gen(0,1,0,0,0,0,0,0)

def test_mixed(A,B,C,label):
    D=innerMul(A,B)
    lhs=comm_cols(D, Lmul(C))
    rhs=Lmul(innerMul_apply(A,B,C))
    print(f"  {label}: ⁅innerMul A B, L C⁆==L(innerMul A B·C) all-X ? {cols_eq(lhs,rhs)}")

print("SCOPE of mixed-Leibniz operator identity (A=slotA u1, B=slotB 1 = kAB):")
test_mixed(sA(u1),sB(one), Cherm, "C generic Hermitian")
test_mixed(sA(u1),sB(one), Cnh,   "C generic NON-Herm")

print("SCOPE with A,B generic Hermitian slots too:")
test_mixed(sB(one),sC(one), Cherm, "famA, C generic Herm")
test_mixed(sB(one),sC(one), Cnh,   "famA, C generic NON-Herm")

# Does innerMul_leibniz_herm (C Herm, X Herm) vs all-X differ? Test kAB with C Herm but check
# the identity holds for the ARENA (all X) — already did. Now the crux: WHY all-X for slot C.
# Decompose the two needed mixed brackets via lie_lie into base brackets:
#   ⁅kAB, L C⁆ = ⁅⁅L(sA u1),L(sB 1)⁆, L C⁆ = ⁅L(sA u1),⁅L(sB 1),L C⁆⁆ - ⁅L(sB 1),⁅L(sA u1),L C⁆⁆
#             = ⁅L(sA u1), innerMul(sB 1)(C)⁆ - ⁅L(sB 1), innerMul(sA u1)(C)⁆
print("\nBASE-BRACKET decomposition of the two needed mixed brackets (lie_lie):")
La=Lmul(sA(u1)); Lb=Lmul(sB(one))
for (Cname,C) in [("slotC 1",sC(one)),("slotB u1",sB(u1))]:
    iBC=comm_cols(Lb,Lmul(C))   # innerMul(sB 1)(C)
    iAC=comm_cols(La,Lmul(C))   # innerMul(sA u1)(C)
    b1=comm_cols(La, iBC)       # ⁅L(sA u1), innerMul(sB 1)(C)⁆
    b2=comm_cols(Lb, iAC)       # ⁅L(sB 1), innerMul(sA u1)(C)⁆
    total=cols_sub(b1,b2)
    tgt=comm_cols(kAB,Lmul(C))
    print(f"  C={Cname}: lie_lie total==⁅kAB,LC⁆ ? {cols_eq(total,tgt)}")
    print(f"     base1 ⁅L(sA u1),innerMul(sB1)(C)⁆ zero? {cols_zero(b1)}   base2 ⁅L(sB1),innerMul(sAu1)(C)⁆ zero? {cols_zero(b2)}")
    print(f"     innerMul(sB1)(C) zero? {cols_zero(iBC)}   innerMul(sAu1)(C) zero? {cols_zero(iAC)}")
    # is innerMul(sB1)(C) = a family gen (adE central)? test if it equals innerMul of central slots
    # is base1 = ⁅L(sA u1), famX⁆ where famX central => reduces via central mixed lever?
