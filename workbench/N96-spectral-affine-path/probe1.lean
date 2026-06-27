import Phys.Algebra.LorentzContinuumResolutionId

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section
open scoped BigOperators

/-- The affine spectral path operator: eigenvalues move along the straight segment
    `(1−t)·1 + t·cutSqrt(c i)`. -/
def specPathOp {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) (t : Cut) : Module.End Cut STVC :=
  specOpN (fun i => (1 - t) * 1 + t * cutSqrt (c i)) u

-- endpoint t = 0 : the identity (via resolution of identity)
theorem specPathOp_zero {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC)) :
    specPathOp c u 0 = (LinearMap.id : Module.End Cut STVC) := by
  unfold specPathOp
  have : (fun i => (1 - (0:Cut)) * 1 + (0:Cut) * cutSqrt (c i)) = (fun _ => (1:Cut)) := by
    funext i; ring
  rw [this, specOpN_one_eq_sum_projC, hres]

-- endpoint t = 1 : the spectral square root p^{1/2} = specOpN (cutSqrt∘c) u
theorem specPathOp_one {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC} :
    specPathOp c u 1 = specOpN (fun i => cutSqrt (c i)) u := by
  unfold specPathOp
  congr 1
  funext i; ring

-- self-adjoint for every t
theorem specPathOp_isEvCSymm {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) (t : Cut) :
    IsEvCSymm (specPathOp c u t) :=
  specOpN_isEvCSymm _ _

-- positive-semidefinite for t ∈ [0,1] and c ≥ 0 (the cone segment)
theorem specPathOp_nonneg {n : ℕ} {c : Fin n → Cut} (hc : ∀ i, 0 ≤ c i)
    (u : Fin n → STVC) {t : Cut} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) (p : STVC) :
    0 ≤ EvC (specPathOp c u t p) p := by
  unfold specPathOp
  apply specOpN_nonneg ?_ u p
  intro i
  have h1 : 0 ≤ 1 - t := by linarith
  have h2 : 0 ≤ cutSqrt (c i) := cutSqrt_nonneg (c i)
  have : (1 - t) * 1 + t * cutSqrt (c i) = (1 - t) + t * cutSqrt (c i) := by ring
  rw [this]
  have := mul_nonneg ht0 h2
  linarith

-- the t=1 endpoint is the banked positive operator square root of p = specOpN c u
theorem specPathOp_one_isOpSqrt {n : ℕ} {c : Fin n → Cut} (hc : ∀ i, 0 ≤ c i)
    {u : Fin n → STVC} (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) :
    IsEvCOpSqrt (specPathOp c u 1) (specOpN c u) := by
  rw [specPathOp_one]
  exact specOpN_op_sqrt hc horth

end

end Phys.Algebra
