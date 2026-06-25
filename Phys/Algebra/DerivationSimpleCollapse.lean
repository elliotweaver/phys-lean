import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

namespace Phys.Algebra.Collapse

/-! ## GENERIC LAYER — abstract `A : Subalgebra ℚ (End ℚ V)` (fast typeclass synthesis).

    The concrete `A_I = Algebra.adjoin ℚ (imRep '' I)` makes typeclass synthesis blow up
    (measured: `SMul A_I ↥ImO` times out), so the structure-theorem content is proved here
    over an ABSTRACT subalgebra and instantiated at `A_I` only at the very end. -/

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

open Matrix in
/-- ★ THE ODD-DIMENSION SKEW SINGULARITY (the W1 dissolution of the Schur branch). A
    `B`-skew-adjoint operator `f` on a finite-dimensional space `W` of ODD dimension, for a
    NONDEGENERATE form `B` over a field where `2 ≠ 0`, is SINGULAR: `det f = 0`. Skew-adjointness
    gives `Fᵀ G = -(G F)` for the Gram matrix `G`; taking determinants, `det F · det G =
    (-1)^n · det G · det F`; with `n` odd and `2 ≠ 0` and `det G ≠ 0` this forces `det F = 0`.
    On the DEFINITE Born 7-rep (`gBil.restrict ImO`, odd dim 7) this kills the Schur branch
    uniformly: a commuting-ideal generator sits in the Schur DIVISION RING `End_{A_I} ↥ImO`
    yet is singular, hence is `0`. "One cause" (odd-dim skew singularity) terminating branch B. -/
theorem skew_odd_det_zero {K W : Type*} [Field K] [AddCommGroup W] [Module K W]
    [FiniteDimensional K W]
    (B : LinearMap.BilinForm K W) (hB : B.Nondegenerate)
    (f : Module.End K W) (hf : B.IsSkewAdjoint f)
    (hodd : Odd (Module.finrank K W)) (h2 : (2 : K) ≠ 0) :
    LinearMap.det f = 0 := by
  classical
  let b := Module.finBasis K W
  have hcl : B.compLeft f = - B.compRight f := by
    ext x y
    have hxy : B (f x) y = B x ((-f) y) := hf x y
    simp only [LinearMap.BilinForm.compLeft_apply, LinearMap.BilinForm.neg_apply,
      LinearMap.BilinForm.compRight_apply]
    rw [hxy]; simp
  have hMl := LinearMap.BilinForm.toMatrix_compLeft b B f
  have hMr := LinearMap.BilinForm.toMatrix_compRight b B f
  have hMeq : (LinearMap.toMatrix b b f)ᵀ * LinearMap.BilinForm.toMatrix b B
      = - (LinearMap.BilinForm.toMatrix b B * LinearMap.toMatrix b b f) := by
    rw [← hMl, ← hMr, hcl]
    exact map_neg (LinearMap.BilinForm.toMatrix b) _
  have hdetcard : Fintype.card (Fin (Module.finrank K W)) = Module.finrank K W :=
    Fintype.card_fin _
  have h1 := congrArg Matrix.det hMeq
  rw [Matrix.det_mul, Matrix.det_transpose, Matrix.det_neg, Matrix.det_mul, hdetcard] at h1
  have hGdet : (LinearMap.BilinForm.toMatrix b B).det ≠ 0 :=
    (LinearMap.BilinForm.nondegenerate_iff_det_ne_zero b).mp hB
  have hsign : (-1 : K)^(Module.finrank K W) = -1 := Odd.neg_one_pow hodd
  rw [hsign] at h1
  set Fd := (LinearMap.toMatrix b b f).det with hFd
  set Gd := (LinearMap.BilinForm.toMatrix b B).det with hGd
  have h2eq : (2 : K) * (Fd * Gd) = 0 := by linear_combination h1
  have hFG : Fd * Gd = 0 := by
    rcases mul_eq_zero.mp h2eq with h | h
    · exact absurd h h2
    · exact h
  have hFdet : Fd = 0 := by
    rcases mul_eq_zero.mp hFG with h | h
    · exact h
    · exact absurd h hGdet
  rw [hFd] at hFdet
  rwa [← LinearMap.det_toMatrix b f]

