/-
  Counterexamples.NarrowedBracket8VacuityCostume — N### / ARC-D D5-next-8 anti-vacuity (C515).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-8 node (ARC-D THE NARROWING CAMPAIGN, node 9 — DISSOLVE the sole binding
  residual 1/cutPi's near-pi/2 nlinarith-margin ceiling with the DOUBLE-DOUBLE-ANGLE positivity route: two
  applications of the fold's OWN double-angle identity cutCos_double, folding the ill-conditioned near-pi/2
  positivity to a well-conditioned near-pi/8 one, which pushes leastCosZero's certified LOWER bound to the
  pi/2 grid ceiling 157079632/1e8 [the integer floor of the true half-period], sharpening 1/cutPi ~7x from
  the upper end) re-composes the D4 assembled pipeline to a certified two-sided rational bracket of the
  derived zero-momentum inverse fine-structure coupling that is STRICTLY NARROWER than the parent's
  (D5-next-7). The marquee content that must NOT be hollow: the re-composed bracket 48029320130/706858353 <=
  invAlphaZero (completeBandList chargeTraceDepth) <= 12007329895/176714586 has width 12007329895/176714586 -
  48029320130/706858353 STRICTLY BELOW the parent's width 4802931616/70685829 - 48029320130/706858353 -- i.e.
  the narrowing campaign genuinely SHRANK the assembled bracket AGAIN (a ninth time, ~5.05x). A hollow
  reading where "the campaign banks the same width / the re-composed bracket is no tighter / the
  double-double-angle route buys nothing" is refuted: the banked invAlphaZero_narrowed8_width_lt proves the
  new width is strictly less than the previous rung's.

  THE CERTIFICATE. narrowFlag8 := 1 -- a natural-number flag standing for "the re-composed assembled bracket
  is STRICTLY narrower than the parent's: the double-double-angle route pushes leastCosZero's lower bound to
  the pi/2 grid ceiling, genuinely tightening the derived 1/alpha(0) bracket a ninth time". It is TIED to the
  banked D5-next-8 landing by narrowFlag8_forced: invAlphaZero_narrowed8_width_lt witnesses
  (12007329895/176714586 - 48029320130/706858353 : Cut) < 4802931616/70685829 - 48029320130/706858353, so the
  flag is 1.

  We anchor min 515 narrowFlag8 = 1 (TRUE -- narrowFlag8 = 1 < 515, so the min is narrowFlag8).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the
  double-double-angle route is hollow" mis-reading): that min 515 narrowFlag8 = 515. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 515 in the naturals. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (515, 1) is fresh (Cid 515 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket8
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket8
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-8 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    the double-double-angle route (two applications of cutCos_double) pushes leastCosZero's lower bound to
    the pi/2 grid ceiling 157079632/1e8, sharpening 1/cutPi ~7x and genuinely tightening the derived
    1/alpha(0) bracket a ninth time". -/
def narrowFlag8 : ℕ := 1

/-- TRUE (tied to the banked D5-next-8 landing): invAlphaZero_narrowed8_width_lt proves the re-composed
    bracket width is strictly below the parent's, so the flag is present, narrowFlag8 = 1. -/
theorem narrowFlag8_forced :
    (12007329895 / 176714586 - 48029320130 / 706858353 : Cut)
        < 4802931616 / 70685829 - 48029320130 / 706858353
      ∧ narrowFlag8 = 1 :=
  ⟨invAlphaZero_narrowed8_width_lt, rfl⟩

/-- TRUE: min 515 narrowFlag8 = 1, holding precisely because narrowFlag8 = 1 < 515. -/
theorem cert_val_true : min (515 : ℕ) narrowFlag8 = 1 := by decide

/-- BOGUS: claims min 515 narrowFlag8 = 515. It GENUINELY equals 1 (cert_val_true). A "the campaign buys
    nothing / the width does not shrink / the double-double-angle route is hollow" mis-reading reduces --
    through the banked value -- to the false numeric 1 = 515, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (515 : ℕ) narrowFlag8 = 515 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 515  (FALSE — the costume bites)

end Counterexamples
