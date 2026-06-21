/-
  Counterexamples.JordanTowerCapCostume — N5 anti-vacuity / wrong-cap costume
  (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the Hermitian Jordan tower's CAP, in the precise wrong
  shape the task names: claiming the Jordan identity HOLDS on `H₄(O ℚ)` — i.e. that
  the order-4 tower over the terminal algebra is still a Jordan algebra, which would
  push the cap above 3 and require `𝕆` to associate where the cascade proved it does
  not (`Phys/Cascade/Octonion.lean`, `not_associative`).

  The whole content of `Phys/Algebra/JordanTower.lean` (`jordan_fails_H4`,
  `jdef_witness`, the one-cause link) is that the Jordan identity FAILS at order 4:
  the `(0,3)` entry of the Jordan defect has a nonzero `im.re.im` coordinate, equal to
  `4` over the cascade ground ring `ℚ`. The bogus claim is that this same coordinate is
  `0` (the defect vanishes there — the identity holds).

  Substituting the banked value (`jdef_witness`, BANKED: that coordinate `= 4`), the
  bogus claim reduces to the false core `4 = 0` in `ℚ`. The manifest PASS_SIGNATURE
  matches that core.

  This guards the CAP (docs/RUNBOOK.md W8): if the Jordan identity COMPILED on `H₄`,
  the tower would NOT be capped below order 4 — the terminal algebra's
  alternativity-without-associativity (the SAME octonionic non-associativity that
  stopped the cascade) would not surface as a second termination, and the flagship
  one-cause-many-terminations claim would be vacuous. The kernel must REJECT it.
-/
import Phys.Algebra.JordanTower
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (CAP) CLAIM: that the Jordan identity holds on `H₄(O ℚ)` at the witness pair,
    represented by the `(0,3)` defect coordinate being `0`. The derived law
    (`jdef_witness`, banked) is that this coordinate `= 4`; substituting it, the claim
    reduces to the false core `4 = 0` and must FAIL to elaborate. -/
theorem jordan_tower_cap_BOGUS :
    (jdef Xwit Ywit 0 3).im.re.im = 0 := by
  rw [jdef_witness]

end Counterexamples
