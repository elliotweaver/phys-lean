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
    (hact : ∀ x : V, (a : Module.End ℚ V) x = c • x) : True := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · have hpi : ∀ v : V, a • (e v) = c • (e v) := by
      intro v
      funext i
      apply Subtype.ext
      rw [Pi.smul_apply, Pi.smul_apply, SetLike.val_smul, Submodule.coe_smul_of_tower]
      -- goal: a • ↑(e v i) = c • ↑(e v i)  ;  a • x = (a:End) x
      have hAsmul : a • (((e v) i) : V) = (a : Module.End ℚ V) (((e v) i) : V) := rfl
      rw [hAsmul, hact]
    trivial
  · trivial
end Phys.Algebra.Collapse
end
