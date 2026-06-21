/-
  Counterexamples.QuaternionStarCostume — N2 rung-2 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming the conjugation the doubling carries is
  MULTIPLICATIVE (`star (x*y) = star x · star y`) rather than ANTI-multiplicative
  (`star (x*y) = star y · star x`). The Cayley–Dickson doubling carries a genuine
  `*`-structure whose conjugation is ANTI-multiplicative (`Phys/Cascade/Double.lean`
  `instStarRingCD` proves `star_mul`); on the NON-commutative rung-2 algebra the
  multiplicative form is FALSE. Claiming it on the canonical non-commuting pair must
  be REJECTED by the kernel. If it ever COMPILES, the anti-multiplicativity (the
  reason the doubling can iterate correctly into the next rung) was doing no work —
  exactly the wrong-continuation failure the battery exists to catch.

  The manifest's PASS_SIGNATURE matches the elaboration error below (`-1 = 1`).
-/
import Phys.Cascade.Quaternion
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

/-- WRONG CONTINUATION: claiming the doubled conjugation is multiplicative (not
    anti-multiplicative) on the canonical non-commuting pair. False on the
    non-commutative rung-2 algebra; componentwise reduction leaves `-1 = 1`, so this
    must FAIL to elaborate. -/
theorem quaternion_star_multiplicative_BOGUS :
    star ((ιJ ℚ) * CD.e2) = star (ιJ ℚ) * star CD.e2 := by
  ext <;> simp [ιJ, CD.iota, CD.e2, Dbl.J]
