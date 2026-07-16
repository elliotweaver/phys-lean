import Phys.Algebra.ConfinementHadronicMass
import Phys.Algebra.FineStructureZeroMomentum

namespace Phys.Algebra.X9Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- The confinement scale × the shared coupling-tower edge = Λ/v. -/
def confBundle : Cut := confinementScaleRatio * topBandRatio

/-- CRUX 1: confBundle = cutExp(−8π/3). -/
theorem confBundle_eq : confBundle = cutExp (-(8 * cutPi / 3)) := by
  unfold confBundle
  rw [confinementScaleRatio_eq, topBandRatio_eq, cutExp_add]
  congr 1
  ring

/-- CRUX 2: the rung gap identity. -/
theorem rung_gap_eq : (12 * cutPi) - (28 * cutPi / 3) = 8 * cutPi / 3 := by ring

/-- CRUX 3: confBundle = Λ/M ÷ v/M (ratio reading). -/
theorem confBundle_eq_confToEw :
    confBundle = confinementScaleRatio / ewClosureRatio := by
  unfold confBundle
  rw [topBandRatio]
  rw [div_eq_mul_inv]

/-- CRUX 4: confinementScaleRatio = ewClosureRatio * confBundle (edge factoring). -/
theorem confinement_eq_edge_bundle :
    confinementScaleRatio = ewClosureRatio * confBundle := by
  unfold confBundle
  rw [topBandRatio]
  have hne : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  field_simp

/-- CRUX 5: strict suppression below the edge. -/
theorem confBundle_lt_one : confBundle < 1 := by
  rw [confBundle_eq]
  have hneg : -(8 * cutPi / 3) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

/-- CRUX 6: positivity. -/
theorem confBundle_pos : 0 < confBundle := by
  rw [confBundle_eq]; exact cutExp_pos _

end

end Phys.Algebra.X9Probe
