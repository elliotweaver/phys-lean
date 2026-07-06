/- PROBE2: N346 E1a on Module.End Cut STVC, η = banked sigOpC. -/
import Phys.Algebra.LorentzContinuumMetricCondition
import Mathlib.Tactic

namespace Probe346b

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

abbrev E : Type := Module.End Cut STVC

-- η := banked sigOpC, involutive (banked sigOpC_comp_self). As a ring element: η*η = 1.
theorem eta_mul_self : (sigOpC * sigOpC : E) = 1 := by
  rw [Module.End.mul_eq_comp, sigOpC_comp_self, Module.End.one_eq_id]

-- general ring residual identity
theorem residual_identity {R : Type} [Ring R] (η h : R) (hη : η * η = 1) :
    (η + h) * (η - η * h * η) = 1 - (h * η) * (h * η) := by
  have e1 : (η + h) * (η - η * h * η)
      = η * η - η * η * h * η + h * η - h * η * h * η := by noncomm_ring
  rw [e1, hη]; noncomm_ring

def weakMetric (h : E) : E := sigOpC + h
def linInv (h : E) : E := sigOpC - sigOpC * h * sigOpC

theorem metric_linearized_inverse (h : E) :
    weakMetric h * linInv h = 1 - (h * sigOpC) * (h * sigOpC) := by
  unfold weakMetric linInv
  exact residual_identity sigOpC h eta_mul_self

-- flat limit: h = 0 ⟹ residual 0
theorem flat_limit : weakMetric 0 * linInv 0 = 1 := by
  rw [metric_linearized_inverse]; simp

-- metric EvC-self-adjoint for EvC-self-adjoint h (η is banked self-adjoint)
theorem weakMetric_selfAdjoint {h : E} (hh : IsEvCAdjoint h h) :
    IsEvCAdjoint (weakMetric h) (weakMetric h) := by
  intro p q
  unfold weakMetric
  simp only [LinearMap.add_apply]
  rw [EvC_add_left, EvC_add_right]
  rw [sigOpC_isEvCAdjoint_self p q, hh p q]

/-! W8 non-vacuity: concrete field h = timeProj (projection to time axis), residual ≠ 0. -/

def timeProj : E where
  toFun p := (p.1, 0, 0)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show (0:Cut) = 0 + 0; ring
    · show (0:O Cut) = 0 + 0; rw [add_zero]
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show (0:Cut) = c • 0; rw [smul_zero]
    · show (0:O Cut) = c • 0; rw [smul_zero]

theorem timeProj_apply (p : STVC) : timeProj p = (p.1, 0, 0) := rfl

-- timeProj ∘ sigOpC = timeProj  (sigOpC keeps the time component)
theorem timeProj_comp_sigOpC : (timeProj * sigOpC : E) = timeProj := by
  rw [Module.End.mul_eq_comp]; apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, sigOpC_apply, timeProj_apply]

-- timeProj idempotent
theorem timeProj_idem : (timeProj * timeProj : E) = timeProj := by
  rw [Module.End.mul_eq_comp]; apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, timeProj_apply]

-- (timeProj*sigOpC)² = timeProj ≠ 0, so residual ≠ 0, so g*ǧ ≠ 1
theorem timeProj_ne_zero : (timeProj : E) ≠ 0 := by
  intro hcon
  have h := congrArg (fun (f:E) => (f ((1:Cut),0,0)).1) hcon
  simp only [timeProj_apply, LinearMap.zero_apply] at h
  -- h : (1:Cut) = 0
  exact one_ne_zero h

theorem residual_ne_zero : (timeProj * sigOpC : E) * (timeProj * sigOpC) ≠ 0 := by
  rw [timeProj_comp_sigOpC, timeProj_idem]
  exact timeProj_ne_zero

theorem metric_inverse_not_exact :
    weakMetric timeProj * linInv timeProj ≠ 1 := by
  rw [metric_linearized_inverse]
  intro hcon
  exact residual_ne_zero (sub_eq_self.mp hcon)

-- residual evaluated at e0 = (1,0,0): time component drops to 0 (the costume tie)
def e0 : STVC := ((1:Cut), 0, 0)
theorem residual_time_zero :
    ((weakMetric timeProj * linInv timeProj) e0).1 = 0 := by
  rw [metric_linearized_inverse, timeProj_comp_sigOpC, timeProj_idem]
  simp only [LinearMap.sub_apply, Module.End.one_apply, timeProj_apply, e0,
    sub_self, Prod.fst_zero]

end
end Probe346b
