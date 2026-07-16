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

-- Cauchy-Schwarz on bornForm (Lagrange identity)
theorem cs (a b : StateFibre) : (bornForm a b)^2 ≤ bornForm a a * bornForm b b := by
  unfold bornForm
  nlinarith [sq_nonneg (a.1*b.2 - a.2*b.1)]

-- CHSH combination
noncomputable def chsh (a1 a2 b1 b2 : StateFibre) : Cut :=
  bornForm a1 b1 + bornForm a1 b2 + bornForm a2 b1 - bornForm a2 b2

-- bornForm bilinear pieces we need (explicit)
theorem bf_add_right (a u v : StateFibre) : bornForm a (u+v) = bornForm a u + bornForm a v := by
  unfold bornForm; simp [Prod.add_def]; ring
theorem bf_sub_right (a u v : StateFibre) : bornForm a (u-v) = bornForm a u - bornForm a v := by
  unfold bornForm; simp [Prod.sub_def]; ring

-- Parallelogram: bornForm (b1+b2)(b1+b2) + bornForm (b1-b2)(b1-b2) = 2 bf b1 b1 + 2 bf b2 b2
theorem parallelogram (b1 b2 : StateFibre) :
    bornForm (b1+b2) (b1+b2) + bornForm (b1-b2) (b1-b2)
      = 2 * bornForm b1 b1 + 2 * bornForm b2 b2 := by
  unfold bornForm; simp [Prod.add_def, Prod.sub_def]; ring

end Phys.Quantum.Q3Probe
