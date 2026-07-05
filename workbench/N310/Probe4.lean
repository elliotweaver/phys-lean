/-
  MEASURE-FIRST probe 4 for N310 (seed T7): the SCALAR-I₃ separation, matched magnitudes.
  The ℂ-line imaginary directions are all collinear with u1, so octCross of two of them
  vanishes -> assoc3 = 0 on the ℂ-line (I₃=0, leptons). The Fano triple has assoc3 = -1 ≠ 0.
  The separation: with the SAME slot-norms, I₃ differs (0 vs nonzero) -> Q (norms) and I₃ (cross)
  are independent.
-/
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationAutCompact
import Mathlib.Tactic

namespace N310Probe4

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- The imaginary ℂ-line direction is (a multiple of) u1. Two such are collinear -> octCross=0.
-- octCross_self: octCross x x = 0 for x ∈ ImO. And octCross is bilinear -> octCross (b•u1)(d•u1)=0.

/-- octCross of two collinear multiples of u1 vanishes: `u1*u1 = -1` cancels `gForm u1 u1 = 1`. -/
theorem octCross_u1_collinear (b d : ℚ) :
    octCross (b • u1) (d • u1) = 0 := by
  have hg : gForm u1 u1 = 1 := by
    unfold gForm; simp [u1, reQ, CD.mul_re, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.star_re', Dbl.star_im', Dbl.neg_im]
  have hsq : (u1 : O ℚ) * u1 = -1 := Phys.Algebra.complexUnit_sq
  unfold octCross
  rw [qsmul_mul_left, qsmul_mul_right, gForm_smul_left, gForm_smul_right, smul_smul,
      hg, hsq, mul_one, smul_neg, neg_add_cancel]

/-- (C1b) assoc3 on the ℂ-line's IMAGINARY parts vanishes: assoc3 x (b•u1) (d•u1) = 0. -/
theorem assoc3_cline_zero (x : O ℚ) (b d : ℚ) :
    assoc3 x (b • u1) (d • u1) = 0 := by
  unfold assoc3
  rw [octCross_u1_collinear]
  show reQ (x * star (0 : O ℚ)) = 0
  rw [star_zero, mul_zero]
  simp [reQ]

end N310Probe4
