import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Composite

namespace Phys.Quantum.Q3Probe
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ
open scoped TensorProduct

noncomputable def bellOverlap : TwoFibre →ₗ[Cut] Cut := coeff false false + coeff true true

theorem bellOverlap_tmul (a b : StateFibre) : bellOverlap (a ⊗ₜ b) = bornForm a b := by
  unfold bellOverlap bornForm
  simp only [LinearMap.add_apply, coeff_tmul, Bool.false_eq_true, if_false, if_true]

theorem bellOverlap_bell : bellOverlap bell = 2 := by
  unfold bellOverlap bell
  simp only [map_add, LinearMap.add_apply, coeff_tmul, eInward, eOutward]
  norm_num

end Phys.Quantum.Q3Probe
