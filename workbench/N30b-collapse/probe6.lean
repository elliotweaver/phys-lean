import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- linearEquiv_fun WITH the semisimple instance supplied via haveI:
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V)
    (hss : IsSemisimpleModule A V) (h : IsIsotypicOfType A V S) :
    ∃ n : ℕ, Nonempty (V ≃ₗ[A] (Fin n → S)) := by
  haveI : Module.Finite A V := Module.Finite.of_restrictScalars_finite ℚ A V
  haveI := hss
  exact h.linearEquiv_fun

-- The dichotomy direction I need: bot-or-top ⟹ IsIsotypic, then specialize to get S simple.
example (A : Subalgebra ℚ (Module.End ℚ V)) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    IsIsotypic A V := by
  haveI := hss
  exact isIsotypic_iff_isFullyInvariant_imp_bot_or_top.mpr hdich

-- IsIsotypic + Nontrivial + Finite ⟹ ∃ n S, IsSimpleModule S ∧ V ≃ Fin n → S
example (A : Subalgebra ℚ (Module.End ℚ V)) (hss : IsSemisimpleModule A V)
    (hnt : Nontrivial V) (h : IsIsotypic A V) :
    ∃ (n : ℕ) (_ : NeZero n) (S : Submodule A V),
      IsSimpleModule A S ∧ Nonempty (V ≃ₗ[A] Fin n → S) := by
  haveI : Module.Finite A V := Module.Finite.of_restrictScalars_finite ℚ A V
  haveI := hss
  haveI := hnt
  exact h.linearEquiv_fun

end
