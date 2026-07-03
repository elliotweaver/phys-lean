import Phys.Algebra.TowerGatherFaithfulColourRep
import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open scoped Classical
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000

/-- Restriction of a colour derivation to a colour-invariant `W ≤ O ℚ`, landing in the
    skew-adjoint operators of `gBil.restrict W`. -/
noncomputable def colRestrictToSkew (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W) :
    colourCentralizer →ₗ[ℚ] (gBil.restrict W).skewAdjointSubmodule where
  toFun D := ⟨((D : derivationLieQ) : Module.End ℚ (O ℚ)).restrict (fun x hx => hWinv D x hx),
    (LinearMap.mem_skewAdjointSubmodule _).mpr (by
      intro x y
      show (gBil.restrict W) (((D : derivationLieQ) : Module.End ℚ (O ℚ)).restrict
            (fun x hx => hWinv D x hx) x) y
        = (gBil.restrict W) x
            ((-(((D : derivationLieQ) : Module.End ℚ (O ℚ)).restrict
              (fun x hx => hWinv D x hx))) y)
      simp only [BilinForm.restrict_apply, LinearMap.neg_apply]
      show gForm (((D : derivationLieQ) : Module.End ℚ (O ℚ)) (x : O ℚ)) (y : O ℚ)
        = gForm (x : O ℚ) (-(((D : derivationLieQ) : Module.End ℚ (O ℚ)) (y : O ℚ)))
      have hsk := gFormQ_skew ((D : derivationLieQ) : Module.End ℚ (O ℚ))
        (D : derivationLieQ).2 (x : O ℚ) (y : O ℚ)
      have hneg : gForm (x : O ℚ) (-(((D : derivationLieQ) : Module.End ℚ (O ℚ)) (y : O ℚ)))
          = - gForm (x : O ℚ) (((D : derivationLieQ) : Module.End ℚ (O ℚ)) (y : O ℚ)) := by
        simp only [gForm, star_neg, mul_neg, reQ_neg]
      rw [hneg]; linarith)⟩
  map_add' D E := by
    apply Subtype.ext; apply LinearMap.ext; intro x; apply Subtype.ext
    show (((D : derivationLieQ) : Module.End ℚ (O ℚ)) + ((E : derivationLieQ) : Module.End ℚ (O ℚ)))
        (x : O ℚ)
      = ((D : derivationLieQ) : Module.End ℚ (O ℚ)) (x : O ℚ)
        + ((E : derivationLieQ) : Module.End ℚ (O ℚ)) (x : O ℚ)
    rfl
  map_smul' c D := by
    apply Subtype.ext; apply LinearMap.ext; intro x; apply Subtype.ext
    show ((c • (D : derivationLieQ) : derivationLieQ) : Module.End ℚ (O ℚ)) (x : O ℚ)
      = c • ((D : derivationLieQ) : Module.End ℚ (O ℚ)) (x : O ℚ)
    rfl

/-- The underlying operator value of `colRestrictToSkew` on a subtype element. -/
theorem colRestrictToSkew_coe (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W)
    (D : colourCentralizer) (y : W) :
    (((colRestrictToSkew W hWinv D : (gBil.restrict W).skewAdjointSubmodule) :
        Module.End ℚ W) y : O ℚ) = ((D : derivationLieQ) : Module.End ℚ (O ℚ)) (y : O ℚ) := rfl

/-- If `colRestrictToSkew W D = 0` then colour `D` kills `W`. -/
theorem colRestrict_eq_zero_kills (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W)
    (D : colourCentralizer) (h1 : colRestrictToSkew W hWinv D = 0) :
    ∀ y ∈ W, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) y = 0 := by
  intro y hy
  have hz : ((colRestrictToSkew W hWinv D : (gBil.restrict W).skewAdjointSubmodule) :
      Module.End ℚ W) ⟨y, hy⟩ = 0 := by rw [h1]; rfl
  have hcoe : (((colRestrictToSkew W hWinv D : (gBil.restrict W).skewAdjointSubmodule) :
      Module.End ℚ W) ⟨y, hy⟩ : O ℚ) = ((0 : W) : O ℚ) := by rw [hz]
  rw [colRestrictToSkew_coe] at hcoe
  simpa using hcoe

/-- colour maps the `gBil`-orthogonal complement (within `Vsub`) of a colour-invariant `W` into
    itself: `W' := gBil.orthogonal W ⊓ Vsub`. -/
