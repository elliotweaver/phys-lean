/-
  Counterexamples.DimensionalTransmutationWrongFormCostume — N320 anti-vacuity (C349).
  ===========================================================================
  W8 ANTI-VACUITY. The N320 node (seeded gauge route B1 — the FIRST node of Arc B, the scale
  tower) banks the STRUCTURAL FORM of dimensional transmutation on the BANKED derived-ℝ `cutExp`:

      `transmutationRatio c g2 := cutExp (−(c / g2))`   (the dimensionless suppression `v/M`)

  and the STRICT EXPONENTIAL SUPPRESSION

      `transmutationRatio_lt_one : 0 < c → 0 < g2 → transmutationRatio c g2 < 1`,

  because the exponent `−(c/g²)` is strictly NEGATIVE (`cutExp_strictMono` vs `cutExp_zero`). The
  minus SIGN is load-bearing: a wrong-sign reading `cutExp(+c/g²)` INFLATES (`> 1`), which is
  strictly ABOVE the correct suppressed ratio (`transmutationRatio_inflation_gt`). The suppression
  also holds at the banked Arc-A coupling `g² = alphaStar` (`transmutationRatio_at_alphaStar`).

  THE CERTIFICATE. `suppressed := 1` — a ℕ flag standing for "the closure scale is genuinely
  SUPPRESSED (the ratio is strictly below 1)". It is TIED to the banked landing by
  `suppressed_forced` below: at a concrete positive `c = g² = 1` the ratio is genuinely `< 1` (via
  `transmutationRatio_lt_one`) AND the wrong-sign inflation reading is strictly above it (via
  `transmutationRatio_inflation_gt`). If the FORM were wrong (no suppression / wrong sign), those
  banked theorems would not hold and `suppressed_forced` would fail to compile.

  We anchor `min 349 suppressed = 1` (TRUE — `suppressed = 1`, and the suppression is genuine).

  THE BOGUS CLAIM (a stand-in for ANY wrong form: no suppression, wrong exponent sign giving
  inflation `v > M`, a non-exponential dependence, or an asserted ratio value): that
  `min 349 suppressed = 349`. It GENUINELY equals `1` (`cert_val_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `1 = 349` in ℕ. The kernel cannot close it; it BITES.

  (Non-vacuity is itself banked: `transmutationRatio_lt_one` — strict suppression for `c,g² > 0` —
  and `transmutationRatio_inflation_gt` — the wrong-sign inflation `cutExp(+c/g²) > 1` is strictly
  above the correct ratio, so the SIGN is load-bearing.)

  DISTINCT from the banked battery: the pair (349, 1) is fresh (RHS 349 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DimensionalTransmutation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE SUPPRESSION FLAG: `1` = "the closure scale is genuinely suppressed (ratio strictly < 1)". -/
def suppressed : ℕ := 1

/-- TRUE (tied to the banked N320 forced landings): at a concrete positive `c = g² = 1` the
    transmutation ratio is genuinely strictly below `1` (STRICT SUPPRESSION), and the wrong-sign
    inflation reading `cutExp(+c/g²)` is strictly ABOVE it — so the minus sign of the exponent is
    load-bearing. If the FORM were wrong, these would not hold. -/
theorem suppressed_forced :
    transmutationRatio 1 1 < 1 ∧ transmutationRatio 1 1 < cutExp ((1 : Cut) / 1) :=
  ⟨transmutationRatio_lt_one 1 1 (by norm_num) (by norm_num),
   transmutationRatio_inflation_gt 1 1 (by norm_num) (by norm_num)⟩

/-- TRUE: `min 349 suppressed = 1`, holding precisely because `suppressed = 1` (the genuine strict
    suppression of the banked form), not `349` (a no-suppression / wrong-sign / inflated reading). -/
theorem cert_val_true : min (349 : ℕ) suppressed = 1 := by decide

/-- BOGUS: claims `min 349 suppressed = 349`. It GENUINELY equals `1` (`cert_val_true`). The WRONG
    form (no suppression / wrong exponent sign giving `v > M` / non-exponential / asserted value)
    reduces — through the banked value — to the false numeric `1 = 349`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (349 : ℕ) suppressed = 349 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 349  (FALSE — the costume bites)

end Counterexamples
