import Phys.Algebra.AntiScreeningTemperingCeiling
import Phys.Algebra.TowerWorldMapWeakDoubletLeftRegular

open Phys.Algebra
open Phys.Algebra.AntiScreeningTemperingCeiling
open Phys.Algebra.IsospinAntiScreeningCrossNorm
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section

-- helper: u1M ≠ 0 in ImO
example : (u1M : ImO) ≠ 0 := by
  intro h
  exact Phys.Algebra.u1_ne_zero (congrArg Subtype.val h)

-- TEETH 1: the adjoint Casimir eigenvalue is uniquely -8 (ties to N277 casimirOp_u1I)
example (c : ℚ) (hc : casimirOp u1M = c • u1M) : c = -8 := by
  have hu : (u1M : ImO) ≠ 0 := fun h => Phys.Algebra.u1_ne_zero (congrArg Subtype.val h)
  have h : c • u1M = (-8 : ℚ) • u1M := by rw [← hc, casimirOp_u1I]
  have h2 : (c - (-8)) • u1M = 0 := by rw [sub_smul, h, sub_self]
  rcases smul_eq_zero.mp h2 with h3 | h4
  · linarith [sub_eq_zero.mp h3]
  · exact absurd h4 hu

-- TEETH 2: the fundamental Casimir eigenvalue is uniquely -3 (ties to N279)
example (c : ℚ)
    (hc : lregI.comp lregI + lregJ.comp lregJ + lregK.comp lregK = c • LinearMap.id) :
    c = -3 := by
  have hone : (1 : O ℚ) ≠ 0 := one_ne_zero
  have heq : c • LinearMap.id = (-3 : ℚ) • (LinearMap.id : Module.End ℚ (O ℚ)) := by
    rw [← hc, leftReg_casimir_eq_neg_three]
  have happ := LinearMap.congr_fun heq (1 : O ℚ)
  simp only [LinearMap.smul_apply, LinearMap.id_apply] at happ
  -- happ : c • (1:O ℚ) = (-3:ℚ) • (1:O ℚ)
  have h2 : (c - (-3)) • (1 : O ℚ) = 0 := by rw [sub_smul, happ, sub_self]
  rcases smul_eq_zero.mp h2 with h3 | h4
  · linarith [sub_eq_zero.mp h3]
  · exact absurd h4 hone

end
