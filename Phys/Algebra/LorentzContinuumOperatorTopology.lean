/-
  Phys.Algebra.LorentzContinuumOperatorTopology — N152: THE OPERATOR TOPOLOGY OVER `Cut` AND THE
  CONTINUITY / PRECONNECTEDNESS OF THE AFFINE SPECTRAL PATH — over the DERIVED ℝ `Cut` and the
  terminal algebra `O Cut := CD (H Cut)`.

  ===========================================================================
  THE FORWARD FRONTIER (N152). With BOTH halves of the unit-normalized Pin double cover derived
  (kernel `{1,-1}` N150, surjectivity N151), the remaining open structure is TOPOLOGICAL. N96
  dissolved the *cone* connectedness of the polar/KAK positive part by CONVEX ARITHMETIC over the
  ordered field `Cut` (the straight-line eigenvalue segment `specPathOp`), and EXPLICITLY childed
  the literal TOPOLOGICAL connectedness of the operator group — because Mathlib has NO topology on
  `Module.End Cut STVC` over the derived `Cut`. That gap is what this node BUILDS.

  MEASURE-FIRST (W1/W9) found the topology LIGHT, NOT a wall:
    • `STVC = Cut × Cut × O Cut` already carries a product topology — the derived `Cut` has a banked
      `OrderTopology` (N34) / `CompleteSpace` (N37) / `IsTopologicalRing`, and `O Cut = CD (H Cut)`
      carries banked `ContinuousAdd` / `ContinuousSMul Cut` (OctonionTopology); the product
      instances `ContinuousAdd STVC` / `ContinuousSMul Cut STVC` resolve by `inferInstance`.
    • The operator topology over `Cut` is the topology INDUCED on `Module.End Cut STVC` by its
      coercion to the function space `STVC → STVC` (`endOpC`). Mathlib LACKS this instance over the
      derived `Cut` — we BUILD it (W1, do not panic). It is the coarsest topology making evaluation
      continuous; `Continuous f ↔ ∀ v, Continuous (· ↦ (f ·) v)` (`endOpC_continuous_iff`).
    • THE PAYOFF: the banked N96 affine spectral path `specPathOp c u : Cut → Module.End Cut STVC`
      is CONTINUOUS in `endOpC` (`specPathOp_cont`) — each evaluation `t ↦ (γ t) v` is a finite sum
      of `Cut`-continuous affine-times-`EvC` coefficients scaling fixed frame vectors. So the
      positive (boost) part `γ 1 = p^{1/2}` and the identity `γ 0 = id` lie in a SINGLE PRECONNECTED
      subset of the operator topology (`specPathOp_image_preconnected`), realised by a CONTINUOUS
      path through the cone — the identity component is path-joined to the positive part. The
      connectedness parameter is the DERIVED `Cut` interval `Set.Icc (0:Cut) 1` (`isPreconnected_Icc`
      over the order topology of the derived ℝ), NOT Mathlib's ℝ-valued `unitInterval` / `Path`.

  Banked here (foundations-only `[propext, Classical.choice, Quot.sound]`):
    • `endOpC` — THE OPERATOR TOPOLOGY over the derived `Cut`: the induced topology on
      `Module.End Cut STVC` from the function topology of `STVC → STVC` (the structure Mathlib lacks);
    • `endOpC_coe_continuous` — the coercion `Module.End Cut STVC → (STVC → STVC)` is continuous;
    • `endOpC_eval_continuous` — evaluation `g ↦ g v` at a fixed vector is continuous;
    • `endOpC_continuous_iff` — `Continuous f ↔ ∀ v, Continuous (· ↦ (f ·) v)` (the operator topology
      is the topology of pointwise/coordinate convergence);
    • `specPathOp_eval_cont` — each evaluation of the affine spectral path is `Cut`-continuous;
    • `specPathOp_cont` — ★ the affine spectral path `specPathOp c u` is CONTINUOUS in `endOpC`;
    • `cut_isPreconnected_Icc` — `Set.Icc (0:Cut) 1` is preconnected (order topology of derived ℝ);
    • `specPathOp_image_preconnected` — the image of the path on `[0,1]` is preconnected in `endOpC`;
    • `specPathOp_joins_id_sqrt` — ★★ THE PACKAGED CONNECTEDNESS: for an EvC-orthonormal resolving
      family with eigenvalues `c ≥ 0`, there is a CONTINUOUS path in the operator topology lying in a
      single preconnected set, whose endpoints are `id` and the positive operator square root of
      `specOpN c u` — the boost part is topologically path-joined to the identity, WITHOUT Mathlib's
      ℝ `unitInterval` / `Path`, WITHOUT a continuous power / `exp`, WITHOUT Mathlib spectral theory;
    • `specPathOp_mix4_cont` — NON-VACUITY: the concrete rank-4 octonionic-frame path is continuous;
    • `specPathOp_mix4_mid_read_cont` — the W8 anchor: the continuous path's midpoint reading is `3/2`.

  DERIVED from the trunk (the operator topology BUILT from the banked `Cut`-topology N34/N37 + the
  `O Cut` topological algebra (OctonionTopology) + the N96 affine path `specPathOp` /
  `specPathOp_zero` / `specPathOp_one` / `specPathOp_connects` / `specOpN_apply` (N68) / `EvC` /
  `cutSqrt` (N57) / the rank-4 frame `mix4` (N68); standard `Continuous.*` / `continuous_finset_sum`
  / `isPreconnected_Icc` / `IsPreconnected.image` MACHINERY applied to the DERIVED objects, STANDARD
  §3), NOT a posited operator topology, NOT a posited connectedness, NOT a posited Lorentz group /
  `SO⁺(1,9)`, NOT Mathlib ℝ/ℂ as content (the field and the path parameter are BOTH the DERIVED
  `Cut`), NOT a fully proved implication asserted without a proof, NOT a bridge.
