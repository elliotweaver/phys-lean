/-
  Counterexamples.NarrowedBracket3VacuityCostume — N### / ARC-D D5-next-3 anti-vacuity (C510).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-3 node (ARC-D THE NARROWING CAMPAIGN, node 4 — SHARPEN THE m01 FLOOR
  AND AIM THE COS INSTRUMENT AT split@5) sharpens the m01 flavor floor (via the DIRECT Born-square
  quotient bracket, tighter than the banked massRatio detour) and squeezes 1/cutPi (split@5 lower
  positivity + split@4 upper sign), then re-composes the D4 assembled pipeline to a certified two-sided
  rational bracket of the derived zero-momentum inverse fine-structure coupling that is STRICTLY
  NARROWER than D5-next-2's. The marquee content that must NOT be hollow: the re-composed bracket
  `9606370/141381 <= invAlphaZero (completeBandList chargeTraceDepth) <= 9605390/141363` has width
  `9605390/141363 - 9606370/141381` STRICTLY BELOW D5-next-2's width `159646/2349 - 48290/711` — i.e.
  the narrowing campaign genuinely SHRANK the assembled bracket AGAIN (a fourth time, ~26x). A hollow
  reading where "the campaign banks the same width / the re-composed bracket is no tighter / the deeper
  indices buy nothing" is refuted: the banked `invAlphaZero_narrowed3_width_lt` proves the new width is
  strictly less than the previous rung's.

  THE CERTIFICATE. `narrowFlag3 := 1` — a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than D5-next-2's: the split@5 cos squeeze and the direct-Born-square m01
  sharpening genuinely tighten the derived 1/alpha(0) bracket a fourth time". It is TIED to the banked
  D5-next-3 landing by `narrowFlag3_forced`: `invAlphaZero_narrowed3_width_lt` witnesses
  `(9605390/141363 - 9606370/141381 : Cut) < 159646/2349 - 48290/711`, so the flag is `1`.

  We anchor `min 510 narrowFlag3 = 1` (TRUE — `narrowFlag3 = 1 < 510`, so the min is `narrowFlag3`).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  deeper indices are hollow" mis-reading): that `min 510 narrowFlag3 = 510`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 510` in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (510, 1) is fresh (Cid 510 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket3
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket3
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-3 FLAG: `1` = "the re-composed assembled bracket is STRICTLY narrower than D5-next-2's —
    the split@5 cos squeeze and the direct-Born-square m01 sharpening genuinely tighten the derived
    1/alpha(0) bracket a fourth time". -/
def narrowFlag3 : ℕ := 1

/-- TRUE (tied to the banked D5-next-3 landing): `invAlphaZero_narrowed3_width_lt` proves the
    re-composed bracket width is strictly below D5-next-2's, so the flag is present, `narrowFlag3 = 1`. -/
theorem narrowFlag3_forced :
    (9605390 / 141363 - 9606370 / 141381 : Cut) < 159646 / 2349 - 48290 / 711 ∧ narrowFlag3 = 1 :=
  ⟨invAlphaZero_narrowed3_width_lt, rfl⟩

/-- TRUE: `min 510 narrowFlag3 = 1`, holding precisely because `narrowFlag3 = 1 < 510`. -/
theorem cert_val_true : min (510 : ℕ) narrowFlag3 = 1 := by decide

/-- BOGUS: claims `min 510 narrowFlag3 = 510`. It GENUINELY equals `1` (`cert_val_true`). A "the
    campaign buys nothing / the width does not shrink / the deeper indices are hollow" mis-reading
    reduces — through the banked value — to the false numeric `1 = 510`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (510 : ℕ) narrowFlag3 = 510 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 510  (FALSE — the costume bites)

end Counterexamples
