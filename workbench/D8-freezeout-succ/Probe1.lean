import Phys.Algebra.GenerationMassRatiosNumeric
import Phys.Algebra.SubBandCompletion
import Phys.Algebra.OctonionJordanGenerationCyclePhaseLineIndependence
import Mathlib.Tactic

namespace Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios

noncomputable section

/-- The shared shape amplitudes (banked N340) as a Fin 3 vector. -/
def bShape : Fin 3 → Cut := ![b0, b1, b2]

/-- A sector's scaled amplitude at the shared derived phase: `scale · shapeₖ`. -/
def sectorAmp (M : Cut) (k : Fin 3) : Cut := M * bShape k

/-- The sector's Born-square masses. -/
def sectorMass (M : Cut) (k : Fin 3) : Cut := (sectorAmp M k) ^ 2

-- scale factoring
theorem sectorMass_eq (M : Cut) (k : Fin 3) : sectorMass M k = M ^ 2 * (bShape k) ^ 2 := by
  unfold sectorMass sectorAmp; ring

-- sectorMass 1 = the banked masses
theorem sectorMass_one : sectorMass 1 0 = mass0 ∧ sectorMass 1 1 = mass1 ∧ sectorMass 1 2 = mass2 := by
  refine ⟨?_, ?_, ?_⟩ <;>
    (unfold sectorMass sectorAmp bShape; simp; unfold mass0 mass1 mass2; ring)

-- within-sector ratio scale-independence (cross-mult form)
theorem withinSector_ratio_indep (M : Cut) (i j : Fin 3) :
    sectorMass M i * sectorMass 1 j = sectorMass M j * sectorMass 1 i := by
  rw [sectorMass_eq, sectorMass_eq, sectorMass_eq, sectorMass_eq]; ring

-- cross-sector scale witness: Mu=2, Md=1 gives factor 4
theorem crossSector_scale_witness (i : Fin 3) : sectorMass 2 i = 4 * sectorMass 1 i := by
  rw [sectorMass_eq, sectorMass_eq]; ring

-- within-sector ratios are the banked lepton numerals (at scale M ≠ 0)
theorem withinSector_ratios_lepton (M : Cut) (hM : M ≠ 0) :
    (483 : Cut) / 100000 * sectorMass M 2 ≤ sectorMass M 1
    ∧ sectorMass M 1 ≤ (485 : Cut) / 100000 * sectorMass M 2 := by
  have hM2 : (0 : Cut) < M ^ 2 := by positivity
  have h1 := massRatio_1_2
  rw [sectorMass_eq, sectorMass_eq]
  have hb1 : (bShape 1) ^ 2 = mass1 := by unfold bShape; simp [mass1]
  have hb2 : (bShape 2) ^ 2 = mass2 := by unfold bShape; simp [mass2]
  rw [hb1, hb2]
  constructor
  · have := h1.1; nlinarith [this, hM2]
  · have := h1.2; nlinarith [this, hM2]

end
end Probe
