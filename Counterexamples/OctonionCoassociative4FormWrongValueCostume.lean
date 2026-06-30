/-
  Counterexamples.OctonionCoassociative4FormWrongValueCostume — N210 anti-vacuity (C242).
  ===========================================================================
  W8 ANTI-VACUITY. The N210 node banks a genuinely-NEW, genuinely-DIFFERENT joint: the
  COASSOCIATIVE 4-FORM (the Hodge dual *phi of the associative calibration 3-form N209) on the
  imaginary subspace of the octonion rung O Q = CD (H Q),
        coassoc4 x y z w := gForm (assoc x y z) w   (= <[x,y,z], w>),
  assembling the banked associator assoc x y z = (x.y).z - x.(y.z) (N5b, ALTERNATING in its three
  slots) with the Born form gForm (N24). For imaginary w it equals - reQ ([x,y,z].w)
  (coassoc4_eq_neg_reQ); it is ANTISYMMETRIC under each adjacent transposition — x<->y
  (coassoc4_swap_xy), y<->z (coassoc4_swap_yz) and z<->w (coassoc4_swap_zw, the genuinely-new
  (z,w)-exchange lever assoc_reQ_skew: reQ([x,y,z].w)+reQ([x,y,w].z)=0, the associator is SKEW for
  the Born form in its last slot) — hence totally antisymmetric: the alternating 4-form whose
  stabilizer in GL(7) is the same exceptional structure g2 = Der(O) that fixes phi (N209).

  THE GENUINE VALUE. coassoc4 a b c [a,b,c] = ||[a,b,c]||^2 = 4 (coassoc4_witness_coord) on the
  cascade's non-associating witness triple (a,b,c) = (iota(iota J), iota e2, e2): pairing the
  associator with itself gives the squared Born length, a genuine NONZERO value (= 4), so the
  4-form is NON-DEGENERATE, not the trivial 0 = 0.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the 4-form vanishes on the witness / it is
  symmetric not alternating / the calibration is degenerate / the associator is NOT skew for the
  Born form): that this value equals (210 : Q). Rewriting the banked value shows the bogus claim
  reduces to the false numeric 4 = 210 in Q. The kernel cannot close it; the costume BITES (lean
  leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), gForm (assoc a b c) (assoc a b c) equals 4, so claiming it is 210 is genuinely FALSE
  (4 /= 210).

  DISTINCT from the banked battery (... C239 1 = 207, C240 = 208, C241 = 209): the pair (210, 4)
  is fresh (LHS 210 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionCoassociative4Form

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the coassociative 4-form on the self-paired non-associating witness equals `4`
    (`coassoc4_witness_coord`). -/
theorem coassoc4_true :
    coassoc4 wa wb wc (assoc wa wb wc) = 4 := coassoc4_witness_coord

/-- BOGUS: claims the value is `210`. It GENUINELY equals `4` (`coassoc4_true`). The WRONG claim
    (the 4-form vanishes on the witness / is symmetric / the calibration is degenerate / the
    associator is not skew for the Born form) reduces — through the banked value — to the false
    numeric `4 = 210`, so this must NOT compile. -/
theorem coassoc4_wrong_BOGUS :
    coassoc4 wa wb wc (assoc wa wb wc) = (210 : ℚ) := by
  rw [coassoc4_true]
  -- ⊢ (4 : ℚ) = 210  (FALSE — the costume bites)

end Counterexamples
