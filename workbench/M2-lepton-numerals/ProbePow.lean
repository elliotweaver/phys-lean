import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

noncomputable section

-- MEASURE A: 28th power of a 5-digit rational, reciprocal lower bound, over Cut.
-- ew ~ 1.8442e-13; test 1844/1e16 * (28497/10000)^28 <= 1  (i.e. 1844e-16 <= 1/Ehi^28)
example : (1844 / 10000000000000000 : Cut) * (28497 / 10000)^28 ≤ 1 := by
  norm_num

-- MEASURE B: reciprocal upper bound: 1 <= 1846/1e16 * (28496/10000)^28
example : (1 : Cut) ≤ (1846 / 10000000000000000) * (28496 / 10000)^28 := by
  norm_num

end
