import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- Module.Finite A V from ℚ-finiteness:
example (A : Subalgebra ℚ (Module.End ℚ V)) : Module.Finite A V := by
  exact Module.Finite.of_restrictScalars_finite ℚ A V

-- Module.Finite A V via IsScalarTower:
example (A : Subalgebra ℚ (Module.End ℚ V)) : IsScalarTower ℚ A V := by infer_instance

-- The isotypic dichotomy lemma applies given IsSemisimpleModule A V:
example (A : Subalgebra ℚ (Module.End ℚ V)) (hss : IsSemisimpleModule A V) :
    IsIsotypic A V ↔ ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤ :=
  isIsotypic_iff_isFullyInvariant_imp_bot_or_top

-- linearEquiv_fun from IsIsotypicOfType:
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) (h : IsIsotypicOfType A V S) :
    ∃ n : ℕ, Nonempty (V ≃ₗ[A] (Fin n → S)) := by
  have : Module.Finite A V := Module.Finite.of_restrictScalars_finite ℚ A V
  exact h.linearEquiv_fun

end
