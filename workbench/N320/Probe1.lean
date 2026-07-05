/-
  workbench/N320/Probe1 — DE-RISK the B1 structural form on the BANKED derived ℝ `cutExp`.
  Confirms the banked ContinuumLog order lemmas close every planned landing. Bounded probe.
-/
import Phys.Foundation.ContinuumLog
import Phys.Algebra.FineStructureScaleCoupling
import Mathlib.Tactic

namespace N320Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

noncomputable section

/-- v/M = exp(−c/g²) on the banked derived ℝ `cutExp`. -/
def transmutationRatio (c g2 : Cut) : Cut := cutExp (-(c / g2))

/-- v = M·exp(−c/g²). -/
def transmutationScale (M c g2 : Cut) : Cut := M * transmutationRatio c g2

/-- Born positivity of the suppression factor (banked `cutExp_pos`). -/
theorem transmutationRatio_pos (c g2 : Cut) : 0 < transmutationRatio c g2 :=
  cutExp_pos _

/-- Suppression ≤ 1 for c ≥ 0, g² > 0 (banked `cutExp_le_one_of_nonpos`). -/
theorem transmutationRatio_le_one (c g2 : Cut) (hc : 0 ≤ c) (hg : 0 < g2) :
    transmutationRatio c g2 ≤ 1 := by
  unfold transmutationRatio
  apply cutExp_le_one_of_nonpos
  have : 0 ≤ c / g2 := div_nonneg hc (le_of_lt hg)
  linarith

/-- STRICT suppression < 1 for c > 0, g² > 0 (banked `cutExp_strictMono` vs `cutExp_zero`). -/
theorem transmutationRatio_lt_one (c g2 : Cut) (hc : 0 < c) (hg : 0 < g2) :
    transmutationRatio c g2 < 1 := by
  unfold transmutationRatio
  have hneg : -(c / g2) < 0 := by
    have : 0 < c / g2 := div_pos hc hg
    linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

/-- v < M for c,g²,M > 0. -/
theorem transmutationScale_lt_M (M c g2 : Cut) (hc : 0 < c) (hg : 0 < g2) (hM : 0 < M) :
    transmutationScale M c g2 < M := by
  unfold transmutationScale
  have h := transmutationRatio_lt_one c g2 hc hg
  calc M * transmutationRatio c g2 < M * 1 := by
        apply mul_lt_mul_of_pos_left h hM
    _ = M := mul_one M

/-- positive scale. -/
theorem transmutationScale_pos (M c g2 : Cut) (hM : 0 < M) :
    0 < transmutationScale M c g2 :=
  mul_pos hM (transmutationRatio_pos c g2)

/-- STRICTLY DECREASING in c: larger c ⟹ more suppression. -/
theorem transmutationRatio_mono_c (c1 c2 g2 : Cut) (h : c1 < c2) (hg : 0 < g2) :
    transmutationRatio c2 g2 < transmutationRatio c1 g2 := by
  unfold transmutationRatio
  apply cutExp_strictMono
  have hlt : c1 / g2 < c2 / g2 := by gcongr
  linarith

/-- STRICTLY INCREASING in g²: weaker suppression at larger coupling. -/
theorem transmutationRatio_mono_g2 (c g1 g2 : Cut) (hc : 0 < c) (h1 : 0 < g1) (h : g1 < g2) :
    transmutationRatio c g1 < transmutationRatio c g2 := by
  unfold transmutationRatio
  apply cutExp_strictMono
  have h2 : 0 < g2 := lt_trans h1 h
  have hcg : c / g2 < c / g1 := by gcongr
  linarith

/-- v/M = ratio for M ≠ 0. -/
theorem transmutationRatio_eq_scale_div (M c g2 : Cut) (hM : M ≠ 0) :
    transmutationScale M c g2 / M = transmutationRatio c g2 := by
  unfold transmutationScale
  field_simp

/-- The coupling instance: at the banked Arc-A coupling g² = alphaStar (>0), suppression holds. -/
theorem transmutationRatio_at_alphaStar (c : Cut) (hc : 0 < c) :
    transmutationRatio c ((alphaStar : ℚ) : Cut) < 1 := by
  apply transmutationRatio_lt_one c _ hc
  have : (0 : ℚ) < alphaStar := by rw [alphaStar_eq]; norm_num
  exact_mod_cast this

end
end N320Probe
