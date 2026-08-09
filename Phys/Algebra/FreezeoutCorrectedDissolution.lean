import Phys.Algebra.BaseGemCensusAdjudicated
import Mathlib.Tactic

/-!
  # N689 — THE CORRECTED FREEZE-OUT DISSOLUTION (production-grade module, scratch lane)
  ==============================================================================
  Restates `ComposedFreezeoutDissolved`'s dissolution pipeline at the ACTIVE per-edge
  census weights `(10/3, 2, 5/3)` (N574 `PerEdgeCensusRederived`), consuming the banked
  theorems BY NAME, and welds it to N688's adjudication
  (`BaseGemCensusAdjudicated.base_gem_census_adjudicated`).

  Grep facts consumed (kill-check discharged):
    • `freezeoutActive_summand_dissolved` (PerEdgeCensusRederived) — the corrected
      dissolution `κ·(10/3)·cutLog rb + κ·2·cutLog rc + κ·(5/3)·cutLog rl
        = 40/27 + κ·[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]` at the pinned edges
      `rb = mbRatioDerived·(bMass 0 / bMass 2)`, `rc = 1/mbRatioDerived`,
      `rl = downConfBundle·bMass 2`;
    • `gem_active` (PerEdgeCensusRederived) — `κ·(5/3)·(8·cutPi/3) = 40/27`;
    • `freezeout_summand_dissolved`, `confinement_rung_rational`
      (ComposedFreezeoutDissolved) — the OLD-census dissolution
      `= 16/9 + κ·[(7/3)L_mb + (11/3)L_b0 − (5/3)L_b2]` and the banked gem `16/9`;
    • `full_correction_shape`, `base_gem_census_adjudicated`, `base_corrected_value`
      (BaseGemCensusAdjudicated, N688);
    • `base_corrected` (BaseNormalFormAudit, N575) — `6923/54 + 128/27 + 40/27 = 7259/54`.

  TARGETS: (1) `freezeoutCorrected_summand` (def + dissolution, re-exporting the banked
  N574 theorem with the wiring made explicit); (2) `corrected_vs_banked` (the exact
  difference identity of the two dissolved summands, through N688's
  `full_correction_shape`); (3) `correctedBase` / `correctedBase_eq` (= 7259/54, through
  N575's `base_corrected`); (4) the capstone `freezeout_corrected_landing`.

  NO sorry / admit / axiom. Foundations-only imports (N688 transitively pulls
  N574/N575/ComposedFreezeoutDissolved, all banked foundations-only).
-/

namespace Phys.Algebra.FreezeoutCorrectedDissolution

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.BaseNormalFormAudit
open Phys.Algebra.BaseGemCensusAdjudicated
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE CORRECTED FREEZE-OUT SUMMAND — def + dissolution at the pinned edges. -/

/-- THE CORRECTED FREEZE-OUT SUMMAND at the three PINNED derived edges
    `rb = mbRatioDerived·(bMass 0 / bMass 2)`, `rc = 1/mbRatioDerived`,
    `rl = downConfBundle·bMass 2` (the banked edge pinnings of
    `ComposedFreezeoutDissolved`), carrying the AB-INITIO ACTIVE-SPAN census weights
    `(10/3, 2, 5/3)` (N574 `censusActive{Bottom,Charm,Light}Span_val`). -/
def freezeoutCorrectedSummand : Cut :=
  kappaLeading * (10 / 3) * cutLog (mbRatioDerived * (bMass 0 / bMass 2))
    + kappaLeading * 2 * cutLog (1 / mbRatioDerived)
    + kappaLeading * (5 / 3) * cutLog (downConfBundle * bMass 2)

/-- ★★★ (TARGET 1) THE CORRECTED DISSOLUTION: the corrected summand at the pinned edges
    dissolves to `40/27 + κ·[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]` — the corrected gem
    `40/27` (the active light-span census `5/3` on the confinement rung `8π/3`, the π
    cancelled against `κ = 1/(3π)`, N574 `gem_active`) plus a κ-weighted log-combination.
    Re-export of the banked N574 `freezeoutActive_summand_dissolved`, with the def
    wiring made explicit. -/
theorem freezeoutCorrected_summand :
    freezeoutCorrectedSummand
      = 40 / 27
        + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
          - (5 / 3) * cutLog (bMass 2)) := by
  unfold freezeoutCorrectedSummand
  exact freezeoutActive_summand_dissolved

/-- The corrected gem inside the dissolution is the banked N574 `gem_active`
    (re-export, the wiring witness): `κ·(5/3)·(8·cutPi/3) = 40/27`. -/
theorem freezeoutCorrected_gem : kappaLeading * (5 / 3) * (8 * cutPi / 3) = 40 / 27 :=
  gem_active

/-! ## (2) THE EXACT DIFFERENCE IDENTITY — corrected vs banked, through N688. -/

/-- THE BANKED (OLD-CENSUS) FREEZE-OUT SUMMAND at the same pinned edges, weights
    `(11/3, 10/3, 2)` — the `ComposedFreezeoutDissolved` object, named here for the
    difference identity. -/
def freezeoutBankedSummand : Cut :=
  kappaLeading * (11 / 3) * cutLog (mbRatioDerived * (bMass 0 / bMass 2))
    + kappaLeading * (10 / 3) * cutLog (1 / mbRatioDerived)
    + kappaLeading * 2 * cutLog (downConfBundle * bMass 2)

