import Phys.Algebra.D7CompositionAttestation
import Phys.Algebra.JoinSplitRatioDerived
import Phys.Algebra.FreezeoutReweightingBounded
import Mathlib.Tactic

open Phys.Algebra
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.JoinContent
open Phys.Algebra.JoinSplitRatioDerived
open Phys.Algebra.HadronicLevelWeights
open Phys.Algebra.FreezeoutReweightingBounded
open Phys.Algebra.SubBandCompletion
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (A) The mirror threshold census shift COMPOSED onto the census-conserving endpoint contributes EXACTLY 0
--     at the DERIVED splitting ratio (joinSplitRatio = 1, isometric last doubling). INCLUDED-proven-zero.
example (w : Cut) : recomposedEndpoint + joinContent w joinSplitRatio = recomposedEndpoint := by
  rw [joinContent_at_derived_eq_zero, add_zero]

-- the census SHIFT is a real derived count (=3), distinct from the vanishing descent contribution
example : mirrorMultCensus = 3 := mirrorMultCensus_eq

-- the join content is genuinely positive for a NON-degenerate splitting 1 < j (so j=1 is the vanishing boundary, not vacuous)
example (w j : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) (hj : 1 < j) : 0 < joinContent w j :=
  joinContent_pos w j hw0 hw1 hj

-- (B) The above-floor hadronic level weights: any census-conserving reweighting is bounded by κ·9·cutLog R
example (wb wc wl rb rc rl R : Cut)
    (hwb : 0 ≤ wb) (hwc : 0 ≤ wc) (hwl : 0 ≤ wl) (hconserve : wb + wc + wl = 9)
    (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl) (hbR : rb ≤ R) (hcR : rc ≤ R) (hlR : rl ≤ R) :
    reweightedFreezeout wb wc wl rb rc rl ≤ kappaLeading * 9 * cutLog R :=
  census_conserving_reweight_bounded wb wc wl rb rc rl R hwb hwc hwl hconserve hb hc hl hbR hcR hlR

-- the floor occupancy count 16 is DISTINCT from the freeze-out census 9 (two distinct objects)
example : ((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut)
    ≠ censusBottomBand + censusCharmBand + censusLightBand := occupancy_ne_census_total

-- floor occupancy = 16 exactly
example : Nat.card ↥(levelOccupancy 1) = 16 := floorOccupancy_eq_sixteen

-- (D) the endpoint bracket CARRIES THROUGH unchanged (both summands do not move it)
example : (3406 / 25 : Cut) ≤ recomposedEndpoint ∧ recomposedEndpoint ≤ 13639 / 100 :=
  Phys.Algebra.D7CompositionAttestation.recomposedEndpoint_restated_bracket

example : recomposedEndpoint < 137 :=
  Phys.Algebra.D7CompositionAttestation.recomposedEndpoint_lt_137

end
