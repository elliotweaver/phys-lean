import Phys.Algebra.SpacetimeEinsteinTensor
import Phys.Algebra.ScaleTowerNumeratorLock

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- the spin-2 trace-reversal coefficient (the ½ in the banked einsteinRaiseMap, N354)
def einsteinTraceReversalCoeff : Cut := 2⁻¹

-- HOMED: it IS the coefficient in the banked einstein_traceReversal (N354)
theorem einsteinTraceReversalCoeff_homed (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G
      = ricciScalar G - einsteinTraceReversalCoeff * (Module.finrank Cut STVC : Cut) * ricciScalar G := by
  unfold einsteinTraceReversalCoeff; exact einstein_traceReversal G

-- κ/G = (½)⁻¹ · (4π flux)
def gravCouplingCoeff : Cut := einsteinTraceReversalCoeff⁻¹ * gaussSphereSolidAngle

theorem gravCouplingCoeff_eq : gravCouplingCoeff = 8 * cutPi := by
  unfold gravCouplingCoeff einsteinTraceReversalCoeff
  rw [gaussSphereSolidAngle_eq]
  rw [inv_inv]; ring

theorem gravCouplingCoeff_two_flux : gravCouplingCoeff = 2 * gaussSphereSolidAngle := by
  unfold gravCouplingCoeff einsteinTraceReversalCoeff
  rw [inv_inv]

theorem gravCouplingCoeff_flux_factor :
    gravCouplingCoeff = einsteinTraceReversalCoeff⁻¹ * gaussSphereSolidAngle := rfl

-- MOAT: both are azimuthalTurn multiples
theorem gravCouplingCoeff_azimuthal : gravCouplingCoeff = azimuthalTurn * 4 := by
  rw [gravCouplingCoeff_eq]; unfold azimuthalTurn; ring

theorem numerator_azimuthal : criticalPhaseNumerator = azimuthalTurn * 42 := by
  rw [criticalPhaseNumerator_eq]; unfold azimuthalTurn; ring

theorem gravAndGauge_share_azimuthalTurn :
    gravCouplingCoeff = azimuthalTurn * 4
      ∧ criticalPhaseNumerator = azimuthalTurn * 42
      ∧ criticalPhaseNumerator = 21 * gravCouplingCoeff := by
  refine ⟨gravCouplingCoeff_azimuthal, numerator_azimuthal, ?_⟩
  rw [criticalPhaseNumerator_eq, gravCouplingCoeff_eq]; ring

theorem gravCouplingCoeff_pos : 0 < gravCouplingCoeff := by
  rw [gravCouplingCoeff_eq]; have := cutPi_pos; linarith

-- EH action normalization 1/(16πG)
def ehActionInverseCoeff : Cut := 2 * gravCouplingCoeff

theorem ehActionInverseCoeff_eq : ehActionInverseCoeff = 16 * cutPi := by
  unfold ehActionInverseCoeff; rw [gravCouplingCoeff_eq]; ring

-- W8: the careful measurement — the κ-factor 2 is NOT the dimension-dependent trace-value −4
theorem kappa_two_ne_traceValue :
    einsteinTraceReversalCoeff⁻¹
      ≠ (1 - einsteinTraceReversalCoeff * (Module.finrank Cut STVC : Cut)) := by
  unfold einsteinTraceReversalCoeff; rw [finrank_STVC]
  rw [inv_inv]; push_cast; norm_num

-- W8: the trace-reversal 2 is load-bearing (8π ≠ 4π)
theorem gravCouplingCoeff_ne_flux : gravCouplingCoeff ≠ gaussSphereSolidAngle := by
  rw [gravCouplingCoeff_eq, gaussSphereSolidAngle_eq]
  have := cutPi_pos; intro h; nlinarith [this]

end

end Phys.Algebra
