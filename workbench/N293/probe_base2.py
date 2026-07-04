"""
N293 — characterize the sticking-point operator innerMul(slotA u1)(slotC 1) and find the
cleanest operator-level route for base2 = ⁅L(slotB 1), innerMul(slotA u1)(slotC 1)⁆ = 0.
Test if innerMul(slotA u1)(slotC 1) equals a recognizable object (± Lmul, ± another coset/fam gen,
± innerMul of central slots via adE).
"""
from fractions import Fraction as F
import sys
sys.path.insert(0,'/Users/elliotweaver/phys-lean/workbench/N293')
from probe_route import (E,one,u1,O0,oadd,osub,omul,ostar,oneg,M0,mmul,madd,msub,jb,
    slot,sA,sB,sC,DIM,m2v,op_cols,comm_cols,Lmul,innerMul,cols_eq,cols_zero,cols_scale,
    cols_sub,innerMul_apply,mat_eq,mat_zero,flat,basisM,apply_cols,unflat)

def cols_add(P,Q): return [[P[k][r]+Q[k][r] for r in range(DIM)] for k in range(DIM)]

La=Lmul(sA(u1)); Lb=Lmul(sB(one)); Lc=Lmul(sC(one))
iAC=innerMul(sA(u1),sC(one))    # innerMul(slotA u1)(slotC 1)
iBC=innerMul(sB(one),sC(one))   # famA (central)

# base2 = ⁅Lb, iAC⁆
base2=comm_cols(Lb,iAC)
print("base2 = ⁅L(slotB 1), innerMul(slotA u1)(slotC 1)⁆ zero?", cols_zero(base2))

# Is iAC = ± innerMul of a pair we know? Try candidates:
cands = {
 "innerMul(slotB u1)(slotA 1)": innerMul(sB(u1),sA(one)),
 "innerMul(slotA 1)(slotC u1)": innerMul(sA(one),sC(u1)),
 "innerMul(slotC u1)(slotA 1)=kCA": innerMul(sC(u1),sA(one)),
 "innerMul(slotB u1)(slotB 1)": innerMul(sB(u1),sB(one)),
}
for nm,op in cands.items():
    print(f"  iAC == {nm}? {cols_eq(iAC,op)}   iAC == -{nm}? {cols_eq(iAC,cols_scale(op,F(-1)))}")

# Does iAC commute with Lb because iAC 'lives in' slots B is blind to?
# Test: is base2 provable as ⁅Lb, iAC⁆ where we expand iAC=⁅La,Lc⁆ and use leibniz_lie:
# ⁅Lb,⁅La,Lc⁆⁆ = ⁅⁅Lb,La⁆,Lc⁆ + ⁅La,⁅Lb,Lc⁆⁆ = ⁅innerMul(sB1)(sAu1),Lc⁆ + ⁅La, innerMul(sB1)(sC1)⁆
t1=comm_cols(innerMul(sB(one),sA(u1)), Lc)   # ⁅innerMul(slotB 1)(slotA u1), L(slotC 1)⁆
t2=comm_cols(La, iBC)                          # ⁅L(slotA u1), famA⁆
print("\nbase2 via leibniz_lie: t1+t2 == base2 ?", cols_eq(cols_add(t1,t2),base2))
print("  t1=⁅innerMul(slotB1)(slotAu1),L(slotC1)⁆ zero?",cols_zero(t1))
print("  t2=⁅L(slotAu1),famA⁆ zero?",cols_zero(t2))
# innerMul(slotB 1)(slotA u1) = -innerMul(slotA u1)(slotB 1) = -kAB
print("  innerMul(slotB1)(slotAu1) == -kAB ?", cols_eq(innerMul(sB(one),sA(u1)), cols_scale(innerMul(sA(u1),sB(one)),F(-1))))
# so t1 = ⁅-kAB, L(slotC 1)⁆ = -⁅kAB,L(slotC1)⁆  (the lemma we want). CIRCULAR. Confirm:
print("  t1 == -⁅kAB,L(slotC1)⁆ ?", cols_eq(t1, cols_scale(comm_cols(innerMul(sA(u1),sB(one)),Lc),F(-1))))

# NON-CIRCULAR handle for base2: is innerMul(slotA u1)(slotC 1) itself in derH3 & central-collapsible?
# slotA u1 Herm, slotC 1 Herm => innerMul(slotA u1)(slotC 1) ∈ derH3. Is it = adE(central)? NO (u1).
# Try: express base2=⁅Lb,iAC⁆ and use that Lb=L(central slotB1). Maybe ⁅L(ocRM P), innerMul Q R⁆
# has a central lever when P central? Test general: pick central D=slotB1, is ⁅L D, innerMul Q R⁆
# related to L(...)? Probably not. Instead: maybe base2=0 because iAC ANNIHILATES on the relevant.
# DIRECT: prove base2=0 by showing iAC and Lb COMMUTE. iAC=⁅La,Lc⁆. 
# Alternative: swap roles. base2 = ⁅Lb, iAC⁆. Use iAC = -innerMul(slotC 1)(slotA u1) and expand via
# the OTHER slot. innerMul(slotC1)(slotAu1)=⁅Lc,La⁆.
# ⁅Lb,⁅Lc,La⁆⁆ = ⁅⁅Lb,Lc⁆,La⁆ + ⁅Lc,⁅Lb,La⁆⁆ = ⁅innerMul(sB1)(sC1),La⁆ + ⁅Lc,innerMul(sB1)(sAu1)⁆
#             = ⁅famA, L(slotA u1)⁆ + ⁅L(slotC 1), -kAB⁆
s1=comm_cols(iBC, La)                # ⁅famA, L(slotA u1)⁆  (central lever!)
s2=comm_cols(Lc, innerMul(sB(one),sA(u1)))  # ⁅L(slotC1), -kAB⁆
base2b = cols_scale(cols_add(s1,s2),F(-1))   # base2 = -(⁅Lb,⁅Lc,La⁆⁆) since iAC=-⁅Lc,La⁆
print("\nbase2 via OTHER expansion: -(s1+s2) == base2 ?", cols_eq(base2b, base2))
print("  s1=⁅famA,L(slotAu1)⁆ zero? (central lever, famA·slotAu1=0)",cols_zero(s1))
print("  s2=⁅L(slotC1),-kAB⁆ ; == ⁅kAB,L(slotC1)⁆ ?", cols_eq(s2, comm_cols(innerMul(sA(u1),sB(one)),Lc)))