omit [FiniteDimensional ℚ V] in
/-- ★ THE COMMUTANT MAP. An operator `T : End ℚ V` that commutes with every generator in `S`
    commutes with all of `A = Algebra.adjoin ℚ S`, hence is `A`-linear: it defines an element
    of `End A V` (the commutant). This is the lever that lands the action of a COMMUTING ideal
    `J` in the commutant of `A_I`. -/
def commutantHom (S : Set (Module.End ℚ V)) (T : Module.End ℚ V)
    (hT : ∀ s ∈ S, Commute T s) : V →ₗ[Algebra.adjoin ℚ S] V where
  toFun := T
  map_add' := T.map_add
  map_smul' := by
    intro a x
    have hc : Commute T (a : Module.End ℚ V) :=
      Algebra.commute_of_mem_adjoin_of_forall_mem_commute a.2 hT
    show T ((a : Module.End ℚ V) x) = (a : Module.End ℚ V) (T x)
    have h2 : (T * (a : Module.End ℚ V)) x = ((a : Module.End ℚ V) * T) x := by rw [hc]
    simpa [Module.End.mul_apply] using h2

omit [FiniteDimensional ℚ V] in
@[simp] theorem commutantHom_apply (S : Set (Module.End ℚ V)) (T : Module.End ℚ V)
    (hT : ∀ s ∈ S, Commute T s) (x : V) : commutantHom S T hT x = T x := rfl

/-- The ℚ-dimension count for an `A`-linear iso `V ≃ₗ[A] (Fin n → S)`: descending to ℚ,
    `dim_ℚ V = n · dim_ℚ S`. -/
theorem finrank_of_linearEquiv_fun (A : Subalgebra ℚ (Module.End ℚ V)) (n : ℕ)
    (S : Submodule A V) (e : V ≃ₗ[A] (Fin n → S)) :
    Module.finrank ℚ V = n * Module.finrank ℚ S := by
  haveI hfd : FiniteDimensional ℚ S := by
    have h : FiniteDimensional ℚ (S.restrictScalars ℚ) := inferInstance; exact h
  haveI : Module.Free ℚ S := Module.Free.of_divisionRing ℚ S
  let eℚ : V ≃ₗ[ℚ] (Fin n → S) := e.restrictScalars ℚ
  rw [eℚ.finrank_eq, Module.finrank_pi_fintype ℚ]
  simp [Finset.sum_const, Finset.card_univ]

/-- ★★ THE GENERIC PRIME-DIMENSION STRUCTURE THEOREM. For a finite-dimensional ℚ-space `V`
    whose ℚ-dimension is PRIME, that is a SEMISIMPLE `A`-module (`A` a subalgebra of `End ℚ V`)
    in which every FULLY-INVARIANT `A`-submodule is `⊥` or `⊤`, the module is `A`-ISOTYPIC and
    splits as `V ≃ₗ[A] Fin n → S` (`S` a simple `A`-submodule) with EITHER
      • `n = p`, `dim_ℚ S = 1`  (the module is a sum of `p` one-dimensional copies — characters), OR
      • `n = 1`, `dim_ℚ S = p`  (the module is itself `A`-simple — the Schur branch).
    The prime dimension forbids any intermediate split. This is the Mathlib-absent structure
    theorem (W1 BUILD) the simplicity collapse runs on, proved entirely over an abstract `A`. -/
