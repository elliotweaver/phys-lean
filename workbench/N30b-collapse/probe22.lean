import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)

noncomputable section
namespace Phys.Algebra.Collapse

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- LEFT BRANCH lemma: V ≃ₗ[A] (Fin n → S), dim_ℚ S = 1 ⟹ every a ∈ A acts as a ℚ-scalar.
example (A : Subalgebra ℚ (Module.End ℚ V)) (n : ℕ) (S : Submodule A V)
    (hdS : Module.finrank ℚ S = 1) (e : V ≃ₗ[A] (Fin n → S)) (a : A) :
    ∃ c : ℚ, (a : Module.End ℚ V) = c • LinearMap.id := by
  -- the A-action on the 1-dim S is a ℚ-homothety c • id
  let ρS : S →ₗ[ℚ] S :=
    { toFun := fun s => a • s
      map_add' := fun s t => smul_add a s t
      map_smul' := fun q s => by
        simp only [RingHom.id_apply]
        exact (smul_comm a q s) }
  obtain ⟨c, hc, -⟩ := LinearMap.existsUnique_eq_smul_id_of_finrank_eq_one hdS ρS
  have hcS : ∀ s : S, a • s = c • s := by
    intro s
    have := LinearMap.congr_fun hc s
    simpa [ρS] using this
  refine ⟨c, ?_⟩
  ext v
  -- a • v = (a : End) v, transport through e
  have hav : (a : Module.End ℚ V) v = a • v := rfl
  have he : e (a • v) = a • (e v) := map_smul e a v
  have hpi : a • (e v) = c • (e v) := by
    funext i
    show a • (e v i) = c • (e v i)
    exact hcS (e v i)
  have : e (a • v) = e (c • v) := by
    rw [he, hpi, map_smul]
  have hkey : a • v = c • v := e.injective this
  rw [LinearMap.smul_apply, LinearMap.id_coe, id_eq, ← hkey, hav]

end Phys.Algebra.Collapse
end
