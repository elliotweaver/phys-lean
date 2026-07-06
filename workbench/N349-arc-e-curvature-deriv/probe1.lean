import Phys.Algebra.SpacetimeCurvature
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- MEASURE 1: does LinearMap.trace Cut STVC even elaborate? (needs Module.Free + Module.Finite findable)
example (f : MetricEnd) : Cut := LinearMap.trace Cut STVC f

-- MEASURE 2: trace of any commutator = 0  (the plain scalar-curvature reading is forced to zero)
example (k₁ k₂ : MetricEnd) : LinearMap.trace Cut STVC (lbCurv k₁ k₂) = 0 := by
  unfold lbCurv
  rw [map_sub, LinearMap.trace_mul_comm, sub_self]

-- MEASURE 3: is EvC pointwise positivity (Born self-overlap) available and does it apply to lbCurv output?
-- EvC_nonneg : 0 ≤ EvC p p   (banked N58)
example (k₁ k₂ : MetricEnd) (p : STVC) : (0 : Cut) ≤ EvC (lbCurv k₁ k₂ p) (lbCurv k₁ k₂ p) :=
  EvC_nonneg _

-- MEASURE 4: flat-vanishing of the Born self-overlap of curvature
example (k : MetricEnd) (p : STVC) : EvC (lbCurv 0 k p) (lbCurv 0 k p) = 0 := by
  rw [lbCurv_flat_left]
  simp

end

end Phys.Algebra
