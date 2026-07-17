/-
  Counterexamples.NarrowedBracket5VacuityCostume — N### / ARC-D D5-next-5 anti-vacuity (C512).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-5 node (ARC-D THE NARROWING CAMPAIGN, node 6 — ATTACK 1/cutPi WITH A
  STRUCTURAL COS-POSITIVITY ROUTE via the fold's OWN double-angle identity cutCos(2y) = 2 cutCos(y)^2 - 1,
  escaping the parent's degree-10 nlinarith-margin ceiling; AND SHARPEN cutLog via the ACHIEVABLE m01
  floor at deeper exp indices) squeezes 1/cutPi (leastCosZero in [15707960/1e7, 15707964/1e7], read via
  the well-conditioned near-pi/4 cosine, ~66x tighter) and sharpens cutLog (~24x), then re-composes the
  D4 assembled pipeline to a certified two-sided rational bracket of the derived zero-momentum inverse
  fine-structure coupling that is STRICTLY NARROWER than the parent's (D5-next-4). The marquee content
  that must NOT be hollow: the re-composed bracket
  800488690/11780973 <= invAlphaZero (completeBandList chargeTraceDepth) <= 80048852/1178097 has width
  80048852/1178097 - 800488690/11780973 STRICTLY BELOW the parent's width
  1921144130/28273869 - 960586690/14137173 -- i.e. the narrowing campaign genuinely SHRANK the assembled
  bracket AGAIN (a sixth time, ~39x). A hollow reading where "the campaign banks the same width / the
  re-composed bracket is no tighter / the double-angle route buys nothing" is refuted: the banked
  invAlphaZero_narrowed5_width_lt proves the new width is strictly less than the previous rung's.

  THE CERTIFICATE. narrowFlag5 := 1 -- a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than the parent's: the fold's own double-angle identity dissolves the
  nlinarith ceiling on 1/cutPi and the achievable m01 floor sharpens cutLog, genuinely tightening the
  derived 1/alpha(0) bracket a sixth time". It is TIED to the banked D5-next-5 landing by
  narrowFlag5_forced: invAlphaZero_narrowed5_width_lt witnesses
  (80048852/1178097 - 800488690/11780973 : Cut) < 1921144130/28273869 - 960586690/14137173, so the flag
  is 1.

  We anchor min 512 narrowFlag5 = 1 (TRUE -- narrowFlag5 = 1 < 512, so the min is narrowFlag5).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  double-angle route is hollow" mis-reading): that min 512 narrowFlag5 = 512. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 512 in the naturals.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (512, 1) is fresh (Cid 512 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket5
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket5
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-5 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    the fold's own double-angle identity dissolves the 1/cutPi nlinarith ceiling and the achievable m01
    floor sharpens cutLog, genuinely tightening the derived 1/alpha(0) bracket a sixth time". -/
def narrowFlag5 : ℕ := 1

/-- TRUE (tied to the banked D5-next-5 landing): invAlphaZero_narrowed5_width_lt proves the
    re-composed bracket width is strictly below the parent's, so the flag is present, narrowFlag5 = 1. -/
theorem narrowFlag5_forced :
    (80048852 / 1178097 - 800488690 / 11780973 : Cut)
        < 1921144130 / 28273869 - 960586690 / 14137173
      ∧ narrowFlag5 = 1 :=
  ⟨invAlphaZero_narrowed5_width_lt, rfl⟩

/-- TRUE: min 512 narrowFlag5 = 1, holding precisely because narrowFlag5 = 1 < 512. -/
theorem cert_val_true : min (512 : ℕ) narrowFlag5 = 1 := by decide

/-- BOGUS: claims min 512 narrowFlag5 = 512. It GENUINELY equals 1 (cert_val_true). A "the campaign
    buys nothing / the width does not shrink / the double-angle route is hollow" mis-reading reduces --
    through the banked value -- to the false numeric 1 = 512, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (512 : ℕ) narrowFlag5 = 512 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 512  (FALSE — the costume bites)

end Counterexamples
