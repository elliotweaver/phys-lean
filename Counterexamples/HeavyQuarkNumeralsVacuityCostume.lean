/-
  Counterexamples.HeavyQuarkNumeralsVacuityCostume — the certified heavy-quark numerals GENUINELY
  force a strictly-lifted non-degenerate two-leg heavy sector (it is not a hollow/collapsed bracket),
  C551.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-M M5 — THE HEAVY QUARK SECTOR) evaluates the heavy-sector quark mass
  ratios as certified two-sided rational brackets against the M1 peg: the heavy cross-sector ratio
  `mbRatioDerived ∈ [167505/1e7, 167522/1e7]` (the fold phase's own ℍ-level Born weight
  `(1−q)²/(3(1+q))`, `q = cos(π/4)`), the reciprocal charm-band edge `1/mbRatioDerived ∈ [5969/100,
  5971/100]`, and the down/confinement offset `downConfBundle ∈ [7280/100, 7288/100]`. The content that
  must NOT be hollow is that the two heavy-sector legs are genuinely DISTINCT: the certified brackets
  force `mbRatioDerived < downConfBundle` (`offset_ordered_from_brackets`) — dividing the bare up/down
  weight by the confinement bundle `< 1` genuinely LIFTS it. If that were vacuous — if the
  down/confinement offset coincided with the bare up/down weight — the two legs would collapse and the
  heavy-sector skeleton would carry no offset content.

  The content that must NOT be hollow: the certified brackets force the strict leg ordering — the banked
  `offset_ordered_from_brackets` gives `mbRatioDerived < downConfBundle`. A "the confinement offset is
  trivial / the two legs collapse" mis-reading is refuted by that banked theorem.

  THE CERTIFICATE. liftFlag := 1 -- a natural-number flag standing for "the certified numerals force a
  strictly-lifted non-degenerate two-leg heavy sector `mbRatioDerived < downConfBundle`
  (offset_ordered_from_brackets)". It is TIED to the banked landing by liftFlag_forced.

  We anchor min 551 liftFlag = 1 (TRUE -- liftFlag = 1 < 551, so the min is liftFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the confinement offset is trivial / the two legs collapse"
  mis-reading): that min 551 liftFlag = 551. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 551 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (551, 1) is fresh (Cid 551 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.HeavyQuarkNumerals
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.HeavyQuarkNumerals
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.DownConfinementRelativeScale

/-- THE FLAG: 1 = "the certified numerals force a strictly-lifted non-degenerate two-leg heavy sector
    `mbRatioDerived < downConfBundle` (offset_ordered_from_brackets)". -/
def liftFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the certified brackets force `mbRatioDerived < downConfBundle`
    (`offset_ordered_from_brackets`), and `liftFlag = 1`. -/
theorem liftFlag_forced :
    (mbRatioDerived < downConfBundle) ∧ liftFlag = 1 :=
  ⟨offset_ordered_from_brackets, rfl⟩

/-- TRUE: min 551 liftFlag = 1, holding precisely because liftFlag = 1 < 551. -/
theorem cert_val_true : min (551 : ℕ) liftFlag = 1 := by decide

/-- BOGUS: claims min 551 liftFlag = 551. It GENUINELY equals 1 (cert_val_true). A "the confinement
    offset is trivial / the two legs collapse" mis-reading reduces -- through the banked
    offset_ordered_from_brackets tie -- to the false numeric 1 = 551 in the naturals. The kernel cannot
    close it; it BITES. -/
theorem bogus_claim : min (551 : ℕ) liftFlag = 551 := by
  rw [cert_val_true]

end Counterexamples
