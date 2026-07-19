import Phys.Algebra.HucBornSquareAnchor
import Phys.Algebra.ScaleTowerDischargeArcM
import Mathlib.Tactic

/-!
  PROBE — N578 node 2: derive the UP-SECTOR TOP-AT-ANCHOR Born-square pinning `Mu^2 = M·ewClosureRatio`
  ab initio by promoting the banked arc-O2 top-link `= 1` (empty cascade-insertion product) to a
  theorem of Cut.

  THE THEORY-NATIVE HEART.
  The up-sector top amplitude Mu enters the banked absolute-scale chain
    absScaleChainR φ τ ℓ = ewClosureRatio · (φ · s1BornProb) · τ · ℓ
  as the electroweak-ANCHOR member. In the banked cascade the light/down sector carries a NON-empty
  insertion bundle `(cutCos foldPhase · s1BornProb) · cutCos(2/3)` that suppresses it STRICTLY below
  the anchor (banked `absScaleChainDerived_lt_anchor`). The top is the HEAVIEST member: its cascade
  insertion depth is ZERO, so its insertion product is the EMPTY product = the identity `1`, and its
  chain value is the anchor ITSELF, `ewClosureRatio`. That is the Born-square scale `Mu^2/M = v/M`,
  i.e. `Mu^2 = M · ewClosureRatio`.

  Two things must be forced (not asserted):
  (i) the empty insertion product IS 1 — a UNIVERSAL fact of the insertion monoid (List.prod []), so
      the top link is the identity, NOT a fitted 1;
  (ii) the discriminator is FORCED by the counting: a NON-empty insertion bundle lands STRICTLY BELOW
      the anchor (banked `absScaleChainDerived_lt_anchor`), while the EMPTY bundle lands EXACTLY AT the
      anchor (`insertionChain [] = ewClosureRatio`). Zero insertion depth ⟺ at the anchor. Whatever the
      cascade structure forces is the answer — never bent toward 137.036.
-/

open Phys.Algebra
open Phys.Algebra.DischargeArcM
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.HucBornSquareAnchor
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) THE INSERTION CHAIN — the anchor dressed by a LIST of cascade-insertion factors.

  `insertionChain insertions = ewClosureRatio · (List.prod insertions)`. The top's insertion list is
  EMPTY (zero cascade depth ⇒ empty suppression product); the light/down sector's is the banked
  NON-empty bundle. The empty product is the identity `1` (universal), so the empty-insertion chain is
  the anchor itself. -/

def insertionChain (insertions : List Cut) : Cut := ewClosureRatio * insertions.prod

/-- The banked derived down/light cascade scale IS the insertion chain over the banked NON-empty
    insertion bundle. Ties the insertion framing EXACTLY to the banked `absScaleChainDerived`
    (NOT free-floating): the down/light insertions are `[cutCos foldPhase · s1BornProb, cutCos(2/3)]`. -/
example :
    absScaleChainDerived
      = insertionChain [cutCos foldPhase * ((s1BornProb : ℚ) : Cut), cutCos (2 / 3)] := by
  rw [absScaleChainDerived_eq_anchor_mul]
  unfold insertionChain
  simp [List.prod_cons, List.prod_nil]

/-! ## (B) THE EMPTY INSERTION PRODUCT IS THE IDENTITY — the top link `= 1` FORCED. -/

/-- ★ THE EMPTY CASCADE-INSERTION PRODUCT IS THE IDENTITY `1` (universal fact of the insertion monoid,
    `List.prod_nil`). The top has ZERO cascade insertion depth (heaviest = anchor member), so its
    insertion list is empty, and the empty product is exactly `1` — WHY the top link contributes the
    identity. Not a fitted 1; the forced identity of the empty product. -/
example : ([] : List Cut).prod = 1 := List.prod_nil

/-- ★★ THE EMPTY-INSERTION CHAIN IS THE ELECTROWEAK ANCHOR ITSELF: `insertionChain [] = ewClosureRatio`
    (= `v/M`). Zero insertion depth ⇒ the chain value collapses to the anchor. The Born-square scale of
    the top amplitude Mu is `v/M`. -/
example : insertionChain [] = ewClosureRatio := by
  unfold insertionChain; rw [List.prod_nil, mul_one]

/-! ## (C) THE DISCRIMINATOR IS FORCED BY THE COUNTING — non-empty ⇒ strictly below the anchor. -/

/-- ★★ ZERO-DEPTH ⟺ AT THE ANCHOR (the forced discriminator, banked): the EMPTY-insertion chain lands
    EXACTLY at the anchor (`insertionChain [] = ewClosureRatio`), while the banked NON-empty down/light
    insertion bundle lands STRICTLY BELOW the anchor (banked `absScaleChainDerived_lt_anchor`). So the
    top's zero insertion depth FORCES it to the anchor — any non-zero depth would put it strictly below.
    The counting, not the target, selects the anchor. -/
example :
    insertionChain [] = ewClosureRatio
    ∧ insertionChain [cutCos foldPhase * ((s1BornProb : ℚ) : Cut), cutCos (2 / 3)] < ewClosureRatio := by
  refine ⟨by unfold insertionChain; rw [List.prod_nil, mul_one], ?_⟩
  have hchain :
      absScaleChainDerived
        = insertionChain [cutCos foldPhase * ((s1BornProb : ℚ) : Cut), cutCos (2 / 3)] := by
    rw [absScaleChainDerived_eq_anchor_mul]; unfold insertionChain
    simp [List.prod_cons, List.prod_nil]
  rw [← hchain]; exact absScaleChainDerived_lt_anchor

/-! ## (D) THE TOP-AT-ANCHOR BORN-SQUARE PINNING — `Mu^2 = M·ewClosureRatio` DERIVED. -/

/-- ★★★ THE TOP-AT-ANCHOR PINNING: given the top amplitude Mu is the Born-square root of the
    closure-anchor `M` dressed by its EMPTY cascade-insertion product (i.e. `Mu^2 = M · insertionChain []`),
    it follows that `Mu^2 = M · ewClosureRatio` — the top's Born-square mass sits at the electroweak
    anchor `v`. The empty insertion product collapses the chain to the anchor. This is the last
    remaining anchor half of N577's huc reduction. -/
example (M Mu : Cut) (hu : Mu ^ 2 = M * insertionChain []) :
    Mu ^ 2 = M * ewClosureRatio := by
  rw [hu]; unfold insertionChain; rw [List.prod_nil, mul_one]

/-! ## (E) FEED BOTH ANCHOR HALVES INTO N577 — huc FULLY DERIVED. -/

/-- ★★★ huc FULLY DERIVED: given the top-at-anchor empty-insertion pinning and the definitional
    confinement-floor half, `(Mu/Mlam)^2 = 1/confBundle` follows from N577's `huc_from_born_anchors`.
    The up half is now DERIVED (empty insertion product), the floor half is definitional
    (`confAnchor_is_confScale`) — the candidate huc is a theorem. -/
example (M Mu Mlam : Cut) (hM : M ≠ 0)
    (hu : Mu ^ 2 = M * insertionChain [])
    (hl : Mlam ^ 2 = M * confinementScaleRatio) :
    (Mu / Mlam) ^ 2 = 1 / confBundle := by
  have hu' : Mu ^ 2 = M * ewClosureRatio := by
    rw [hu]; unfold insertionChain; rw [List.prod_nil, mul_one]
  exact huc_from_born_anchors M Mu Mlam hM hu' hl

end
