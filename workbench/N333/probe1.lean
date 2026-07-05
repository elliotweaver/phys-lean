import Phys.Algebra.ScaleTowerLadder
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN333

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

noncomputable section

/-- m₀/M = (v/M)² — the Born self-overlap square of the banked EW rung. -/
def seesawRatio : Cut := ewClosureRatio * ewClosureRatio

theorem seesawRatio_born_square : seesawRatio = ewClosureRatio ^ 2 := by
  unfold seesawRatio; ring

theorem seesawRatio_eq : seesawRatio = cutExp (-(56 * cutPi / 3)) := by
  unfold seesawRatio
  rw [ewClosureRatio_eq, cutExp_add]
  congr 1; ring

theorem seesawExponent_eq_two_rung :
    (56 : Cut) * cutPi / 3 = 2 * rungExponent (Module.finrank ℚ spaceSub) := by
  rw [rungExponent_at_spaceSub]; ring

theorem seesawRatio_pos : 0 < seesawRatio := by
  rw [seesawRatio_eq]; exact cutExp_pos _

theorem seesawRatio_lt_one : seesawRatio < 1 := by
  rw [seesawRatio_eq]
  have hneg : -(56 * cutPi / 3) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

theorem seesawRatio_lt_ewClosureRatio : seesawRatio < ewClosureRatio := by
  unfold seesawRatio
  have h1 := ewClosureRatio_lt_one
  have h0 := ewClosureRatio_pos
  calc ewClosureRatio * ewClosureRatio < 1 * ewClosureRatio :=
        mul_lt_mul_of_pos_right h1 h0
    _ = ewClosureRatio := one_mul _

theorem seesaw_scale_ordering :
    0 < seesawRatio ∧ seesawRatio < ewClosureRatio ∧ ewClosureRatio < 1 :=
  ⟨seesawRatio_pos, seesawRatio_lt_ewClosureRatio, ewClosureRatio_lt_one⟩

/-- m₀ = M·(v/M)² — the seesaw scale, M the free closure anchor (no new Cut atom). -/
def seesawScale (M : Cut) : Cut := M * seesawRatio

theorem seesawScale_pos (M : Cut) (hM : 0 < M) : 0 < seesawScale M := by
  unfold seesawScale; exact mul_pos hM seesawRatio_pos

/-- m₀ = v²/M — the literal seesaw formula on the banked VEV `transmutationScale`. -/
theorem seesawScale_eq_vev_sq_div (M g2 : Cut) (hM : M ≠ 0) (hg : g2 ≠ 0) :
    (transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2) ^ 2 / M
      = seesawScale M := by
  have hv : transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2
          = M * ewClosureRatio := by
    unfold transmutationScale; rw [ewClosureRatio_eq_transmutation g2 hg]
  rw [hv]; unfold seesawScale; rw [seesawRatio_born_square]
  field_simp

theorem seesawScale_lt_vev (M g2 : Cut) (hM : 0 < M) (hg : g2 ≠ 0) :
    seesawScale M < transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2 := by
  have hv : transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2
          = M * ewClosureRatio := by
    unfold transmutationScale; rw [ewClosureRatio_eq_transmutation g2 hg]
  rw [hv]; unfold seesawScale
  exact mul_lt_mul_of_pos_left seesawRatio_lt_ewClosureRatio hM

theorem seesaw_born_square_scale :
    seesawRatio = cutExp (-(56 * cutPi / 3))
    ∧ seesawRatio = ewClosureRatio ^ 2
    ∧ (56 : Cut) * cutPi / 3 = 2 * rungExponent (Module.finrank ℚ spaceSub)
    ∧ 0 < seesawRatio
    ∧ seesawRatio < ewClosureRatio
    ∧ ewClosureRatio < 1 :=
  ⟨seesawRatio_eq, seesawRatio_born_square, seesawExponent_eq_two_rung,
   seesawRatio_pos, seesawRatio_lt_ewClosureRatio, ewClosureRatio_lt_one⟩

theorem seesawRatio_ne_ewClosureRatio : seesawRatio ≠ ewClosureRatio :=
  ne_of_lt seesawRatio_lt_ewClosureRatio

theorem seesawExponent_ne_rung : (56 : Cut) * cutPi / 3 ≠ 28 * cutPi / 3 := by
  intro h
  have := cutPi_pos
  nlinarith [this]

end

end Phys.Algebra.ProbeN333
