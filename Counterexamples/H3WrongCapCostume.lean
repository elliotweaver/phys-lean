/-
  Counterexamples.H3WrongCapCostume — N5j wrong-cap / anti-vacuity costume
  (must be REJECTED).
  ===========================================================================
  THE WRONG-CAP WITNESS for the POSITIVE EDGE of the Hermitian Jordan cap: claiming the
  order-3 Jordan identity FAILS for a general Hermitian pair over the terminal algebra
  `O ℚ` — i.e. that some entry of the order-3 Jordan defect `jdef (Hm…) (Hm…)` is NONZERO,
  which would mean the tower is NOT Jordan at order 3 and the cap value is below 3.

  The whole content of `Phys/Algebra/HermitianJordan/PieceBfinal.lean` (`jdef_H3`,
  `jordan_cap_pinned_at_three`) is that the order-3 Jordan identity HOLDS for EVERY general
  Hermitian pair: `jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) = 0`. So every coordinate of
  every entry of that defect is `0`. The bogus claim picks a GENUINELY MULTI-GENERATOR pair —
  `Hm 1 0 0 e₂ 0 0` (real diagonal `1` at `(0,0)`, the cascade's last-doubling generator `e₂`
  on the `(0,1)` off-diagonal) and `Hm 0 1 0 0 e₂ 0` (real diagonal `1` at `(1,1)`, `e₂` on the
  `(0,2)` off-diagonal) — and asserts the `(0,1)` entry's deepest real coordinate is `1`.

  Rewriting by the banked `jdef_H3` (that defect matrix is the zero matrix), the `(0,1)` entry
  is `0`, whose `re.re.re` coordinate is `0`; the claim reduces to the false core `0 = 1` in
  `ℚ`. The manifest PASS_SIGNATURE matches that core.

  This guards the POSITIVE EDGE (docs/RUNBOOK.md W8, anti-vacuity): the witness pair carries
  genuine octonion off-diagonal content (two distinct `e₂` generators in different slots), so
  `jdef_H3` is forcing a REAL multi-generator defect to vanish — not the empty statement about a
  collapsed carrier. If the order-3 defect did NOT vanish on this genuine Hermitian pair, the cap
  would not be pinned at 3 and the flagship one-cause (alternativity-without-associativity) edge
  would be vacuous. The kernel must REJECT this.
-/
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (WRONG-CAP) CLAIM: that the order-3 Jordan defect of a genuine multi-generator
    Hermitian pair over `O ℚ` is NONZERO at the `(0,1)` entry's deepest real coordinate
    (value `1`). The derived law (`jdef_H3`, banked) is that this defect is the ZERO matrix;
    substituting it, the entry is `0`, its coordinate is `0`, and the claim reduces to the
    false core `0 = 1` and must FAIL to elaborate. -/
theorem h3_wrong_cap_BOGUS :
    (jdef (Hm 1 0 0 (CD.e2 : O ℚ) 0 0) (Hm 0 1 0 0 (CD.e2 : O ℚ) 0) 0 1).re.re.re = 1 := by
  rw [jdef_H3, Matrix.zero_apply]
  simp only [CD.zero_re, Dbl.zero_re]

end Counterexamples
