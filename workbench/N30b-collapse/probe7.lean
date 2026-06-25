import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- From an A-linear equiv V ≃ₗ[A] (Fin n → S), get a ℚ-linear equiv (restrict scalars).
-- Then finrank ℚ V = n * finrank ℚ S.
example (A : Subalgebra ℚ (Module.End ℚ V)) (n : ℕ) (S : Submodule A V)
    (e : V ≃ₗ[A] (Fin n → S)) :
    Module.finrank ℚ V = n * Module.finrank ℚ S := by
  -- restrict scalars to ℚ
  haveI : Module.Finite A V := Module.Finite.of_restrictScalars_finite ℚ A V
  let eℚ : V ≃ₗ[ℚ] (Fin n → S) := e.restrictScalars ℚ
  rw [eℚ.finrank_eq]
  rw [Module.finrank_pi_fintype ℚ]
  simp [Finset.sum_const, Finset.card_univ]

end
