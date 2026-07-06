import Phys.Algebra.SpacetimeCurvatureScalar
import Phys.Algebra.LorentzContinuumOperatorTopology

namespace Phys.Algebra.ProbeN350b

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

example : ContinuousAdd STVC := inferInstance
example : ContinuousSMul Cut STVC := inferInstance

/-- The operator directional-derivative predicate at 0. -/
def HasOpDerivAt0 (H : Cut → MetricEnd) (k : MetricEnd) : Prop :=
  Tendsto (fun s : Cut => s⁻¹ • (H s - H 0)) (𝓝[≠] (0:Cut)) (𝓝 k)

theorem hasOpDerivAt0_iff (H : Cut → MetricEnd) (k : MetricEnd) :
    HasOpDerivAt0 H k ↔
      ∀ v, Tendsto (fun s : Cut => s⁻¹ • (H s v - H 0 v)) (𝓝[≠] (0:Cut)) (𝓝 (k v)) := by
  unfold HasOpDerivAt0
  have hcongr : ∀ v, (fun s : Cut => (s⁻¹ • (H s - H 0)) v)
      = (fun s : Cut => s⁻¹ • (H s v - H 0 v)) := by
    intro v; funext s; simp only [LinearMap.smul_apply, LinearMap.sub_apply]
  rw [nhds_induced, tendsto_comap_iff, tendsto_pi_nhds]
  constructor
  · intro h v; have := h v; rw [Function.comp_def] at this; rw [← hcongr v]; exact this
  · intro h v; rw [Function.comp_def, hcongr v]; exact h v

theorem affine_opderiv (A₀ A₁ : MetricEnd) :
    HasOpDerivAt0 (fun t => A₀ + t • A₁) A₁ := by
  rw [hasOpDerivAt0_iff]
  intro v
  apply Tendsto.congr' (f₁ := fun _ : Cut => A₁ v) _ tendsto_const_nhds
  filter_upwards [self_mem_nhdsWithin] with s hs
  have hs0 : s ≠ 0 := hs
  simp only [LinearMap.add_apply, LinearMap.smul_apply, zero_smul, add_zero]
  rw [show (A₀ v + s • A₁ v - A₀ v) = s • A₁ v by abel, smul_smul, inv_mul_cancel₀ hs0, one_smul]

theorem quadratic_opderiv (A₀ A₁ A₂ : MetricEnd) :
    HasOpDerivAt0 (fun t => A₀ + t • A₁ + t ^ 2 • A₂) A₁ := by
  rw [hasOpDerivAt0_iff]
  intro v
  apply Tendsto.congr' (f₁ := fun s : Cut => A₁ v + s • A₂ v)
  · filter_upwards [self_mem_nhdsWithin] with s hs
    have hs0 : s ≠ 0 := hs
    simp only [LinearMap.add_apply, LinearMap.smul_apply, zero_smul, add_zero]
    rw [show ((0:Cut))^2 = 0 by ring, zero_smul, add_zero]
    rw [show (A₀ v + s • A₁ v + s^2 • A₂ v - A₀ v) = s • A₁ v + s^2 • A₂ v by abel]
    rw [smul_add, smul_smul, inv_mul_cancel₀ hs0, one_smul]
    congr 1
    rw [smul_smul, show s^2 = s * s by ring, ← mul_assoc, inv_mul_cancel₀ hs0, one_mul]
  · have : Tendsto (fun s : Cut => A₁ v + s • A₂ v) (𝓝[≠] (0:Cut)) (𝓝 (A₁ v + (0:Cut) • A₂ v)) := by
      apply Tendsto.const_add
      exact ((continuous_id.smul continuous_const).tendsto (0:Cut)).mono_left nhdsWithin_le_nhds
    simpa using this

end

end Phys.Algebra.ProbeN350b