-/
import Phys.Cascade.OctonionTopology
import Phys.Foundation.ContinuumTopology
import Phys.Algebra.LorentzContinuumSpectralPath

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## The operator topology over the derived `Cut`.

`STVC = Cut × Cut × O Cut` carries a product topology (the derived `Cut` is a topological ring with
the banked order topology N34; `O Cut = CD (H Cut)` carries the banked `ContinuousAdd`/
`ContinuousSMul`). The operator topology on `Module.End Cut STVC` is the topology INDUCED from the
function space `STVC → STVC` — the coarsest topology making every evaluation continuous. Mathlib has
no such instance over the derived `Cut`; we build it. -/

/-- ★ THE OPERATOR TOPOLOGY over the derived `Cut`: the topology on `Module.End Cut STVC` induced by
    the coercion to the function space `STVC → STVC` (carrying the product/pointwise topology). This
    is the structure Mathlib lacks over the derived field; it is the topology of pointwise
    convergence of operators. -/
instance endOpC : TopologicalSpace (Module.End Cut STVC) :=
  TopologicalSpace.induced (fun (g : Module.End Cut STVC) => (g : STVC → STVC)) inferInstance

/-- The coercion `Module.End Cut STVC → (STVC → STVC)` is continuous (definitional for the induced
    topology). -/
theorem endOpC_coe_continuous :
    Continuous (fun (g : Module.End Cut STVC) => (g : STVC → STVC)) :=
  continuous_induced_dom

/-- Evaluation at a fixed vector `v` is continuous in the operator topology. -/
theorem endOpC_eval_continuous (v : STVC) :
    Continuous (fun (g : Module.End Cut STVC) => g v) :=
  (continuous_apply v).comp endOpC_coe_continuous

/-- ★ THE OPERATOR TOPOLOGY IS POINTWISE CONVERGENCE: a map into operators is continuous iff each of
    its evaluations is continuous. The "if and only if" form of the induced/product topology. -/
theorem endOpC_continuous_iff {X : Type*} [TopologicalSpace X] (f : X → Module.End Cut STVC) :
    Continuous f ↔ ∀ v, Continuous (fun x => (f x) v) := by
  rw [continuous_induced_rng, continuous_pi_iff]; rfl

/-! ## Continuity of the affine spectral path. -/

/-- THE PER-VECTOR CONTINUITY: each evaluation `t ↦ (γ t) v` of the affine spectral path is a finite
    sum of `Cut`-continuous coefficients (`((1−t)·1 + t·√(c i))·EvC (u i) v`, polynomial in `t`)
    scaling the fixed frame vectors `u i`, hence continuous. -/
theorem specPathOp_eval_cont {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) (v : STVC) :
    Continuous (fun t : Cut => (specPathOp c u t) v) := by
  have hrw : (fun t : Cut => (specPathOp c u t) v)
      = (fun t : Cut => ∑ i, (((1 - t) * 1 + t * cutSqrt (c i)) * EvC (u i) v) • u i) := by
    funext t; rw [specPathOp, specOpN_apply]
  rw [hrw]
  apply continuous_finset_sum
  intro i _
  apply Continuous.smul _ continuous_const
  fun_prop

