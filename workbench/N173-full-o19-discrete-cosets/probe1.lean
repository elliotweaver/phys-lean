import Phys.Algebra.LorentzContinuumSO9UnconditionalClosure
import Mathlib.LinearAlgebra.Determinant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## PROBE 1 — det of neg-id over Cut and O Cut. -/

-- finrank facts
example : Module.finrank Cut Cut = 1 := Module.finrank_self Cut
example : Module.finrank Cut (O Cut) = 8 := finrank_O_eq_eight_Cut

-- det of -id over Cut: want -1
example : LinearMap.det (-(LinearMap.id) : Cut →ₗ[Cut] Cut) = -1 := by
  have : (-(LinearMap.id) : Cut →ₗ[Cut] Cut) = (-1 : Cut) • LinearMap.id := by
    rw [neg_one_smul]
  rw [this, LinearMap.det_smul, LinearMap.det_id, Module.finrank_self]
  ring

-- det of -id over O Cut: want 1
example : LinearMap.det (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut) = 1 := by
  have : (-(LinearMap.id) : O Cut →ₗ[Cut] O Cut) = (-1 : Cut) • LinearMap.id := by
    rw [neg_one_smul]
  rw [this, LinearMap.det_smul, LinearMap.det_id, finrank_O_eq_eight_Cut]
  norm_num

end

end Phys.Algebra
