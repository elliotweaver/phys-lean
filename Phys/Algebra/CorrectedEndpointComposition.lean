/-
  ScratchN690 — CorrectedEndpointComposition (REPAIR PHASE 2, prereg
  workbench/mirror-closure/PREREG-REPAIR-690-692.md §N690).

  THE CORRECTED ENDPOINT COMPOSITION: the census-conserving endpoint rebuilt over the
  CORRECTED base `7259/54` (N689 `correctedBase_eq`, through N688's adjudication) and the
  CORRECTED active-span log weights `(2, 3, 10/3, −5/3)` (N689 `freezeoutCorrected_summand`),
  then dressed by the SAME fold-forced all-orders depth-2 factor `3/2` as the banked frame
  (X5 `kappaLeadingDressed_eq_div` at D3 `depthWeight_eq` — the dressing is frame-blind).

  TARGETS (all THEOREM-EXACT, no bracket here — brackets are N691):
    (1) `cInnerCorrected` — the corrected inner log-combination;
    (2) `recomposedEndpointCorrected` / `recomposedEndpointCorrectedDressed` — bare/dressed
        corrected endpoints over the corrected base `7259/54`;
    (3) `corrected_dressed_closed` — dressed `= 7259/54 + (3/2)·κ·cInnerCorrected`
        (the D7DepthTwoComposed closed-form route, verbatim);
    (4) `corrected_vs_banked_endpoint` — the EXACT difference vs the banked-frame dressed
        endpoint: `−8/27 + (3/2)·κ·(cInnerCorrected − cInner)`, and the weight-difference
        substitution `= −8/27 + (3/2)·κ·((2/3)·L_mb − (1/3)·L_b0)` (the N688
        `full_correction_shape` content carried to the composed endpoint);
    (5) `corrected_depthTwo_dresses` — dressed = bare + `(1/2)·κ·cInnerCorrected`
        (the depth-2 increment at the corrected weights);
    (W) `corrected_weld` — the corrected endpoint IS way-point + lepton tail + corrected
        staircase: `recomposedEndpointCorrected = 7179/54 + leptonTailScreen +
        freezeoutCorrectedSummand` (mirrors `recomposedEndpoint_closed`'s shape);
    (6) capstone `corrected_composition_landing` welding (1)–(5) + N689's landing pieces.

  CONSUMES (all banked): D7DepthTwoComposed (`cInner`, `recomposedEndpointDressed`,
  `recomposedEndpointDressed_closed`); FreezeoutCorrectedDissolution (N689:
  `freezeoutCorrectedSummand`, `freezeoutCorrected_summand`, `correctedBase`,
  `correctedBase_eq`, `correctedBase_lt_banked`); PerChannelRecomb (`leptonTailScreen`);
  DepthTowerDescent (`kappaLeadingDressed`, `kappaLeadingDressed_eq_div`); DepthWeight
  (`depthWeight_eq`, `depthWeight_pos`, `depthWeight_lt_one`); DecouplingCensusRemoval
  (`leptonCensus_val`); `kappaLeading` / `bandScreen` / `cutLog` over the derived ℝ `Cut`.
  NO sorry / admit / axiom; no empirical number in any statement or proof.
-/
import Phys.Algebra.D7DepthTwoComposed
import Phys.Algebra.FreezeoutCorrectedDissolution
import Mathlib.Tactic

namespace Phys.Algebra.CorrectedEndpointComposition

open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.FreezeoutCorrectedDissolution
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE CORRECTED INNER LOG-COMBINATION. -/

/-- ★★★ (TARGET 1) THE CORRECTED INNER LOG-COMBINATION: the loop-running content of the
    corrected endpoint — the SAME four banked derived logs as the banked `cInner`, at the
    N689 corrected active-span weights: `2·cutLog(mass0/mass1) + 3·cutLog mbRatioDerived
    + (10/3)·cutLog (bMass 0) − (5/3)·cutLog (bMass 2)` (the lepton-tail weight `2` and
    the `L_b2` weight `−5/3` unchanged; `(7/3, 11/3) → (3, 10/3)` per N688's
    `full_correction_shape`). -/
def cInnerCorrected : Cut :=
  2 * cutLog (mass0 / mass1) + 3 * cutLog mbRatioDerived
    + (10 / 3) * cutLog (bMass 0) - (5 / 3) * cutLog (bMass 2)

/-! ## (2) THE CORRECTED ENDPOINTS — bare and depth-2-dressed, over the corrected base. -/

/-- ★★★ (TARGET 2a) THE CORRECTED BARE ENDPOINT: the corrected base `7259/54` (N689
    `correctedBase_eq`) plus the bare-loop-factor corrected running content. -/
def recomposedEndpointCorrected : Cut :=
  7259 / 54 + kappaLeading * cInnerCorrected

/-- ★★★ (TARGET 2b) THE CORRECTED DRESSED ENDPOINT: the corrected base plus the corrected
    running content at the banked all-orders dressed loop factor
    `kappaLeadingDressed depthWeight` (X5, at the fold-forced weight `depthWeight = 1/3`
    — the dressing is frame-blind: it dresses the LOOP FACTOR, not the census weights). -/
def recomposedEndpointCorrectedDressed : Cut :=
  7259 / 54 + kappaLeadingDressed depthWeight * cInnerCorrected

/-! ## (3) THE CLOSED FORM — the fold-forced factor `3/2`, D7DepthTwoComposed route verbatim. -/

/-- ★★★ (TARGET 3) THE CLOSED FORM: `recomposedEndpointCorrectedDressed = 7259/54 +
    (3/2)·kappaLeading·cInnerCorrected` — banked `kappaLeadingDressed_eq_div` at
    `depthWeight_pos`/`depthWeight_lt_one` + `depthWeight_eq`; the factor `3/2` is
    `1/(1 − 1/3)`, forced, never chosen (same proof as
    `recomposedEndpointDressed_closed`). -/
theorem corrected_dressed_closed :
    recomposedEndpointCorrectedDressed
      = 7259 / 54 + (3 / 2) * kappaLeading * cInnerCorrected := by
  unfold recomposedEndpointCorrectedDressed
  rw [kappaLeadingDressed_eq_div depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one,
      depthWeight_eq]
  have h : kappaLeading / (1 - (1 / 3 : Cut)) = (3 / 2) * kappaLeading := by
    have h23 : (1 : Cut) - 1 / 3 = 2 / 3 := by norm_num
    rw [h23]; ring
  rw [h]

/-! ## (4) THE EXACT DIFFERENCE vs THE BANKED-FRAME DRESSED ENDPOINT. -/

/-- ★★★ (TARGET 4a) CORRECTED vs BANKED, ABSTRACT FORM: the corrected dressed endpoint
    differs from the banked `recomposedEndpointDressed` by EXACTLY the base drop `−8/27`
    (N688: `2425/18 − 7259/54 = 16/9 − 40/27 = 8/27`) plus the dressed weight shift
    `(3/2)·κ·(cInnerCorrected − cInner)`. -/
theorem corrected_vs_banked_endpoint :
    recomposedEndpointCorrectedDressed - recomposedEndpointDressed
      = -(8 / 27) + (3 / 2) * kappaLeading * (cInnerCorrected - cInner) := by
  rw [corrected_dressed_closed, recomposedEndpointDressed_closed]
  ring

/-- ★★★ (TARGET 4b) CORRECTED vs BANKED, WEIGHT-DIFFERENCE FORM: substituting the exact
    log-weight shift `cInnerCorrected − cInner = (3 − 7/3)·L_mb + (10/3 − 11/3)·L_b0
    = (2/3)·L_mb − (1/3)·L_b0` (the mass0/mass1 and bMass 2 weights cancel) — the N688
    `full_correction_shape` content, carried to the composed dressed endpoint. -/
theorem corrected_vs_banked_endpoint_weights :
    recomposedEndpointCorrectedDressed - recomposedEndpointDressed
      = -(8 / 27)
        + (3 / 2) * kappaLeading
          * ((2 / 3) * cutLog mbRatioDerived - (1 / 3) * cutLog (bMass 0)) := by
  rw [corrected_dressed_closed, recomposedEndpointDressed_closed]
  unfold cInnerCorrected cInner
  ring

/-! ## (5) THE DEPTH-2 DRESSING INCREMENT AT THE CORRECTED WEIGHTS. -/

/-- ★★★ (TARGET 5) THE DEPTH-2 DRESSING AT THE CORRECTED WEIGHTS: the corrected dressed
    endpoint is the corrected bare endpoint plus EXACTLY `(1/2)·kappaLeading·cInnerCorrected`
    — the same census-in-census increment shape as the banked
    `depthTwo_dresses_recomposed` (part 1), at the corrected running content. -/
theorem corrected_depthTwo_dresses :
    recomposedEndpointCorrectedDressed
      = recomposedEndpointCorrected + (1 / 2) * kappaLeading * cInnerCorrected := by
  rw [corrected_dressed_closed]
  unfold recomposedEndpointCorrected
  ring

/-! ## (W) THE WELD TO N689 — the corrected endpoint IS way-point + lepton tail +
    corrected staircase (mirrors `recomposedEndpoint_closed`'s shape at the corrected
    weights). -/

/-- ★★★ (WELD) THE CORRECTED ENDPOINT DISSOLVES AS THE BANKED ONE DOES: the corrected bare
    endpoint is the recomposed confinement way-point `7179/54` plus the SINGLET lepton
    tail (`leptonTailScreen`, census `2` — unchanged by the correction) plus the N689
    CORRECTED freeze-out staircase summand (`freezeoutCorrectedSummand`, dissolved by
    `freezeoutCorrected_summand` to `40/27 + κ·[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]`;
    `7179/54 + 40/27 = 7259/54` is the corrected base). The composition shape of
    `PerChannelRecomb.recomposedEndpoint_closed` is PRESERVED under the correction. -/
theorem corrected_weld :
    recomposedEndpointCorrected
      = 7179 / 54 + leptonTailScreen + freezeoutCorrectedSummand := by
  unfold recomposedEndpointCorrected
  rw [freezeoutCorrected_summand]
  unfold leptonTailScreen bandScreen
  rw [leptonCensus_val]
  unfold cInnerCorrected
  ring

/-! ## (6) THE CAPSTONE — the corrected composition landing, welded to N689. -/

/-- ★★★ (TARGET 6) THE CORRECTED COMPOSITION LANDING: in ONE statement —

    (1) THE CLOSED FORM: `recomposedEndpointCorrectedDressed = 7259/54 +
        (3/2)·κ·cInnerCorrected` (`corrected_dressed_closed`, the fold-forced `3/2`);
    (2) THE WELD: the corrected endpoint IS way-point + lepton tail + corrected staircase
        (`corrected_weld`, the N689 dissolution composed);
    (3) THE EXACT DIFFERENCE vs the banked frame, weight-substituted:
        `−8/27 + (3/2)·κ·((2/3)·L_mb − (1/3)·L_b0)` (`corrected_vs_banked_endpoint_weights`,
        the N688 full-correction content at the composed endpoint);
    (4) THE DEPTH-2 INCREMENT: dressed = bare + `(1/2)·κ·cInnerCorrected`
        (`corrected_depthTwo_dresses`);
    (5) N689's CORRECTED BASE, consumed: `correctedBase = 7259/54`, strictly below the
        production `2425/18` (`correctedBase_eq` / `correctedBase_lt_banked`);
    (6) N689's CORRECTED DISSOLUTION, consumed: the corrected summand dissolves to
        `40/27 + κ·[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]` (`freezeoutCorrected_summand`).

    Statable from no single conjunct alone (non-hollow). NO-FIT: every rational is forced
    by the banked counting; the dressing factor falls out of `depthWeight_eq`; no
    empirical number appears in any statement or proof. -/
theorem corrected_composition_landing :
    -- (1) the closed form
    (recomposedEndpointCorrectedDressed
        = 7259 / 54 + (3 / 2) * kappaLeading * cInnerCorrected)
    -- (2) the weld to N689's dissolution
    ∧ (recomposedEndpointCorrected
        = 7179 / 54 + leptonTailScreen + freezeoutCorrectedSummand)
    -- (3) the exact difference vs the banked-frame dressed endpoint
    ∧ (recomposedEndpointCorrectedDressed - recomposedEndpointDressed
        = -(8 / 27)
          + (3 / 2) * kappaLeading
            * ((2 / 3) * cutLog mbRatioDerived - (1 / 3) * cutLog (bMass 0)))
    -- (4) the depth-2 increment at the corrected weights
    ∧ (recomposedEndpointCorrectedDressed
        = recomposedEndpointCorrected + (1 / 2) * kappaLeading * cInnerCorrected)
    -- (5) N689's corrected base, consumed
    ∧ (correctedBase = 7259 / 54 ∧ correctedBase < 2425 / 18)
    -- (6) N689's corrected dissolution, consumed
    ∧ (freezeoutCorrectedSummand
        = 40 / 27
          + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
            - (5 / 3) * cutLog (bMass 2))) :=
  ⟨corrected_dressed_closed, corrected_weld, corrected_vs_banked_endpoint_weights,
   corrected_depthTwo_dresses, ⟨correctedBase_eq, correctedBase_lt_banked⟩,
   freezeoutCorrected_summand⟩

end

end Phys.Algebra.CorrectedEndpointComposition
