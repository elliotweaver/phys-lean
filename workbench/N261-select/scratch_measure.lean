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

noncomputable def bV : BilinForm ℚ Vsub := gBil.restrict Vsub

theorem bV_symm : bV.IsSymm := by
  rw [BilinForm.isSymm_def]; intro u v
  simp only [bV, BilinForm.restrict_apply]
  show gForm ((u:Vsub):O ℚ) ((v:Vsub):O ℚ) = gForm ((v:Vsub):O ℚ) ((u:Vsub):O ℚ)
  exact gForm_symm _ _

theorem colourRepV_skew (D : colourCentralizer) : bV.IsSkewAdjoint (colourRepV D) := by
  intro u v
  show bV (colourRepV D u) v = bV u ((-(colourRepV D)) v)
  simp only [bV, BilinForm.restrict_apply, LinearMap.neg_apply]
  show gForm ((colourRepV D u : Vsub) : O ℚ) ((v : Vsub) : O ℚ)
     = gForm ((u : Vsub) : O ℚ) (-((colourRepV D v : Vsub) : O ℚ))
  rw [colourRepV_coe, colourRepV_coe]
  have hsk := gFormQ_skew ((D : derivationLieQ) : Module.End ℚ (O ℚ))
    (D : derivationLieQ).2 ((u : Vsub) : O ℚ) ((v : Vsub) : O ℚ)
  have hneg : gForm ((u : Vsub) : O ℚ) (-(((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((v : Vsub) : O ℚ)))
      = - gForm ((u : Vsub) : O ℚ) (((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((v : Vsub) : O ℚ)) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  rw [hneg]; linarith

noncomputable def colToSkew (W : Submodule ℚ Vsub)
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W) :
    colourCentralizer →ₗ[ℚ] (bV.restrict W).skewAdjointSubmodule where
  toFun D := ⟨(colourRepV D).restrict (fun x hx => hWinv D x hx),
    (LinearMap.mem_skewAdjointSubmodule _).mpr (by
      intro x y
      show (bV.restrict W) (((colourRepV D).restrict (fun x hx => hWinv D x hx)) x) y
        = (bV.restrict W) x ((-((colourRepV D).restrict (fun x hx => hWinv D x hx))) y)
      simp only [BilinForm.restrict_apply, LinearMap.neg_apply, LinearMap.restrict_apply]
      have := colourRepV_skew D (x : Vsub) (y : Vsub)
      simpa [BilinForm.restrict_apply] using this)⟩
  map_add' D E := by
    apply Subtype.ext; apply LinearMap.ext; intro x; apply Subtype.ext
    show (colourRepV D + colourRepV E) (x:Vsub) = colourRepV D (x:Vsub) + colourRepV E (x:Vsub)
    rw [LinearMap.add_apply]
  map_smul' c D := by
    apply Subtype.ext; apply LinearMap.ext; intro x; apply Subtype.ext
    show (colourRepV (c • D)) (x:Vsub) = c • colourRepV D (x:Vsub)
    rw [map_smul]; rfl

theorem colToSkew_coe (W : Submodule ℚ Vsub)
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W)
    (D : colourCentralizer) (y : W) :
    (((colToSkew W hWinv D : (bV.restrict W).skewAdjointSubmodule) :
        Module.End ℚ W) y : Vsub) = colourRepV D (y : Vsub) := rfl

/-- If colToSkew W D = 0 then colourRepV D kills W. -/
theorem colToSkew_eq_zero_kills (W : Submodule ℚ Vsub)
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W)
    (D : colourCentralizer) (h1 : colToSkew W hWinv D = 0) :
    ∀ y ∈ W, colourRepV D y = 0 := by
  intro y hy
  have hz : ((colToSkew W hWinv D : (bV.restrict W).skewAdjointSubmodule) :
      Module.End ℚ W) ⟨y, hy⟩ = 0 := by rw [h1]; rfl
  have hcoe : (((colToSkew W hWinv D : (bV.restrict W).skewAdjointSubmodule) :
      Module.End ℚ W) ⟨y, hy⟩ : Vsub) = ((0 : W) : Vsub) := by rw [hz]
  rw [colToSkew_coe] at hcoe
  simpa using hcoe

/-- bV-orthogonal complement is a genuine linear complement. -/
theorem bV_isRefl : bV.IsRefl := bV_symm.isRefl

theorem bV_restrict_nondeg (W : Submodule ℚ Vsub) : (bV.restrict W).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm ((((x:Vsub)):O ℚ)) ((((x:Vsub)):O ℚ)) = 0 := by
      simpa [BilinForm.restrict, bV, gBil, gForm] using hx x
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))
  · intro y hy
    have h0 : gForm ((((y:Vsub)):O ℚ)) ((((y:Vsub)):O ℚ)) = 0 := by
      simpa [BilinForm.restrict, bV, gBil, gForm] using hy y
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))