/-- ★ THE AFFINE SPECTRAL PATH IS CONTINUOUS in the operator topology. The straight-line eigenvalue
    segment connecting `id` to the positive operator square root is a continuous one-parameter family
    of operators — the topological realisation of the N96 cone path. -/
theorem specPathOp_cont {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) :
    Continuous (specPathOp c u) :=
  (endOpC_continuous_iff _).mpr (specPathOp_eval_cont c u)

/-! ## The preconnectedness payoff. -/

/-- `Set.Icc (0:Cut) 1` is preconnected — the closed unit interval of the DERIVED ℝ `Cut` in its
    banked order topology. The connectedness PARAMETER is the derived field, NOT Mathlib's ℝ. -/
theorem cut_isPreconnected_Icc : IsPreconnected (Set.Icc (0:Cut) 1) := isPreconnected_Icc

/-- The image of the affine spectral path on `[0,1]` is PRECONNECTED in the operator topology — the
    continuous image of a preconnected interval. -/
theorem specPathOp_image_preconnected {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC) :
    IsPreconnected ((specPathOp c u) '' (Set.Icc (0:Cut) 1)) :=
  cut_isPreconnected_Icc.image _ (specPathOp_cont c u).continuousOn

/-- ★★ THE PACKAGED CONNECTEDNESS — for an EvC-orthonormal eigen-family `{u i}` resolving the
    identity with all eigenvalues `c i ≥ 0`, there is a CONTINUOUS path `γ` in the operator topology
    over the derived `Cut`, whose image on `[0,1]` is a single PRECONNECTED subset of
    `Module.End Cut STVC` containing both the identity `γ 0 = id` and the positive operator square
    root `γ 1` of `specOpN c u`. The positive (boost) part of the polar/KAK split is topologically
    path-joined to the identity through the cone — the identity-component statement, realised WITHOUT
    Mathlib's ℝ `unitInterval` / `Path`, WITHOUT a continuous power / `exp`, WITHOUT Mathlib spectral
    theory: pure induced-topology + convex arithmetic over the derived ℝ. -/
theorem specPathOp_joins_id_sqrt {n : ℕ} {c : Fin n → Cut} (hc : ∀ i, 0 ≤ c i)
    {u : Fin n → STVC} (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC)) :
    ∃ γ : Cut → Module.End Cut STVC,
      Continuous γ ∧
      IsPreconnected (γ '' (Set.Icc (0:Cut) 1)) ∧
      γ 0 = (LinearMap.id : Module.End Cut STVC) ∧
      (LinearMap.id : Module.End Cut STVC) ∈ γ '' (Set.Icc (0:Cut) 1) ∧
      γ 1 ∈ γ '' (Set.Icc (0:Cut) 1) ∧
      IsEvCOpSqrt (γ 1) (specOpN c u) := by
  refine ⟨specPathOp c u, specPathOp_cont c u, specPathOp_image_preconnected c u,
    specPathOp_zero hres, ?_, ?_, ?_⟩
  · exact ⟨0, ⟨le_refl 0, zero_le_one⟩, specPathOp_zero hres⟩
  · exact ⟨1, ⟨zero_le_one, le_refl 1⟩, rfl⟩
  · rw [specPathOp_one]; exact specOpN_op_sqrt hc horth

/-! ## Non-vacuity (W8) — the concrete rank-4 octonionic-frame path is continuous. -/

/-- ★ NON-VACUITY: the concrete affine path on the time/space/octonion-real/octonion-im
    EvC-orthonormal 4-frame `mix4` (the path from `id` to the spectral square root of
    `specOpN ![4,9,25,64] mix4`) is continuous in the operator topology — a genuine continuous path
    of positive operators, not a vacuous statement. -/
theorem specPathOp_mix4_cont :
    Continuous (specPathOp ![(4:Cut),9,25,64] mix4) :=
  specPathOp_cont _ _

/-- ★ THE W8 ANCHOR re-read along the continuous path: the path on `mix4` at its midpoint `t = 1/2`
    reads, on its first frame vector, the convex eigenvalue `3/2` — so `2 · reading = 3`. The same
    nontrivial midpoint of `1` and `cutSqrt 4 = 2`, now carried by a path proved CONTINUOUS. -/
theorem specPathOp_mix4_mid_read_cont :
    EvC (specPathOp ![(4:Cut),9,25,64] mix4 (1/2) (mix4 0)) (mix4 0) = 3/2 :=
  specPathOp_mix4_mid_read

end

end Phys.Algebra
