/-
  Counterexamples.OctonionCrossGramContractionWrongValueCostume — N211 anti-vacuity (C243).
  ===========================================================================
  W8 ANTI-VACUITY. The N211 node banks a genuinely-NEW, genuinely-DIFFERENT joint: the
  CROSS-PRODUCT GRAM CONTRACTION, the polarized Born composition law on the octonion rung
  O Q = CD (H Q). Polarizing the banked Born composition law gForm_comp (N24,
  gForm (x.y)(x.y) = gForm x x . gForm y y) twice — once in the left factor
  (gForm_right_exchange), once in the right factor — yields the master EXCHANGE identity
        gForm (x.y)(z.w) + gForm (x.w)(z.y) = 2 . gForm x z . gForm y w,
  the fully-polarized composition law, with NO coordinate expansion. On the imaginary subspace,
  where octCross x y = Im(x.y) is the 7-dimensional vector product (N206), it contracts the Gram
  pairing of two cross products to the metric:
        gForm (octCross x y)(octCross z w) + gForm (octCross x w)(octCross z y)
          = 2 . gForm x z . gForm y w - gForm x y . gForm z w - gForm x w . gForm y z,
  the symmetric (metric) part of the calibration contraction <phi, phi>, in which the
  totally-antisymmetric coassociative 4-form psi = *phi (N210) cancels.

  THE GENUINE VALUE. On the banked orthonormal pair (u1, u2) — gForm u1 u1 = gForm u2 u2 = 1,
  gForm u1 u2 = 0 — the contraction evaluates to the nonzero scalar
        gForm (octCross u1 u2)(octCross u1 u2) + gForm (octCross u1 u2)(octCross u1 u2)
          = 2 . 1 . 1 - 0 - 0 = 2     (octCross_gram_witness),
  a genuine NONZERO value (= 2), so the Gram contraction is NON-DEGENERATE, not the trivial 0 = 0.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the contraction vanishes on the witness /
  the cross-product Gram does not reduce to the metric / the exchange identity is degenerate /
  the polarized composition law is trivial): that this value equals (211 : Q). Rewriting the
  banked value shows the bogus claim reduces to the false numeric 2 = 211 in Q. The kernel cannot
  close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), gForm (octCross u1 u2)(octCross u1 u2) + gForm (octCross u1 u2)(octCross u1 u2) equals
  2, so claiming it is 211 is genuinely FALSE (2 /= 211).

  DISTINCT from the banked battery (... C240 = 208, C241 = 209, C242 = 210): the pair (211, 2)
  is fresh (LHS 211 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionCrossGramContraction

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the cross-product Gram contraction on the orthonormal witness pair equals `2`
    (`octCross_gram_witness`). -/
theorem octCross_gram_true :
    gForm (octCross u1 u2) (octCross u1 u2) + gForm (octCross u1 u2) (octCross u1 u2) = 2 :=
  octCross_gram_witness

/-- BOGUS: claims the value is `211`. It GENUINELY equals `2` (`octCross_gram_true`). The WRONG
    claim (the contraction vanishes / the cross-product Gram does not reduce to the metric / the
    exchange identity is degenerate) reduces — through the banked value — to the false numeric
    `2 = 211`, so this must NOT compile. -/
theorem octCross_gram_wrong_BOGUS :
    gForm (octCross u1 u2) (octCross u1 u2) + gForm (octCross u1 u2) (octCross u1 u2) = (211 : ℚ) := by
  rw [octCross_gram_true]
  -- ⊢ (2 : ℚ) = 211  (FALSE — the costume bites)

end Counterexamples