theorem isCompl_bV_orthogonal (W : Submodule ℚ Vsub) : IsCompl W (bV.orthogonal W) :=
  bV.isCompl_orthogonal_of_restrict_nondegenerate bV_isRefl (bV_restrict_nondeg W)

theorem colour_mapsTo_bV_orthogonal {W : Submodule ℚ Vsub}
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W)
    (D : colourCentralizer) {x : Vsub} (hx : x ∈ bV.orthogonal W) :
    colourRepV D x ∈ bV.orthogonal W := by
  rw [BilinForm.mem_orthogonal_iff]; intro n hn
  show bV n (colourRepV D x) = 0
  have hsymm : bV n (colourRepV D x) = bV (colourRepV D x) n := by
    have := bV_symm; rw [BilinForm.isSymm_def] at this; exact this _ _
  have hsk := colourRepV_skew D x n
  have hxorth0 : bV (colourRepV D n) x = 0 :=
    (BilinForm.mem_orthogonal_iff.mp hx) (colourRepV D n) (hWinv D n hn)
  have hxorth : bV x (colourRepV D n) = 0 := by
    have := bV_symm; rw [BilinForm.isSymm_def] at this; rw [this]; exact hxorth0
  rw [hsymm, hsk]
  show bV x (-(colourRepV D n)) = 0
  rw [map_neg, hxorth, neg_zero]