theorem colour_mapsTo_orthogonal_inf_Vsub {W : Submodule ℚ (O ℚ)}
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W)
    (D : colourCentralizer) {x : O ℚ} (hx : x ∈ gBil.orthogonal W ⊓ Vsub) :
    ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ gBil.orthogonal W ⊓ Vsub := by
  rw [Submodule.mem_inf] at hx ⊢
  refine ⟨?_, ?_⟩
  · exact deriv_mapsTo_orthogonal ((D : derivationLieQ) : Module.End ℚ (O ℚ)) (D : derivationLieQ).2
      (fun n hn => hWinv D n hn) hx.1
  · exact colour_mapsTo_Vsub (D : derivationLieQ) D.2 hx.2

/-- The so(n)-type bound on the skew-adjoints of `gBil.restrict W` (banked N28). -/
theorem finrank_colRestrictSkew_le (W : Submodule ℚ (O ℚ)) :
    Module.finrank ℚ (gBil.restrict W).skewAdjointSubmodule ≤ (Module.finrank ℚ W).choose 2 :=
  finrank_restrictSkew_le W

/-- ★ THE d=1 CRUX (self-blindness one level up): a colour-invariant `W ≤ Vsub` of dim 1 cannot
    exist.  Its generator `v` is a common eigenvector of colour; skew-adjointness forces the
    eigenvalue to 0 (`deriv_eigenvalue_zero`); so `v` is colour-fixed, hence in `span{sgl}` (N252);
    but `singlet ⊓ Vsub = ⊥` (N42c). -/
theorem no_one_dim_colour_invariant (W : Submodule ℚ (O ℚ)) (hWle : W ≤ Vsub)
    (hW1 : Module.finrank ℚ W = 1)
    (hinv : ∀ (D : colourCentralizer), ∀ x ∈ W, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W) :
    False := by
  rw [finrank_eq_one_iff'] at hW1
  obtain ⟨⟨v, hvW⟩, hvne0, hgen⟩ := hW1
  have hvne : v ≠ 0 := fun h => hvne0 (Subtype.ext h)
  -- every colour derivation kills v (eigenvalue 0)
  have hkill : ∀ D : colourCentralizer, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) v = 0 := by
    intro D
    obtain ⟨c, hc⟩ := hgen ⟨((D : derivationLieQ) : Module.End ℚ (O ℚ)) v, hinv D v hvW⟩
    have hcv : ((D : derivationLieQ) : Module.End ℚ (O ℚ)) v = c • v := by
      have := congrArg Subtype.val hc; simpa using this.symm
    have hc0 : c = 0 :=
      deriv_eigenvalue_zero ((D : derivationLieQ) : Module.End ℚ (O ℚ)) (D : derivationLieQ).2 hvne hcv
    rw [hcv, hc0, zero_smul]
  -- v ∈ ImO
  have hvIm : v ∈ ImO := Vsub_le_ImO (hWle hvW)
  -- ⟨v, hvIm⟩ ∈ colourInvariants
  have hvci : (⟨v, hvIm⟩ : ImO) ∈ colourInvariants := by
    rw [colourInvariants, Submodule.mem_iInf]
    intro D; rw [LinearMap.mem_ker]; apply Subtype.ext; rw [imRep_coe]
    show ((D : derivationLieQ) : Module.End ℚ (O ℚ)) v = ((0 : ImO) : O ℚ)
    simpa using hkill D
  -- push to O ℚ: v ∈ singlet
  have hvsing : v ∈ singlet := by
    rw [← colourInvariants_map_eq_singlet]
    exact ⟨⟨v, hvIm⟩, hvci, rfl⟩
  -- v ∈ singlet ⊓ Vsub = ⊥
  have hvbot : v ∈ (⊥ : Submodule ℚ (O ℚ)) := by
    rw [← singlet_disj_Vsub.eq_bot, Submodule.mem_inf]
    exact ⟨hvsing, hWle hvW⟩
  rw [Submodule.mem_bot] at hvbot
  exact hvne hvbot

/-- ★★★ NO PROPER NONZERO COLOUR-INVARIANT SUBSPACE of `Vsub`: the charged matter `Vsub = 3 ⊕ 3̄`
    is an IRREDUCIBLE colour module. -/
