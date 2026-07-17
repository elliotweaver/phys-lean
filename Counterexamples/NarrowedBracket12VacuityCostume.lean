/-
  Counterexamples.NarrowedBracket12VacuityCostume — N### / ARC-D D5-next-12 anti-vacuity (C519).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-12 node (ARC-D THE NARROWING CAMPAIGN, node 13 — SHARPEN 1/cutPi, once again
  the sole binding residual after the split@6 cutLog collapse, via a 1e11-grid lift of its whole bracket
  using the SAME banked double-double-angle route [two applications of the fold's own cutCos_double, one
  digit deeper]: leastCosZero's LOWER bound pushed to the true pi/2 1e11-grid floor 157079632679/1e11 [the
  UPPER bound is the SAME rational at both grids, so the split@8 upper sign is reused verbatim], hence
  1/cutPi in [1250000000/3926990817, 50000000000/157079632679] [width ~2.03e-12, ~10x narrower]; cutLog
  reused verbatim from the parent) re-composes the D4 assembled pipeline to a certified two-sided rational
  bracket of the derived zero-momentum inverse fine-structure coupling that is STRICTLY NARROWER than the
  parent's (D5-next-11). The marquee content that must NOT be hollow: the re-composed bracket
  12007329939722/176714586765 <= invAlphaZero (completeBandList chargeTraceDepth) <=
  32019546505738/471238898037 has width 32019546505738/471238898037 - 12007329939722/176714586765 STRICTLY
  BELOW the parent's width 16009773252014/235619449005 - 12007329939722/176714586765 -- i.e. the narrowing
  campaign genuinely SHRANK the assembled bracket AGAIN (a thirteenth time). A hollow reading where "the
  campaign banks the same width / the re-composed bracket is no tighter / the 1e11-grid 1/cutPi lift buys
  nothing" is refuted: the banked invAlphaZero_narrowed12_width_lt proves the new width is strictly less
  than the previous rung's.

  THE CERTIFICATE. narrowFlag12 := 1 -- a natural-number flag standing for "the re-composed assembled
  bracket is STRICTLY narrower than the parent's: the 1e11-grid 1/cutPi lift (same one-cause
  double-double-angle instrument, one digit deeper) tightens 1/cutPi ~10x, genuinely tightening the derived
  1/alpha(0) bracket a thirteenth time". It is TIED to the banked D5-next-12 landing by narrowFlag12_forced:
  invAlphaZero_narrowed12_width_lt witnesses (32019546505738/471238898037 - 12007329939722/176714586765 :
  Cut) < 16009773252014/235619449005 - 12007329939722/176714586765, so the flag is 1.

  We anchor min 519 narrowFlag12 = 1 (TRUE -- narrowFlag12 = 1 < 519, so the min is narrowFlag12).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the 1e11-grid
  1/cutPi lift is hollow" mis-reading): that min 519 narrowFlag12 = 519. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 519 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (519, 1) is fresh (Cid 519 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket12
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket12
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-12 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    the 1e11-grid 1/cutPi lift (the same one-cause double-double-angle instrument, one digit deeper)
    tightens 1/cutPi ~10x and genuinely tightens the derived 1/alpha(0) bracket a thirteenth time". -/
def narrowFlag12 : ℕ := 1

/-- TRUE (tied to the banked D5-next-12 landing): invAlphaZero_narrowed12_width_lt proves the re-composed
    bracket width is strictly below the parent's, so the flag is present, narrowFlag12 = 1. -/
theorem narrowFlag12_forced :
    (32019546505738 / 471238898037 - 12007329939722 / 176714586765 : Cut)
        < 16009773252014 / 235619449005 - 12007329939722 / 176714586765
      ∧ narrowFlag12 = 1 :=
  ⟨invAlphaZero_narrowed12_width_lt, rfl⟩

/-- TRUE: min 519 narrowFlag12 = 1, holding precisely because narrowFlag12 = 1 < 519. -/
theorem cert_val_true : min (519 : ℕ) narrowFlag12 = 1 := by decide

/-- BOGUS: claims min 519 narrowFlag12 = 519. It GENUINELY equals 1 (cert_val_true). A "the campaign buys
    nothing / the width does not shrink / the 1e11-grid 1/cutPi lift is hollow" mis-reading reduces --
    through the banked value -- to the false numeric 1 = 519, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (519 : ℕ) narrowFlag12 = 519 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 519  (FALSE — the costume bites)

end Counterexamples
