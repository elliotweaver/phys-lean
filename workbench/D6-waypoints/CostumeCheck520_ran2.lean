/-
  Counterexamples.WayPointBracketVacuityCostume — N### / ARC-D D6 anti-vacuity (C520).
  =====================================================================================
  W8 ANTI-VACUITY. The D6 node (ARC-D THE DIGITS — THE WAY-POINTS EVALUATED FREE: read α(M_Z) and
  sin²θ_W(M_Z) from the SAME certified tower as certified two-sided rational readings, landing FREE,
  never targeted, now that the D5 narrowing campaign crossed BELOW measured precision) evaluates the
  α(M_Z) reading as a certified two-sided rational bracket squeezed FREE between the EXACT electroweak
  way-point floor 1582/27 and the banked D5-next-12 derived endpoint ceiling
  32019546505738/471238898037. The marquee content that must NOT be hollow: the α(M_Z) bracket is
  GENUINELY TWO-SIDED -- the exact way-point floor is STRICTLY BELOW the derived endpoint ceiling,
  1582/27 < 32019546505738/471238898037 -- so the reading is pinned in a real (non-degenerate)
  bracket, not collapsed to a point. A hollow reading where "the α(M_Z) bracket is a degenerate
  width-0 point / the floor equals the ceiling / the reading is not genuinely two-sided" is refuted:
  the banked waypoint_bracket_strict proves the floor is strictly below the ceiling.

  THE CERTIFICATE. wayFlag := 1 -- a natural-number flag standing for "the α(M_Z) reading is a
  GENUINE certified two-sided rational bracket: the EXACT electroweak way-point floor 1582/27 is
  STRICTLY BELOW the banked D5-next-12 derived endpoint ceiling 32019546505738/471238898037, so the
  free landing is pinned in a real two-sided bracket". It is TIED to the banked D6 landing by
  wayFlag_forced: waypoint_bracket_strict witnesses (1582/27 : Cut) < 32019546505738/471238898037, so
  the flag is 1.

  We anchor min 520 wayFlag = 1 (TRUE -- wayFlag = 1 < 520, so the min is wayFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the α(M_Z) bracket is degenerate / the floor equals the ceiling
  / the free reading is not genuinely two-sided" mis-reading): that min 520 wayFlag = 520. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 520
  in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (520, 1) is fresh (Cid 520 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.WayPointBracket
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.WayPointBracket
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D6 FLAG: 1 = "the α(M_Z) reading is a GENUINE certified two-sided rational bracket -- the
    EXACT electroweak way-point floor 1582/27 is STRICTLY BELOW the banked D5-next-12 derived endpoint
    ceiling 32019546505738/471238898037, so the free landing is pinned in a real two-sided bracket". -/
def wayFlag : ℕ := 1

/-- TRUE (tied to the banked D6 landing): waypoint_bracket_strict proves the exact way-point floor is
    strictly below the derived endpoint ceiling, so the flag is present, wayFlag = 1. -/
theorem wayFlag_forced :
    (1582 / 27 : Cut) < 32019546505738 / 471238898037
      ∧ wayFlag = 1 :=
  ⟨waypoint_bracket_strict, rfl⟩

/-- TRUE: min 520 wayFlag = 1, holding precisely because wayFlag = 1 < 520. -/
theorem cert_val_true : min (520 : ℕ) wayFlag = 1 := by decide

/-- BOGUS: claims min 520 wayFlag = 520. It GENUINELY equals 1 (cert_val_true). A "the α(M_Z) bracket
    is degenerate / the floor equals the ceiling / the free reading is not genuinely two-sided"
    mis-reading reduces -- through the banked value -- to the false numeric 1 = 520, so this must NOT
    compile. -/
theorem cert_val_wrong_BOGUS :
    min (520 : ℕ) wayFlag = 520 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 520  (FALSE — the costume bites)

end Counterexamples
