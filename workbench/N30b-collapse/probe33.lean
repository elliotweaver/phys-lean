import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

set_option synthInstance.maxHeartbeats 400000 in
theorem prime_split_dichotomy (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    (∀ a : A, ∃ c : ℚ, (a : Module.End ℚ V) = c • LinearMap.id) ∨ IsSimpleModule A V := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- n = p, dim_ℚ S = 1: scalar branch
    left
    intro a
    set Sq : Submodule ℚ V := S.restrictScalars ℚ with hSqdef
    have hSqstable : ∀ x ∈ Sq, (a : Module.End ℚ V) x ∈ Sq := by
      intro x hx
      rw [hSqdef, Submodule.restrictScalars_mem] at hx ⊢
      exact S.smul_mem a hx
    let ρ : ↥Sq →ₗ[ℚ] ↥Sq := LinearMap.restrict (a : Module.End ℚ V) hSqstable
    have hdSq : Module.finrank ℚ Sq = 1 := hdS
    obtain ⟨c, hc, -⟩ := LinearMap.existsUnique_eq_smul_id_of_finrank_eq_one hdSq ρ
    have hact : ∀ x : V, x ∈ Sq → (a : Module.End ℚ V) x = c • x := by
      intro x hx
      have h1 := LinearMap.congr_fun hc ⟨x, hx⟩
      have h2 := congrArg (Subtype.val) h1
      simpa [ρ, LinearMap.restrict_apply] using h2
    refine ⟨c, ?_⟩
    ext v
    have he : e (a • v) = a • (e v) := map_smul e a v
    have hcoord : ∀ i, ((a • (e v)) i : V) = c • (((e v) i) : V) := by
      intro i
      have hmem : (((e v) i) : V) ∈ Sq := by
        rw [hSqdef, Submodule.restrictScalars_mem]; exact ((e v) i).2
      have hsa : ((a • (e v)) i : V) = ((a : Module.End ℚ V) (((e v) i) : V)) := by
        have : (a • (e v)) i = a • ((e v) i) := Pi.smul_apply a (e v) i
        rw [this]; rfl
      rw [hsa, hact _ hmem]
    have hpi : a • (e v) = c • (e v) := by
      funext i
      apply Subtype.ext
      rw [hcoord i]
      show (((a • (e v)) i) : V) = ((c • (e v) i : S) : V)
      rw [hcoord i, Submodule.coe_smul]
    have hkey : a • v = c • v := e.injective (by rw [he, hpi, map_smul])
    rw [LinearMap.smul_apply, LinearMap.id_coe, id_eq, ← hkey]; rfl
  · right
    haveI : Unique (Fin n) := by rw [hn]; infer_instance
    have e2 : V ≃ₗ[A] S := e.trans (LinearEquiv.funUnique (Fin n) A S)
    exact (LinearEquiv.isSimpleModule_iff e2).mpr hSsimple

end Phys.Algebra.Collapse
end
