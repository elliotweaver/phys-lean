import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
theorem prime_split_dichotomy (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    (∀ a : A, ∃ c : ℚ, (a : Module.End ℚ V) = c • LinearMap.id) ∨ IsSimpleModule A V := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- n = p, dim_ℚ S = 1: scalar / character branch
    left
    intro a
    -- act-by-a on Sq := S.restrictScalars ℚ as a ℚ-linear endo (no ↥S SMul)
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
    -- transport a • v = c • v through the A-iso e (coordinatewise scalar on S = Sq)
    have he : e (a • v) = a • (e v) := map_smul e a v
    have hpi : a • (e v) = c • (e v) := by
      funext i
      apply Subtype.ext
      rw [Pi.smul_apply, Pi.smul_apply, SetLike.val_smul, Submodule.coe_smul_of_tower]
      have hAsmul : a • (((e v) i) : V) = (a : Module.End ℚ V) (((e v) i) : V) := rfl
      have hmem : (((e v) i) : V) ∈ Sq := by
        rw [hSqdef, Submodule.restrictScalars_mem]; exact ((e v) i).2
      rw [hAsmul, hact _ hmem]
    have hkey : a • v = c • v := e.injective (by rw [he, hpi, map_smul])
    rw [LinearMap.smul_apply, LinearMap.id_coe, id_eq, ← hkey]; rfl
  · -- n = 1, dim_ℚ S = p: V is A-simple (single isotypic copy)
    right
    haveI : Unique (Fin n) := by rw [hn]; infer_instance
    have e2 : V ≃ₗ[A] S := e.trans (LinearEquiv.funUnique (Fin n) A S)
    exact (LinearEquiv.isSimpleModule_iff e2).mpr hSsimple

end Phys.Algebra.Collapse
end
