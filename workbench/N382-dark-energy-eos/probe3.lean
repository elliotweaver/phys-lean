import Phys.Algebra.SpacetimeCovariantDerivative
import Phys.Foundation.ContinuumExpDeriv
import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

namespace ProbeN382b

example : AddCommMonoid STVC := by infer_instance
example : Module Cut STVC := by infer_instance

noncomputable def cosmoStress (Λ : Cut) : MetricEnd := Λ • sigOpC

-- density
example (Λ : Cut) : ((cosmoStress Λ) ((1:Cut),(0:Cut),(0:O Cut))).1 = Λ := by
  unfold cosmoStress
  rw [LinearMap.smul_apply, sigOpC_apply]
  simp

-- pressure
example (Λ : Cut) : ((cosmoStress Λ) ((0:Cut),(1:Cut),(0:O Cut))).2.1 = -Λ := by
  unfold cosmoStress
  rw [LinearMap.smul_apply, sigOpC_apply]
  simp

-- growth via mul_lt_mul_of_pos_left
example (H t₁ t₂ : Cut) (hH : 0 < H) (ht : t₁ < t₂) :
    cutExp (H * t₁) < cutExp (H * t₂) := by
  apply cutExp_strictMono
  exact mul_lt_mul_of_pos_left ht hH

-- covariant constancy re-export (does HSub on MetricEnd resolve here?)
example (Λ : Cut) (k : MetricEnd) :
    (Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 :=
  (cosmoTerm_covDeriv_zero Λ k).2

end ProbeN382b
