import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

set_option synthInstance.maxHeartbeats 20000 in
example (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) (a : A) : True := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- Inside the branch. Test 1: is `Module ↥A ↥S` cheap here (cached)?
    have hM : Module ↥A ↥S := inferInstance
    -- Test 2: with hM bound, does the smul `a • (s)` work via that instance?
    have htest : ∀ s : S, (a • s : S) = (a • s : S) := fun s => rfl
    trivial
  · trivial

end Phys.Algebra.Collapse
end