theorem no_proper_invariant_Vsub (W : Submodule ℚ (O ℚ)) (hWle : W ≤ Vsub)
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W)
    (hd0 : 0 < Module.finrank ℚ W) (hd6 : Module.finrank ℚ W < 6) : False := by
  set W' := gBil.orthogonal W ⊓ Vsub with hW'def
  have hW'inv : ∀ (D : colourCentralizer), ∀ x ∈ W',
      ((D : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W' :=
    fun D x hx => colour_mapsTo_orthogonal_inf_Vsub hWinv D hx
  have hsup : W ⊔ W' = Vsub := by
    rw [hW'def, ← sup_inf_assoc_of_le _ hWle, (isCompl_gBil_orthogonal W).sup_eq_top, top_inf_eq]
  have hdisj : Disjoint W W' :=
    (isCompl_gBil_orthogonal W).disjoint.mono_right inf_le_left
  have hdimsum : Module.finrank ℚ W + Module.finrank ℚ W' = 6 := by
    have key := Submodule.finrank_sup_add_finrank_inf_eq W W'
    rw [hsup, finrank_Vsub, disjoint_iff.mp hdisj, finrank_bot, add_zero] at key
    omega
  -- colour injects into skew(W) × skew(W')
  let F : colourCentralizer →ₗ[ℚ]
      ((gBil.restrict W).skewAdjointSubmodule × (gBil.restrict W').skewAdjointSubmodule) :=
    (colRestrictToSkew W hWinv).prod (colRestrictToSkew W' hW'inv)
  have hFinj : Function.Injective F := by
    rw [injective_iff_map_eq_zero]
    intro D hD
    have h1 : colRestrictToSkew W hWinv D = 0 := (Prod.ext_iff.mp hD).1
    have h2 : colRestrictToSkew W' hW'inv D = 0 := (Prod.ext_iff.mp hD).2
    have hkillW := colRestrict_eq_zero_kills W hWinv D h1
    have hkillW' := colRestrict_eq_zero_kills W' hW'inv D h2
    -- colour D kills W ⊔ W' = Vsub, so colourRepV D = 0, so D = 0
    have hkillVsub : ∀ y ∈ Vsub, ((D : derivationLieQ) : Module.End ℚ (O ℚ)) y = 0 := by
      intro y hy
      rw [← hsup, Submodule.mem_sup] at hy
      obtain ⟨a, ha, b, hb, rfl⟩ := hy
      rw [map_add, hkillW a ha, hkillW' b hb, add_zero]
    have hcolzero : colourRepV D = 0 := by
      apply LinearMap.ext; intro x; apply Subtype.ext
      rw [colourRepV_coe]
      show ((D : derivationLieQ) : Module.End ℚ (O ℚ)) (x : O ℚ) = ((0 : Vsub) : O ℚ)
      simpa using hkillVsub (x : O ℚ) x.2
    exact (injective_iff_map_eq_zero colourRepV).mp colourRepV_faithful D hcolzero
  have h8 : Module.finrank ℚ colourCentralizer.toSubmodule = 8 :=
    finrank_colourCentralizer_eq_eight
  have hle := LinearMap.finrank_le_finrank_of_injective hFinj
  haveI : Module.Free ℚ (gBil.restrict W).skewAdjointSubmodule :=
    Module.Free.of_divisionRing ℚ (gBil.restrict W).skewAdjointSubmodule
  haveI : Module.Free ℚ (gBil.restrict W').skewAdjointSubmodule :=
    Module.Free.of_divisionRing ℚ (gBil.restrict W').skewAdjointSubmodule
  rw [Module.finrank_prod] at hle
  have hb1 := finrank_colRestrictSkew_le W
  have hb2 := finrank_colRestrictSkew_le W'
  have hfin : (8 : ℕ) ≤ (Module.finrank ℚ W).choose 2 + (Module.finrank ℚ W').choose 2 := by
    calc (8:ℕ) = Module.finrank ℚ colourCentralizer.toSubmodule := h8.symm
    _ ≤ Module.finrank ℚ (gBil.restrict W).skewAdjointSubmodule
        + Module.finrank ℚ (gBil.restrict W').skewAdjointSubmodule := hle
    _ ≤ (Module.finrank ℚ W).choose 2 + (Module.finrank ℚ W').choose 2 := Nat.add_le_add hb1 hb2
  obtain ⟨d, hd⟩ : ∃ d, Module.finrank ℚ W = d := ⟨_, rfl⟩
  have hd'6 : Module.finrank ℚ W' = 6 - d := by omega
  rw [hd, hd'6] at hfin
  rw [hd] at hd0 hd6
  interval_cases d
  · exact no_one_dim_colour_invariant W hWle hd hWinv
  · revert hfin; decide
  · revert hfin; decide
  · revert hfin; decide
  · exact no_one_dim_colour_invariant W' inf_le_right (by omega) hW'inv

end Phys.Algebra
