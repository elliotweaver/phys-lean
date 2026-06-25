import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)

noncomputable section
namespace Phys.Algebra.Collapse

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

theorem prime_split_dichotomy (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    (∀ a : A, ∃ c : ℚ, (a : Module.End ℚ V) = c • LinearMap.id) ∨ IsSimpleModule A V := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- n = p, dim_ℚ S = 1: the scalar / character branch (instances live from obtain)
    left
    intro a
    -- act-by-a on S as a ℚ-linear endo
    let ρS : S →ₗ[ℚ] S :=
      { toFun := fun s => a • s
        map_add' := fun s t => smul_add a s t
        map_smul' := fun q s => by
          simp only [RingHom.id_apply]; exact (smul_comm a q s) }
    obtain ⟨c, hc, -⟩ := LinearMap.existsUnique_eq_smul_id_of_finrank_eq_one hdS ρS
    have hcS : ∀ s : S, a • s = c • s := fun s => by
      have := LinearMap.congr_fun hc s; simpa [ρS] using this
    refine ⟨c, ?_⟩
    ext v
    have he : e (a • v) = a • (e v) := map_smul e a v
    have hpi : a • (e v) = c • (e v) := by
      funext i; exact hcS (e v i)
    have hkey : a • v = c • v := e.injective (by rw [he, hpi, map_smul])
    rw [LinearMap.smul_apply, LinearMap.id_coe, id_eq, ← hkey]; rfl
  · right
    haveI : Unique (Fin n) := by rw [hn]; infer_instance
    have e2 : V ≃ₗ[A] S := e.trans (LinearEquiv.funUnique (Fin n) A S)
    exact (LinearEquiv.isSimpleModule_iff e2).mpr hSsimple

end Phys.Algebra.Collapse
end
