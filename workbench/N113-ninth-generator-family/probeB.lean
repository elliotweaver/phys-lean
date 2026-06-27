import Phys.Algebra.LorentzContinuumGenerationKAK

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- (axisRotLin copied from probeA — only need apply + the def)
def axisRotLin (e : O Cut) (c s : Cut) : Module.End Cut STVC where
  toFun p := (p.1, c * p.2.1 - s * gFormC p.2.2 e,
              p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (p.2.1 + q.2.1) - s * gFormC (p.2.2 + q.2.2) e
          = (c * p.2.1 - s * gFormC p.2.2 e) + (c * q.2.1 - s * gFormC q.2.2 e)
      rw [gFormC_add_left]; ring
    · show (p.2.2 + q.2.2) + (s * (p.2.1 + q.2.1) + (c - 1) * gFormC (p.2.2 + q.2.2) e) • e
          = (p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
            + (q.2.2 + (s * q.2.1 + (c - 1) * gFormC q.2.2 e) • e)
      rw [gFormC_add_left]
      rw [show s * (p.2.1 + q.2.1) + (c - 1) * (gFormC p.2.2 e + gFormC q.2.2 e)
            = (s * p.2.1 + (c - 1) * gFormC p.2.2 e) + (s * q.2.1 + (c - 1) * gFormC q.2.2 e) by ring]
      rw [add_smul]; abel
  map_smul' a p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show c * (a • p.2.1) - s * gFormC (a • p.2.2) e = a • (c * p.2.1 - s * gFormC p.2.2 e)
      rw [gFormC_smul_left]; simp only [smul_eq_mul]; ring
    · show (a • p.2.2) + (s * (a • p.2.1) + (c - 1) * gFormC (a • p.2.2) e) • e
          = a • (p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e)
      rw [gFormC_smul_left, smul_add, smul_smul]
      rw [show s * (a • p.2.1) + (c - 1) * (a * gFormC p.2.2 e)
            = a * (s * p.2.1 + (c - 1) * gFormC p.2.2 e) by simp only [smul_eq_mul]; ring]

theorem axisRotLin_apply (e : O Cut) (c s : Cut) (p : STVC) :
    axisRotLin e c s p = (p.1, c * p.2.1 - s * gFormC p.2.2 e,
              p.2.2 + (s * p.2.1 + (c - 1) * gFormC p.2.2 e) • e) := rfl

/-! ## THE NON-COMMUTATION — the structural complement to N112. -/

/-- The banked octonion-block word `genTwoPlaneLin e₂ je2` NEGATES the axis `e₂`:
    `vTwoPlane e₂ je2 e₂ = −e₂` (from `biMulComp_e2_je2_negates_e2`). It does NOT fix `e₂` — breaking
    the N112 commutation hypothesis. -/
theorem vTwoPlane_e2_je2_e2 : vTwoPlane (CD.e2 : O Cut) (je2 : O Cut) (CD.e2 : O Cut) = -(CD.e2 : O Cut) := by
  have h := biMulComp_e2_je2_negates_e2
  -- both sides' .2.2 coincide: vTwoPlane_apply matches biMulFun∘biMulFun .2.2
  have := congrArg (fun p => p.2.2) h
  simpa [vTwoPlane_apply, biMulFun] using this

/-- gFormC (−e₂) e₂ = −1. -/
theorem gFormC_neg_e2_e2 : gFormC (-(CD.e2 : O Cut)) (CD.e2 : O Cut) = (-1 : Cut) := by
  rw [show (-(CD.e2:O Cut)) = (-1:Cut) • (CD.e2:O Cut) by rw [neg_one_smul]]
  rw [gFormC_smul_left, e2_gFormC_self]; ring

/-- R∘W applied to (0,0,e₂): the word negates e₂ first (so the axis-rotation reads gFormC(−e₂)e₂ = −1),
    giving x-slot = c·0 − s·(−1) = s. -/
theorem axisRot_word_e2 (c s : Cut) :
    ((axisRotLin (CD.e2 : O Cut) c s * genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut))
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.1 = s := by
  rw [Module.End.mul_apply, genTwoPlaneLin_vblock, vTwoPlane_e2_je2_e2, axisRotLin_apply]
  show c * 0 - s * gFormC (-(CD.e2:O Cut)) (CD.e2:O Cut) = s
  rw [gFormC_neg_e2_e2]; ring

/-- W∘R applied to (0,0,e₂): the axis-rotation acts first (reads gFormC e₂ e₂ = 1), giving x-slot
    = c·0 − s·1 = −s; the word then leaves the x-slot rigid. -/
theorem word_axisRot_e2 (c s : Cut) :
    ((genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut) * axisRotLin (CD.e2 : O Cut) c s)
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.1 = -s := by
  rw [Module.End.mul_apply, axisRotLin_apply]
  show (genTwoPlaneLin (CD.e2:O Cut) (je2:O Cut)
      ((0:Cut), c * 0 - s * gFormC (CD.e2:O Cut) (CD.e2:O Cut),
        (CD.e2:O Cut) + (s * 0 + (c - 1) * gFormC (CD.e2:O Cut) (CD.e2:O Cut)) • (CD.e2:O Cut))).2.1 = -s
  rw [genTwoPlaneLin_vblock, e2_gFormC_self]
  ring

end

end Phys.Algebra
