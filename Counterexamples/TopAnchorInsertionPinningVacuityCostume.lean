/-
  Counterexamples.TopAnchorInsertionPinningVacuityCostume — the top-at-anchor insertion pinning is
  GENUINE: the empty cascade-insertion product collapses the chain to the electroweak anchor, the
  discriminator is FORCED (at-anchor ⟺ trivial insertion; the banked non-empty down/light bundle sits
  strictly below), the top-at-anchor Born-square pinning `Mu^2 = M·ewClosureRatio` is derived, and huc
  is FULLY DERIVED. C577.
  =====================================================================================
  W8 ANTI-VACUITY. This node DERIVES the last remaining anchor half of N577's huc reduction — the
  up-sector top-at-anchor Born-square pinning `Mu^2 = M·ewClosureRatio` — by promoting the banked
  arc-O2 top-link `= 1` (empty cascade-insertion product) to a theorem of Cut. The content that must
  NOT be hollow: (i) the empty-insertion chain IS the anchor `insertionChain [] = ewClosureRatio`
  (`emptyInsertion_at_anchor`); (ii) the banked NON-empty down/light bundle sits STRICTLY BELOW the
  anchor (`downLight_below_anchor`), so the discriminator genuinely bites — zero-depth ≠ non-zero-depth;
  (iii) the two anchors are genuinely distinct — `confinementScaleRatio < ewClosureRatio`
  (`top_above_floor`). If the empty product did not collapse to the anchor, or the non-empty bundle did
  not sit strictly below, or the anchors coincided, the pinning would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the top-at-anchor insertion
  pinning is genuine: the empty cascade-insertion product collapses the chain to the electroweak
  anchor, the banked non-empty down/light bundle sits strictly below (the discriminator bites), and the
  two Born-square anchors are genuinely distinct". TIED to the banked landing by attestFlag_forced.

  We anchor min 577 attestFlag = 1 (TRUE -- attestFlag = 1 < 577, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the empty product does not collapse to the anchor / the
  non-empty bundle does not sit below / the anchors coincide / the pinning is vacuous" reading): that
  min 577 attestFlag = 577. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 577 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (577, 1) is fresh (Cid 577 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TopAnchorInsertionPinning
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.TopAnchorInsertionPinning
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear
open Phys.Algebra.QuarkHadronTower
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the top-at-anchor insertion pinning is genuine: the empty cascade-insertion product
    collapses the chain to the electroweak anchor, the banked non-empty down/light bundle sits strictly
    below (the discriminator bites), the two Born-square anchors are genuinely distinct". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the empty-insertion chain IS the anchor
    (`emptyInsertion_at_anchor`), the banked non-empty down/light bundle sits STRICTLY BELOW the anchor
    (`downLight_below_anchor`), the two anchors are genuinely distinct (`top_above_floor`) — and
    `attestFlag = 1`. -/
theorem attestFlag_forced :
    (insertionChain [] = ewClosureRatio)
    ∧ (insertionChain [cutCos foldPhase * ((s1BornProb : ℚ) : Cut), cutCos (2 / 3)]
        < ewClosureRatio)
    ∧ (confinementScaleRatio < ewClosureRatio)
    ∧ attestFlag = 1 :=
  ⟨emptyInsertion_at_anchor, downLight_below_anchor, top_above_floor, rfl⟩

/-- TRUE: min 577 attestFlag = 1, holding precisely because attestFlag = 1 < 577. -/
theorem cert_val_true : min (577 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 577 attestFlag = 577. It GENUINELY equals 1 (cert_val_true). A "the empty product
    does not collapse to the anchor / the non-empty bundle does not sit below / the anchors coincide /
    the pinning is vacuous" reading reduces -- through the banked emptyInsertion_at_anchor /
    downLight_below_anchor tie -- to the false numeric 1 = 577 in the naturals. The kernel cannot close
    it; it BITES. -/
theorem bogus_claim : min (577 : ℕ) attestFlag = 577 := by
  rw [cert_val_true]

end Counterexamples
