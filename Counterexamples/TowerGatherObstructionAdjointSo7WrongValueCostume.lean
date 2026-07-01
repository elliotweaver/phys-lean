/-
  Counterexamples.TowerGatherObstructionAdjointSo7WrongValueCostume — N223 anti-vacuity (C255).
  ===========================================================================
  W8 ANTI-VACUITY. The N223 node banks that THE CROSS PRODUCT REALIZES THE FUNDAMENTAL 7 INSIDE
  so(7): over the banked octonion rung `O Q` with the banked fundamental 7-module `ImO` (N22),
  the cross-product operator `crossOp a : y ↦ octCross a y` is SKEW-ADJOINT for the Born form —
  it lands in `skewAdjointLieSubalgebra bornBil = so(7)` — and the adjoint g₂ = Der(O Q) lands in
  the SAME so(7), linked by the g₂-intertwiner. Skew-adjointness means the SYMMETRIC part of the
  cross-product operator vanishes: for the concrete witness `(a,y,z) = (u1, u2, u1×u2)`,

      <octCross u1 u2, octCross u1 u2> + <u2, octCross u1 (octCross u1 u2)>  =  0
        (`crossOp_skew_witness`, TRUE),

  the two skew terms being genuinely `+1` and `−1` (banked Lagrange value `<u1×u2, u1×u2> = 1`
  and contraction witness `u1×(u1×u2) = −u2`). The cross-product operator is GENUINELY SKEW: its
  symmetric (self-adjoint) part is ZERO — it really is an element of so(7).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the cross-product operator has a nonzero
  symmetric/self-adjoint part / is NOT skew-adjoint / does NOT land in so(7) / the fundamental 7
  does not embed into so(7)): that this skew-sum equals (255 : Q). Rewriting the banked witness
  shows the bogus claim reduces to the false numeric 0 = 255 in Q. The kernel cannot close it;
  the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q),
  the skew-sum `<octCross u1 u2, octCross u1 u2> + <u2, octCross u1 (octCross u1 u2)>` is genuinely
  0 (banked `crossOp_skew_witness`), so claiming it is 255 is genuinely FALSE (0 /= 255).

  DISTINCT from the banked battery (... C253 = 2=253, C254 = 0=254): the pair (255, 0) is fresh
  (RHS 255 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherObstructionAdjointSo7

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the cross-product operator's skew-sum at the orthonormal witness triple genuinely
    vanishes (the banked `crossOp_skew_witness`). The operator IS skew-adjoint — it lands in
    so(7), it has no symmetric part. -/
theorem crossOp_skew_true :
    gForm (octCross u1 u2) (octCross u1 u2)
      + gForm u2 (octCross u1 (octCross u1 u2)) = (0 : ℚ) :=
  Phys.Algebra.crossOp_skew_witness

/-- BOGUS: claims the cross-product operator's skew-sum is `255`. It GENUINELY equals `0`
    (`crossOp_skew_true`). The WRONG claim (the operator has a nonzero symmetric part / is not
    skew-adjoint / does not land in so(7)) reduces — through the banked value — to the false
    numeric `0 = 255`, so this must NOT compile. -/
theorem crossOp_skew_wrong_BOGUS :
    gForm (octCross u1 u2) (octCross u1 u2)
      + gForm u2 (octCross u1 (octCross u1 u2)) = (255 : ℚ) := by
  rw [crossOp_skew_true]
  -- ⊢ (0 : ℚ) = 255  (FALSE — the costume bites)

end Counterexamples
