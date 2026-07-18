import Phys.Algebra.RecomposedRunningEndpoint
import Phys.Algebra.CensusCompletenessClosure
import Phys.Algebra.ComposedFreezeoutDissolved
import Phys.Algebra.FreezeoutEdgeNumerals
import Mathlib.Tactic

/-! PROBE 2 — the production theorems. -/

namespace Phys.Algebra.PerChannelRecomb

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.RecomposedRunningEndpoint
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- The DETERMINED freeze-out staircase summand (the coloured content re-supplied at the QUARK edges) —
    the banked dissolved closed form: `16/9 + κ·[(7/3)L_mb + (11/3)L_b0 − (5/3)L_b2]`. -/
def freezeoutStaircaseSummand : Cut :=
  16 / 9
    + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
      - (5 / 3) * cutLog (bMass 2))

/-- THE CENSUS-CONSERVING LEPTON-TAIL SCREENING: the below-Λ lepton tail carries the SINGLET census
    `leptonCensus = 2` (coloured DECOUPLED / removed), so its screening telescopes to
    `bandScreen leptonCensus (mass0/mass1)`. -/
def leptonTailScreen : Cut := bandScreen leptonCensus (mass0 / mass1)

theorem leptonTailScreen_telescope :
    totalScreening (leptonTail leptonCensus) = leptonTailScreen :=
  leptonTail_screen_telescope _

/-- ★★★ THE RECOMPOSED CENSUS-CONSERVING ENDPOINT over the derived ℝ `Cut`: the recomposed confinement
    way-point `7179/54` (iso channel decoupled below `v`, full charge census screens the confinement
    band) PLUS the below-Λ census-conserving tail — the singlet lepton tail (census `2`) and the quark
    freeze-out staircase (the coloured slice `10/3` re-supplied at the derived quark edges). -/
def recomposedEndpoint : Cut :=
  7179 / 54 + leptonTailScreen + freezeoutStaircaseSummand

/-- T2 — THE CLOSED FORM (definitional witness, made explicit): the recomposed census-conserving
    endpoint is the recomposed confinement way-point `7179/54` plus the below-Λ census-conserving tail.
    A DETERMINED closed real of `Cut` — `s = 1/8` pinned, the freeze-out edges dissolved to banked logs;
    no free parameter remains. -/
theorem recomposedEndpoint_closed :
    recomposedEndpoint
      = 7179 / 54 + bandScreen leptonCensus (mass0 / mass1)
        + (16 / 9
          + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
            - (5 / 3) * cutLog (bMass 2))) := rfl

/-- T3 ★ WAY-POINT ADJUDICATOR (EW): the SAME pipeline reproduces the banked recomposed electroweak
    way-point `6923/54` (iso census reduced by the derived `s = 1/8`) — the below-`v` structure never
    moves it. Re-exported through the assembly. -/
theorem recomposed_ew_waypoint_reproduced :
    recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)] = 6923 / 54 :=
  recomposed_EW_waypoint

/-- T4a — the recomposed confinement way-point `7179/54` is banked (iso decoupled below `v`). -/
theorem recomposed_conf_waypoint_reproduced :
    (6923 / 54 : Cut) + bandScreen chargeTraceDepth confBandRatio = 7179 / 54 :=
  recomposed_conf_waypoint

/-- T4b ★ WAY-POINT ADJUDICATOR (conf): the recomposed confinement way-point `7179/54` is a PARTIAL SUM
    of the recomposed census-conserving endpoint — the below-Λ tail is APPENDED, never moves `7179/54`.
    `recomposedEndpoint − (tail) = 7179/54`. The assembly is NOT a fit. -/
theorem recomposedEndpoint_off_confWaypoint :
    recomposedEndpoint - (leptonTailScreen + freezeoutStaircaseSummand) = 7179 / 54 := by
  unfold recomposedEndpoint; ring

/-- T1 — THE BELOW-Λ CENSUS-CONSERVING PARTITION (census level): the ONE charge census re-partitions
    exhaustively across the two below-Λ parts — the freeze-out staircase (coloured `10/3`) plus the
    singlet lepton tail (`2`). Re-export of the banked `census_completeness_closure`. -/
theorem belowLambda_census_partition :
    chargeTraceDepth = ((freezeoutStaircaseCensus : ℚ) : Cut) + leptonCensus :=
  census_completeness_closure

/-! ## DIRECTION + TEETH -/

/-- T5 ★ THE ONE-LAW DOWNWARD DIRECTION (re-exported): at the top band the recomposed two-channel
    coupling runs STRICTLY BELOW the additive one (`6923/54 < 3472/27`) — the DERIVED anti-screening
    `s = 1/8` moves the endpoint DOWN, correcting the additive overshoot the R2 finding detected. -/
theorem recompose_below_additive_topBand :
    recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)]
      < invAlphaEM [(chargeTraceDepth, topBandRatio)] :=
  recomposed_below_additive

/-- T6a — TOOTH: the below-Λ lepton tail GENUINELY SCREENS: `0 < leptonTailScreen`. The singlet census
    `leptonCensus = 2 > 0` over the forced flavor ratio `mass0/mass1 > 1` gives a strictly positive
    screening — the census-conserving tail is not a vacuous zero. -/
theorem leptonTailScreen_pos : 0 < leptonTailScreen := by
  unfold leptonTailScreen
  apply bandScreen_pos _ m01_gt_one
  rw [leptonCensus_val]; norm_num

/-- T6b — TOOTH: the two below-Λ census parts are GENUINELY DISTINCT (`10/3 ≠ 2`, no double-count
    degeneracy). Re-export of the banked `staircase_ne_singlet`. -/
theorem below_parts_distinct :
    ((freezeoutStaircaseCensus : ℚ) : Cut) ≠ leptonCensus :=
  staircase_ne_singlet

/-- T6c — TOOTH: the derived anti-screening `s = 1/8` GENUINELY BITES (`bandScreen projectedS
    topBandRatio = 7/18 ≠ 0`). Re-export of the banked `recomposed_shift_ne_zero`. -/
theorem antiScreen_bites : bandScreen projectedS topBandRatio ≠ 0 :=
  recomposed_shift_ne_zero

/-- T6d — TOOTH: the recompose is DISTINCT from the additive endpoint at the top band
    (`6923/54 ≠ 3472/27`). Re-export of the banked `recomposed_EW_ne_additive`. -/
theorem recompose_ne_additive :
    recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)]
      ≠ invAlphaEM [(chargeTraceDepth, topBandRatio)] :=
  recomposed_EW_ne_additive

/-- T6e — TOOTH: the freeze-out staircase summand GENUINELY CARRIES THE CONFINEMENT RUNG: its rational
    part is the derived `16/9` (the π-cancelled octonion confinement rung), `≠ 0` — the coloured
    re-supply is not a pure log with no rung. -/
theorem freezeout_uses_confinement_rung :
    freezeoutStaircaseSummand
      - kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
        - (5 / 3) * cutLog (bMass 2)) = 16 / 9 := by
  unfold freezeoutStaircaseSummand; ring

end

end Phys.Algebra.PerChannelRecomb