theorem isotypic_prime_split (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    ∃ (n : ℕ) (S : Submodule A V), IsSimpleModule A S ∧ Nonempty (V ≃ₗ[A] (Fin n → S)) ∧
      ((n = p ∧ Module.finrank ℚ S = 1) ∨ (n = 1 ∧ Module.finrank ℚ S = p)) := by
  haveI := hss
  haveI : Module.Finite A V := Module.Finite.of_restrictScalars_finite ℚ A V
  -- V is nontrivial: dim = p ≥ 2 > 0.
  haveI hnt : Nontrivial V := by
    have hpos : 0 < Module.finrank ℚ V := by rw [hdim]; exact hp.pos
    exact Module.nontrivial_of_finrank_pos hpos
  -- the dichotomy gives isotypy
  have hiso : IsIsotypic A V := isIsotypic_iff_isFullyInvariant_imp_bot_or_top.mpr hdich
  obtain ⟨n, hne, S, hSsimple, ⟨e⟩⟩ := hiso.linearEquiv_fun
  refine ⟨n, S, hSsimple, ⟨e⟩, ?_⟩
  -- dimension count
  have hcount : p = n * Module.finrank ℚ S := by
    rw [← hdim]; exact finrank_of_linearEquiv_fun A n S e
  -- n ∣ p, so n = 1 or n = p
  have hndvd : n ∣ p := ⟨Module.finrank ℚ S, hcount⟩
  rcases (Nat.Prime.eq_one_or_self_of_dvd hp n hndvd) with hn1 | hnp
  · -- n = 1 ⟹ dim S = p
    right
    refine ⟨hn1, ?_⟩
    rw [hn1, one_mul] at hcount; omega
  · -- n = p ⟹ dim S = 1
    left
    refine ⟨hnp, ?_⟩
    rw [hnp] at hcount
    have hppos : 0 < p := hp.pos
    -- p = p * dim S ⟹ dim S = 1
    have : p * 1 = p * Module.finrank ℚ S := by rw [mul_one]; exact hcount
    have := Nat.eq_of_mul_eq_mul_left hppos this
    omega

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
/-- ★★ THE PRIME-DIMENSION DICHOTOMY (the `↥S`-free structure theorem). For a
    finite-dimensional ℚ-space `V` of PRIME ℚ-dimension `p`, a SEMISIMPLE `A`-module
    (`A` a subalgebra of `End ℚ V`) in which every fully-invariant `A`-submodule is `⊥`/`⊤`,
    EITHER
      • every `a ∈ A` acts as a ℚ-SCALAR (`(a : End ℚ V) = c • id`) — the `dim S = 1`,
        `n = p` (character) branch, OR
      • `V` is `A`-SIMPLE — the `n = 1`, `dim S = p` (Schur) branch.
    This is `isotypic_prime_split` with the `↥S` ELIMINATED from the conclusion: the raw
    `Submodule A V` coercion `↥S` makes typeclass synthesis blow up at the CONCRETE
    `A_I = Algebra.adjoin ℚ (imRep '' I)` (measured: `SMul A_I (Fin n → ↥S)` times out), so the
    consumable form replaces "`V ≃ₗ[A] Fin n → S`" by the two intrinsic alternatives that have
    no `↥S` in their statement, and the instantiation at `A_I` is cheap. The scalar branch is
    extracted by the homothety lemma `existsUnique_eq_smul_id_of_finrank_eq_one` on the 1-dim
    simple type (transported coordinatewise through the isotypic `A`-iso); the simple branch by
    `Fin 1 → S ≃ S` (`funUnique`). The synthesis-depth `set_option`s are SUBSTRATE (instance
    SEARCH depth on the derived subalgebra-module, not proof `maxHeartbeats` inflation — the
    tactics are fast; only the deep subalgebra-Pi-module instance search exceeds the default
    ceiling); the proof is structural, no coordinate expansion. -/
theorem prime_split_dichotomy (A : Subalgebra ℚ (Module.End ℚ V)) (p : ℕ) (hp : p.Prime)
    (hdim : Module.finrank ℚ V = p) (hss : IsSemisimpleModule A V)
    (hdich : ∀ N : Submodule A V, N.IsFullyInvariant → N = ⊥ ∨ N = ⊤) :
    (∀ a : A, ∃ c : ℚ, (a : Module.End ℚ V) = c • LinearMap.id) ∨ IsSimpleModule A V := by
  obtain ⟨n, S, hSsimple, ⟨e⟩, (⟨hn, hdS⟩ | ⟨hn, hdS⟩)⟩ :=
    isotypic_prime_split A p hp hdim hss hdich
  · -- n = p, dim_ℚ S = 1: scalar / character branch
    left
    intro a
    -- act-by-`a` on `Sq := S.restrictScalars ℚ` as a ℚ-linear endo (no `↥S` SMul)
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
    -- transport `a • v = c • v` through the `A`-iso `e` (coordinatewise scalar on `S = Sq`)
    have he : e (a • v) = a • (e v) := map_smul e a v
    have hpi : a • (e v) = c • (e v) := by
      funext i
      apply Subtype.ext
      rw [Pi.smul_apply, Pi.smul_apply, SetLike.val_smul, Submodule.coe_smul_of_tower]
      have hAsmul : a • (((e v) i) : V) = (a : Module.End ℚ V) (((e v) i) : V) := rfl
      have hmem : (((e v) i) : V) ∈ Sq := by
        rw [hSqdef, Submodule.restrictScalars_mem]; exact ((e v) i).2
      rw [hAsmul, hact _ hmem]
    have hec : e (c • v) = c • (e v) := (e.restrictScalars ℚ).map_smul c v
    have hkey : a • v = c • v := e.injective (by rw [he, hpi, ← hec])
    rw [LinearMap.smul_apply, LinearMap.id_coe, id_eq, ← hkey]; rfl
  · -- n = 1, dim_ℚ S = p: V is A-simple (single isotypic copy)
    right
    haveI : Unique (Fin n) := by rw [hn]; infer_instance
    have e2 : V ≃ₗ[A] S := e.trans (LinearEquiv.funUnique (Fin n) A S)
    exact (LinearEquiv.isSimpleModule_iff e2).mpr hSsimple

end Phys.Algebra.Collapse

/-! ## CONCRETE INSTANTIATION at `V = ↥ImO`, `p = 7`, `A = A_I` (FORWARD, NO posited G₂).

    The generic prime-dimension dichotomy is instantiated at the DERIVED faithful 7-rep.
    The fully-invariant hypothesis `hdich` of `prime_split_dichotomy` is discharged by the
    banked full-irreducibility lever `no_proper_invariant_ImO`: a fully-invariant `A_I`-submodule
    `N` of `↥ImO` pushes forward to a subspace `W ≤ ImO` invariant under the FULL
    `derivationLieQ` (the `I`-action stabilises `N` as `A_I`-generators; the complementary
    commuting ideal `Iᶜ` acts in the commutant `End_{A_I}` via `commutantHom`, so full
    invariance stabilises `N` under it too; `I ⊔ Iᶜ = ⊤` then covers all of `derivationLieQ`),
    so `0 < dim W < 7` is impossible. -/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
/-- ★ The image subspace `W := (N|_ℚ).map ImO.subtype ≤ ImO` of a fully-invariant
    `A_I`-submodule `N` of `↥ImO` is invariant under the FULL `derivationLieQ` action.
    `D = a + b` with `a ∈ I`, `b ∈ Iᶜ` (from `I ⊔ Iᶜ = ⊤`); `imRep a` stabilises `N` as
    an `A_I`-generator; `imRep b` commutes with every generator (`⁅I, Iᶜ⁆ = ⊥`), so by
    `commutantHom` it is `A_I`-linear and full-invariance stabilises `N` under it. -/
theorem collapse_Winv (I : LieIdeal ℚ derivationLieQ)
    (N : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO)
    (hN : N.IsFullyInvariant) :
    ∀ (D : derivationLieQ) (y : O ℚ),
      y ∈ (N.restrictScalars ℚ).map ImO.subtype →
      (D : Module.End ℚ (O ℚ)) y ∈ (N.restrictScalars ℚ).map ImO.subtype := by
  have hgen : ∀ x : I, imRep (I.incl x) ∈
      Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x))) :=
    fun x => Algebra.subset_adjoin ⟨x, rfl⟩
  have hNstab_I : ∀ (x : I) (v : ImO), v ∈ N → imRep (I.incl x) v ∈ N := by
    intro x v hv
    exact N.smul_mem
      (⟨imRep (I.incl x), hgen x⟩ :
        Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) hv
  have hNstab_fi : ∀ (f : ImO →ₗ[Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))] ImO)
      (v : ImO), v ∈ N → f v ∈ N := by
    intro f v hv
    have := hN f hv
    rwa [Submodule.mem_comap] at this
  have hbrak : (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) = ⊥ := by
    rw [eq_bot_iff]
    calc (⁅I, Iᶜ⁆ : LieIdeal ℚ derivationLieQ) ≤ I ⊓ Iᶜ :=
          le_inf (LieSubmodule.lie_le_left I Iᶜ) (LieSubmodule.lie_le_right Iᶜ I)
      _ = ⊥ := inf_compl_eq_bot
  have hJcomm : ∀ (b : derivationLieQ), b ∈ (Iᶜ : LieIdeal ℚ derivationLieQ) →
      ∀ s ∈ (Set.range (fun x : I => imRep (I.incl x))), Commute (imRep b) s := by
    intro b hb s hs
    obtain ⟨x, rfl⟩ := hs
    have hlz : (⁅(I.incl x : derivationLieQ), b⁆ : derivationLieQ) = 0 := by
      have hmem : (⁅(I.incl x : derivationLieQ), b⁆ : derivationLieQ)
          ∈ (⁅I, (Iᶜ : LieIdeal ℚ derivationLieQ)⁆ : LieIdeal ℚ derivationLieQ) :=
        LieSubmodule.lie_mem_lie (x.2) hb
      rw [hbrak, LieSubmodule.mem_bot] at hmem; exact hmem
    exact (imRep_commute_of_lie_zero (I.incl x) b hlz).symm
  have hNstab_J : ∀ (b : derivationLieQ), b ∈ (Iᶜ : LieIdeal ℚ derivationLieQ) →
      ∀ (v : ImO), v ∈ N → imRep b v ∈ N := by
    intro b hb v hv
    exact hNstab_fi (Phys.Algebra.Collapse.commutantHom
      (Set.range (fun x : I => imRep (I.incl x))) (imRep b) (hJcomm b hb)) v hv
  intro D y hy
  obtain ⟨z, hzN, rfl⟩ := hy
  have hsup : I ⊔ (Iᶜ : LieIdeal ℚ derivationLieQ) = ⊤ := sup_compl_eq_top
  have hmemD : D ∈ (⊤ : LieIdeal ℚ derivationLieQ) := trivial
  rw [← hsup, ← LieSubmodule.mem_toSubmodule, LieSubmodule.sup_toSubmodule,
    Submodule.mem_sup] at hmemD
  obtain ⟨a, ha, b, hb, hab⟩ := hmemD
  have ha_stab : imRep a z ∈ N := by
    have := hNstab_I ⟨a, ha⟩ z hzN
    rwa [show (I.incl ⟨a, ha⟩ : derivationLieQ) = a from rfl] at this
  have hb_stab : imRep b z ∈ N := hNstab_J b hb z hzN
  have himD : imRep D = imRep a + imRep b := by rw [← hab, map_add]
  refine ⟨imRep a z + imRep b z, N.add_mem ha_stab hb_stab, ?_⟩
  calc ((imRep a z + imRep b z : ImO) : O ℚ)
      = ((imRep D z : ImO) : O ℚ) := by rw [himD]; rfl
    _ = (D : Module.End ℚ (O ℚ)) (z : O ℚ) := imRep_coe D z

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
/-- ★★ THE FULLY-INVARIANT DICHOTOMY at `A_I`. A fully-invariant `A_I`-submodule of the
    faithful 7-rep `↥ImO` is `⊥` or `⊤`. By `collapse_Winv` its image `W ≤ ImO` is invariant
    under all of `derivationLieQ`; if `N ≠ ⊥, ⊤` then `0 < dim W < 7`, excluded by the banked
    full-irreducibility lever `no_proper_invariant_ImO`. This is the `hdich` hypothesis the
    generic `prime_split_dichotomy` consumes, discharged at the concrete `A_I`. -/
