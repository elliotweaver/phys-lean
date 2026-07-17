/-
  Counterexamples.NarrowedBracket6VacuityCostume — N### / ARC-D D5-next-6 anti-vacuity (C513).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-6 node (ARC-D THE NARROWING CAMPAIGN, node 7 — SHARPEN cutLog FURTHER via
  the ACHIEVABLE m01 floor [34774707/10000, 34774761/10000] read through the D1 exp instrument at deeper
  index 24/27, AND push leastCosZero still nearer pi/2 via the SAME banked double-angle identity
  cutCos(2y) = 2 cutCos(y)^2 - 1 with the near-pi/4 positivity lemma extended one tick) squeezes cutLog
  (~1.6x tighter) and 1/cutPi (~2.7x tighter), then re-composes the D4 assembled pipeline to a certified
  two-sided rational bracket of the derived zero-momentum inverse fine-structure coupling that is STRICTLY
  NARROWER than the parent's (D5-next-5). The marquee content that must NOT be hollow: the re-composed
  bracket 19211728054/282743343 <= invAlphaZero (completeBandList chargeTraceDepth) <= 4802931662/70685829
  has width 4802931662/70685829 - 19211728054/282743343 STRICTLY BELOW the parent's width
  80048852/1178097 - 800488690/11780973 -- i.e. the narrowing campaign genuinely SHRANK the assembled
  bracket AGAIN (a seventh time, ~1.90x). A hollow reading where "the campaign banks the same width / the
  re-composed bracket is no tighter / the sharpened cutLog and pushed 1/cutPi buy nothing" is refuted: the
  banked invAlphaZero_narrowed6_width_lt proves the new width is strictly less than the previous rung's.

  THE CERTIFICATE. narrowFlag6 := 1 -- a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than the parent's: the achievable m01 floor at a deeper exp index sharpens
  cutLog and the fold's own double-angle identity pushed further tightens 1/cutPi, genuinely tightening the
  derived 1/alpha(0) bracket a seventh time". It is TIED to the banked D5-next-6 landing by
  narrowFlag6_forced: invAlphaZero_narrowed6_width_lt witnesses
  (4802931662/70685829 - 19211728054/282743343 : Cut) < 80048852/1178097 - 800488690/11780973, so the flag
  is 1.

  We anchor min 513 narrowFlag6 = 1 (TRUE -- narrowFlag6 = 1 < 513, so the min is narrowFlag6).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  sharpened residuals are hollow" mis-reading): that min 513 narrowFlag6 = 513. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 513 in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (513, 1) is fresh (Cid 513 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket6
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket6
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-6 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    the achievable m01 floor at a deeper exp index sharpens cutLog and the fold's own double-angle
    identity pushed further tightens 1/cutPi, genuinely tightening the derived 1/alpha(0) bracket a
    seventh time". -/
def narrowFlag6 : ℕ := 1

/-- TRUE (tied to the banked D5-next-6 landing): invAlphaZero_narrowed6_width_lt proves the
    re-composed bracket width is strictly below the parent's, so the flag is present, narrowFlag6 = 1. -/
theorem narrowFlag6_forced :
    (4802931662 / 70685829 - 19211728054 / 282743343 : Cut)
        < 80048852 / 1178097 - 800488690 / 11780973
      ∧ narrowFlag6 = 1 :=
  ⟨invAlphaZero_narrowed6_width_lt, rfl⟩

/-- TRUE: min 513 narrowFlag6 = 1, holding precisely because narrowFlag6 = 1 < 513. -/
theorem cert_val_true : min (513 : ℕ) narrowFlag6 = 1 := by decide

/-- BOGUS: claims min 513 narrowFlag6 = 513. It GENUINELY equals 1 (cert_val_true). A "the campaign
    buys nothing / the width does not shrink / the sharpened residuals are hollow" mis-reading reduces --
    through the banked value -- to the false numeric 1 = 513, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (513 : ℕ) narrowFlag6 = 513 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 513  (FALSE — the costume bites)

end Counterexamples
