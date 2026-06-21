/-
  Counterexamples.OctonionAssocCostume — N2c rung-3 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming the rung-3 algebra `O ℚ = CD (H ℚ)` is ASSOCIATIVE
  on the canonical triple. The whole content of rung 3 is that doubling the
  NON-commutative algebra LOSES associativity (`Phys/Cascade/Octonion.lean`
  `not_associative_witness`: `(ι(ι J)·ι(e₂))·e₂ ≠ ι(ι J)·(ι(e₂)·e₂)`). Claiming the
  canonical triple reassociates is FALSE: the kernel must REJECT it. If it ever
  COMPILES, the loss of associativity was doing no work — the cascade could have
  continued associative forever, with no forced stop — exactly the WRONG
  CONTINUATION the battery exists to catch.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Cascade.Octonion
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

/-- WRONG CONTINUATION: claiming the rung-3 algebra associates on the canonical
    triple. False: the two bracketings of `(ι(ι J), ι(e₂), e₂)` land on `J` and
    `J* = −J` in the top dimension. Reducing componentwise leaves the false core
    `1 = -1`, so this must FAIL to elaborate. -/
theorem octonion_associative_BOGUS :
    (CD.iota (ιJ ℚ) * CD.iota (CD.e2 : H ℚ)) * (CD.e2 : O ℚ)
      = CD.iota (ιJ ℚ) * (CD.iota (CD.e2 : H ℚ) * (CD.e2 : O ℚ)) := by
  ext <;> simp [ιJ, CD.iota, CD.e2, Dbl.J]
