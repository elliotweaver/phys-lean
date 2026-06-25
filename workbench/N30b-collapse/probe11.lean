import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- Supply Free/Finite ℚ ↥S explicitly.
example (A : Subalgebra ℚ (Module.End ℚ V)) (n : ℕ) (S : Submodule A V)
    (e : V ≃ₗ[A] (Fin n → S)) :
    Module.finrank ℚ V = n * Module.finrank ℚ S := by
  haveI hfd : FiniteDimensional ℚ S := by
    have h : FiniteDimensional ℚ (S.restrictScalars ℚ) := inferInstance; exact h
  haveI : Module.Free ℚ S := Module.Free.of_divisionRing ℚ S
  let eℚ : V ≃ₗ[ℚ] (Fin n → S) := e.restrictScalars ℚ
  rw [eℚ.finrank_eq, Module.finrank_pi_fintype ℚ]
  simp [Finset.sum_const, Finset.card_univ]

end
