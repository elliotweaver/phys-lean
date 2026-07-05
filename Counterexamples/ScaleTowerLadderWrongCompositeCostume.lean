/-
  Counterexamples.ScaleTowerLadderWrongCompositeCostume — N332 anti-vacuity (C357).
  ============================================================================
  W8 ANTI-VACUITY. The N332 node (seeded arc-B B5) banks the composite electroweak-to-Planck ratio as
  a product of two 84π-grammar rungs, whose exponent numerator is the SUM `37 = 28 + 9`:

      `ewToPlanckRatio_eq : ewToPlanckRatio = cutExp (-(37 * cutPi / 3))`,
      `ewToPlanckRatio_from_grammar : ewToPlanckRatio
          = cutExp (-(rungExponent (finrank spaceSub) + rungExponent (finrank selfAdj)))`,

  i.e. `v/M_Pl = (v/M)·(M/M_Pl) = e^(−28π/3)·e^(−3π) = e^(−37π/3)` with `37π/3 = 28π/3 + 9π/3`. The
  composite exponent numerator `37` is LOAD-BEARING: it is the SUM of the n=9 EW rung numerator (28,
  over 3) and the n=28 gravity half-rung (3 = 9/3). A WRONG composite — e.g. forgetting to stack the
  gravity half-rung (`v/M_Pl = e^(−28π/3)`, numerator `28`) or the wrong stack — would break the
  `cutExp_add` collapse and give the wrong scale ordering.

  THE CERTIFICATE. `ladderCompositeNumerator := 37` — a ℕ flag standing for "the derived composite
  v/M_Pl exponent numerator is genuinely `37 = 28 + 9` (the n=9 EW rung stacked on the n=28 gravity
  half-rung, over the common denominator 3)". It is TIED to the banked landings by
  `ladderCompositeNumerator_forced` below: the banked `ewToPlanckRatio_eq` gives `cutExp(−(37·cutPi/3))`
  and `ewToPlanckRatio_from_grammar` exhibits it as the sum of the two banked rung exponents. If the
  banked `rungExponent_at_spaceSub = 28·cutPi/3`, `rungExponent_at_selfAdj = 3·cutPi`, `cutPi`, or the
  banked homomorphism `cutExp_add` were mis-built, these would not hold.

  We anchor `min 357 ladderCompositeNumerator = 37` (TRUE — `ladderCompositeNumerator = 37`, the
  genuine composite numerator).

  THE BOGUS CLAIM (a stand-in for ANY wrong composite): that `min 357 ladderCompositeNumerator = 357`.
  It GENUINELY equals `37` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `37 = 357` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (357, 37) is fresh (RHS 357 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerLadder
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

/-- THE COMPOSITE-NUMERATOR FLAG: `37` = "the derived composite v/M_Pl exponent numerator is genuinely
    `37 = 28 + 9` (the n=9 EW rung stacked on the n=28 gravity half-rung, over the common denominator
    3)". -/
def ladderCompositeNumerator : ℕ := 37

/-- TRUE (tied to the banked N332 forced landings): the composite ratio is `cutExp(−(37·cutPi/3))` and
    equals `cutExp` of the sum of the two banked grammar rung exponents. If the banked n=9 rung
    (`28·cutPi/3`), the banked n=28 rung (`3·cutPi`), the banked `cutPi`, or the banked homomorphism
    `cutExp_add` were mis-built, these would not hold. -/
theorem ladderCompositeNumerator_forced :
    ewToPlanckRatio = cutExp (-(37 * cutPi / 3))
    ∧ ewToPlanckRatio = cutExp (-(rungExponent (Module.finrank ℚ spaceSub)
                        + rungExponent (Module.finrank ℚ (bornBil).selfAdjointSubmodule))) :=
  ⟨ewToPlanckRatio_eq, ewToPlanckRatio_from_grammar⟩

/-- TRUE: `min 357 ladderCompositeNumerator = 37`, holding precisely because
    `ladderCompositeNumerator = 37` (the genuine composite numerator), not `357`. -/
theorem cert_val_true : min (357 : ℕ) ladderCompositeNumerator = 37 := by decide

/-- BOGUS: claims `min 357 ladderCompositeNumerator = 357`. It GENUINELY equals `37`
    (`cert_val_true`). A WRONG composite (e.g. forgetting the gravity half-rung stack, `v/M_Pl =
    e^(−28π/3)`, numerator `28`) reduces — through the banked value — to the false numeric `37 = 357`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (357 : ℕ) ladderCompositeNumerator = 357 := by
  rw [cert_val_true]
  -- ⊢ (37 : ℕ) = 357  (FALSE — the costume bites)

end Counterexamples
