import Phys.Algebra.TowerGatherHyperchargeDoublingIntertwiner
import Mathlib.Tactic

open Phys.Algebra

-- Load-bearing: the IMAGE of the un-doubled triplet TL under the doubling intertwiner hyperOp
-- is a genuine 3-space (it equals TR, dim 3). A degenerate/collapsing reading of the swap would
-- give a smaller dimension. Ties to the node headline TL_map_hyperOp_eq_TR + finrank_TR.
example : Module.finrank ℚ (TL.map hyperOp) = 3 := by
  rw [TL_map_hyperOp_eq_TR, finrank_TR]

example : min (309 : ℕ) (Module.finrank ℚ (TL.map hyperOp)) = 3 := by
  rw [TL_map_hyperOp_eq_TR, finrank_TR]; decide
