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

-- 1. Qcut 2 = (2:Cut) ?
example : Qcut 2 = (2 : Cut) := by
  have : Qcut (1+1) = Qcut 1 + Qcut 1 := (Qcut_add 1 1).symm
  simp only [one_add_one_eq_two] at this
  rw [this]
  norm_num
  rfl

-- 2. sqrt2 * sqrt2 = 2
example : sqrt2 * sqrt2 = (2 : Cut) := by
  rw [sqrt2_mul_sqrt2]
  have : Qcut (1+1) = Qcut 1 + Qcut 1 := (Qcut_add 1 1).symm
  simp only [one_add_one_eq_two] at this
  rw [this]; norm_num; rfl

end Phys.Quantum.Q3Probe
