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

theorem scalarOp_opderiv (f : Cut → Cut) (df : Cut) (A : MetricEnd)
    (hf : CutHasDerivAt f df 0) :
    HasOpDerivAt0 (fun τ => f τ • A) (df • A) := by
  rw [hasOpDerivAt0_iff]
  intro v
  have hcongr : (fun s : Cut => s⁻¹ • ((f s • A) v - (f 0 • A) v))
      = (fun s : Cut => (s⁻¹ * (f s - f 0)) • (A v)) := by
    funext s; simp only [LinearMap.smul_apply]; rw [mul_smul, ← sub_smul]
  rw [hcongr]
  have hf0 : Tendsto (fun s : Cut => s⁻¹ * (f s - f 0)) (𝓝[≠] (0 : Cut)) (𝓝 df) := by
    have := hf; unfold CutHasDerivAt at this; simpa using this
  have hgoal : ((df • A) v) = df • (A v) := by rw [LinearMap.smul_apply]
  rw [hgoal]; exact hf0.smul_const (A v)

-- opderiv_sub via add + negation. Build a neg lemma first.
theorem opderiv_neg {H : Cut → MetricEnd} {a : MetricEnd}
    (hH : HasOpDerivAt0 H a) : HasOpDerivAt0 (fun t => - H t) (-a) := by
  rw [hasOpDerivAt0_iff] at hH ⊢
  intro v
  refine Tendsto.congr' ?_ ((hH v).neg)
  filter_upwards with s
  simp only [LinearMap.neg_apply]
  rw [← smul_neg]; congr 1; abel

theorem opderiv_sub {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t - K t) (a - b) := by
  have := opderiv_add hH (opderiv_neg hK)
  simp only [sub_eq_add_neg]
  exact this

-- (D) THE EINSTEIN-FIELD COVARIANT-DERIVATIVE SPLIT.
-- Model: Ric : Cut → MetricEnd (Ricci endo field), Rs : Cut → Cut (scalar curv field),
-- Einstein field E τ = Ric τ - (2⁻¹ * Rs τ) • id.
-- Derivative face: HasOpDerivAt0 E (dRic - (2⁻¹*dRs)•id).
theorem einstein_field_opderiv (Ric : Cut → MetricEnd) (dRic : MetricEnd)
    (Rs : Cut → Cut) (dRs : Cut)
    (hRic : HasOpDerivAt0 Ric dRic) (hRs : CutHasDerivAt Rs dRs 0) :
    HasOpDerivAt0 (fun τ => Ric τ - (2⁻¹ * Rs τ) • (LinearMap.id : MetricEnd))
      (dRic - (2⁻¹ * dRs) • (LinearMap.id : MetricEnd)) := by
  -- the metric term family: (fun τ => (2⁻¹ * Rs τ) • id) has deriv (2⁻¹ * dRs)•id
  have hmetric : HasOpDerivAt0 (fun τ => (2⁻¹ * Rs τ) • (LinearMap.id : MetricEnd))
      ((2⁻¹ * dRs) • (LinearMap.id : MetricEnd)) := by
    have hf : CutHasDerivAt (fun τ => 2⁻¹ * Rs τ) (2⁻¹ * dRs) 0 := by
      -- 2⁻¹ * Rs is a const_mul of Rs; use Tendsto.const_mul
      unfold CutHasDerivAt at hRs ⊢
      have := hRs.const_mul (2⁻¹ : Cut)
      refine Tendsto.congr' ?_ this
      filter_upwards with h
      ring
    exact scalarOp_opderiv _ _ _ hf
  exact opderiv_sub hRic hmetric

end

end Phys.Algebra
