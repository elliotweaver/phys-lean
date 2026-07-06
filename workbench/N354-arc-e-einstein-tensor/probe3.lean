/-
  N354 probe3 — the einstein-raise is UNIQUE (forced by banked BvC_nondegenerate), analogous to
  ricciRaise_unique; and the full consolidated route + axiom check.
-/
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

/-- The einstein-raise relation. -/
def IsEinsteinRaise (G : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) : Prop :=
  ∀ Y Z : STVC, BvC Y (T Z) = einstein G Y Z

/-- UNIQUE — forced by banked BvC_nondegenerate. -/
theorem einsteinRaise_unique (G : STVC →ₗ[Cut] MetricEnd) (T T' : MetricEnd)
    (hT : IsEinsteinRaise G T) (hT' : IsEinsteinRaise G T') : T = T' := by
  refine LinearMap.ext fun Z => ?_
  have hZ : T Z - T' Z = 0 := by
    apply BvC_nondegenerate (T Z - T' Z)
    intro q; rw [BvC_symm, BvC_sub_right, hT q Z, hT' q Z, sub_self]
  exact sub_eq_zero.mp hZ

def einsteinRaiseMap (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd :=
  ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)

theorem einsteinRaiseMap_isRaise (G : STVC →ₗ[Cut] MetricEnd) :
    IsEinsteinRaise G (einsteinRaiseMap G) := by
  intro Y Z
  unfold einsteinRaiseMap einstein
  show BvC Y ((ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)) Z) = _
  rw [LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.id_apply, BvC_sub_right,
    ricciRaiseMap_isRaise G Y Z]
  congr 1
  rw [← BvCBilin_apply, map_smul, BvCBilin_apply, smul_eq_mul]

def einsteinScalar (G : STVC →ₗ[Cut] MetricEnd) : Cut :=
  LinearMap.trace Cut STVC (einsteinRaiseMap G)

/-- THE DIMENSION-FORCED TRACE-REVERSAL. -/
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

end Phys.Algebra
