import Phys.Algebra.DerivationSimpleCollapse
open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
example (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) (a : A) (c : ℚ)
    (hact : ∀ x : V, x ∈ (⊤ : Submodule ℚ V) → (a : Module.End ℚ V) x = c • x) : True := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- TEST the coordinatewise scalar step in isolation
    have hpi : ∀ v : V, a • (e v) = c • (e v) := by
      intro v
      funext i
      apply Subtype.ext
      have h1 : (a • (e v)) i = a • ((e v) i) := Pi.smul_apply a (e v) i
      have h2 : (c • (e v)) i = c • ((e v) i) := Pi.smul_apply c (e v) i
      rw [h1, h2]
      apply Subtype.ext
      show (a : Module.End ℚ V) (((e v) i) : V) = c • (((e v) i) : V)
      exact hact _ (Submodule.mem_top)
    trivial
  · trivial
end Phys.Algebra.Collapse
end
