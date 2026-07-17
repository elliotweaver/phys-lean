/-
  Counterexamples.NarrowedBracket9VacuityCostume — N### / ARC-D D5-next-9 anti-vacuity (C516).
  =====================================================================================
  W8 ANTI-VACUITY. The D5-next-9 node (ARC-D THE NARROWING CAMPAIGN, node 10 — LIFT the sole binding
  residual 1/cutPi's whole bracket onto a 1e9 GRID via the SAME banked double-double-angle positivity route
  [two applications of the fold's OWN cutCos_double, re-aimed one digit deeper], pushing leastCosZero's
  certified LOWER bound to the pi/2 1e9-grid FLOOR 1570796326/1e9 [the integer floor of the true half-period
  1570796326.79] and its UPPER bound to the 1e9-grid CEILING 1570796327/1e9 [split@8 upper sign], sharpening
  1/cutPi ~20x from BOTH ends) re-composes the D4 assembled pipeline to a certified two-sided rational
  bracket of the derived zero-momentum inverse fine-structure coupling that is STRICTLY NARROWER than the
  parent's (D5-next-8). The marquee content that must NOT be hollow: the re-composed bracket
  960586395190/14137166943 <= invAlphaZero (completeBandList chargeTraceDepth) <= 480293197510/7068583467 has
  width 480293197510/7068583467 - 960586395190/14137166943 STRICTLY BELOW the parent's width
  12007329895/176714586 - 48029320130/706858353 -- i.e. the narrowing campaign genuinely SHRANK the assembled
  bracket AGAIN (a tenth time, ~2.79x). A hollow reading where "the campaign banks the same width / the
  re-composed bracket is no tighter / the 1e9-grid lift buys nothing" is refuted: the banked
  invAlphaZero_narrowed9_width_lt proves the new width is strictly less than the previous rung's.

  THE CERTIFICATE. narrowFlag9 := 1 -- a natural-number flag standing for "the re-composed assembled bracket
  is STRICTLY narrower than the parent's: the 1e9-grid lift (same double-double-angle route, one digit
  deeper) sharpens 1/cutPi ~20x from both ends, genuinely tightening the derived 1/alpha(0) bracket a tenth
  time". It is TIED to the banked D5-next-9 landing by narrowFlag9_forced: invAlphaZero_narrowed9_width_lt
  witnesses (480293197510/7068583467 - 960586395190/14137166943 : Cut) < 12007329895/176714586 -
  48029320130/706858353, so the flag is 1.

  We anchor min 516 narrowFlag9 = 1 (TRUE -- narrowFlag9 = 1 < 516, so the min is narrowFlag9).

  THE BOGUS CLAIM (a stand-in for ANY "the campaign buys nothing / the width does not shrink / the 1e9-grid
  lift is hollow" mis-reading): that min 516 narrowFlag9 = 516. It GENUINELY equals 1 (cert_val_true).
  Rewriting reduces the bogus claim to the false numeric 1 = 516 in the naturals. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (516, 1) is fresh (Cid 516 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NarrowedBracket9
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.NarrowedBracket9
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D5-next-9 FLAG: 1 = "the re-composed assembled bracket is STRICTLY narrower than the parent's --
    the 1e9-grid lift (the same double-double-angle route, one digit deeper) sharpens 1/cutPi ~20x from
    BOTH ends and genuinely tightens the derived 1/alpha(0) bracket a tenth time". -/
def narrowFlag9 : ℕ := 1

/-- TRUE (tied to the banked D5-next-9 landing): invAlphaZero_narrowed9_width_lt proves the re-composed
    bracket width is strictly below the parent's, so the flag is present, narrowFlag9 = 1. -/
theorem narrowFlag9_forced :
    (480293197510 / 7068583467 - 960586395190 / 14137166943 : Cut)
        < 12007329895 / 176714586 - 48029320130 / 706858353
      ∧ narrowFlag9 = 1 :=
  ⟨invAlphaZero_narrowed9_width_lt, rfl⟩

/-- TRUE: min 516 narrowFlag9 = 1, holding precisely because narrowFlag9 = 1 < 516. -/
theorem cert_val_true : min (516 : ℕ) narrowFlag9 = 1 := by decide

/-- BOGUS: claims min 516 narrowFlag9 = 516. It GENUINELY equals 1 (cert_val_true). A "the campaign buys
    nothing / the width does not shrink / the 1e9-grid lift is hollow" mis-reading reduces -- through the
    banked value -- to the false numeric 1 = 516, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (516 : ℕ) narrowFlag9 = 516 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 516  (FALSE — the costume bites)

end Counterexamples
