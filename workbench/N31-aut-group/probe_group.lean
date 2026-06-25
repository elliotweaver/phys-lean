import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- Group mul convention on (O ℚ ≃ₗ[ℚ] O ℚ): is (φ * ψ) x = φ (ψ x) or ψ (φ x)?
example (φ ψ : O ℚ ≃ₗ[ℚ] O ℚ) (x : O ℚ) : (φ * ψ) x = φ (ψ x) := by
  rfl

-- inverse application: φ⁻¹ (φ x) = x and φ (φ⁻¹ x) = x
example (φ : O ℚ ≃ₗ[ℚ] O ℚ) (x : O ℚ) : φ.symm (φ x) = x := by simp
example (φ : O ℚ ≃ₗ[ℚ] O ℚ) (x : O ℚ) : (φ⁻¹ : O ℚ ≃ₗ[ℚ] O ℚ) x = φ.symm x := by rfl

-- linear independence of {v, 1} when v ∉ ℚ·1 : the key for the reQ case split.
-- We want: if a • v + b • 1 = 0 and v ∉ span{1}, then a = 0 ∧ b = 0.
-- Probe: is there a clean lemma? LinearIndependent.pair_iff or similar.
example (v : O ℚ) (hv : v ∉ Submodule.span ℚ ({1} : Set (O ℚ))) (a b : ℚ)
    (h : a • v + b • (1 : O ℚ) = 0) : a = 0 ∧ b = 0 := by
  constructor
  · by_contra ha
    apply hv
    have : v = (-a⁻¹ * b) • (1 : O ℚ) := by
      have := h
      field_simp at this ⊢
      -- a • v = -b • 1 ⟹ v = (-b/a) • 1
      sorry
    rw [this]
    exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self 1)
  · sorry

end
end Phys.Algebra