/-- ★★ THE FAITHFUL PRODUCT INJECTION: colour injects into skew(W) × skew(W⊥) for invariant W. -/
theorem colToProd_injective (W : Submodule ℚ Vsub)
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W) :
    Function.Injective
      (((colToSkew W hWinv).prod
        (colToSkew (bV.orthogonal W) (fun D x hx => colour_mapsTo_bV_orthogonal hWinv D hx)))) := by
  rw [injective_iff_map_eq_zero]
  intro D hD
  have h1 : colToSkew W hWinv D = 0 := (Prod.ext_iff.mp hD).1
  have h2 : colToSkew (bV.orthogonal W) _ D = 0 := (Prod.ext_iff.mp hD).2
  have hkillW := colToSkew_eq_zero_kills W hWinv D h1
  have hkillW' := colToSkew_eq_zero_kills (bV.orthogonal W)
    (fun D x hx => colour_mapsTo_bV_orthogonal hWinv D hx) D h2
  have hall : colourRepV D = 0 := by
    apply LinearMap.ext; intro x
    have hxtop : x ∈ (⊤ : Submodule ℚ Vsub) := Submodule.mem_top
    rw [← (isCompl_bV_orthogonal W).sup_eq_top, Submodule.mem_sup] at hxtop
    obtain ⟨a, ha, b, hb, rfl⟩ := hxtop
    rw [map_add, hkillW a ha, hkillW' b hb, add_zero]; rfl
  exact (injective_iff_map_eq_zero colourRepV).mp colourRepV_faithful D hall

/-- The so(n)-type bound for the restricted Born form on a subspace `W ≤ Vsub`. -/
theorem finrank_bVrestrictSkew_le (W : Submodule ℚ Vsub) :
    Module.finrank ℚ (bV.restrict W).skewAdjointSubmodule ≤ (Module.finrank ℚ W).choose 2 :=
  finrank_skewAdjoint_le_choose (bV.restrict W)
    (by rw [BilinForm.isSymm_def]; intro x y
        simp only [BilinForm.restrict_apply]
        have := bV_symm; rw [BilinForm.isSymm_def] at this; exact this _ _)
    (bV_restrict_nondeg W)

/-- ★ THE d=1 CRUX (self-blindness one level up): NO 1-dim colour-invariant subspace of Vsub. -/
theorem no_one_dim_colour_invariant_Vsub (W : Submodule ℚ Vsub)
    (hW1 : Module.finrank ℚ W = 1)
    (hinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W) : False := by
  rw [finrank_eq_one_iff'] at hW1
  obtain ⟨v, hvne0, hgen⟩ := hW1
  set vV : Vsub := (v : Vsub) with hvVdef
  have hvVne : vV ≠ 0 := by intro h; exact hvne0 (Subtype.ext h)
  have hkill : ∀ D : colourCentralizer, colourRepV D vV = 0 := by
    intro D
    have hmem : colourRepV D vV ∈ W := hinv D vV v.2
    obtain ⟨c, hc⟩ := hgen ⟨colourRepV D vV, hmem⟩
    have hcv : colourRepV D vV = c • vV := by
      have := congrArg (fun (t : W) => (t : Vsub)) hc
      simpa [hvVdef] using this.symm
    have hvOne : ((vV:Vsub):O ℚ) ≠ 0 := by intro h; exact hvVne (Subtype.ext h)
    have hcvO : ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((vV:Vsub):O ℚ)
        = c • ((vV:Vsub):O ℚ) := by
      have h := congrArg (fun (t : Vsub) => (t : O ℚ)) hcv
      simp only [colourRepV_coe, Submodule.coe_smul] at h
      simpa using h
    have hc0 : c = 0 :=
      deriv_eigenvalue_zero ((D : derivationLieQ) : Module.End ℚ (O ℚ))
        (D : derivationLieQ).2 hvOne hcvO
    rw [hcv, hc0, zero_smul]
  have hvIm : ((vV : Vsub) : O ℚ) ∈ ImO := Vsub_le_ImO vV.2
  have hvci : (⟨((vV:Vsub):O ℚ), hvIm⟩ : ImO) ∈ colourInvariants := by
    rw [colourInvariants, Submodule.mem_iInf]
    intro D; rw [LinearMap.mem_ker]; apply Subtype.ext; rw [imRep_coe]
    show ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((vV:Vsub):O ℚ) = ((0 : ImO) : O ℚ)
    have hk := hkill D
    have hcoe : ((colourRepV D vV : Vsub) : O ℚ) = ((0 : Vsub) : O ℚ) := by rw [hk]
    rw [colourRepV_coe] at hcoe
    simpa using hcoe
  have hvsing : ((vV:Vsub):O ℚ) ∈ singlet := by
    rw [← colourInvariants_map_eq_singlet]
    exact ⟨⟨((vV:Vsub):O ℚ), hvIm⟩, hvci, rfl⟩
  have hvbot : ((vV:Vsub):O ℚ) ∈ (⊥ : Submodule ℚ (O ℚ)) := by
    rw [← singlet_disj_Vsub.eq_bot, Submodule.mem_inf]
    exact ⟨hvsing, vV.2⟩
  rw [Submodule.mem_bot] at hvbot
  exact hvVne (Subtype.ext hvbot)

/-- ★★★ NO PROPER NONZERO COLOUR-INVARIANT SUBSPACE of `Vsub`: the charged matter is an
    IRREDUCIBLE colour module. -/
set_option maxHeartbeats 800000 in
theorem no_proper_invariant_Vsub (W : Submodule ℚ Vsub)
    (hWinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W)
    (hd0 : 0 < Module.finrank ℚ W) (hd6 : Module.finrank ℚ W < 6) : False := by
  set W' := bV.orthogonal W with hW'def
  have hW'inv : ∀ (D : colourCentralizer), ∀ x ∈ W', colourRepV D x ∈ W' :=
    fun D x hx => colour_mapsTo_bV_orthogonal hWinv D hx
  have hdisj : Disjoint W W' := (isCompl_bV_orthogonal W).disjoint
  have hsup : W ⊔ W' = ⊤ := (isCompl_bV_orthogonal W).sup_eq_top
  have hdimsum : Module.finrank ℚ W + Module.finrank ℚ W' = 6 := by
    have key := Submodule.finrank_sup_add_finrank_inf_eq W W'
    rw [hsup, disjoint_iff.mp hdisj, finrank_bot, add_zero, finrank_top, finrank_Vsub] at key
    omega
  have hFinj := colToProd_injective W hWinv
  have h8 : Module.finrank ℚ colourCentralizer.toSubmodule = 8 :=
    finrank_colourCentralizer_eq_eight
  have hle := LinearMap.finrank_le_finrank_of_injective hFinj
  haveI : Module.Free ℚ (bV.restrict W).skewAdjointSubmodule :=
    Module.Free.of_divisionRing ℚ (bV.restrict W).skewAdjointSubmodule
  haveI : Module.Free ℚ (bV.restrict W').skewAdjointSubmodule :=
    Module.Free.of_divisionRing ℚ (bV.restrict W').skewAdjointSubmodule
  rw [Module.finrank_prod] at hle
  have hb1 := finrank_bVrestrictSkew_le W
  have hb2 := finrank_bVrestrictSkew_le W'
  have hfin : (8 : ℕ) ≤ (Module.finrank ℚ W).choose 2 + (Module.finrank ℚ W').choose 2 := by
    calc (8:ℕ) = Module.finrank ℚ colourCentralizer.toSubmodule := h8.symm
    _ ≤ Module.finrank ℚ (bV.restrict W).skewAdjointSubmodule
        + Module.finrank ℚ (bV.restrict W').skewAdjointSubmodule := hle
    _ ≤ (Module.finrank ℚ W).choose 2 + (Module.finrank ℚ W').choose 2 := Nat.add_le_add hb1 hb2
  obtain ⟨d, hd⟩ : ∃ d, Module.finrank ℚ W = d := ⟨_, rfl⟩
  have hd'6 : Module.finrank ℚ W' = 6 - d := by omega
  rw [hd, hd'6] at hfin
  rw [hd] at hd0 hd6
  interval_cases d
  · exact no_one_dim_colour_invariant_Vsub W hd hWinv
  · revert hfin; decide
  · revert hfin; decide
  · revert hfin; decide
  · exact no_one_dim_colour_invariant_Vsub W' (by omega) hW'inv

end Phys.Algebra
