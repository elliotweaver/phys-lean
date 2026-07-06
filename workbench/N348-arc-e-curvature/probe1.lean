import Phys.Algebra.SpacetimeConnection

namespace Phys.Algebra.ProbeCurv

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- The curvature = the two look-back transports failing to commute.
def lbCurv (k₁ k₂ : MetricEnd) : MetricEnd := lbConn k₁ * lbConn k₂ - lbConn k₂ * lbConn k₁

-- PROBE 1: the closed form.  lbConn k = 2⁻¹ • (sigOpC * k).
-- lbConn k₁ * lbConn k₂ = 4⁻¹ • (sigOpC*k₁*sigOpC*k₂).
example (k₁ k₂ : MetricEnd) :
    lbCurv k₁ k₂ = (4⁻¹ : Cut) • (sigOpC*k₁*sigOpC*k₂ - sigOpC*k₂*sigOpC*k₁) := by
  unfold lbCurv lbConn
  rw [smul_mul_smul_comm, smul_mul_smul_comm, ← smul_sub]
  congr 1
  · norm_num
  · noncomm_ring

-- PROBE 2: antisymmetry.
example (k₁ k₂ : MetricEnd) : lbCurv k₁ k₂ = - lbCurv k₂ k₁ := by
  unfold lbCurv; abel

-- PROBE 3: self = 0.
example (k : MetricEnd) : lbCurv k k = 0 := by
  unfold lbCurv; abel

-- PROBE 4: flat.
example (k : MetricEnd) : lbCurv 0 k = 0 := by
  unfold lbCurv; rw [lbConn_flat]; simp

end

end Phys.Algebra.ProbeCurv
