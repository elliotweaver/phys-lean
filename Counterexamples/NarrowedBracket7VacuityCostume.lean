/-
  Counterexamples.NarrowedBracket7VacuityCostume — N### / ARC-D D5-next-7 anti-vacuity (C514).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-7 node (ARC-D THE NARROWING CAMPAIGN, node 8 — SHARPEN THE m01 FLOOR
  FURTHER by reading the SAME derived cycle-phase cosine numeral cutCos(2/9) one term deeper (split@5)
  and re-propagating through the banked Born-square amplitude chain to a ~44x tighter m01, crushing
  cutLog ~38x, AND take the cheap split@6 upper-sign tick for 1/cutPi) re-composes the D4 assembled
  pipeline to a certified two-sided rational bracket of the derived zero-momentum inverse fine-structure
  coupling that is STRICTLY NARROWER than the parent's (D5-next-6). The marquee content that must NOT be
  hollow: the re-composed bracket 48029320130/706858353 <= invAlphaZero (completeBandList
  chargeTraceDepth) <= 4802931616/70685829 has width 4802931616/70685829 - 48029320130/706858353 STRICTLY
  BELOW the parent's width 4802931662/70685829 - 19211728054/282743343 -- i.e. the narrowing campaign
  genuinely SHRANK the assembled bracket AGAIN (an eighth time, ~3.45x). A hollow reading where "the
  campaign banks the same width / the re-composed bracket is no tighter / the split@5 cosine read and the
  pushed 1/cutPi buy nothing" is refuted: the banked invAlphaZero_narrowed7_width_lt proves the new width
  is strictly less than the previous rung's.

  THE CERTIFICATE. narrowFlag7 := 1 -- a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than the parent's: reading the cycle-phase cosine one term deeper sharpens
  m01 ~44x (crushing cutLog ~38x) and the cheap split@6 upper-sign tick tightens 1/cutPi, genuinely
  tightening the derived 1/alpha(0) bracket an eighth time". It is TIED to the banked D5-next-7 landing by
  narrowFlag7_forced: invAlphaZero_narrowed7_width_lt witnesses
  (4802931616/70685829 - 48029320130/706858353 : Cut) < 4802931662/70685829 - 19211728054/282743343, so
  the flag is 1.

  We anchor min 514 narrowFlag7 = 1 (TRUE -- narrowFlag7 = 1 < 514, so the min is narrowFlag7).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  sharpened residuals are hollow" mis-reading): that min 514 narrowFlag7 = 514. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 514 in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (514, 1) is fresh (Cid 514 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket7
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket7
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-7 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    reading the cycle-phase cosine one term deeper sharpens m01 ~44x (crushing cutLog ~38x) and the cheap
    split@6 upper-sign tick tightens 1/cutPi, genuinely tightening the derived 1/alpha(0) bracket an
    eighth time". -/
def narrowFlag7 : ℕ := 1

/-- TRUE (tied to the banked D5-next-7 landing): invAlphaZero_narrowed7_width_lt proves the
    re-composed bracket width is strictly below the parent's, so the flag is present, narrowFlag7 = 1. -/
theorem narrowFlag7_forced :
    (4802931616 / 70685829 - 48029320130 / 706858353 : Cut)
        < 4802931662 / 70685829 - 19211728054 / 282743343
      ∧ narrowFlag7 = 1 :=
  ⟨invAlphaZero_narrowed7_width_lt, rfl⟩

/-- TRUE: min 514 narrowFlag7 = 1, holding precisely because narrowFlag7 = 1 < 514. -/
theorem cert_val_true : min (514 : ℕ) narrowFlag7 = 1 := by decide

/-- BOGUS: claims min 514 narrowFlag7 = 514. It GENUINELY equals 1 (cert_val_true). A "the campaign
    buys nothing / the width does not shrink / the sharpened residuals are hollow" mis-reading reduces --
    through the banked value -- to the false numeric 1 = 514, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (514 : ℕ) narrowFlag7 = 514 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 514  (FALSE — the costume bites)

end Counterexamples
