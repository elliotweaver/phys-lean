/-
  Phys.Algebra.LorentzContinuumSpectralPath — N96: THE AFFINE SPECTRAL PATH — the positive
  (boost/self-adjoint) part of a polar/KAK decomposition is connected to the identity through the
  CONE OF POSITIVE OPERATORS by a STRAIGHT-LINE eigenvalue segment, over the DERIVED ℝ `Cut` and
  the terminal algebra `O Cut := CD (H Cut)`.

  ===========================================================================
  THE FORWARD FRONTIER (N96) is CONNECTEDNESS OF THE ISOMETRY GROUP OVER `Cut` → THE GLOBAL
  REVERSE KAK SURJECTIVITY → THE `Spin(9)→SO(9)` EXHAUSTION. N93 banked the operator-level
  polar/KAK split `g = k·p^{1/2}` with BOTH factors isometries; N94/N95 banked the concrete
  `biMulFun` 2-plane rotations. The ONE missing piece toward the global reverse surjectivity is
  the TOPOLOGY: that the positive part `p^{1/2}` is connected to the identity by a one-parameter
  path.

  MEASURE-FIRST (N96 priority (i)) found a CONTINUOUS real power `(c i)^t` over `Cut`
  (`cutRpow`/`cutPow`/operator-`exp`) to be GENUINELY MISSING, and NO operator topology over
  `Cut` (`TopologicalSpace (Module.End)`/`ContinuousLinearMap`) — the literal topological
  connectedness of the operator group is the W1 HEAVY remainder (childed N97). But the difficulty
  DISSOLVES through the trunk: the literature connects `p^{1/2}` to `id` via the operator
  EXPONENTIAL of the self-adjoint generator (`exp(t·log p^{1/2})` — the transcendental rapidity
  flow), which needs the missing continuous power. Because the spectral operator
  `specOpN l u = ∑ i, l i • projC (u i)` is AFFINE in the eigenvalue family `l`, and the positive
  cone is CONVEX over the ordered field `Cut`, the STRAIGHT-LINE eigenvalue segment
    `γ(t) := specOpN (fun i => (1−t)·1 + t·cutSqrt(c i)) u`
  connects `γ(0) = specOpN 1 u = id` (the resolution-of-identity N87) to
  `γ(1) = specOpN (cutSqrt∘c) u = p^{1/2}` (the banked positive operator square root N68), staying
  EvC-SELF-ADJOINT and EvC-POSITIVE-SEMIDEFINITE for every `t ∈ [0,1]` — a path of positive
  operators through the cone. NO power, NO `exp`, NO analysis, NO operator topology: pure
  ordered-field CONVEX arithmetic over the derived ℝ. The transcendental rapidity flow becomes
  the affine segment.

  Banked here (foundations-only `[propext, Classical.choice, Quot.sound]`):
    • `specPathOp` — the affine spectral path operator (eigenvalues on the segment `(1−t)+t·√c`);
    • `specPathOp_zero` — `γ(0) = id` (resolution-of-identity N87);
    • `specPathOp_one` — `γ(1) = specOpN (cutSqrt∘c) u`, the spectral square root;
    • `specPathOp_one_isOpSqrt` — `γ(1)` IS the banked positive operator square root of `specOpN c u`;
    • `specPathOp_isEvCSymm` — `γ(t)` is EvC-self-adjoint for EVERY `t` (closure of self-adjointness
       along the whole segment);
    • `specPathOp_nonneg` — `γ(t)` is EvC-positive-semidefinite for `t ∈ [0,1]`, `c ≥ 0` (the path
       stays in the cone — the convex-combination positivity);
    • `specPathOp_connects` — the PACKAGED connectedness: an affine path of cone-positive
       self-adjoint operators with `γ(0)=id`, `γ(1)=p^{1/2}` — the positive part connects to the
       identity through the cone WITHOUT any continuous power;
    • `specPathOp_mix4_witness` — NON-VACUITY: the concrete path on the rank-4 frame from `id` to
       `specOpN ![2,3,5,8] mix4` (the spectral root of `specOpN ![4,9,25,64] mix4`);
    • `specPathOp_mix4_mid_read` — the W8 anchor: the midpoint `γ(1/2)` eigenvalue reading on the
       first frame vector is `(1 + cutSqrt 4)/2 = 3/2`, so `2 · reading = 3`.

  DERIVED from the trunk (`specOpN`/`specOpN_apply`/`_isEvCSymm`/`_nonneg`/`_read`/`_op_sqrt` N68;
  `specOpN_one_eq_sum_projC`/`stvc_resolution_of_identity` N87; `cutSqrt`/`cutSqrt_nonneg`/
  `cutSqrt_sq`/`cutSqrt_four_eq_two` N57; `projC`/`EvC`; the rank-4 frame `mix4`/`mix4_orthonormal`
  N68; standard ordered-field `linarith`/`mul_nonneg` MACHINERY on the DERIVED `Cut`, STANDARD §3),
  NOT a posited operator exponential / continuous functional calculus, NOT Mathlib spectral theory,
  NOT a posited Lorentz group / SO⁺(1,9), NOT Mathlib ℝ/ℂ as content (the field IS the DERIVED
  `Cut`), NOT a bridge.
