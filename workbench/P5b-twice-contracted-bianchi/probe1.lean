import Phys.Algebra.SpacetimeDivergence

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-- A symmetric shear variation h_tx: (t,x,v) ↦ (x,t,0). This is EvC-self-adjoint (symmetric),
    unlike offDiagVar. Physical metric perturbations are symmetric. -/
def symShear : MetricEnd where
  toFun p := (p.2.1, p.1, 0)
  map_add' p q := by refine Prod.ext rfl (Prod.ext rfl ?_); simp
  map_smul' c p := by refine Prod.ext rfl (Prod.ext rfl ?_); simp

theorem symShear_apply (p : STVC) : symShear p = (p.2.1, p.1, 0) := rfl

/-- Metric-skewness predicate. -/
def IsBvCSkew (M : MetricEnd) : Prop := ∀ p q : STVC, BvC (M p) q + BvC p (M q) = 0

/-- TEST: is lbCurv timeProj symShear BvC-skew (metric-antisymmetric)? This is the Riemann
    second-pair antisymmetry R(a,b) ∈ so(BvC). -/
example : IsBvCSkew (lbCurv timeProj symShear) := by
  intro p q
  obtain ⟨t, x, v⟩ := p
  obtain ⟨t', x', v'⟩ := q
  rw [lbCurv_eq]
  show BvC (((4⁻¹ : Cut) • (sigOpC * timeProj * sigOpC * symShear
        - sigOpC * symShear * sigOpC * timeProj)) (t, x, v)) (t', x', v')
      + BvC (t, x, v) (((4⁻¹ : Cut) • (sigOpC * timeProj * sigOpC * symShear
        - sigOpC * symShear * sigOpC * timeProj)) (t', x', v')) = 0
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, symShear_apply, Prod.smul_fst, Prod.smul_snd,
    Prod.fst_sub, Prod.snd_sub, neg_zero, sub_zero, BvC]
  rw [smul_zero, gFormC_zero_left, gFormC_zero_right']
  simp only [smul_eq_mul]
  ring

/-- Is it NONZERO (non-vacuity for the skew Riemann)? -/
example : lbCurv timeProj symShear ≠ 0 := by
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((1:Cut),(0:Cut),(0:O Cut))).2.1) hcon
  rw [lbCurv_eq] at h
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, symShear_apply, Prod.smul_fst, Prod.smul_snd,
    LinearMap.zero_apply, Prod.fst_zero, Prod.snd_zero] at h
  norm_num at h

end

end Phys.Algebra
