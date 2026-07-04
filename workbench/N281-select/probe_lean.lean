import Phys.Algebra.TowerWorldMapWeakDoubletTwoHandedSO4
import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Algebra.TowerWorldMapChirality
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationColourCentralizer
import Mathlib.Tactic

open scoped Classical
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000

noncomputable section

/-- coordinate idiom helper (copied from N279 witness), extended with O/Dbl zero-one-smul. -/
macro "oct_coord" : tactic =>
  `(tactic| (apply CD.ext <;> apply CD.ext <;> apply Dbl.ext <;>
    simp only [u1, e2O, e3O, e4O, e5O, e6O, e7O, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im, CD.one_re, CD.one_im,
      cd_qsmul_re, cd_qsmul_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_im, Dbl.zero_re, Dbl.one_re, Dbl.one_im,
      Dbl.smul_re, Dbl.smul_im] <;> ring))

/-! ## PROBE 1: the same-unit two faces COMMUTE on ALL O — flexibility (coordinate-free). -/
theorem flex_reg_commute_probe :
    lregI.comp rregI = rregI.comp lregI := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.comp_apply, lregI_apply, rregI_apply]
  -- goal: u1 * (x * u1) = (u1 * x) * u1
  exact mul_flex u1 x

/-! ## PROBE 3: both faces square to -id (banked leftReg_sq/rightReg_sq + gForm_u1M=1). -/
theorem lregI_sq_probe : lregI.comp lregI = (-1 : ℚ) • LinearMap.id := by
  show (leftReg u1M).comp (leftReg u1M) = (-1 : ℚ) • LinearMap.id
  rw [leftReg_sq u1M, gForm_u1M]

theorem rregI_sq_probe : rregI.comp rregI = (-1 : ℚ) • LinearMap.id := by
  show (rightReg u1M).comp (rightReg u1M) = (-1 : ℚ) • LinearMap.id
  rw [rightReg_sq u1M, gForm_u1M]

/-! ## PROBE 4: eigen-split support facts (bounded coordinate `ring`). -/
theorem foldVec_kills_e2O_probe : (lregI + rregI) e2O = 0 := by
  simp only [LinearMap.add_apply, lregI_apply, rregI_apply]
  -- u1 * e2O + e2O * u1 = e3O + (-e3O) = 0
  oct_coord

theorem foldVec_on_core_one_probe : (lregI + rregI) (1 : O ℚ) = (2 : ℚ) • u1 := by
  simp only [LinearMap.add_apply, lregI_apply, rregI_apply]
  oct_coord

theorem foldAx_kills_one_probe : (lregI - rregI) (1 : O ℚ) = 0 := by
  simp only [LinearMap.sub_apply, lregI_apply, rregI_apply]
  oct_coord

/-! ## PROBE 2: the two faces are DISTINCT — already banked in N280 as `lregI_ne_rregI`. -/
theorem lregI_ne_rregI_probe : lregI ≠ rregI := lregI_ne_rregI

/-! ## PROBE 6a: RIGHT-face Leibniz twin — for a derivation D, [D, R_a] = R_{D a}. -/
-- comm for the RIGHT multiplication: D(x*u1) = D x * u1 + x * D u1  (Leibniz), so
-- D(rightReg u1 x) = rightReg u1 (D x) + leftReg? ... check: rightReg u1 x = x * u1.
-- D(x*u1) = (D x)*u1 + x*(D u1). With D u1 = 0 (colour): D(x*u1) = (D x)*u1 = rightReg u1 (D x).
theorem right_comm_deriv_probe {D : Module.End ℚ (O ℚ)} (hD : IsDerivQ D) (x : O ℚ) :
    D (x * u1) = D x * u1 + x * D u1 := hD x u1

end

end Phys.Algebra
