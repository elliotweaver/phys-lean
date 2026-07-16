import Phys.Algebra.ParityMirrorObstruction
import Phys.Algebra.DimensionSelection
import Phys.Algebra.TowerGatherObstructionUnification
import Phys.Quantum.TsirelsonBound
import Phys.Quantum.CPTInvolutionWeld
import Phys.Quantum.RadiationArrow
import Phys.Algebra.EmergentQuantization
import Mathlib.Tactic

namespace Phys.Algebra.ArcQProbe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ
open Module

attribute [local instance] CD.narCD CD.srCD

/- ===== SPINE A: the one associator ===== -/

-- Q1 parity block ⟺ Q7 non-arena (the marquee fifth-face weld, NEW cross-tie)
theorem parity_block_iff_nonarena :
    (¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
      ↔ ¬ CoherentArena (CD (H ℚ)) := by
  rw [parity_mirror_is_fifth_face, ← confinement_is_obstruction,
      ← nonarena_iff_confines (CD (H ℚ))]

-- I confinement ∧ Q1 parity ∧ Q7 non-arena all ⟺ AssocLocusNonempty
theorem associator_spine_three_arcQ_faces :
    (SectorConfines (O ℚ) ↔ AssocLocusNonempty)
    ∧ ((¬ ∀ a b : O ℚ, (LeftMul a).comp (RightMul b) = (RightMul b).comp (LeftMul a))
        ↔ AssocLocusNonempty)
    ∧ (¬ CoherentArena (CD (H ℚ)) ↔ AssocLocusNonempty) :=
  ⟨confinement_is_obstruction,
   parity_mirror_is_fifth_face,
   (nonarena_iff_confines (CD (H ℚ))).trans confinement_is_obstruction⟩

/- ===== SPINE B: the one doubled fibre ===== -/

-- Q3 Tsirelson ceiling AND Q9 flux quantum ride the SAME banked fibre dim 2 (NEW cross-tie)
theorem tsirelson_flux_share_fibre_dim (h : azimuthalTurn ≠ 0) :
    finrank Cut Phys.Quantum.StateFibre = 2
    ∧ Phys.Quantum.tsirelsonBound * Phys.Quantum.tsirelsonBound
        = 4 * ((finrank Cut Phys.Quantum.StateFibre : ℤ) : Cut)
    ∧ ((finrank Cut Phys.Quantum.StateFibre : ℤ) : Cut)
        * Phys.Algebra.EmergentQuant.emergentPairFlux = azimuthalTurn := by
  refine ⟨Phys.Quantum.fibre_finrank, ?_, ?_⟩
  · rw [Phys.Quantum.fibre_finrank, Phys.Quantum.tsirelsonBound_sq]; norm_num
  · exact Phys.Algebra.EmergentQuant.pair_doubles_flux h

end Phys.Algebra.ArcQProbe
