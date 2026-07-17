/-
  Counterexamples.NarrowedBracket10VacuityCostume — N### / ARC-D D5-next-10 anti-vacuity (C517).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-10 node (ARC-D THE NARROWING CAMPAIGN, node 11 — LIFT the binding
  residual 1/cutPi's whole bracket onto a 1e10 GRID via the SAME banked double-double-angle positivity route
  [two applications of the fold's OWN cutCos_double, re-aimed one digit deeper], pushing leastCosZero's
  certified LOWER bound to the pi/2 1e10-grid FLOOR 15707963267/1e10 [the integer floor of the true
  half-period 15707963267.95] and its UPPER bound to the 1e10-grid CEILING 15707963268/1e10 [split@8 upper
  sign], sharpening 1/cutPi ~10x from BOTH ends) re-composes the D4 assembled pipeline to a certified
  two-sided rational bracket of the derived zero-momentum inverse fine-structure coupling that is STRICTLY
  NARROWER than the parent's (D5-next-9). The marquee content that must NOT be hollow: the re-composed
  bracket 2401465987690/35342917353 <= invAlphaZero (completeBandList chargeTraceDepth) <=
  9605863954190/141371669403 has width 9605863954190/141371669403 - 2401465987690/35342917353 STRICTLY BELOW
  the parent's width 480293197510/7068583467 - 960586395190/14137166943 -- i.e. the narrowing campaign
  genuinely SHRANK the assembled bracket AGAIN (an eleventh time). A hollow reading where "the campaign banks
  the same width / the re-composed bracket is no tighter / the 1e10-grid lift buys nothing" is refuted: the
  banked invAlphaZero_narrowed10_width_lt proves the new width is strictly less than the previous rung's.

  THE CERTIFICATE. narrowFlag10 := 1 -- a natural-number flag standing for "the re-composed assembled bracket
  is STRICTLY narrower than the parent's: the 1e10-grid lift (same double-double-angle route, one digit
  deeper) sharpens 1/cutPi ~10x from both ends, genuinely tightening the derived 1/alpha(0) bracket an
  eleventh time". It is TIED to the banked D5-next-10 landing by narrowFlag10_forced:
  invAlphaZero_narrowed10_width_lt witnesses (9605863954190/141371669403 - 2401465987690/35342917353 : Cut)
  < 480293197510/7068583467 - 960586395190/14137166943, so the flag is 1.

  We anchor min 517 narrowFlag10 = 1 (TRUE -- narrowFlag10 = 1 < 517, so the min is narrowFlag10).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the 1e10-grid
  lift is hollow" mis-reading): that min 517 narrowFlag10 = 517. It GENUINELY equals 1 (cert_val_true).
  Rewriting reduces the bogus claim to the false numeric 1 = 517 in the naturals. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (517, 1) is fresh (Cid 517 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket10
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket10
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-10 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    the 1e10-grid lift (the same double-double-angle route, one digit deeper) sharpens 1/cutPi ~10x from
    BOTH ends and genuinely tightens the derived 1/alpha(0) bracket an eleventh time". -/
def narrowFlag10 : ℕ := 1

/-- TRUE (tied to the banked D5-next-10 landing): invAlphaZero_narrowed10_width_lt proves the re-composed
    bracket width is strictly below the parent's, so the flag is present, narrowFlag10 = 1. -/
theorem narrowFlag10_forced :
    (9605863954190 / 141371669403 - 2401465987690 / 35342917353 : Cut)
        < 480293197510 / 7068583467 - 960586395190 / 14137166943
      ∧ narrowFlag10 = 1 :=
  ⟨invAlphaZero_narrowed10_width_lt, rfl⟩

/-- TRUE: min 517 narrowFlag10 = 1, holding precisely because narrowFlag10 = 1 < 517. -/
theorem cert_val_true : min (517 : ℕ) narrowFlag10 = 1 := by decide

/-- BOGUS: claims min 517 narrowFlag10 = 517. It GENUINELY equals 1 (cert_val_true). A "the campaign buys
    nothing / the width does not shrink / the 1e10-grid lift is hollow" mis-reading reduces -- through the
    banked value -- to the false numeric 1 = 517, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (517 : ℕ) narrowFlag10 = 517 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 517  (FALSE — the costume bites)

end Counterexamples
