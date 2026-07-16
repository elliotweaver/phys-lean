import Phys.Algebra.SpacetimeCovariantDivergence
import Phys.Algebra.SpacetimeRicciScalar
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

def divCov (Φ : STVC →ₗ[Cut] MetricEnd) (ν : STVC) : Cut :=
  LinearMap.trace Cut STVC ((LinearMap.applyₗ ν).comp Φ)

def skewWit : STVC →ₗ[Cut] MetricEnd :=
  (xFun).smulRight timeProj

theorem skewWit_apply (w : STVC) : skewWit w = w.2.1 • timeProj := by
  show xFun w • timeProj = _; rw [xFun_apply]

/-- MEASURE: divCov skewWit ν = 0 for ALL ν (off-diagonal soldered-divergence-free). -/
theorem skewWit_divCov_zero (ν : STVC) : divCov skewWit ν = 0 := by
  unfold divCov skewWit
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp ((xFun).smulRight timeProj)
      = xFun.smulRight (timeProj ν) from by
    refine LinearMap.ext fun w => ?_
    simp only [LinearMap.comp_apply, LinearMap.applyₗ_apply_apply, LinearMap.smulRight_apply,
      LinearMap.smul_apply]]
  rw [LinearMap.trace_smulRight, xFun_apply, timeProj_apply]

/-- skewWit is NONZERO (non-vacuity). -/
theorem skewWit_ne_zero : skewWit ≠ 0 := by
  intro hcon
  have h : (skewWit ((0:Cut),(1:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))).1
      = ((0 : STVC →ₗ[Cut] MetricEnd) ((0:Cut),(1:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))).1 := by
    rw [hcon]
  rw [skewWit_apply] at h
  simp only [timeProj_apply, LinearMap.smul_apply, LinearMap.zero_apply, Prod.smul_fst,
    Prod.fst_zero, smul_eq_mul] at h
  norm_num at h

#check @skewWit_divCov_zero

end

end Phys.Algebra
