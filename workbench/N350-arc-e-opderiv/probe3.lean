import Phys.Algebra.SpacetimeCurvatureScalar
import Phys.Algebra.LorentzContinuumOperatorTopology

namespace Phys.Algebra.ProbeN350c

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- MEASURE: is sigOpC continuous on STVC (product topology)?
example : Continuous (fun p : STVC => sigOpC p) := by
  simp only [sigOpC_apply]
  fun_prop

-- MEASURE: is any fixed Cut-linear endomorphism's application continuous? (probably NOT in general
-- without more; but sigOpC concretely is). Check timeProj / offDiagVar too.
example : Continuous (fun p : STVC => timeProj p) := by
  simp only [timeProj_apply]; fun_prop

/-- operator directional-derivative predicate at 0. -/
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

-- THE THEORY-NATIVE HEART: the look-back transport commutes with the directional derivative.
-- ∂_λ (lbConn (H λ)) = lbConn (∂_λ H)  — the derivative of the transport = transport of the derivative.
theorem lbConn_opderiv {H : Cut → MetricEnd} {k : MetricEnd} (h : HasOpDerivAt0 H k) :
    HasOpDerivAt0 (fun t => lbConn (H t)) (lbConn k) := by
  rw [hasOpDerivAt0_iff] at h ⊢
  intro v
  -- per-vector: (lbConn (H s)) v = 2⁻¹ • sigOpC (H s v)
  have hpt : ∀ (g : MetricEnd) (w : STVC), (lbConn g) w = (2⁻¹ : Cut) • sigOpC (g w) := by
    intro g w; unfold lbConn
    simp only [LinearMap.smul_apply, Module.End.mul_apply]
  -- reduce to: s⁻¹ • (2⁻¹ • sigOpC (H s v) - 2⁻¹ • sigOpC (H 0 v)) → 2⁻¹ • sigOpC (k v)
  have hce : (fun s : Cut => s⁻¹ • ((lbConn (H s)) v - (lbConn (H 0)) v))
      = (fun s : Cut => (2⁻¹ : Cut) • sigOpC (s⁻¹ • (H s v - H 0 v))) := by
    funext s
    rw [hpt, hpt, ← smul_sub, ← map_sub sigOpC, map_smul, smul_comm]
  rw [hce]
  -- lbConn k v = 2⁻¹ • sigOpC (k v)
  have hkv : (lbConn k) v = (2⁻¹ : Cut) • sigOpC (k v) := hpt k v
  rw [hkv]
  -- limit: sigOpC continuous, scalar mult continuous
  have hsig : Continuous (fun p : STVC => sigOpC p) := by simp only [sigOpC_apply]; fun_prop
  have hcomp := (hsig.tendsto (k v)).comp (h v)
  have := (hcomp.const_smul (2⁻¹ : Cut))
  simpa [Function.comp_def] using this

end

end Phys.Algebra.ProbeN350c
