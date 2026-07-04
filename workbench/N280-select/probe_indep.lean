import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular
import Phys.Algebra.TowerWorldMapChirality

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- Are the six operators {lregI,lregJ,lregK, rregI,rregJ,rregK} genuinely 6 independent
-- endomorphisms (so(4) dim 6)? Check a cheap discriminator: L and R act DIFFERENTLY.
-- L_hI(1) = u1*1 = u1 ; R_hI(1) = 1*u1 = u1 (same on 1). Use an imaginary test instead.
-- L_hI(e2O) = u1*e2O = e3O ; R_hI(e2O) = e2O*u1 = -e3O.  DIFFERENT ⟹ L_hI ≠ R_hI.
theorem lregI_ne_rregI : leftReg u1M ≠ rightReg u1M := by
  intro h
  have := congrArg (fun f => f e2O) h
  simp only [leftReg_apply, rightReg_apply] at this
  -- u1 * e2O = e3O, e2O * u1 = -e3O
  have h1 : (u1M : O ℚ) * e2O = e3O := by
    show u1 * e2O = e3O; rw [← JO_apply]; exact JO_e2
  have h2 : e2O * (u1M : O ℚ) = -e3O := by
    show e2O * u1 = -e3O
    rw [u1_iotaO, e2O_iotaO,
        show (iotaO hJ * iotaO hI) = iotaO (hJ * hI) from (CD.iota_mul hJ hI).symm, hJ_hI,
        map_neg, ← e3O_iotaO]
  rw [h1, h2] at this
  -- this : e3O = -e3O ⟹ 2•e3O = 0 ⟹ e3O = 0, contradicting e3O ≠ 0
  have h2e : (2 : ℚ) • e3O = 0 := by
    have := this; rw [two_smul]; nth_rewrite 1 [this]; abel
  have hz : e3O = (0 : O ℚ) := by
    have := h2e
    rwa [smul_eq_zero, or_iff_right (by norm_num : (2:ℚ) ≠ 0)] at this
  have hne : e3O ≠ (0 : O ℚ) := by
    intro hzz
    have : (e3O : O ℚ).re.im.im = 0 := by rw [hzz]; rfl
    simp only [e3O] at this; norm_num at this
  exact hne hz

end
end Phys.Algebra