theorem collapse_dich (I : LieIdeal ℚ derivationLieQ)
    (N : Submodule (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO)
    (hN : N.IsFullyInvariant) : N = ⊥ ∨ N = ⊤ := by
  by_contra hcon
  rw [not_or] at hcon
  obtain ⟨hNbot, hNtop⟩ := hcon
  set W : Submodule ℚ (O ℚ) := (N.restrictScalars ℚ).map ImO.subtype with hWdef
  have hWle : W ≤ ImO := by rintro _ ⟨z, _, rfl⟩; exact z.2
  have hWinv := collapse_Winv I N hN
  have hWNq : Module.finrank ℚ W = Module.finrank ℚ (N.restrictScalars ℚ) :=
    (Submodule.equivMapOfInjective ImO.subtype Subtype.val_injective
      (N.restrictScalars ℚ)).finrank_eq.symm
  have hNqbot : (N.restrictScalars ℚ) ≠ ⊥ := by
    intro h; exact hNbot (by rwa [Submodule.restrictScalars_eq_bot_iff] at h)
  have hNqtop : (N.restrictScalars ℚ) ≠ ⊤ := by
    intro h; exact hNtop (by rwa [Submodule.restrictScalars_eq_top_iff] at h)
  have hd0 : 0 < Module.finrank ℚ W := by
    rw [hWNq]; have := (Submodule.one_le_finrank_iff (S := N.restrictScalars ℚ)).mpr hNqbot; omega
  have hd7 : Module.finrank ℚ W < 7 := by
    rw [hWNq]; have hlt := Submodule.finrank_lt (s := N.restrictScalars ℚ) hNqtop
    rwa [finrank_ImO] at hlt
  exact no_proper_invariant_ImO W hWle hWinv hd0 hd7

set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
/-- ★ THE SCALAR (CHARACTER) BRANCH ⟹ `I = ⊥`. If every element of `A_I` acts as a ℚ-scalar
    on `↥ImO` (the `dim S = 1`, `n = p` branch of the dichotomy), then since the atom `I` is
    PERFECT (`atom_isPerfect`: `⁅⊤,⊤⁆ = ⊤`), the Lie hom `imRep ∘ I.incl` kills all brackets
    (scalars commute) hence vanishes on the perfect `⊤`, so `imRep` is `0` on `I`; by
    faithfulness (`imRep_injective`) `I = ⊥`. -/
theorem collapse_scalar_branch (I : LieIdeal ℚ derivationLieQ) (hI : IsAtom I)
    (hscal : ∀ a : (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))),
        ∃ c : ℚ, (a : Module.End ℚ ImO) = c • LinearMap.id) : I = ⊥ := by
  have hgen : ∀ x : I, imRep (I.incl x) ∈
      Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x))) :=
    fun x => Algebra.subset_adjoin ⟨x, rfl⟩
  have hgenscal : ∀ x : I, ∃ c : ℚ, imRep (I.incl x) = c • LinearMap.id := by
    intro x
    obtain ⟨c, hc⟩ := hscal ⟨imRep (I.incl x), hgen x⟩
    exact ⟨c, hc⟩
  let f : I →ₗ⁅ℚ⁆ Module.End ℚ ImO := imRep.comp I.incl
  have hf_app : ∀ x : I, f x = imRep (I.incl x) := fun x => rfl
  have hf_brak : ∀ a b : I, f ⁅a, b⁆ = 0 := by
    intro a b
    rw [LieHom.map_lie]
    obtain ⟨ca, hca⟩ := hgenscal a
    obtain ⟨cb, hcb⟩ := hgenscal b
    rw [hf_app, hf_app, hca, hcb]
    rw [Ring.lie_def]
    simp [smul_smul, mul_comm]
  have hker : (⁅(⊤ : LieIdeal ℚ I), (⊤ : LieIdeal ℚ I)⁆ : LieIdeal ℚ I) ≤ f.ker := by
    rw [LieSubmodule.lie_le_iff]
    intro a _ b _
    rw [LieHom.mem_ker]
    exact hf_brak a b
  have hperf : (⁅(⊤ : LieIdeal ℚ I), (⊤ : LieIdeal ℚ I)⁆ : LieIdeal ℚ I) = ⊤ :=
    atom_isPerfect I hI
  rw [hperf] at hker
  have hf0 : ∀ x : I, imRep (I.incl x) = 0 := by
    intro x
    have : x ∈ f.ker := hker (LieSubmodule.mem_top x)
    rw [LieHom.mem_ker] at this
    rw [← hf_app]; exact this
  rw [eq_bot_iff]
  intro y hy
  rw [LieSubmodule.mem_bot]
  have hyzero : imRep (I.incl ⟨y, hy⟩) = 0 := hf0 ⟨y, hy⟩
  have : (I.incl ⟨y, hy⟩ : derivationLieQ) = 0 :=
    (injective_iff_map_eq_zero imRep).mp imRep_injective _ hyzero
  simpa using this

end Phys.Algebra

end