/-- The banked summand's dissolution (re-export of the banked
    `freezeout_summand_dissolved`, wiring made explicit): `16/9 + κ·[(7/3)L_mb +
    (11/3)L_b0 − (5/3)L_b2]`. -/
theorem freezeoutBanked_summand :
    freezeoutBankedSummand
      = 16 / 9
        + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
          - (5 / 3) * cutLog (bMass 2)) := by
  unfold freezeoutBankedSummand
  exact freezeout_summand_dissolved

/-- ★★★ (TARGET 2) CORRECTED VS BANKED — THE EXACT DIFFERENCE IDENTITY: the banked
    summand exceeds the corrected summand by EXACTLY
    `8/27 + κ·[−(2/3)·L_mb + (1/3)·L_b0]` — the gem drop `16/9 − 40/27 = 8/27` PLUS the
    log-weight shift ((7/3, 11/3) → (3, 10/3); the L_b2 weight −5/3 unchanged). Consumes
    N688's `full_correction_shape` applied at the pinned-edge logs: the referee's −8/27
    diagnostic is incomplete — the correction moves the log weights too. -/
theorem corrected_vs_banked :
    freezeoutBankedSummand - freezeoutCorrectedSummand
      = 8 / 27
        + kappaLeading * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)) := by
  rw [freezeoutBanked_summand, freezeoutCorrected_summand]
  exact full_correction_shape (cutLog mbRatioDerived) (cutLog (bMass 0)) (cutLog (bMass 2))

/-! ## (3) THE CORRECTED BASE — the normal-form constant under the active census. -/

/-- THE CORRECTED BASE: the N575 normal-form regrouping with the corrected gem `40/27`
    in place of the banked `16/9` — `6923/54 + 128/27 + 40/27`. -/
def correctedBase : Cut := 6923 / 54 + 128 / 27 + 40 / 27

/-- ★★ (TARGET 3) THE CORRECTED BASE VALUE: `correctedBase = 7259/54` (consumes N575's
    `base_corrected`, as adjudicated by N688's `base_corrected_value`). -/
theorem correctedBase_eq : correctedBase = 7259 / 54 :=
  base_corrected

/-- The corrected base strictly drops from the production base `2425/18` (N575's
    `base_corrected_lt_base` through N688's `correction_real` — the correction is real). -/
theorem correctedBase_lt_banked : correctedBase < 2425 / 18 := by
  rw [correctedBase_eq]; exact correction_real

/-! ## (4) THE CAPSTONE — the corrected freeze-out landing, welded to N688. -/

/-- ★★★ (TARGET 4) THE CORRECTED FREEZE-OUT LANDING: in ONE statement —

    (1) THE CORRECTED DISSOLUTION: the active-weight summand at the pinned edges
        dissolves to `40/27 + κ·[3·L_mb + (10/3)·L_b0 − (5/3)·L_b2]`
        (`freezeoutCorrected_summand`, re-exporting N574);
    (2) THE EXACT DIFFERENCE: banked − corrected = `8/27 + κ·[−(2/3)L_mb + (1/3)L_b0]`
        (`corrected_vs_banked`, through N688's `full_correction_shape`);
    (3) THE CORRECTED BASE: `correctedBase = 7259/54` (`correctedBase_eq`, N575's
        `base_corrected`), strictly below the production `2425/18`;
    (4) THE ADJUDICATION (N688 `base_gem_census_adjudicated`, consumed whole): the
        production base's gem IS the light-census screen `16/9`, that census over-counts
        by exactly the strange term, the corrected gem is `40/27`, the base drop is
        exactly the gem drop, and the drop is real.

    Statable from no single conjunct alone (non-hollow). NO-FIT: every rational is
    forced by the banked counting; no empirical number appears in any statement or
    proof. -/
theorem freezeout_corrected_landing :
    -- (1) the corrected dissolution
    (freezeoutCorrectedSummand
      = 40 / 27
        + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
          - (5 / 3) * cutLog (bMass 2)))
    -- (2) the exact corrected-vs-banked difference
    ∧ (freezeoutBankedSummand - freezeoutCorrectedSummand
        = 8 / 27
          + kappaLeading * (-(2 / 3) * cutLog mbRatioDerived + (1 / 3) * cutLog (bMass 0)))
    -- (3) the corrected base
    ∧ correctedBase = 7259 / 54
    ∧ correctedBase < 2425 / 18
    -- (4) N688's adjudication, consumed whole
    ∧ ((kappaLeading * censusLightBand * (8 * cutPi / 3) = 16 / 9)
        ∧ (censusLightBand - censusActiveLightSpan = ((colouredCensusTerm 1 : ℚ) : Cut))
        ∧ (kappaLeading * censusActiveLightSpan * (8 * cutPi / 3) = 40 / 27)
        ∧ ((2425 : Cut) / 18 - 7259 / 54 = 16 / 9 - 40 / 27)
        ∧ ((7259 : Cut) / 54 < 2425 / 18)) :=
  ⟨freezeoutCorrected_summand, corrected_vs_banked, correctedBase_eq,
   correctedBase_lt_banked, base_gem_census_adjudicated⟩

end

end Phys.Algebra.FreezeoutCorrectedDissolution
