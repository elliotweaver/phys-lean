/-
  Counterexamples.DerivationRep7IrreducibleAdjointWrongValueCostume — N195 anti-vacuity (C227).
  ===========================================================================
  W8 ANTI-VACUITY. The N195 node banks that the (3,1) summand iotaO(ImH) of the joint so(4)
  bigrading 7 = (3,1) (+) (2,2) is IRREDUCIBLE under su(2)_S (the adjoint action): no proper nonzero
  invariant subspace. The genuinely NEW content vs N194 (which irreducibilized the (2,2) on the
  LEFT-REGULAR module) is the irreducibility of the OTHER summand, the 3-dim ADJOINT rep ImH, via the
  DOUBLE-BRACKET lever (4 quatNorm w) p = ad_w(ad_p w) - (4 (w p).re.re) w with quatNorm anisotropic
  over Q. The dichotomy genuinely FORBIDS proper nonzero invariants: the line Q hI FAILS adjoint
  invariance because ad_hJ(hI) = hJ hI - hI hJ = -hK - hK = -2 hK leaves the line Q hI.

  THE GENUINE VALUE. The deep coordinate of ad_hJ(hI) = -2 hK is (ad_hJ hI).im.im = -2 (since
  hK = (0, J) so hK.im.im = 1, times -2). This NONZERO off-line value is exactly what witnesses
  that Q hI is NOT adjoint-invariant — the irreducibility is non-vacuous.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the adjoint action fixes the line Q hI / the
  (3,1) is reducible / the irreducibility is vacuous / the double-bracket lever is trivial): that
  this coordinate equals (195 : Q). The banked value is exactly -2 (adHJ_hI_coord_true below), so
  the claim reduces to the false numeric 195 = -2 in Q. The kernel cannot close it; the costume
  BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(2) / so(3) / so(4) / adjoint / 3 /
  branching / bigrading / irreducible / gauge" and for the Cayley-Dickson double H Q = CD (Dbl Q)
  the commutator ad_hJ(hI) = hJ hI - hI hJ has deep coordinate -2 -- so claiming 195 is genuinely
  FALSE (195 /= -2 in Q).

  DISTINCT from the banked battery (... C224 1 = 192, C225 193 = -1, C226 194 = 1): pair (195, -2)
  is fresh (LHS 195 distinct from every prior left-hand value).
-/
import Phys.Algebra.DerivationRep7IrreducibleAdjoint

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the deep coordinate of the off-line commutator `ad_hJ(hI) = -2 hK` is `-2`. -/
theorem adHJ_hI_coord_true : (adHom (hJ : H ℚ) hI).im.im = -2 := by
  rw [adHom_apply, hJ_hI, hI_hJ, hK_def, sub_eq_add_neg]
  simp only [CD.add_im, CD.neg_im, Dbl.add_im, Dbl.neg_im, Dbl.J]
  norm_num

/-- BOGUS: claims this coordinate is `(195 : ℚ)`. It GENUINELY equals `-2` (`adHJ_hI_coord_true`).
    The WRONG claim (the adjoint action fixes the line `ℚ·hI` / the (3,1) is reducible / the
    irreducibility is vacuous) reduces to the false numeric `(195 : ℚ) = -2`, so this must NOT
    compile. -/
theorem adHJ_hI_coord_wrong_BOGUS : (195 : ℚ) = (adHom (hJ : H ℚ) hI).im.im := by
  rw [adHJ_hI_coord_true]

end Counterexamples
