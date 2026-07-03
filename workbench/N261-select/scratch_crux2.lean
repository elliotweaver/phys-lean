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

theorem bV_symm : bV.IsSymm := by
  rw [BilinForm.isSymm_def]; intro u v
  simp only [bV, BilinForm.restrict_apply]
  show gForm ((u:Vsub):O ℚ) ((v:Vsub):O ℚ) = gForm ((v:Vsub):O ℚ) ((u:Vsub):O ℚ)
  exact gForm_symm _ _

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

/-! ## The d=1 crux: no 1-dim colour-invariant subspace of Vsub (self-blindness one level up). -/

/-- ★ THE d=1 CRUX. A colour-invariant `W ≤ Vsub` (as a submodule of Vsub) of dim 1 is impossible.
    A generator `v` is a common eigenvector of all colour; skew-adjointness forces eigenvalue 0;
    so `v` is colour-fixed = `span{sgl}` (N252), but `Vsub ⊓ singlet = ⊥`. -/
theorem no_one_dim_colour_invariant_Vsub (W : Submodule ℚ Vsub)
    (hW1 : Module.finrank ℚ W = 1)
    (hinv : ∀ (D : colourCentralizer), ∀ x ∈ W, colourRepV D x ∈ W) : False := by
  rw [finrank_eq_one_iff'] at hW1
  obtain ⟨v, hvne0, hgen⟩ := hW1
  -- v : W, nonzero; the underlying Vsub vector
  set vV : Vsub := (v : Vsub) with hvVdef
  have hvVne : vV ≠ 0 := by
    intro h; exact hvne0 (Subtype.ext h)
  -- every colour derivation acts as a scalar on v (invariance), and that scalar is 0
  have hkill : ∀ D : colourCentralizer, colourRepV D vV = 0 := by
    intro D
    have hmem : colourRepV D vV ∈ W := hinv D vV v.2
    obtain ⟨c, hc⟩ := hgen ⟨colourRepV D vV, hmem⟩
    have hcv : colourRepV D vV = c • vV := by
      have := congrArg (fun (t : W) => (t : Vsub)) hc
      simpa [hvVdef] using this.symm
    -- push to O ℚ: (D:End)(v) = c • v, and deriv_eigenvalue_zero forces c = 0
    have hvOne : ((vV:Vsub):O ℚ) ≠ 0 := by
      intro h; exact hvVne (Subtype.ext h)
    have hcvO : ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((vV:Vsub):O ℚ)
        = c • ((vV:Vsub):O ℚ) := by
      have h := congrArg (fun (t : Vsub) => (t : O ℚ)) hcv
      simp only [colourRepV_coe, Submodule.coe_smul] at h
      simpa using h
    have hc0 : c = 0 :=
      deriv_eigenvalue_zero ((D : derivationLieQ) : Module.End ℚ (O ℚ))
        (D : derivationLieQ).2 hvOne hcvO
    rw [hcv, hc0, zero_smul]
  -- vV ∈ ImO
  have hvIm : ((vV : Vsub) : O ℚ) ∈ ImO := Vsub_le_ImO vV.2
  -- ⟨vV, hvIm⟩ ∈ colourInvariants
  have hvci : (⟨((vV:Vsub):O ℚ), hvIm⟩ : ImO) ∈ colourInvariants := by
    rw [colourInvariants, Submodule.mem_iInf]
    intro D
    rw [LinearMap.mem_ker]
    apply Subtype.ext
    rw [imRep_coe]
    show ((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((vV:Vsub):O ℚ) = ((0 : ImO) : O ℚ)
    have hk := hkill D
    have hcoe : ((colourRepV D vV : Vsub) : O ℚ) = ((0 : Vsub) : O ℚ) := by rw [hk]
    rw [colourRepV_coe] at hcoe
    simpa using hcoe
  -- push to O ℚ: vV ∈ singlet
  have hvsing : ((vV:Vsub):O ℚ) ∈ singlet := by
    rw [← colourInvariants_map_eq_singlet]
    exact ⟨⟨((vV:Vsub):O ℚ), hvIm⟩, hvci, rfl⟩
  -- vV ∈ singlet ⊓ Vsub = ⊥
  have hvbot : ((vV:Vsub):O ℚ) ∈ (⊥ : Submodule ℚ (O ℚ)) := by
    rw [← singlet_disj_Vsub.eq_bot, Submodule.mem_inf]
    exact ⟨hvsing, vV.2⟩
  rw [Submodule.mem_bot] at hvbot
  exact hvVne (Subtype.ext hvbot)

end Phys.Algebra
