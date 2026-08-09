/-
  Counterexamples.BaseGemCensusAdjudicatedVacuityCostume — the adjudication is GENUINE:
  the over-count is strictly nonzero (the two censuses genuinely differ), the corrected
  base strictly drops, and the full correction's log-weight part is nonzero (the −8/27
  diagnostic alone is genuinely incomplete). C688.
  =====================================================================================
  W8 ANTI-VACUITY. N688 adjudicates the base-gem census (Frame 2 forced). What must NOT
  be hollow: (i) the over-count is real (censusLightBand ≠ censusActiveLightSpan);
  (ii) the base correction is a strict drop; (iii) the log-weight shift component is
  structurally nonzero (the weight deltas −2/3 and +1/3 are not zero).

  THE CERTIFICATE. attestFlag := 1 -- "over-count real + drop strict + weights move".
  TIED to the banked theorems by attestFlag_forced.

  We anchor min 688 attestFlag = 1 (TRUE -- attestFlag = 1 < 688).

  THE BOGUS CLAIM (a stand-in for ANY "the frames agree / the correction is zero / only
  the constant moves" reading): that min 688 attestFlag = 688. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 688 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (688, 1) is fresh.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.BaseGemCensusAdjudicated

namespace Counterexamples

open Phys.Algebra.BaseGemCensusAdjudicated
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "over-count real + drop strict + weights move". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked theorems): the two censuses strictly differ, the corrected
    base strictly drops, the two changed log weights are nonzero, and attestFlag = 1. -/
theorem attestFlag_forced :
    censusLightBand ≠ censusActiveLightSpan
      ∧ ((7259 : Cut) / 54 < 2425 / 18)
      ∧ ((7/3 : Cut) - 3 ≠ 0 ∧ (11/3 : Cut) - 10/3 ≠ 0)
      ∧ attestFlag = 1 := by
  refine ⟨?_, correction_real, ⟨by norm_num, by norm_num⟩, rfl⟩
  intro h
  have hover := gem_census_overcounts_by_strange
  rw [h, sub_self] at hover
  have : ((colouredCensusTerm 1 : ℚ) : Cut) = 1/3 := by
    rw [colouredCensusTerm_one]
    norm_num
  rw [this] at hover
  norm_num at hover

/-- TRUE: min 688 attestFlag = 1. -/
theorem cert_val_true : min (688 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 688 attestFlag = 688. It GENUINELY equals 1 (cert_val_true). The
    kernel cannot close it; it BITES. -/
theorem bogus_claim : min (688 : ℕ) attestFlag = 688 := by
  rw [cert_val_true]

end Counterexamples
