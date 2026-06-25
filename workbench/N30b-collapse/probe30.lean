import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- Isolate transport: given e and the per-coordinate scalar fact, get a • w = c • w on Fin n → S.
example (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) (a : A) (c : ℚ) : True := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- TEST: does a • w (w : Fin n → S) and Pi.smul_apply fire with cached instances?
    have htest : ∀ (w : Fin n → S) (i : Fin n), (a • w) i = a • (w i) := by
      intro w i
      exact Pi.smul_apply a w i
    trivial
  · trivial

end Phys.Algebra.Collapse
end
