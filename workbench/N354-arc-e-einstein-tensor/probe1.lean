/-
  N354 probe1 — MEASURE the Einstein tensor G_μν = Ric_μν − ½ R g_μν on the banked derived objects,
  and its metric trace-reversal. KEY QUESTION (theory-native, measured BEFORE assuming): the textbook
  trace-reversal g^μν G_μν = R(1 − d/2) = −R takes d=4. Our carrier is the DERIVED (1,9) STVC with
  finrank_STVC = 10 (banked). Does the trace-reversal factor come out 1 − dim/2 with dim FORCED by the
  banked finrank? MEASURE.
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

/-- THE EINSTEIN TENSOR as a rank-(0,2) form: G(Y,Z) = Ric(Y,Z) − ½·R·g(Y,Z). -/
def einstein (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  ricci G Y Z - (2⁻¹ * ricciScalar G) * BvC Y Z

/-- The metric-raised Einstein endomorphism: raise(Ric) − ½R·id (the raise of g IS id). -/
def einsteinRaiseMap (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd :=
  ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)

/-- The raise satisfies BvC Y (T Z) = einstein G Y Z (well-defined raise). -/
theorem einsteinRaiseMap_isRaise (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) :
    BvC Y (einsteinRaiseMap G Z) = einstein G Y Z := by
  unfold einsteinRaiseMap einstein
  show BvC Y ((ricciRaiseMap G - (2⁻¹ * ricciScalar G) • (LinearMap.id : MetricEnd)) Z) = _
  rw [LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.id_apply]
  rw [BvC_sub_right]
  rw [ricciRaiseMap_isRaise G Y Z]
  congr 1
  -- BvC Y ((2⁻¹R) • Z) = (2⁻¹R) * BvC Y Z
  rw [← BvCBilin_apply]
  rw [map_smul]
  rw [BvCBilin_apply]
  rw [smul_eq_mul]

/-- THE EINSTEIN SCALAR trace (of the raised Einstein endomorphism). -/
def einsteinScalar (G : STVC →ₗ[Cut] MetricEnd) : Cut :=
  LinearMap.trace Cut STVC (einsteinRaiseMap G)

/-- ★★★ THE TRACE-REVERSAL — dimension-forced. trace(raised G) = R − ½·(finrank STVC)·R.
    The raise of the metric g IS the identity, whose trace is the DERIVED spacetime dimension
    finrank_STVC = 10 (banked). So the trace-reversal factor is 1 − dim/2, FORCED by the derived
    (1,9) carrier — NOT the d=4 textbook −1. -/
theorem einstein_traceReversal (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G = ricciScalar G - 2⁻¹ * (Module.finrank Cut STVC : Cut) * ricciScalar G := by
  unfold einsteinScalar einsteinRaiseMap ricciScalar
  rw [map_sub, map_smul]
  rw [LinearMap.trace_id, smul_eq_mul]
  ring

/-- The trace-reversal value on the derived carrier (finrank STVC = 10): trace(raised G) = −4·R. -/
theorem einstein_traceReversal_value (G : STVC →ₗ[Cut] MetricEnd) :
    einsteinScalar G = -(4 : Cut) * ricciScalar G := by
  rw [einstein_traceReversal, finrank_STVC]
  push_cast
  ring

/-- Concrete: einsteinScalar solderWit = −4·(−¼) = 1. -/
theorem einsteinScalar_solder : einsteinScalar solderWit = (1 : Cut) := by
  rw [einstein_traceReversal_value, ricciScalar_solder]
  norm_num

/-- W8 non-vacuity: the Einstein scalar is nonzero. -/
theorem einsteinScalar_solder_ne_zero : einsteinScalar solderWit ≠ 0 := by
  rw [einsteinScalar_solder]; norm_num

end

end Phys.Algebra
