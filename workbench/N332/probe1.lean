import Phys.Algebra.PlanckMassRatio
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN332

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

noncomputable section

-- (1) THE EW RUNG as a concrete derived ratio of the 84π grammar (n = dim spaceSub = 9).
def ewClosureRatio : Cut := cutExp (-(rungExponent (Module.finrank ℚ spaceSub)))

theorem ewClosureRatio_eq : ewClosureRatio = cutExp (-(28 * cutPi / 3)) := by
  unfold ewClosureRatio; rw [rungExponent_at_spaceSub]

theorem ewClosureRatio_pos : 0 < ewClosureRatio := by
  unfold ewClosureRatio; exact cutExp_pos _

theorem ewClosureRatio_lt_one : ewClosureRatio < 1 := by
  rw [ewClosureRatio_eq]
  have hneg : -(28 * cutPi / 3) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

-- (2) TIE to B1: c is FORCED = rungExponent(9)·g² (closes B1's deferred coefficient).
theorem ewClosureRatio_eq_transmutation (g2 : Cut) (hg : g2 ≠ 0) :
    transmutationRatio (rungExponent (Module.finrank ℚ spaceSub) * g2) g2 = ewClosureRatio := by
  unfold transmutationRatio ewClosureRatio
  congr 1
  rw [mul_div_assoc, div_self hg, mul_one]

-- (3) the EW rung is deeper than the closure→Planck half-rung (28π/3 > 3π).
theorem ewClosureRatio_lt_planckClosureRatio : ewClosureRatio < planckClosureRatio := by
  rw [ewClosureRatio_eq, planckClosureRatio_eq]
  apply cutExp_strictMono
  have := cutPi_pos; linarith

-- (4) composite v/M_Pl = e^(−37π/3) as product of two grammar quotients.
def ewToPlanckRatio : Cut := ewClosureRatio * planckClosureRatio

theorem ewToPlanckRatio_eq : ewToPlanckRatio = cutExp (-(37 * cutPi / 3)) := by
  unfold ewToPlanckRatio
  rw [ewClosureRatio_eq, planckClosureRatio_eq, cutExp_add]
  congr 1; ring

theorem ewToPlanckRatio_pos : 0 < ewToPlanckRatio := by
  rw [ewToPlanckRatio_eq]; exact cutExp_pos _

theorem ewToPlanckRatio_from_grammar :
    ewToPlanckRatio = cutExp (-(rungExponent (Module.finrank ℚ spaceSub)
                              + rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule))) := by
  unfold ewToPlanckRatio ewClosureRatio planckClosureRatio
  rw [cutExp_add]; congr 1; ring

theorem ewToPlanckRatio_lt_planckClosureRatio : ewToPlanckRatio < planckClosureRatio := by
  unfold ewToPlanckRatio
  have h1 := ewClosureRatio_lt_one
  have h0 := planckClosureRatio_pos
  calc ewClosureRatio * planckClosureRatio < 1 * planckClosureRatio :=
        mul_lt_mul_of_pos_right h1 h0
    _ = planckClosureRatio := one_mul _

-- (5) THE ORDERED LADDER: 0 < v/M_Pl < M/M_Pl < 1 < M_Pl/M, anchored on G (G·M_Pl²=1).
theorem scale_tower_ladder :
    0 < ewToPlanckRatio
    ∧ ewToPlanckRatio < planckClosureRatio
    ∧ planckClosureRatio < 1
    ∧ 1 < planckMassRatio
    ∧ planckMassRatio ^ 2 * newtonScaleProduct = 1 :=
  ⟨ewToPlanckRatio_pos, ewToPlanckRatio_lt_planckClosureRatio,
   planckClosureRatio_lt_one, planckMassRatio_gt_one,
   planckMassRatio_sq_mul_newtonScaleProduct⟩

-- non-vacuity checks
theorem ewToPlanckRatio_ne_planckClosureRatio : ewToPlanckRatio ≠ planckClosureRatio :=
  ne_of_lt ewToPlanckRatio_lt_planckClosureRatio

theorem ewClosureRatio_ne_one : ewClosureRatio ≠ 1 := by
  have := ewClosureRatio_lt_one; intro h; rw [h] at this; linarith

end

end Phys.Algebra.ProbeN332