-/
import Phys.Algebra.LorentzContinuumResolutionId

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- ★ THE AFFINE SPECTRAL PATH OPERATOR: the spectral operator whose eigenvalues travel along the
    STRAIGHT-LINE segment `(1−t)·1 + t·cutSqrt(c i)` as `t` runs from `0` to `1`. At `t=0` the
    eigenvalues are all `1` (the identity); at `t=1` they are `cutSqrt(c i)` (the spectral square
    root of `specOpN c u`). The convex eigenvalue interpolation — NO continuous power, NO `exp`. -/
def specPathOp {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) (t : Cut) : Module.End Cut STVC :=
  specOpN (fun i => (1 - t) * 1 + t * cutSqrt (c i)) u

/-- THE START `γ(0) = id`: at `t = 0` every eigenvalue is `1`, so the path operator is the all-ones
    spectral operator `∑ projC (u i)`, which equals the identity by the resolution-of-identity
    (N87 `stvc_resolution_of_identity`). The path BEGINS at the identity. -/
theorem specPathOp_zero {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC)) :
    specPathOp c u 0 = (LinearMap.id : Module.End Cut STVC) := by
  unfold specPathOp
  have h1 : (fun i => (1 - (0:Cut)) * 1 + (0:Cut) * cutSqrt (c i)) = (fun _ => (1:Cut)) := by
    funext i; ring
  rw [h1, specOpN_one_eq_sum_projC, hres]

/-- THE END `γ(1) = specOpN (cutSqrt∘c) u`: at `t = 1` every eigenvalue is `cutSqrt(c i)`, so the
    path operator is the spectral square root operator of `specOpN c u`. The path ENDS at
    `p^{1/2}`. -/
theorem specPathOp_one {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC} :
    specPathOp c u 1 = specOpN (fun i => cutSqrt (c i)) u := by
  unfold specPathOp
  congr 1
  funext i; ring

/-- ★ `γ(t)` is EvC-SELF-ADJOINT for EVERY `t`: each eigenvalue family yields a self-adjoint
    spectral operator (`specOpN_isEvCSymm` holds for every family), so self-adjointness is
    preserved along the WHOLE path — the path never leaves the self-adjoint slice. -/
theorem specPathOp_isEvCSymm {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) (t : Cut) :
    IsEvCSymm (specPathOp c u t) :=
  specOpN_isEvCSymm _ _

/-- ★★ `γ(t)` is EvC-POSITIVE-SEMIDEFINITE for `t ∈ [0,1]` and `c ≥ 0`: each eigenvalue
    `(1−t) + t·cutSqrt(c i)` is a CONVEX COMBINATION of `1 ≥ 0` and `cutSqrt(c i) ≥ 0`, hence `≥ 0`,
    so `specOpN_nonneg` applies. The path stays in the CONE OF POSITIVE OPERATORS for every
    `t ∈ [0,1]` — the convex-combination positivity over the ordered field `Cut`. (The positivity
    needs only `t ∈ [0,1]`: `cutSqrt` is nonneg for every argument, so no hypothesis on `c` is
    required for the path to stay in the cone.) -/
theorem specPathOp_nonneg {n : ℕ} {c : Fin n → Cut}
    (u : Fin n → STVC) {t : Cut} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) (p : STVC) :
    0 ≤ EvC (specPathOp c u t p) p := by
  unfold specPathOp
  apply specOpN_nonneg ?_ u p
  intro i
  have h1 : 0 ≤ 1 - t := by linarith
  have h2 : 0 ≤ cutSqrt (c i) := cutSqrt_nonneg (c i)
  have heq : (1 - t) * 1 + t * cutSqrt (c i) = (1 - t) + t * cutSqrt (c i) := by ring
  rw [heq]
  have hp := mul_nonneg ht0 h2
  linarith

