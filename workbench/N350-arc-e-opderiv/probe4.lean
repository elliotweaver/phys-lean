import Phys.Algebra.SpacetimeCurvatureScalar
import Phys.Algebra.LorentzContinuumOperatorTopology

namespace Phys.Algebra.ProbeN350d

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

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

-- UNIQUENESS of the operator derivative (T2 on STVC gives per-vector uniqueness → operator uniqueness)
theorem opderiv_unique {H : Cut → MetricEnd} {k₁ k₂ : MetricEnd}
    (h₁ : HasOpDerivAt0 H k₁) (h₂ : HasOpDerivAt0 H k₂) : k₁ = k₂ := by
  rw [hasOpDerivAt0_iff] at h₁ h₂
  apply LinearMap.ext
  intro v
  exact tendsto_nhds_unique (h₁ v) (h₂ v)

-- derivative of a constant field is 0
theorem const_opderiv (A : MetricEnd) : HasOpDerivAt0 (fun _ => A) 0 := by
  rw [hasOpDerivAt0_iff]; intro v
  apply Tendsto.congr' (f₁ := fun _ : Cut => (0:STVC)) _ tendsto_const_nhds
  filter_upwards with s
  simp only [sub_self, smul_zero]

-- SUM RULE: derivative is additive
theorem opderiv_add {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t + K t) (a + b) := by
  rw [hasOpDerivAt0_iff] at hH hK ⊢
  intro v
  have := (hH v).add (hK v)
  apply Tendsto.congr' _ this
  filter_upwards with s
  simp only [LinearMap.add_apply]
  rw [← smul_add]
  congr 1
  abel

end

end Phys.Algebra.ProbeN350d
