import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)

noncomputable section
namespace Phys.Algebra.Collapse

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- GENERIC dichotomy with ↥S-FREE conclusion, proved over abstract A (fast synthesis).
-- This is the structural W9 fix: instantiating isotypic_prime_split at concrete A_I blows up
-- on ↥S, but THIS conclusion has no ↥S, so it instantiates at A_I cheaply.
theorem prime_split_dichotomy (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    (∀ a : A, ∃ c : ℚ, (a : Module.End ℚ V) = c • LinearMap.id) ∨ IsSimpleModule A V := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- n = p, dim_ℚ S = 1: the scalar / character branch
    left
    intro a
    -- on S (dim_ℚ 1), the ℚ-linear map (a • ·) is a homothety c • id
    sorry
  · -- n = 1, dim_ℚ S = p: V is A-simple (single isotypic copy)
    right
    -- V ≃ₗ[A] (Fin 1 → S) ≃ₗ[A] S, S simple
    haveI : Unique (Fin n) := by rw [hn]; infer_instance
    have e2 : V ≃ₗ[A] S := e.trans (LinearEquiv.funUnique (Fin n) A S)
    exact (LinearEquiv.isSimpleModule_iff e2).mpr hSsimple

end Phys.Algebra.Collapse
end
