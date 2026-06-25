import Phys.Algebra.DerivationSimpleCollapse
open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
-- Isolate: in the branch, is `a • (e v)` (Pi-SMul) cheap if we name the Module instance?
set_option synthInstance.maxHeartbeats 400000 in
example (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) (a : A) : True := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · have he : ∀ v : V, e (a • v) = a • (e v) := fun v => map_smul e a v
    trivial
  · trivial
end Phys.Algebra.Collapse
end
