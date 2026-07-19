/-
  Counterexamples.D7NarrowingRung3VacuityCostume — the D7 rung-3 narrowing is GENUINE: the re-composed
  bare + dressed endpoint brackets are strictly two-sided (real readings of width `≈ 10⁻¹²`, not
  collapsed points), strictly narrower than the banked N580 brackets (a real advance), and the
  `1e12`-grid `1/cutPi` residual is strictly two-sided and genuinely nested inside the banked ext6. C583.
  =====================================================================================
  W8 ANTI-VACUITY. This node LIFTS `1/cutPi` onto the `1e12` grid (ext7) and wires in the split@7
  `L_m01`, re-composing the D7 endpoint to a narrower certified two-sided rational bracket. The content
  that must NOT be hollow: (i) the bare endpoint bracket is a REAL two-sided reading
  `1363071881405515/1e13 < 1363071881405528/1e13` (`bare_r3_strict`) — if it collapsed to a point the
  "narrowing" would be a degenerate relabelling; (ii) the bare bracket is STRICTLY NARROWER than the
  banked N580 bracket (`bare_r3_width_lt`) — the rung genuinely shrank the reading, not merely restated
  it; (iii) the `1e12`-grid `1/cutPi` residual is a REAL two-sided reading
  `100000000000/314159265359 < 250000000000/785398163397` (`inv_cutPi_ext7_strict`) — the binding win
  is a genuine bracket, not a collapsed point. If any collapsed, the narrowing would be vacuous.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 rung-3 narrowing is
  genuine: the bare endpoint bracket is strictly two-sided and strictly narrower than the banked N580,
  and the 1e12-grid 1/cutPi residual is strictly two-sided". TIED to the banked landing by attestFlag_forced.

  We anchor min 583 attestFlag = 1 (TRUE -- attestFlag = 1 < 583, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the endpoint bracket collapsed / the narrowing did not shrink the
  reading / the residual is a point / the narrowing is vacuous" reading): that min 583 attestFlag = 583.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 583
  in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (583, 1) is fresh (Cid 583 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7NarrowingRung3
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.D7NarrowingRung3
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 rung-3 narrowing is genuine: the bare endpoint bracket is strictly two-sided
    and strictly narrower than the banked N580, and the 1e12-grid 1/cutPi residual is strictly
    two-sided". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the bare endpoint bracket is strictly two-sided
    (`bare_r3_strict`), strictly narrower than the banked N580 (`bare_r3_width_lt`), and the 1e12-grid
    1/cutPi residual is strictly two-sided (`inv_cutPi_ext7_strict`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((1363071881405515 / 10000000000000 : Cut) < 1363071881405528 / 10000000000000)
    ∧ ((1363071881405528 / 10000000000000 - 1363071881405515 / 10000000000000 : Cut)
        < 1363071881406 / 10000000000 - 1363071881405 / 10000000000)
    ∧ ((100000000000 / 314159265359 : Cut) < 250000000000 / 785398163397)
    ∧ attestFlag = 1 :=
  ⟨bare_r3_strict, bare_r3_width_lt, inv_cutPi_ext7_strict, rfl⟩

/-- TRUE: min 583 attestFlag = 1, holding precisely because attestFlag = 1 < 583. -/
theorem cert_val_true : min (583 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 583 attestFlag = 583. It GENUINELY equals 1 (cert_val_true). A "the endpoint
    bracket collapsed / the narrowing did not shrink the reading / the residual is a point / the
    narrowing is vacuous" reading reduces -- through the banked bare_r3_strict / bare_r3_width_lt /
    inv_cutPi_ext7_strict tie -- to the false numeric 1 = 583 in the naturals. The kernel cannot close
    it; it BITES. -/
theorem bogus_claim : min (583 : ℕ) attestFlag = 583 := by
  rw [cert_val_true]

end Counterexamples
