import Phys.Algebra.SpacetimeBlackHoleEntropy

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

-- bhEntropy nonneg / zero / pos
theorem bhEntropy_nonneg (M : Cut) : 0 ≤ bhEntropy M := by
  unfold bhEntropy
  have hg := gravCouplingCoeff_pos
  have hM : 0 ≤ M ^ 2 := by positivity
  positivity

theorem bhEntropy_zero : bhEntropy (0 : Cut) = 0 := by
  unfold bhEntropy; ring

theorem bhEntropy_pos_of_ne (M : Cut) (hM : M ≠ 0) : 0 < bhEntropy M := by
  unfold bhEntropy
  have hg := gravCouplingCoeff_pos
  have hM2 : 0 < M ^ 2 := by positivity
  positivity

-- strict monotone on nonnegatives
theorem bhEntropy_strictMono {M₁ M₂ : Cut} (h1 : 0 ≤ M₁) (h : M₁ < M₂) :
    bhEntropy M₁ < bhEntropy M₂ := by
  unfold bhEntropy
  have hg := gravCouplingCoeff_pos
  have h2 : 0 ≤ M₂ := le_of_lt (lt_of_le_of_lt h1 h)
  have hsq : M₁ ^ 2 < M₂ ^ 2 := by nlinarith
  have : gravCouplingCoeff * M₁ ^ 2 < gravCouplingCoeff * M₂ ^ 2 :=
    mul_lt_mul_of_pos_left hsq hg
  linarith

-- THE PAGE CURVE: fine-grained radiation entropy = min(emitted, remaining)
def pageRadEntropy (M₀ M : Cut) : Cut := min (bhEntropy M₀ - bhEntropy M) (bhEntropy M)

theorem pageRad_start (M₀ : Cut) : pageRadEntropy M₀ M₀ = 0 := by
  unfold pageRadEntropy
  have : bhEntropy M₀ - bhEntropy M₀ = 0 := by ring
  rw [this]
  exact min_eq_left (bhEntropy_nonneg M₀)

theorem pageRad_end (M₀ : Cut) : pageRadEntropy M₀ 0 = 0 := by
  unfold pageRadEntropy
  rw [bhEntropy_zero, sub_zero]
  exact min_eq_right (bhEntropy_nonneg M₀)

theorem pageRad_le_remaining (M₀ M : Cut) : pageRadEntropy M₀ M ≤ bhEntropy M :=
  min_le_right _ _

theorem pageRad_le_emitted (M₀ M : Cut) : pageRadEntropy M₀ M ≤ bhEntropy M₀ - bhEntropy M :=
  min_le_left _ _

-- THE PAGE POINT: crossing where remaining = emitted ⟺ remaining = total/2
theorem pageTime_condition (M₀ M : Cut) :
    bhEntropy M = bhEntropy M₀ - bhEntropy M ↔ bhEntropy M = bhEntropy M₀ / 2 := by
  constructor
  · intro h; linarith
  · intro h; linarith

-- at the crossing the radiation entropy = total/2 (the peak)
theorem pageRad_at_crossing (M₀ M : Cut) (h : bhEntropy M = bhEntropy M₀ / 2) :
    pageRadEntropy M₀ M = bhEntropy M₀ / 2 := by
  unfold pageRadEntropy
  have hemit : bhEntropy M₀ - bhEntropy M = bhEntropy M₀ / 2 := by rw [h]; ring
  rw [hemit, h, min_self]

-- W8 non-vacuity: info is NOT lost — the final radiation entropy is NOT the total
theorem pageRad_end_ne_total (M₀ : Cut) (hM : M₀ ≠ 0) :
    pageRadEntropy M₀ 0 ≠ bhEntropy M₀ := by
  rw [pageRad_end]
  exact (ne_of_lt (bhEntropy_pos_of_ne M₀ hM)).symm ∘ Eq.symm

end
end Phys.Algebra
