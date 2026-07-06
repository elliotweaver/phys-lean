import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Phys.Algebra.LorentzContinuumCliffordSpinCover
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- PROBE 2: the general-Z components of the concrete curvature vector, then the concrete Ricci form.

-- (A) general Z: (lbCurv timeProj offDiagVar Z).1 = ¼·Z.2.1
theorem lbCurv_gen_comp1 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).1 = (4⁻¹ : Cut) * Z.2.1 := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero, smul_eq_mul]

-- (B) general Z: (lbCurv timeProj offDiagVar Z).2.1 = 0
theorem lbCurv_gen_comp2 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).2.1 = (0 : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_snd, Prod.smul_fst,
    Prod.snd_sub, Prod.fst_sub, neg_zero, sub_zero, smul_eq_mul, mul_zero]

-- (C) the concrete Ricci is ¼·Y.2.1·Z.2.1
theorem ricci_solder_form (Y Z : STVC) :
    ricci solderWit Y Z = (4⁻¹ : Cut) * Y.2.1 * Z.2.1 := by
  rw [ricci_solder, lbCurv_gen_comp1, lbCurv_gen_comp2]
  ring

-- (D) SYMMETRY of the concrete Ricci
theorem ricci_solder_symm (Y Z : STVC) :
    ricci solderWit Y Z = ricci solderWit Z Y := by
  rw [ricci_solder_form, ricci_solder_form]; ring

end

end Phys.Algebra
