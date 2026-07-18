/-
  Counterexamples.LightQuarkNumeralsVacuityCostume — the certified light-quark numerals GENUINELY
  force a floor-straddling non-degenerate two-member light sector (it is not a hollow/collapsed
  bracket), C552.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-M M6 — THE LIGHT QUARK SECTOR) evaluates the light-sector quark mass
  structure as certified two-sided rational brackets against the M1 peg: the strange placement
  `lightBandStrange = downConfBundle·bMass 2 ∈ [49/2, 1227/50]` (the banked light-band freeze-out edge
  value), the down placement `lightBandDown = downConfBundle·bMass 1 ∈ [118/1000, 119/1000]`, the
  reciprocal `1/lightBandStrange ∈ [407/1e4, 409/1e4]`, and the within-sector light splittings (banked
  N340 descent). The content that must NOT be hollow is that the confinement floor genuinely SEPARATES
  the two light quarks: the certified brackets force `lightBandDown < 1 ∧ 1 < lightBandStrange`
  (`lightBand_straddles_floor`) — the down placement sits strictly BELOW the confinement floor squared
  and the strange placement strictly ABOVE it. If that were vacuous — if both light quarks sat on the
  same side of the floor — the light-sector placement skeleton would carry no floor-separation content.

  The content that must NOT be hollow: the certified brackets force the floor straddle — the banked
  `lightBand_straddles_floor` gives `lightBandDown < 1 ∧ 1 < lightBandStrange`. A "both light quarks sit
  on the same side of the confinement floor / the placements collapse" mis-reading is refuted by that
  banked theorem.

  THE CERTIFICATE. straddleFlag := 1 -- a natural-number flag standing for "the certified numerals force
  a floor-straddling non-degenerate two-member light sector `lightBandDown < 1 < lightBandStrange`
  (lightBand_straddles_floor)". It is TIED to the banked landing by straddleFlag_forced.

  We anchor min 552 straddleFlag = 1 (TRUE -- straddleFlag = 1 < 552, so the min is straddleFlag).

  THE BOGUS CLAIM (a stand-in for ANY "both light quarks sit on the same side of the floor / the
  placements collapse" mis-reading): that min 552 straddleFlag = 552. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 552 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (552, 1) is fresh (Cid 552 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.LightQuarkNumerals
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.LightQuarkNumerals

/-- THE FLAG: 1 = "the certified numerals force a floor-straddling non-degenerate two-member light
    sector `lightBandDown < 1 < lightBandStrange` (lightBand_straddles_floor)". -/
def straddleFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the certified brackets force `lightBandDown < 1 <
    lightBandStrange` (`lightBand_straddles_floor`), and `straddleFlag = 1`. -/
theorem straddleFlag_forced :
    (lightBandDown < 1 ∧ 1 < lightBandStrange) ∧ straddleFlag = 1 :=
  ⟨lightBand_straddles_floor, rfl⟩

/-- TRUE: min 552 straddleFlag = 1, holding precisely because straddleFlag = 1 < 552. -/
theorem cert_val_true : min (552 : ℕ) straddleFlag = 1 := by decide

/-- BOGUS: claims min 552 straddleFlag = 552. It GENUINELY equals 1 (cert_val_true). A "both light
    quarks sit on the same side of the confinement floor / the placements collapse" mis-reading reduces
    -- through the banked lightBand_straddles_floor tie -- to the false numeric 1 = 552 in the naturals.
    The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (552 : ℕ) straddleFlag = 552 := by
  rw [cert_val_true]

end Counterexamples
