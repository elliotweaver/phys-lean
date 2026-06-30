/-
  Counterexamples.SedenionAlternativityLossWrongValueCostume — N200 anti-vacuity (C232).
  ===========================================================================
  W8 ANTI-VACUITY. The N200 node banks a genuinely-NEW, genuinely-DIFFERENT physics joint:
  the LOSS OF LEFT-ALTERNATIVITY at the sedenion rung S Q = CD (O Q) -- the FOURTH structure
  the same octonionic non-associativity terminates (beside the cascade stop N2, the Jordan
  generation cap N5, and the chirality block N44). The left-alternative law x(xy) = (xx)y,
  which the octonions KEEP, FAILS one rung up, and the failure is forced by the SAME banked
  zero divisor zdX*zdY = 0 (Sedenion.lean) that loses division and the Born / composition law.

  THE GENUINE VALUE. On the banked zero-divisor pair zdX, zdY the left side of the
  left-alternative law (zdX*zdX)*zdY has re.im.re.im coordinate exactly -2 (leftAlt_lhs_coord),
  hence is nonzero -- while the right side zdX*(zdX*zdY) = zdX*0 = 0 collapses through the banked
  zero_divisor_prod. So the two sides DIFFER: left-alternativity genuinely fails.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the sedenions are still left-alternative /
  the witness coordinate vanishes / the two bracketings agree / the alternative law survives the
  doubling past the octonions): that this coordinate value equals (200 : Q). The banked value is
  exactly -2, so the claim reduces to the false numeric 200 = -2 in Q. The kernel cannot close
  it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "alternativity / Moufang / sedenion / octonion / Jordan /
  chirality" and for the Cayley-Dickson double of the double-of-a-double O Q the witness product
  (zdX*zdX)*zdY has the coordinate -2 -- so claiming 200 is genuinely FALSE (200 /= -2).

  DISTINCT from the banked battery (... C229 197 = -2, C230 198 = 1, C231 199 = 0): the pair
  (200, -2) is fresh (LHS 200 distinct from every prior left-hand value).
-/
import Phys.Algebra.SedenionAlternativityLoss

namespace Counterexamples

open Phys.Algebra Phys.Cascade

/-- TRUE: the left side of the left-alternative law on the banked zero-divisor pair has
    `re.im.re.im` coordinate `-2` -- it is nonzero, so left-alternativity genuinely fails. -/
theorem leftalt_value_true : ((zdX * zdX) * zdY).re.im.re.im = -2 := leftAlt_lhs_coord

/-- BOGUS: claims the witness coordinate is `200`. It GENUINELY equals `-2`
    (`leftalt_value_true`). The WRONG claim (the sedenions stay left-alternative / the witness
    vanishes / the two bracketings agree) reduces to the false numeric `200 = -2`, so this must
    NOT compile. -/
theorem leftalt_value_wrong_BOGUS : (200 : ℚ) = ((zdX * zdX) * zdY).re.im.re.im := by
  rw [leftalt_value_true]

end Counterexamples
