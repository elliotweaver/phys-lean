/-
  Counterexamples.DerivationColourIsospinNonNormalizeWrongValueCostume — N203 anti-vacuity (C235).
  ===========================================================================
  W8 ANTI-VACUITY. The N203 node banks a genuinely-NEW, genuinely-DIFFERENT physics joint: the
  embedded weak-isospin su(2) does NOT normalize the colour su(3) inside g₂ = Der(O Q). The
  off-Cartan isospin generator DJ brackets the shared colour Cartan DI OUT of colour:
  the inter-factor bracket is [DI, DJ] = 2 . DK (the su(2) structure constant transported into g₂),
  and DK is NOT in the colour centralizer (DK u1 = iotaO(2.hJ) /= 0), so [DJ, DI] = -2 . DK is not
  in colour, hence DJ is not in the normalizer of colour and colour is not a Lie ideal of g₂.

  THE GENUINE VALUE. The inter-factor bracket coefficient (bracket_DI_DJ_eq :
  [DI, DJ] = (2 : Q) . DK) is exactly 2: the two Standard-Model non-abelian gauge factors do NOT
  commute.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the two factors commute / isospin normalizes
  colour / colour IS a Lie ideal of g₂ / the structure constant vanishes / the coefficient is
  anything other than 2): that this coefficient equals (203 : Q). Multiplying the banked equality
  bracket_DI_DJ_eq by the bogus scalar identity shows the bogus claim reduces to the false numeric
  203 = 2 in Q. The kernel cannot close it; the costume BITES (lean leaves the unsolved false goal,
  exit 1).

  The bite is name-independent: delete "colour / isospin / su(3) / su(2) / u(1) / g₂ / Cartan /
  gauge / ideal / normalize" and for the Cayley-Dickson double O Q = CD (H Q), the Lie bracket of
  the two derivations DI, DJ equals 2 . DK, so claiming the coefficient is 203 is genuinely FALSE
  (203 /= 2).

  DISTINCT from the banked battery (... C232 200 = -2, C233 201 = 8, C234 202 = 1): the pair
  (203, 2) is fresh (LHS 203 and RHS 2 distinct from every recent pair).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DerivationColourIsospinNonNormalize

namespace Counterexamples

open Phys.Algebra

/-- TRUE: the inter-factor bracket of the two SM non-abelian gauge factors inside g₂ has
    coefficient `2`: `⁅DI, DJ⁆ = (2 : ℚ) • DK`. -/
theorem bracket_coeff_true : (⁅DI, DJ⁆ : derivationLieQ) = (2 : ℚ) • DK := bracket_DI_DJ_eq

/-- BOGUS: claims the bracket coefficient is `203`. It GENUINELY equals `2` (`bracket_coeff_true`).
    The WRONG claim (the factors commute / isospin normalizes colour / colour is a Lie ideal of g₂ /
    the coefficient is not `2`) reduces — through the banked equality — to the false numeric
    `203 = 2`, so this must NOT compile. -/
theorem bracket_coeff_wrong_BOGUS : (203 : ℚ) • DK = (⁅DI, DJ⁆ : derivationLieQ) := by
  rw [bracket_coeff_true]
  -- goal: (203 : ℚ) • DK = (2 : ℚ) • DK ; congr reduces to the false 203 = 2
  congr 1
  -- ⊢ (203 : ℚ) = 2  (FALSE — the costume bites)

end Counterexamples
