import Phys.Algebra.SpacetimeRicciScalar
import Phys.Algebra.LorentzContinuumGenerationSO8FinrankTower

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def einstein (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  ricci G Y Z - (2⁻¹ * ricciScalar G) * BvC Y Z

def einsteinRaiseMap (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd :=
  ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)

def einsteinScalar (G : STVC →ₗ[Cut] MetricEnd) : Cut :=
  LinearMap.trace Cut STVC (einsteinRaiseMap G)

theorem einstein_traceReversal (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G = ricciScalar G - 2⁻¹ * (Module.finrank Cut STVC : Cut) * ricciScalar G := by
  unfold einsteinScalar einsteinRaiseMap ricciScalar
  rw [map_sub, map_smul, LinearMap.trace_id, smul_eq_mul]; ring

theorem einstein_traceReversal_value (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G = -(4 : Cut) * ricciScalar G := by
  rw [einstein_traceReversal, finrank_STVC]; push_cast; ring

theorem einsteinScalar_solder : einsteinScalar solderWit = (1 : Cut) := by
  rw [einstein_traceReversal_value, ricciScalar_solder]; norm_num

end

#print axioms einstein_traceReversal
#print axioms einstein_traceReversal_value
#print axioms einsteinScalar_solder

end Phys.Algebra
