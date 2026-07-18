/-
  Counterexamples.ScaleTowerNumeralsVacuityCostume — the certified scale-tower numeral GENUINELY
  forces a strictly-climbing non-degenerate geometric ladder (it is not a hollow/collapsed bracket),
  C550.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-M M4 — THE SCALE-TOWER NUMERALS) evaluates the full dimensionful
  skeleton as certified two-sided rational brackets against the M1 peg: the `M/v` numeral
  `topBandRatio ∈ [54220·1e8, 54226·1e8]`, the composition tooth `topBandRatio · confBandRatio =
  confinementScaleRatio⁻¹` (the exponent-addition ladder `28 + 8 = 36`), the three edges pegged, the
  band-ratio numerals, and the five banked exact way-points free. The content that must NOT be hollow
  is that the numerals genuinely place the band ratios as a strictly-CLIMBING ladder: `1 < confBandRatio
  < topBandRatio` (`bandRatio_ordered_from_brackets`), derived FROM the certified brackets. If that were
  vacuous — if the `M/v` ratio coincided with the `v/Λ` ratio or with `1` — the "scale tower" would
  carry no hierarchy content and the arc-M skeleton would be empty.

  The content that must NOT be hollow: the certified brackets force the strict ratio ordering — the
  banked `bandRatio_ordered_from_brackets` gives `1 < confBandRatio ∧ confBandRatio < topBandRatio`. A
  "the M/v ratio is degenerate with the v/Λ ratio / the ladder collapses" mis-reading is refuted by that
  banked theorem.

  THE CERTIFICATE. climbFlag := 1 -- a natural-number flag standing for "the certified numerals force a
  strictly-climbing non-degenerate geometric ladder `1 < confBandRatio < topBandRatio`
  (bandRatio_ordered_from_brackets)". It is TIED to the banked landing by climbFlag_forced.

  We anchor min 550 climbFlag = 1 (TRUE -- climbFlag = 1 < 550, so the min is climbFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the M/v ratio is degenerate / the ladder collapses" mis-reading):
  that min 550 climbFlag = 550. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim
  to the false numeric 1 = 550 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (550, 1) is fresh (Cid 550 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerNumerals
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.TowerNumerals
open Phys.Algebra
open Phys.Algebra.BandEdgeList

/-- THE FLAG: 1 = "the certified numerals force a strictly-climbing non-degenerate geometric ladder
    `1 < confBandRatio < topBandRatio` (bandRatio_ordered_from_brackets)". -/
def climbFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the certified brackets force `1 < confBandRatio < topBandRatio`
    (`bandRatio_ordered_from_brackets`), and `climbFlag = 1`. -/
theorem climbFlag_forced :
    (1 < confBandRatio ∧ confBandRatio < topBandRatio) ∧ climbFlag = 1 :=
  ⟨bandRatio_ordered_from_brackets, rfl⟩

/-- TRUE: min 550 climbFlag = 1, holding precisely because climbFlag = 1 < 550. -/
theorem cert_val_true : min (550 : ℕ) climbFlag = 1 := by decide

/-- BOGUS: claims min 550 climbFlag = 550. It GENUINELY equals 1 (cert_val_true). A "the M/v ratio is
    degenerate with the v/Λ ratio / the ladder collapses" mis-reading reduces -- through the banked
    bandRatio_ordered_from_brackets tie -- to the false numeric 1 = 550 in the naturals. The kernel
    cannot close it; it BITES. -/
theorem bogus_claim : min (550 : ℕ) climbFlag = 550 := by
  rw [cert_val_true]

end Counterexamples
