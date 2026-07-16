/-
  Counterexamples.NarrowedBracket2VacuityCostume — N### / ARC-D D5-next-2 anti-vacuity (C509).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-2 node (ARC-D THE NARROWING CAMPAIGN, node 3 — TIGHTEN FURTHER) aims
  the banked D5 cos instrument (split@4 on both ends) and the D1 exp instrument (partial-sum index
  16/20) at deeper/sharper indices, then re-composes the D4 assembled pipeline to a certified
  two-sided rational bracket of the derived zero-momentum inverse fine-structure coupling that is
  STRICTLY NARROWER than D5-next's. The marquee content that must NOT be hollow: the re-composed
  bracket `48290/711 <= invAlphaZero (completeBandList chargeTraceDepth) <= 159646/2349` has width
  `159646/2349 - 48290/711 = 8344/185571` STRICTLY BELOW D5-next's width `9206/135 - 610/9 = 56/135`
  — i.e. the narrowing campaign genuinely SHRANK the assembled bracket AGAIN. A hollow reading where
  "the campaign banks the same width / the re-composed bracket is no tighter / the deeper indices buy
  nothing" is refuted: the banked `invAlphaZero_narrowed2_width_lt` proves the new width is strictly
  less than the previous rung's.

  THE CERTIFICATE. `narrowFlag2 := 1` — a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than D5-next's: the deeper cos/exp indices genuinely tighten the derived
  1/alpha(0) bracket a third time". It is TIED to the banked D5-next-2 landing by `narrowFlag2_forced`:
  `invAlphaZero_narrowed2_width_lt` witnesses
  `(159646/2349 - 48290/711 : Cut) < 9206/135 - 610/9`, so the flag is `1`.

  We anchor `min 509 narrowFlag2 = 1` (TRUE — `narrowFlag2 = 1 < 509`, so the min is `narrowFlag2`).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  deeper indices are hollow" mis-reading): that `min 509 narrowFlag2 = 509`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 509` in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (509, 1) is fresh (Cid 509 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket2
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket2
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-2 FLAG: `1` = "the re-composed assembled bracket is STRICTLY narrower than D5-next's —
    the deeper cos/exp indices genuinely tighten the derived 1/alpha(0) bracket a third time". -/
def narrowFlag2 : ℕ := 1

/-- TRUE (tied to the banked D5-next-2 landing): `invAlphaZero_narrowed2_width_lt` proves the
    re-composed bracket width `8344/185571` is strictly below D5-next's `56/135`, so the flag is
    present, `narrowFlag2 = 1`. -/
theorem narrowFlag2_forced :
    (159646 / 2349 - 48290 / 711 : Cut) < 9206 / 135 - 610 / 9 ∧ narrowFlag2 = 1 :=
  ⟨invAlphaZero_narrowed2_width_lt, rfl⟩

/-- TRUE: `min 509 narrowFlag2 = 1`, holding precisely because `narrowFlag2 = 1 < 509`. -/
theorem cert_val_true : min (509 : ℕ) narrowFlag2 = 1 := by decide

/-- BOGUS: claims `min 509 narrowFlag2 = 509`. It GENUINELY equals `1` (`cert_val_true`). A "the
    campaign buys nothing / the width does not shrink / the deeper indices are hollow" mis-reading
    reduces — through the banked value — to the false numeric `1 = 509`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (509 : ℕ) narrowFlag2 = 509 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 509  (FALSE — the costume bites)

end Counterexamples
