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
  · -- n = p, dim_ℚ S = 1: scalar / character branch
    left
    intro a
    -- act-by-a on Sq := S.restrictScalars ℚ as a ℚ-linear endo (no ↥S SMul)
    set Sq : Submodule ℚ V := S.restrictScalars ℚ with hSq
    have hSqstable : ∀ x ∈ Sq, (a : Module.End ℚ V) x ∈ Sq := by
      intro x hx
      rw [hSq, Submodule.restrictScalars_mem] at hx ⊢
      show a • x ∈ S
      exact S.smul_mem a hx
    let ρ : ↥Sq →ₗ[ℚ] ↥Sq := LinearMap.restrict (a : Module.End ℚ V) hSqstable
    have hdSq : Module.finrank ℚ Sq = 1 := hdS
    obtain ⟨c, hc, -⟩ := LinearMap.existsUnique_eq_smul_id_of_finrank_eq_one hdSq ρ
    -- ρ = c • id means: for x ∈ Sq, (a:End) x = c • x
    have hact : ∀ x : V, x ∈ Sq → (a : Module.End ℚ V) x = c • x := by
      intro x hx
      have := LinearMap.congr_fun hc ⟨x, hx⟩
      have h2 := congrArg (Subtype.val) this
      simpa [ρ, LinearMap.restrict_apply] using h2
    -- transport: every v ∈ V has e v : Fin n → S, each coordinate ∈ S = Sq
    refine ⟨c, ?_⟩
    ext v
    -- a • v = c • v.   Use e : V ≃ₗ[A] (Fin n → S); a acts coordinatewise.
    have he : e (a • v) = a • (e v) := map_smul e a v
    -- a • (e v) i = a • (e v i) ; and (e v i) ∈ S ⟹ (a:End)(e v i)=c•(e v i)
    have hcoord : ∀ i, (a • (e v)) i = c • ((e v) i) := by
      intro i
      -- a • (e v) is the A-scalar action on Fin n → S, coordinatewise
      show a • ((e v) i) = c • ((e v) i)
      -- (e v i : V) ∈ S, so apply hact; lift to ↥S
      apply Subtype.ext
      have hmem : ((e v) i : V) ∈ Sq := by rw [hSq, Submodule.restrictScalars_mem]; exact ((e v) i).2
      have := hact ((e v) i : V) hmem
      -- a • ((e v) i) as element of S has val = (a:End)((e v i):V)
      show ((a • ((e v) i) : S) : V) = ((c • ((e v) i) : S) : V)
      rw [Submodule.coe_smul]
      change (a : Module.End ℚ V) ((e v) i : V) = c • (((e v) i : V))
      exact this
    have hpi : a • (e v) = c • (e v) := by funext i; rw [hcoord i]; rfl
    have hkey : a • v = c • v := e.injective (by rw [he, hpi, map_smul])
    rw [LinearMap.smul_apply, LinearMap.id_coe, id_eq, ← hkey]; rfl
  · right
    haveI : Unique (Fin n) := by rw [hn]; infer_instance
    have e2 : V ≃ₗ[A] S := e.trans (LinearEquiv.funUnique (Fin n) A S)
    exact (LinearEquiv.isSimpleModule_iff e2).mpr hSsimple

end Phys.Algebra.Collapse
end
