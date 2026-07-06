import Phys.Algebra.CosmoInflationPlateauExclusion
import Phys.Algebra.SterileNeutrinoDarkMatter

namespace Phys.Algebra.N365Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-! MEASURE: the arc-E return-surface (azimuthalTurn) normalization family closure.
    All coefficients DERIVED by composing banked identities (N328/N359/N361), never asserted. -/

-- (A) NEW Engine-A family members: each normalization = azimuthalTurn · (pure count)

theorem gaussSphere_azimuthal : gaussSphereSolidAngle = azimuthalTurn * 2 := by
  rw [gaussSphereSolidAngle_eq]; unfold azimuthalTurn; ring

theorem ehAction_azimuthal : ehActionInverseCoeff = azimuthalTurn * 8 := by
  rw [ehActionInverseCoeff_eq]; unfold azimuthalTurn; ring

-- bhEntropy M = gravCouplingCoeff·M²/2 = (azimuthalTurn·4)·M²/2 = azimuthalTurn·2·M²
theorem bhEntropy_azimuthal (M : Cut) : bhEntropy M = azimuthalTurn * 2 * M ^ 2 := by
  unfold bhEntropy; rw [gravCouplingCoeff_azimuthal]; ring

-- the Schwarzschild Hawking period = azimuthalTurn·4·M
theorem hawkingPeriod_sch_azimuthal (κsg M : Cut) (hM : M ≠ 0) (h : κsg = (4 * M)⁻¹) :
    hawkingPeriod κsg = azimuthalTurn * 4 * M := by
  rw [hawkingPeriod_schwarzschild κsg M hM h, gravCouplingCoeff_azimuthal]; ring

-- (B) the azimuthalTurn-FREE cross-locks (pure integers relate banked physical objects)

-- entropy ↔ fine-structure: locked by the pure integer 21 = 42/2, no cutPi in the coefficients
theorem bhEntropy_gauge_lock (M : Cut) :
    bhEntropy M * 21 = criticalPhaseNumerator * M ^ 2 := by
  rw [bhEntropy_azimuthal, numerator_azimuthal]; ring

-- Schwarzschild Hawking period ↔ fine-structure: pure integers 42, 4
theorem hawkingPeriod_gauge_lock (κsg M : Cut) (hM : M ≠ 0) (h : κsg = (4 * M)⁻¹) :
    hawkingPeriod κsg * 42 = criticalPhaseNumerator * 4 * M := by
  rw [hawkingPeriod_sch_azimuthal κsg M hM h, numerator_azimuthal]; ring

-- (C) W8 non-vacuity candidates: a WRONG count must fail
theorem bhEntropy_azimuthal_ne_three (M : Cut) (hM : M ≠ 0) :
    bhEntropy M ≠ azimuthalTurn * 3 * M ^ 2 := by
  rw [bhEntropy_azimuthal]
  have hpi := cutPi_pos
  have hM2 : 0 < M ^ 2 := by positivity
  intro hcon
  unfold azimuthalTurn at hcon
  nlinarith [hcon, hpi, hM2]

-- wrong integer in the lock (20 instead of 21) must fail
theorem bhEntropy_gauge_lock_ne_twenty (M : Cut) (hM : M ≠ 0) :
    bhEntropy M * 20 ≠ criticalPhaseNumerator * M ^ 2 := by
  rw [bhEntropy_azimuthal, numerator_azimuthal]
  have hpi := cutPi_pos
  have hM2 : 0 < M ^ 2 := by positivity
  intro hcon
  unfold azimuthalTurn at hcon
  nlinarith [hcon, hpi, hM2]

-- (D) confirm the banked Engine-B dark-matter representatives are in scope
example (M : Cut) : (heavyMajorana M).mulVec selfDir = M • selfDir :=
  heavyMajorana_selfDir_eigen M
example (D0 : Matrix (Fin 3) (Fin 3) Cut) : (othersProj * D0)ᵀ.mulVec selfDir = 0 :=
  dirac_others_self_blind D0

#print axioms bhEntropy_gauge_lock
#print axioms hawkingPeriod_gauge_lock
#print axioms bhEntropy_azimuthal_ne_three

end

end Phys.Algebra.N365Probe
