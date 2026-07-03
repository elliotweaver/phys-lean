import Phys.Algebra.TowerGatherFaithfulColourRep
import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

/-!  N261 SCRATCH PROBE — irreducibility of the derived colour rep on the charged matter Vsub.
     Two novel pieces + full assembly, ported from N28 `no_proper_invariant_ImO`.
-/
namespace Phys.Algebra

open scoped Classical
open Phys.Cascade

set_option synthInstance.maxHeartbeats 400000

/-- Colour-restricted skew map: a colour derivation restricted to a colour-invariant `W ≤ O ℚ`,
    landing in the skew-adjoint operators of the restricted Born form. -/
noncomputable def colRestrictSkew (W : Submodule ℚ (O ℚ))
    (hWinv : ∀ (Dc : colourCentralizer), ∀ x ∈ W,
      ((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W) :
    colourCentralizer →ₗ[ℚ] (gBil.restrict W).skewAdjointSubmodule where
  toFun Dc := ⟨((Dc : derivationLieQ) : Module.End ℚ (O ℚ)).restrict (fun x hx => hWinv Dc x hx),
    (LinearMap.mem_skewAdjointSubmodule _).mpr (by
      intro x y
      show (gBil.restrict W) (((Dc : derivationLieQ) : Module.End ℚ (O ℚ)).restrict
            (fun x hx => hWinv Dc x hx) x) y
        = (gBil.restrict W) x
            ((-(((Dc : derivationLieQ) : Module.End ℚ (O ℚ)).restrict
              (fun x hx => hWinv Dc x hx))) y)
      simp only [BilinForm.restrict_apply, LinearMap.neg_apply]
      show gForm (((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) (x : O ℚ)) (y : O ℚ)
        = gForm (x : O ℚ) (-(((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) (y : O ℚ)))
      have hsk := gFormQ_skew ((Dc : derivationLieQ) : Module.End ℚ (O ℚ))
        (Dc : derivationLieQ).2 (x : O ℚ) (y : O ℚ)
      have hneg : gForm (x : O ℚ) (-(((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) (y : O ℚ)))
          = - gForm (x : O ℚ) (((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) (y : O ℚ)) := by
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

/-- ★ THE d=1 CRUX (self-blindness one level up): NO 1-dim colour-invariant subspace of `Vsub`. -/
theorem no_one_dim_colour_invariant_Vsub (W : Submodule ℚ (O ℚ)) (hWle : W ≤ Vsub)
    (hW1 : Module.finrank ℚ W = 1)
    (hinv : ∀ (Dc : colourCentralizer), ∀ x ∈ W,
      ((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) x ∈ W) : False := by
  rw [finrank_eq_one_iff'] at hW1
  obtain ⟨⟨v, hvW⟩, hvne0, hgen⟩ := hW1
  have hvne : v ≠ 0 := fun h => hvne0 (Subtype.ext h)
  -- every colour derivation kills v
  have hkill : ∀ Dc : colourCentralizer,
      ((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) v = 0 := by
    intro Dc
    obtain ⟨c, hc⟩ := hgen ⟨((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) v, hinv Dc v hvW⟩
    have hcv : ((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) v = c • v := by
      have := congrArg Subtype.val hc; simpa using this.symm
    have hsk := gFormQ_skew ((Dc : derivationLieQ) : Module.End ℚ (O ℚ))
      (Dc : derivationLieQ).2 v v
    -- gForm (D v) v + gForm v (D v) = 0, symmetric ⟹ 2·gForm(Dv,v)=0
    have hsymm : gForm v (((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) v)
        = gForm (((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) v) v := gForm_symm _ _
    have h2 : gForm (((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) v) v = 0 := by
      rw [hsymm] at hsk; linarith
    rw [hcv] at h2
    -- gForm (c•v) v = c • gForm v v; gForm v v ≠ 0
    have hcgf : c * gForm v v = 0 := by
      have hcc : gForm (c • v) v = c * gForm v v := gForm_smul_left v v c
      rw [hcc] at h2; exact h2
    have hgfne : gForm v v ≠ 0 := fun h => hvne (gForm_self_eq_zero.mp h)
    have hc0 : c = 0 := by
      rcases mul_eq_zero.mp hcgf with h | h
      · exact h
      · exact absurd h hgfne
    rw [hcv, hc0, zero_smul]
  -- v ∈ ImO
  have hvIm : v ∈ ImO := Vsub_le_ImO (hWle hvW)
  -- ⟨v, hvIm⟩ ∈ colourInvariants
  have hvci : (⟨v, hvIm⟩ : ImO) ∈ colourInvariants := by
    rw [colourInvariants, Submodule.mem_iInf]
    intro Dc
    rw [LinearMap.mem_ker]
    apply Subtype.ext
    rw [imRep_coe]
    show ((Dc : derivationLieQ) : Module.End ℚ (O ℚ)) v = ((0 : ImO) : O ℚ)
    simpa using hkill Dc
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

end Phys.Algebra
