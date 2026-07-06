import Phys.Algebra.SpacetimeCurvature
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra.ProbeN349

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- (A) fiber-trace no-go: identically zero
example (k₁ k₂ : MetricEnd) : LinearMap.trace Cut STVC (lbCurv k₁ k₂) = 0 := by
  unfold lbCurv
  rw [map_sub, LinearMap.trace_mul_comm, sub_self]

-- (B) Born self-overlap density
def bornCurv (p : STVC) (k₁ k₂ : MetricEnd) : Cut :=
  EvC (lbCurv k₁ k₂ p) (lbCurv k₁ k₂ p)

example (p : STVC) (k₁ k₂ : MetricEnd) : 0 ≤ bornCurv p k₁ k₂ := EvC_nonneg _

-- orientation independence: R(k₂,k₁) = −R(k₁,k₂) but the positive density is the same
example (p : STVC) (k₁ k₂ : MetricEnd) : bornCurv p k₁ k₂ = bornCurv p k₂ k₁ := by
  unfold bornCurv
  rw [lbCurv_antisymm k₁ k₂]
  simp only [LinearMap.neg_apply]
  rw [EvC_neg_right, EvC_symm (-(lbCurv k₂ k₁ p)), EvC_neg_right, neg_neg]

-- degenerate loop density = 0
example (p : STVC) (k : MetricEnd) : bornCurv p k k = 0 := by
  unfold bornCurv; rw [lbCurv_self]; simp only [LinearMap.zero_apply, EvC_zero_left]

-- positive-definiteness bridge
example (p : STVC) (k₁ k₂ : MetricEnd) :
    bornCurv p k₁ k₂ = 0 ↔ lbCurv k₁ k₂ p = 0 := by
  unfold bornCurv; exact EvC_eq_zero_iff _

-- (C) BITING: the concrete curvature vector is nonzero at (0,1,0)
example : lbCurv timeProj offDiagVar ((0:Cut),(1:Cut),(0:O Cut)) ≠ 0 := by
  intro hcon
  have h := congrArg (fun z : STVC => z.1) hcon
  simp only [Prod.fst_zero] at h
  rw [lbCurv_eq] at h
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero] at h
  exact (by norm_num : (4⁻¹ : Cut) • (1:Cut) ≠ 0) h

end

end Phys.Algebra.ProbeN349
