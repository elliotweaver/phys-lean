import Phys.Algebra.SpacetimeFieldEquationLHS
import Phys.Foundation.ContinuumExpDeriv

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- PROBE 1a: scalar family times a constant operator has operator-derivative = scalarDeriv • op.
-- We need: given CutHasDerivAt f df 0, then HasOpDerivAt0 (fun τ => f τ • A) (df • A).
-- CutHasDerivAt f df x := Tendsto (fun h => h⁻¹ * (f(x+h) - f x)) (𝓝[≠] 0) (𝓝 df)
-- At x=0: Tendsto (fun h => h⁻¹ * (f h - f 0)) (𝓝[≠] 0) (𝓝 df)
-- HasOpDerivAt0 H k := Tendsto (fun s => s⁻¹ • (H s - H 0)) (𝓝[≠] 0) (𝓝 k)

theorem scalarOp_opderiv (f : Cut → Cut) (df : Cut) (A : MetricEnd)
    (hf : CutHasDerivAt f df 0) :
    HasOpDerivAt0 (fun τ => f τ • A) (df • A) := by
  rw [hasOpDerivAt0_iff]
  intro v
  -- difference quotient of (fun τ => (f τ • A) v) = (f τ) • (A v)
  -- s⁻¹ • ((f s • A) v - (f 0 • A) v) = s⁻¹ • ((f s - f 0) • (A v)) = (s⁻¹ * (f s - f 0)) • (A v)
  have hcongr : (fun s : Cut => s⁻¹ • ((f s • A) v - (f 0 • A) v))
      = (fun s : Cut => (s⁻¹ * (f s - f 0)) • (A v)) := by
    funext s
    simp only [LinearMap.smul_apply]
    rw [mul_smul, ← sub_smul]
  rw [hcongr]
  -- (fun s => (s⁻¹*(f s - f 0)) • (A v)) → df • (A v)  since s⁻¹*(f s - f 0) → df (hf at 0)
  have hf0 : Tendsto (fun s : Cut => s⁻¹ * (f s - f 0)) (𝓝[≠] (0 : Cut)) (𝓝 df) := by
    have := hf
    unfold CutHasDerivAt at this
    simpa using this
  have hgoal : ((df • A) v) = df • (A v) := by rw [LinearMap.smul_apply]
  rw [hgoal]
  exact hf0.smul_const (A v)

end

end Phys.Algebra
