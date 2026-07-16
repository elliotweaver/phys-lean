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

example : (1 : Cut) = Qcut 1 := rfl

example : sqrt2 * sqrt2 = (2 : Cut) := by
  rw [sqrt2_mul_sqrt2]
  have h1 : (1 : Cut) = Qcut 1 := rfl
  have : Qcut (1+1) = Qcut 1 + Qcut 1 := (Qcut_add 1 1).symm
  rw [show (2:Q) = 1 + 1 by norm_num, this, ← h1]
  norm_num

end Phys.Quantum.Q3Probe
