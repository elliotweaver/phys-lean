import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- The normalized bisector n := r⁻¹•(e−w) is imaginary: star n = -n. -/
theorem octBisector_imag {e w : O Cut} (he : star e = -e) (hw : star w = -w) :
    star ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
      = -((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) := by
  have hmim : star (e - w) = -(e - w) := by rw [star_sub, he, hw]; abel
  rw [smulCompat_oCut.hstar, hmim, smulCompat_oCut.hneg]

/-- The normalized bisector squares to −1: n·n = −1 (octRefl_mul_self_imag + octBisector_unit). -/
theorem octDeflate_sq_neg_one {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) :
    ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
      ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = -1 := by
  rw [octRefl_mul_self_imag (octBisector_imag he hw), octBisector_unit hne]
  simp

/-- The left-alternative law specialized at the bisector: ∀ z, n·(n·z) = −z. -/
theorem octDeflate_mul_mul_left {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) (z : O Cut) :
    ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
      (((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) * z) = -z := by
  rw [mul_mul_left, octDeflate_sq_neg_one he hw hne, neg_one_mul]

/-- ★ THE REFLECTION INVOLUTION: octDeflate e w · octDeflate e w = 1.
    From the banked N102 biMulLin_imag_involutive. -/
theorem octDeflate_involution {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) :
    octDeflate e w * octDeflate e w = 1 := by
  have h := biMulLin_imag_involutive ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
    (octDeflate_sq_neg_one he hw hne)
    (octDeflate_mul_mul_left he hw hne)
  exact h

end
end Phys.Algebra
