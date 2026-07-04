import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapChirality

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- On the 8-dim SPINOR O ℚ, the LEFT and RIGHT multiplication operators of u1 (the fold √-1).
-- L² = -id, R² = -id (both complex structures). The MIXING datum is trace(L∘R) vs trace(L∘L).
-- If L,R are trace-orthogonal on the spinor, that is a CLEAN neutral geometry the vector-7 lacked
-- (N257: Q∉span{T3,Y} on the vector-7). Compute the 8-coordinate traces.

-- trace of an endomorphism of O ℚ via the standard basis. Use LinearMap.trace? Heavy.
-- Instead: compute the DIAGONAL sum over the 8 basis vectors explicitly on coordinates.
-- Cheaper discriminator: does L_u1 ∘ R_u1 = R_u1 ∘ L_u1 (do the two u1-complex-structures commute)?
-- On H (associative) they commute; on O they may not. This is the KEY: if [L_u1,R_u1]≠0 on O,
-- the two electroweak U(1)s do NOT commute on the spinor either (the wall persists);
-- if they DO commute, the spinor gives a clean abelian neutral pair (progress toward ★2).

theorem Lu1_Ru1_on_H (w : H ℚ) :
    leftReg u1M (rightReg u1M (iotaO w)) - rightReg u1M (leftReg u1M (iotaO w)) = 0 := by
  simp only [leftReg_apply, rightReg_apply]
  show (u1M : O ℚ) * (iotaO w * (u1M : O ℚ)) - ((u1M : O ℚ) * iotaO w) * (u1M : O ℚ) = 0
  rw [show ((u1M : O ℚ)) = u1 from rfl, u1_iotaO]
  have hz : assoc (iotaO hI) (iotaO w) (iotaO hI) = 0 := assoc_iotaO hI w hI
  have : (iotaO hI * iotaO w) * iotaO hI - iotaO hI * (iotaO w * iotaO hI) = 0 := hz
  rw [sub_eq_zero] at this ⊢
  exact this.symm

-- The CRITICAL probe: do L_u1 and R_u1 commute on the FULL spinor O ℚ (including the doubled half)?
-- Test at e4O (the doubling axis, in Hℓ). If nonzero, the two U(1)s don't commute on the spinor.
theorem Lu1_Ru1_at_e4O :
    u1 * (e4O * u1) - (u1 * e4O) * u1 = (0 : O ℚ) ∨ u1 * (e4O * u1) - (u1 * e4O) * u1 ≠ 0 := by
  by_cases h : u1 * (e4O * u1) - (u1 * e4O) * u1 = 0
  · left; exact h
  · right; exact h

-- Actually compute it concretely: is u1*(e4O*u1) - (u1*e4O)*u1 = 0 at the doubling unit?
example : u1 * (e4O * u1) - (u1 * e4O) * u1 = (0 : O ℚ) := by
  apply CD.ext <;> apply CD.ext <;> apply Dbl.ext <;>
    simp only [u1, e4O, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_im, Dbl.one_re, Dbl.zero_re, Dbl.one_im] <;> ring

end
end Phys.Algebra
