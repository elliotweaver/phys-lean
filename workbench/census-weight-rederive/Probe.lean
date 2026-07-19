import Phys.Algebra.ComposedFreezeoutDissolved

namespace Phys.Algebra.PerEdgeCensusProbe

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- corrected active-span census (light edge carries 5/3, the {u,d} content)
def censusAcrossLightEdge : Cut := ((bandCensus [2, 1] : ℚ) : Cut)

theorem censusAcrossLightEdge_val : censusAcrossLightEdge = 5 / 3 := by
  unfold censusAcrossLightEdge
  simp only [bandCensus, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    colouredCensusTerm_two, colouredCensusTerm_one]
  norm_num

-- the corrected gem (5/3 census on the confinement rung → 40/27, π cancels)
theorem gem_active : kappaLeading * (5 / 3) * (8 * cutPi / 3) = 40 / 27 := by
  rw [kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

-- the corrected dissolved form via the field_simp route
theorem dissolved_active :
    kappaLeading * (10 / 3) * cutLog (mbRatioDerived * (bMass 0 / bMass 2))
      + kappaLeading * 2 * cutLog (1 / mbRatioDerived)
      + kappaLeading * (5 / 3) * cutLog (downConfBundle * bMass 2)
    = 40 / 27
      + kappaLeading * (3 * cutLog mbRatioDerived + (10 / 3) * cutLog (bMass 0)
        - (5 / 3) * cutLog (bMass 2)) := by
  have hmb := mbRatioDerived_pos
  have hb0 := bMass0_pos
  have hb2 := bMass2_pos
  have hdcb := downConfBundle_pos
  rw [cutLog_mul hmb (by positivity), cutLog_div_pos hb0 hb2, cutLog_inv_pos hmb,
      cutLog_mul hdcb hb2, cutLog_downConfBundle, kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

end

end Phys.Algebra.PerEdgeCensusProbe
