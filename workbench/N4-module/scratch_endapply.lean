import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
example (f g : AddMonoid.End (O ℚ)) (y : O ℚ) : (f * g) y = f (g y) := by exact?
