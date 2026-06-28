import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem octBisector_imag {e w : O Cut} (he : star e = -e) (hw : star w = -w) :
    star ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
      = -((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) := by
  have hmim : star (e - w) = -(e - w) := by rw [star_sub, he, hw]; abel
  rw [smulCompat_oCut.hstar, hmim, smulCompat_oCut.hneg]

theorem octDeflate_sq_neg_one {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) :
    ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
      ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) = -1 := by
  rw [octRefl_mul_self_imag (octBisector_imag he hw), octBisector_unit hne]
  simp

theorem octDeflate_mul_mul_left {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) (z : O Cut) :
    ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
      (((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) * z) = -z := by
  rw [mul_mul_left, octDeflate_sq_neg_one he hw hne, neg_one_mul]

theorem octDeflate_involution {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) :
    octDeflate e w * octDeflate e w = 1 := by
  have h := biMulLin_imag_involutive ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
    (octDeflate_sq_neg_one he hw hne)
    (octDeflate_mul_mul_left he hw hne)
  exact h

/-- ★★ THE OCTONION-BLOCK FACTORIZATION. For any octonion-block QvC-isometry T with
    T(0,0,e)=(0,0,w) (e unit-imaginary, w≠e), T factors as octDeflate e w · (octDeflate e w · T). -/
theorem octDeflate_factorization {T : Module.End Cut STVC}
    {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hee : gFormC e e = 1) (hww : gFormC w w = 1)
    (hTimg : T ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), w)) (hne : e - w ≠ 0) :
    T = octDeflate e w * (octDeflate e w * T) := by
  rw [← mul_assoc, octDeflate_involution he hw hne, one_mul]

/-- ★★ THE FACTORIZATION PACKAGED — the right factor is e-FIXING (octDeflate_step N117) AND T is
    the reflection of it. The octonion-block analogue of deflate_factorization_stabilizer. -/
theorem octDeflate_factorization_stabilizer {T : Module.End Cut STVC}
    {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hee : gFormC e e = 1) (hww : gFormC w w = 1)
    (hTimg : T ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), w)) (hne : e - w ≠ 0) :
    (octDeflate e w * T) ((0:Cut), (0:Cut), e) = ((0:Cut), (0:Cut), e) ∧
    T = octDeflate e w * (octDeflate e w * T) :=
  ⟨octDeflate_step he hw hee hww hTimg hne,
   octDeflate_factorization he hw hee hww hTimg hne⟩

end
end Phys.Algebra
