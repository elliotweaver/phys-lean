import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
-- decidable eq on H ℚ?
example : DecidableEq (H ℚ) := by infer_instance
