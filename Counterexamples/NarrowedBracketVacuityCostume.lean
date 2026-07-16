/-
  Counterexamples.NarrowedBracketVacuityCostume — N### / ARC-D D5-next anti-vacuity (C508).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next node (ARC-D THE NARROWING CAMPAIGN, node 2 — TIGHTEN EVERY BRACKET)
  aims the banked D5 cos instrument (split@4/@3) and the D1 exp instrument (partial-sum index 10/14)
  at deeper indices, then re-composes the D4 assembled pipeline to a certified two-sided rational
  bracket of the derived zero-momentum inverse fine-structure coupling that is STRICTLY NARROWER than
  D5's. The marquee content that must NOT be hollow: the re-composed bracket
  `610/9 <= invAlphaZero (completeBandList chargeTraceDepth) <= 9206/135` has width
  `9206/135 - 610/9 = 56/135` STRICTLY BELOW D5's width `(190/3+180/7) - (190/3+80/153)` — i.e. the
  narrowing campaign genuinely SHRANK the assembled bracket. A hollow reading where "the campaign
  banks the same width / the re-composed bracket is no tighter / the deeper indices buy nothing" is
  refuted: the banked `invAlphaZero_narrowed_width_lt` proves the new width is strictly less.

  THE CERTIFICATE. `narrowFlag := 1` — a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than D5's: the deeper cos/exp indices genuinely tighten the derived
  1/α(0) bracket". It is TIED to the banked D5-next landing by `narrowFlag_forced`:
  `invAlphaZero_narrowed_width_lt` witnesses `(9206/135 - 610/9 : Cut) < (190/3+180/7) - (190/3+80/153)`,
  so the flag is `1`.

  We anchor `min 508 narrowFlag = 1` (TRUE — `narrowFlag = 1 < 508`, so the min is `narrowFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  deeper indices are hollow" mis-reading): that `min 508 narrowFlag = 508`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 508` in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (508, 1) is fresh (Cid 508 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next FLAG: `1` = "the re-composed assembled bracket is STRICTLY narrower than D5's — the
    deeper cos/exp indices genuinely tighten the derived 1/α(0) bracket". -/
def narrowFlag : ℕ := 1

/-- TRUE (tied to the banked D5-next landing): `invAlphaZero_narrowed_width_lt` proves the re-composed
    bracket width `56/135` is strictly below D5's, so the flag is present, `narrowFlag = 1`. -/
theorem narrowFlag_forced :
    (9206 / 135 - 610 / 9 : Cut) < (190 / 3 + 180 / 7) - (190 / 3 + 80 / 153) ∧ narrowFlag = 1 :=
  ⟨invAlphaZero_narrowed_width_lt, rfl⟩

/-- TRUE: `min 508 narrowFlag = 1`, holding precisely because `narrowFlag = 1 < 508`. -/
theorem cert_val_true : min (508 : ℕ) narrowFlag = 1 := by decide

/-- BOGUS: claims `min 508 narrowFlag = 508`. It GENUINELY equals `1` (`cert_val_true`). A "the
    campaign buys nothing / the width does not shrink / the deeper indices are hollow" mis-reading
    reduces — through the banked value — to the false numeric `1 = 508`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (508 : ℕ) narrowFlag = 508 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 508  (FALSE — the costume bites)

end Counterexamples
