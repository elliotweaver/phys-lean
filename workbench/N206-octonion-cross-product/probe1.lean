import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationRep7
import Phys.Algebra.SpinorRotation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## PROBE1 — the cross product, real-part identity, closure, antisymmetry. -/

/-- gForm value at the unit: gForm v 1 = reQ v. -/
theorem gForm_one_right (v : O ℚ) : gForm v (1 : O ℚ) = reQ v := by
  show reQ (v * star (1 : O ℚ)) = reQ v
  rw [show star (1 : O ℚ) = 1 by simp, mul_one]

/-- For x ∈ ImO (star x = -x), the real part of x·y equals −gForm x y.
    gForm x y = reQ (x · star y); for imaginary y, star y = −y, so this is −reQ(x·y). -/
theorem octMul_re_eq_neg_gForm {x y : O ℚ} (hy : y ∈ ImO) :
    reQ (x * y) = - gForm x y := by
  rw [mem_ImO] at hy
  show reQ (x * y) = - reQ (x * star y)
  rw [hy, mul_neg, reQ_neg]; ring

/-- THE CROSS PRODUCT on O ℚ: `octCross x y := x*y + (gForm x y) • 1`, the imaginary part of
    the octonion product (we ADD gForm x y • 1 because for imaginary args re(x·y) = −gForm x y,
    so this cancels the real part). -/
def octCross (x y : O ℚ) : O ℚ := x * y + (gForm x y) • (1 : O ℚ)

/-- ★ CLOSURE: for imaginary x, y the cross product lands in ImO (its real part vanishes).
    re(octCross x y) = re(x·y) + gForm x y = −gForm x y + gForm x y = 0, and a real part of 0
    on the unit line is exactly membership in ImO. -/
theorem octCross_mem_ImO {x y : O ℚ} (hx : x ∈ ImO) (hy : y ∈ ImO) :
    octCross x y ∈ ImO := by
  rw [mem_ImO]
  -- star (x*y + (gForm x y)•1) = star(x*y) + gForm x y • 1
  -- We show star (octCross x y) = - octCross x y via the trace identity:
  -- octCross x y + star (octCross x y) = (2 reQ (octCross x y)) • 1, and reQ = 0.
  have htr := trace_id (octCross x y)
  have hre : reQ (octCross x y) = 0 := by
    show reQ (x * y + (gForm x y) • (1 : O ℚ)) = 0
    rw [reQ_add, octMul_re_eq_neg_gForm hy]
    have : reQ ((gForm x y) • (1 : O ℚ)) = gForm x y := by
      rw [reQ_smul, reQ_one, mul_one]
    rw [this]; ring
  rw [hre] at htr
  simp only [mul_zero, zero_smul] at htr
  -- htr : octCross x y + star (octCross x y) = 0
  linear_combination (norm := abel) htr

#print axioms gForm_one_right
#print axioms octMul_re_eq_neg_gForm
#print axioms octCross_mem_ImO

end

end Phys.Algebra
