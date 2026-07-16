import Phys.Algebra.EndpointAssembly
import Phys.Algebra.FineStructureCensusBands
import Phys.Algebra.HadronicSpectrum
import Mathlib.Tactic

namespace Phys.Algebra.D2Probe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (A) freeze-out census steps — each threshold step = the frozen flavour's census term. -/

-- bottom (down-type, level 1) freeze-out: 11/3 − 10/3 = 1/3 = colouredCensusTerm 1
theorem freezeout_step_bottom :
    bandCensus [2, 1, 1, 2, 1] - bandCensus [2, 1, 1, 2] = colouredCensusTerm 1 := by
  rw [bandCensus_bottom, bandCensus_charm, colouredCensusTerm_one]; norm_num

-- charm (up-type, level 2) freeze-out: 10/3 − 2 = 4/3 = colouredCensusTerm 2
theorem freezeout_step_charm :
    bandCensus [2, 1, 1, 2] - bandCensus [2, 1, 1] = colouredCensusTerm 2 := by
  rw [bandCensus_charm, bandCensus_light, colouredCensusTerm_two]; norm_num

-- the two steps differ (up vs down flavour distinction)
theorem freezeout_steps_differ :
    (bandCensus [2, 1, 1, 2, 1] - bandCensus [2, 1, 1, 2])
      ≠ (bandCensus [2, 1, 1, 2] - bandCensus [2, 1, 1]) := by
  rw [freezeout_step_bottom, freezeout_step_charm, colouredCensusTerm_one, colouredCensusTerm_two]
  norm_num

-- strictly descending plateaus (freeze-out strictly reduces census)
theorem freezeout_descending :
    bandCensus [2, 1, 1] < bandCensus [2, 1, 1, 2]
    ∧ bandCensus [2, 1, 1, 2] < bandCensus [2, 1, 1, 2, 1] :=
  bandCensus_strictly_increasing

/-! ## (B) freeze-out census as Cut (derived plateaus). -/

def censusBottomBand : Cut := ((bandCensus [2, 1, 1, 2, 1] : ℚ) : Cut)
def censusCharmBand : Cut := ((bandCensus [2, 1, 1, 2] : ℚ) : Cut)
def censusLightBand : Cut := ((bandCensus [2, 1, 1] : ℚ) : Cut)

theorem censusBottomBand_val : censusBottomBand = 11 / 3 := by
  unfold censusBottomBand; rw [bandCensus_bottom]; norm_num
theorem censusCharmBand_val : censusCharmBand = 10 / 3 := by
  unfold censusCharmBand; rw [bandCensus_charm]; norm_num
theorem censusLightBand_val : censusLightBand = 2 := by
  unfold censusLightBand; rw [bandCensus_light]; norm_num

/-! ## (C) the complete freeze-out tower assembled — way-point free. -/

def freezeoutTail (rb rc rl : Cut) : List (Cut × Cut) :=
  [(censusBottomBand, rb), (censusCharmBand, rc), (censusLightBand, rl)]

def completeFreezeoutList (rb rc rl d : Cut) : List (Cut × Cut) :=
  derivedBandList ++ freezeoutTail rb rc rl ++ leptonTail d

theorem freezeout_confWaypoint_free (rb rc rl d : Cut) :
    invAlphaZero (completeFreezeoutList rb rc rl d)
      = 190 / 3 + totalScreening (freezeoutTail rb rc rl ++ leptonTail d) := by
  unfold completeFreezeoutList
  rw [List.append_assoc, confWaypoint_free]

/-! ## (D) edges on the derived ℕ-spectrum (X4). -/

theorem hadronic_edge_on_spectrum : (1 : ℚ) ∈ gapSpectrum := gap_floor_is_one.1
theorem hadronic_spectrum_eq_nat : gapSpectrum = Set.range (fun n : ℕ => (n : ℚ)) :=
  gapSpectrum_eq_natRange
theorem hadronic_edge_quantized : (1 / 2 : ℚ) ∉ gapSpectrum := half_not_mem_spectrum

/-! ## (E) census conservation tie (banked X3). -/

theorem census_conserves_depth :
    (((2 * ((colouredCensusTerm 2 + colouredCensusTerm 1) + 1)) : ℚ) : Cut) = chargeTraceDepth :=
  census_generation_is_depth

end

end Phys.Algebra.D2Probe