/-- ★★★ THE PACKAGED CONNECTEDNESS — for an EvC-ORTHONORMAL eigen-family `{u i}` resolving the
    identity, with all eigenvalues `c i ≥ 0`, there is an AFFINE PATH `γ : Cut → Module.End Cut STVC`
    of EvC-self-adjoint operators, lying in the CONE OF POSITIVE OPERATORS for every `t ∈ [0,1]`,
    with `γ(0) = id` and `γ(1)` the positive operator square root of `specOpN c u`. The positive
    (boost) part of the polar/KAK split is CONNECTED to the identity THROUGH THE CONE — realised
    by a straight-line eigenvalue segment, WITHOUT any continuous power, `exp`, or operator
    topology. The transcendental rapidity flow dissolved into convex arithmetic over the derived ℝ. -/
theorem specPathOp_connects {n : ℕ} {c : Fin n → Cut} (hc : ∀ i, 0 ≤ c i) {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC)) :
    ∃ γ : Cut → Module.End Cut STVC,
      γ 0 = (LinearMap.id : Module.End Cut STVC) ∧
      IsEvCOpSqrt (γ 1) (specOpN c u) ∧
      (∀ t, IsEvCSymm (γ t)) ∧
      (∀ t, 0 ≤ t → t ≤ 1 → ∀ p, 0 ≤ EvC (γ t p) p) := by
  refine ⟨specPathOp c u, specPathOp_zero hres, ?_, specPathOp_isEvCSymm c u, ?_⟩
  · rw [specPathOp_one]; exact specOpN_op_sqrt hc horth
  · intro t ht0 ht1 p; exact specPathOp_nonneg u ht0 ht1 p

/-! ## Non-vacuity (W8) — a concrete affine path on the rank-4 octonionic frame. -/

/-- ★ NON-VACUITY: the concrete affine path on the time/space/octonion-real/octonion-im
    EvC-orthonormal 4-frame `{mixA, mixB, mixW3, mixW4}` (`mix4`) from `id` (`t=0`) to the spectral
    square root `specOpN ![2,3,5,8] mix4` of `specOpN ![4,9,25,64] mix4` (`t=1`) — a genuine path of
    positive operators connecting the identity to a nontrivial positive part. -/
theorem specPathOp_mix4_witness :
    specPathOp ![(4:Cut),9,25,64] mix4 1 = specOpN ![(2:Cut),3,5,8] mix4 := by
  rw [specPathOp_one]
  have e : (fun i => cutSqrt (![(4:Cut),9,25,64] i)) = ![(2:Cut),3,5,8] := by
    funext i
    fin_cases i
    · show cutSqrt (4:Cut) = 2; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (9:Cut) = 3; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (25:Cut) = 5; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
    · show cutSqrt (64:Cut) = 8; exact (cutSqrt_unique (by norm_num) (by norm_num)).symm
  rw [e]

/-- ★ THE MIDPOINT EIGENVALUE READING (W8 anchor): the affine path on `mix4` with eigenvalue family
    `![4,9,25,64]` at `t = 1/2` reads, on its first frame vector `mix4 0 = mixA`, the diagonal
    eigenvalue `(1 − 1/2) + (1/2)·cutSqrt 4 = 1/2 + (1/2)·2 = 3/2`. So `2 · reading = 3`. The genuine
    convex midpoint of `1` and `cutSqrt 4 = 2`. -/
theorem specPathOp_mix4_mid_read :
    EvC (specPathOp ![(4:Cut),9,25,64] mix4 (1/2) (mix4 0)) (mix4 0) = 3/2 := by
  unfold specPathOp
  rw [specOpN_read mix4_orthonormal 0]
  show (1 - (1/2)) * 1 + (1/2) * cutSqrt (![(4:Cut),9,25,64] 0) = 3/2
  rw [show (![(4:Cut),9,25,64] 0) = 4 from rfl,
    show cutSqrt (4:Cut) = 2 from (cutSqrt_unique (by norm_num) (by norm_num)).symm]
  norm_num

end

end Phys.Algebra
