/-
  Counterexamples.OctonionAssociative3FormWrongValueCostume — N209 anti-vacuity (C241).
  ===========================================================================
  W8 ANTI-VACUITY. The N209 node banks a genuinely-NEW, genuinely-DIFFERENT joint: the associative
  CALIBRATION 3-FORM on the imaginary subspace of the octonion rung O Q = CD (H Q),
        assoc3 x y z := gForm x (octCross y z).
  For imaginary x, y, z in ImO this equals - reQ (x . (y . z)) (assoc3_eq_neg_reQ); it is CYCLIC
  (assoc3_cyclic, the real-part TRACE-ASSOCIATIVITY reQ((a.b).c)=reQ(a.(b.c)) of the octonion
  product, the genuinely-new lever) and ANTISYMMETRIC under each transposition (assoc3_swap_yz,
  assoc3_swap_xy) — hence totally antisymmetric: the alternating 3-form whose stabilizer in GL(7)
  is the exceptional structure g2 = Der(O). The teeth: on the orthonormal-derived triple
  (u2, u1, u1 x u2) the 3-form equals -1 (assoc3_witness), flipping to +1 under the first-two swap
  (assoc3_witness_swapped) — genuinely alternating, NON-DEGENERATE.

  THE GENUINE VALUE. assoc3 u2 u1 (octCross u1 u2) = -1 (assoc3_witness): via the banked
  contraction witness u1 x (u1 x u2) = -u2 (N208) and <u2,u2> = 1 (N206), the calibration takes a
  genuine NONZERO value on a real triple.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the 3-form is symmetric not alternating / it
  vanishes on the witness triple / the calibration is degenerate / the cyclic-trace-associativity
  fails): that this value equals (209 : Q). Rewriting the banked value shows the bogus claim reduces
  to the false numeric -1 = 209 in Q. The kernel cannot close it; the costume BITES (lean leaves the
  unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q = CD (H Q),
  gForm u2 (octCross u1 (octCross u1 u2)) equals -1, so claiming it is 209 is genuinely FALSE
  (-1 /= 209).

  DISTINCT from the banked battery (... C238 1 = 206, C239 1 = 207, C240 = 208): the pair (209, -1)
  is fresh (LHS 209 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionAssociative3Form

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the calibration 3-form on the orthonormal-derived triple `(u2, u1, u1 x u2)` equals
    `-1` (`assoc3_witness`). -/
theorem assoc3_true :
    assoc3 u2 u1 (octCross u1 u2) = -1 := assoc3_witness

/-- BOGUS: claims the value is `209`. It GENUINELY equals `-1` (`assoc3_true`). The WRONG claim (the
    3-form is symmetric / vanishes on the triple / the calibration is degenerate / the cyclic
    trace-associativity fails) reduces — through the banked value — to the false numeric `-1 = 209`,
    so this must NOT compile. -/
theorem assoc3_wrong_BOGUS :
    assoc3 u2 u1 (octCross u1 u2) = (209 : ℚ) := by
  rw [assoc3_true]
  -- ⊢ (-1 : ℚ) = 209  (FALSE — the costume bites)

end Counterexamples
