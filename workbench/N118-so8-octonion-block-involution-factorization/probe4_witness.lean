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
  rw [octRefl_mul_self_imag (octBisector_imag he hw), octBisector_unit hne]; simp

theorem octDeflate_mul_mul_left {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) (z : O Cut) :
    ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) *
      (((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w)) * z) = -z := by
  rw [mul_mul_left, octDeflate_sq_neg_one he hw hne, neg_one_mul]

theorem octDeflate_involution {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hne : e - w ≠ 0) :
    octDeflate e w * octDeflate e w = 1 :=
  biMulLin_imag_involutive ((cutSqrt (gFormC (e - w) (e - w)))⁻¹ • (e - w))
    (octDeflate_sq_neg_one he hw hne) (octDeflate_mul_mul_left he hw hne)

/-- ★ W8 — the involution ROUND-TRIP made concrete: applying octDeflate e₂ je2 TWICE to the moved
    image (0,0,je2) returns (0,0,je2). The reflect-back composed with itself is the identity. -/
theorem octDeflate_involution_witness :
    octDeflate (CD.e2 : O Cut) (je2 : O Cut)
      (octDeflate (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (0:Cut), (je2 : O Cut)))
      = ((0:Cut), (0:Cut), (je2 : O Cut)) := by
  rw [← Module.End.mul_apply,
      octDeflate_involution e2_imag je2_imag octDeflate_witness_ne]
  rfl

/-- ★ W8 TEETH — the deep coordinate of the round-tripped image reads je2 back. -/
theorem octDeflate_roundtrip_coord :
    (octDeflate (CD.e2 : O Cut) (je2 : O Cut)
      (octDeflate (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (0:Cut), (je2 : O Cut)))).2.2
      = (je2 : O Cut) := by
  rw [octDeflate_involution_witness]

-- COSTUME probe: a WRONG roundtrip Born self-overlap claim. The roundtripped deep coord is je2,
-- whose Born self-overlap gFormC je2 je2 = 1, NOT 111.
theorem costume_probe_FALSE :
    gFormC (octDeflate (CD.e2 : O Cut) (je2 : O Cut)
      (octDeflate (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut), (0:Cut), (je2 : O Cut)))).2.2
      ((0:Cut), (0:Cut), (je2 : O Cut)).2.2 = 111 := by
  rw [octDeflate_roundtrip_coord, je2_gFormC_self]

end
end Phys.Algebra
