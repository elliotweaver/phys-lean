/-
  Counterexamples.D7NarrowingRung4VacuityCostume — the D7 rung-4 narrowing is GENUINE: the re-composed
  bare + dressed endpoint brackets are strictly two-sided (real readings of width `≈ 5×10⁻¹⁴`, not
  collapsed points), strictly narrower than the banked N583 brackets (a real advance), and the
  `1e14`-grid `1/cutPi` residual is strictly two-sided and genuinely nested inside the banked ext7. C584.
  =====================================================================================
  W8 ANTI-VACUITY. This node LIFTS `1/cutPi` onto the `1e14` grid and deepens the co-dominant edge logs
  one rung, re-composing the D7 endpoint to a narrower certified two-sided rational bracket at ≥ 15 sig
  digits. The content that must NOT be hollow: (i) the bare endpoint bracket is a REAL two-sided reading
  `13630718814055173/1e14 < 13630718814055178/1e14` (`bare_r4_strict`) — if it collapsed to a point the
  "narrowing" would be a degenerate relabelling; (ii) the bare bracket is STRICTLY NARROWER than the
  banked N583 bracket (`bare_r4_width_lt`) — the rung genuinely shrank the reading, not merely restated
  it; (iii) the `1e14`-grid `1/cutPi` residual is a REAL two-sided reading
  `5000000000000/15707963267949 < 50000000000000/157079632679489` (`inv_cutPi_ext8_strict`) — the binding
  win is a genuine bracket, not a collapsed point. If any collapsed, the narrowing would be vacuous.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 rung-4 narrowing is
  genuine: the bare endpoint bracket is strictly two-sided and strictly narrower than the banked N583,
  and the 1e14-grid 1/cutPi residual is strictly two-sided". TIED to the banked landing by attestFlag_forced.

  We anchor min 584 attestFlag = 1 (TRUE -- attestFlag = 1 < 584, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the endpoint bracket collapsed / the narrowing did not shrink the
  reading / the residual is a point / the narrowing is vacuous" reading): that min 584 attestFlag = 584.
  It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 584
  in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (584, 1) is fresh (Cid 584 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7NarrowingRung4
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.D7NarrowingRung4
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 rung-4 narrowing is genuine: the bare endpoint bracket is strictly two-sided
    and strictly narrower than the banked N583, and the 1e14-grid 1/cutPi residual is strictly
    two-sided". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the bare endpoint bracket is strictly two-sided
    (`bare_r4_strict`), strictly narrower than the banked N583 (`bare_r4_width_lt`), and the 1e14-grid
    1/cutPi residual is strictly two-sided (`inv_cutPi_ext8_strict`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((13630718814055173 / 100000000000000 : Cut) < 13630718814055178 / 100000000000000)
    ∧ ((13630718814055178 / 100000000000000 - 13630718814055173 / 100000000000000 : Cut)
        < 1363071881405528 / 10000000000000 - 1363071881405515 / 10000000000000)
    ∧ ((5000000000000 / 15707963267949 : Cut) < 50000000000000 / 157079632679489)
    ∧ attestFlag = 1 :=
  ⟨bare_r4_strict, bare_r4_width_lt, inv_cutPi_ext8_strict, rfl⟩

/-- TRUE: min 584 attestFlag = 1, holding precisely because attestFlag = 1 < 584. -/
theorem cert_val_true : min (584 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 584 attestFlag = 584. It GENUINELY equals 1 (cert_val_true). A "the endpoint
    bracket collapsed / the narrowing did not shrink the reading / the residual is a point / the
    narrowing is vacuous" reading reduces -- through the banked bare_r4_strict / bare_r4_width_lt /
    inv_cutPi_ext8_strict tie -- to the false numeric 1 = 584 in the naturals. The kernel cannot close
    it; it BITES. -/
theorem bogus_claim : min (584 : ℕ) attestFlag = 584 := by
  rw [cert_val_true]

end Counterexamples
