/- find a witness where star(x*y) = star x * star y FAILS in H ℚ -/
import Phys.Cascade.Quaternion
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic
open Phys.Cascade

-- claim star multiplicative (not anti) on the canonical non-commuting pair
example : star ((ιJ ℚ) * CD.e2) = star (ιJ ℚ) * star CD.e2 := by
  ext <;> simp [ιJ, CD.iota, CD.e2, Dbl.J]
