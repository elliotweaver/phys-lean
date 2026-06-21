import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
example : AddCommGroup (O ℚ) := by infer_instance
example : Module ℤ (O ℚ) := by infer_instance
