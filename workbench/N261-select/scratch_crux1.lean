import Phys.Algebra.TowerGatherFaithfulColourRep
import Phys.Algebra.TowerGatherUniqueColourFixedAxis
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open scoped Classical
open Phys.Cascade
open LinearMap (BilinForm)
set_option synthInstance.maxHeartbeats 400000

/-- The Born form restricted to Vsub, as a BilinForm ℚ Vsub. -/
noncomputable def bV : BilinForm ℚ Vsub := gBil.restrict Vsub

/-- CRUX PROBE 1: colourRepV D is skew-adjoint for bV, entirely in End ℚ Vsub (no O ℚ diamond). -/
theorem colourRepV_skew (D : colourCentralizer) : bV.IsSkewAdjoint (colourRepV D) := by
  intro u v
  show bV (colourRepV D u) v = bV u ((-(colourRepV D)) v)
  simp only [BilinForm.restrict_apply, LinearMap.neg_apply]
  show gForm ((colourRepV D u : Vsub) : O ℚ) ((v : Vsub) : O ℚ)
     = gForm ((u : Vsub) : O ℚ) (-((colourRepV D v : Vsub) : O ℚ))
  rw [colourRepV_coe, colourRepV_coe]
  have hsk := gFormQ_skew ((D : derivationLieQ) : Module.End ℚ (O ℚ))
    (D : derivationLieQ).2 ((u : Vsub) : O ℚ) ((v : Vsub) : O ℚ)
  have hneg : gForm ((u : Vsub) : O ℚ) (-(((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((v : Vsub) : O ℚ)))
      = - gForm ((u : Vsub) : O ℚ) (((D : derivationLieQ) : Module.End ℚ (O ℚ)) ((v : Vsub) : O ℚ)) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  rw [hneg]; linarith

/-- bV is symmetric. -/
theorem bV_symm : bV.IsSymm := by
  rw [BilinForm.isSymm_def]; intro u v
  show gForm ((u:Vsub):O ℚ) ((v:Vsub):O ℚ) = gForm ((v:Vsub):O ℚ) ((u:Vsub):O ℚ)
  exact gForm_symm _ _

/-- bV restricted to any subspace is nondegenerate (Born anisotropy). -/
theorem bV_restrict_nondeg (W : Submodule ℚ Vsub) : (bV.restrict W).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm (((x:Vsub)):O ℚ) (((x:Vsub)):O ℚ) = 0 := by
      simpa [BilinForm.restrict, bV, gBil, gForm] using hx x
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))
  · intro y hy
    have h0 : gForm (((y:Vsub)):O ℚ) (((y:Vsub)):O ℚ) = 0 := by
      simpa [BilinForm.restrict, bV, gBil, gForm] using hy y
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))

end Phys.Algebra
