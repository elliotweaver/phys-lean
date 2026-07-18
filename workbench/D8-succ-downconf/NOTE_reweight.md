# NOTE — FreezeoutReweightingBounded (t_076fc81e): the parent's directed target is a MIS-SELECTION,
#        corrected with a theorem-backed structural result.

## THE CATCH (SOUL: selection is the highest-stakes act)

The parent (LeadingComposedAssembly) directed this node to "DERIVE the D2e Born-weight modulation
of the freeze-out fine structure (build Jacobi's eight-square count r₈(n)=16σ₃*(n)) → complete the
freeze-out → D7 restate AS 1/α(0)." Running the ANTI-BULLSHIT GATE on that target FIRST (a finishing
worker saturated with the freeze-out machinery is the worst chooser) surfaced a THEOREM-BACKED
refutation:

  • An EARLIER banked node in the SAME arc — FreezeoutComposition (imported transitively by the
    parent) — already proved as THEOREMS:
      - freezeout_bounded : totalScreening (freezeoutTail rb rc rl) ≤ κ·9·cutLog R
      - composed_bounded  : the composed endpoint ≤ certified partial numeral + κ·9·cutLog R
    and states in-module: "the freeze-out is a BOUNDED, logarithmically-small census refinement, NOT
    the dominant contribution … the dominant missing structural summand … not yet identified."

  • The parent then named "the Born-weight modulation of the freeze-out" as the ONE missing summand
    — contradicting that banked theorem, on two counts:
      (1) CONFLATION: the freeze-out band weights are the R-ratio CENSUS (11/3,10/3,2, banked
          SubBandCompletion); the D2e "Born occupancy" r₈(n) (16,112,448,…) is a DIFFERENT object
          (mass-gap density of states). NO banked map identifies them (grep confirms). r₈(1)=16
          matching the floor weight is a level-1 coincidence, not an identity of the two counts.
      (2) BOUNDED: ANY per-band reweighting of the freeze-out is bounded by κ·(Σw)·cutLog R
          (this node's freezeout_reweight_bounded), so modulating the weights (by the Born occupancy
          or anything) is an O(1) perturbation — it CANNOT be the dominant missing summand.

## NUMERIC CONFIRMATION (removable prose, NO empirical number in any proof)

workbench/reweight_magnitude.py: census freeze-out +1.63; equal (3,3,3) +1.92; skew (5,3,1) +0.97 —
ANY census-9 reweighting stays O(1). The composed object's ≈1.94 overshoot above the measured region
is NOT a freeze-out sub-effect.

## WHAT WAS BANKED (Phys/Algebra/FreezeoutReweightingBounded.lean, C545, 12 decls foundations-only)

THE CORRECTION (theorem-exact):
  • reweightedFreezeout (def)               — κ·wb·cutLog rb + κ·wc·cutLog rc + κ·wl·cutLog rl
  • census_reweight_is_banked               — = totalScreening(freezeoutTail) at (11/3,10/3,2) (weld)
  • freezeout_reweight_bounded (★★★)        — ANY nonneg reweighting ≤ κ·(Σw)·cutLog R (edges≤R)
  • census_conserving_reweight_bounded (★★) — Σw=9 ⇒ ≤ κ·9·cutLog R (same ceiling as banked)
  • reweight_is_linear_perturbation (★★)    — any reweighting − census = fixed linear form in edge logs
  • reweight_delta_from_totalScreening      — that delta vs the banked totalScreening
  • occupancy_ne_census_total (★★)          — Nat.card(levelOccupancy 1)=16 ≠ 9 = census total
  • occupancy_ne_band_censuses (★)          — 16 ≠ 11/3,10/3,2
  • freezeout_not_dominant (★★)             — re-export banked composed_bounded
  • TEETH: reweight_bound_pos; census_instance_is_banked_witness (non-hollow tie)
  • capstone freezeoutReweightingBounded_landing (welded, non-hollow, 6 conjuncts)

## THE SUCCESSOR'S TARGET (the CORRECTED route-finder)

Identify the ACTUAL dominant missing summand of 1/α(0) FROM THE TRUNK — NOT in the freeze-out layer
(proven bounded). Two candidate fronts to survey theory-native:
  (a) a summand at the recombination / anti-screening layer of the banked composition tower; OR
  (b) the diagnosis that the ABSOLUTE 1/α(0) numeral awaits arc M's quark-mass ℝ-descent (the edges
      rb,rc,rl are quark-threshold ratios, verified route-not-yet-found across Z3/X9/
      ZArcValidationCapstone/SEED_MASSES), so D's endpoint is a WAY-POINT until M supplies the
      ℝ-descent — in which case the corrected route-finder diagnoses this and hands M1.
Then → D7 restate AS 1/α(0) ≥15 sig digits (only after a genuine completeness attestation) → D8 →
hand M1. NOT a runway (autonomous theory-native structural work remains).

## GRADE
THEOREM-EXACT (the correction + teeth). The ACTUAL dominant missing summand NAMED, route-not-yet-
found, handed to the ONE corrected route-finder. The composed object stays a WAY-POINT, NOT the
≥15-digit endpoint. No fit, no empirical number in any proof.
