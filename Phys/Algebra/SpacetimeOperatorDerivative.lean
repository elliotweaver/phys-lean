/-
  Phys.Algebra.SpacetimeOperatorDerivative — N350 (arc-E E1-deriv): THE OPERATOR-FIELD DIRECTIONAL
  DERIVATIVE on the derived-ℝ tangent structure (the `dΓ` machinery completing `F = dΓ + Γ∧Γ`),
  and the transport-commutes-with-derivative heart, over the DERIVED ℝ `Cut`.
  ===========================================================================
  DIRECTED route-finder successor of N349 (E1c-scalar, `Phys/Algebra/SpacetimeCurvatureScalar.lean`),
  which banked the curvature SCALAR (`bornCurv = EvC(R·p)(R·p)`, the fold's Born self-overlap of the
  non-closure) + the fiber-trace NO-GO. N349 (with N348 `lbCurv`) completed the ALGEBRAIC (`Γ∧Γ` /
  commutator + its scalar magnitude) part of the linearized Riemann. This node builds the ONE genuine
  remaining machinery gap: the DERIVATIVE-carrying part `dΓ`.

  ── THE REPEATED-DEFERRAL SIGNAL, RESOLVED BY MEASUREMENT (not a fourth deferral) ──
  The operator directional derivative was deferred at N347/N348/N349, each for the SAME stated reason:
  "the banked derivative machinery is SCALAR-only (`cut_powerseries_deriv`, N41g: `Cut → Cut`), and
  there is NO banked topology on `STVC` / `MetricEnd`." A FRESH-worker SELECT MEASURED that claim — and
  it was a FALSE ALARM. The missing structure was ALREADY BANKED, unknown to those workers:
    • `O Cut` carries a full topological `*`-algebra structure (N41b `OctonionTopology.lean`:
      `ContinuousAdd`/`ContinuousMul`/`ContinuousSMul Cut`, `T2`/`T3`, `CompleteSpace`), so
      `STVC = Cut × Cut × O Cut` carries a product topology (`ContinuousAdd STVC` etc. by `inferInstance`).
    • `MetricEnd = Module.End Cut STVC` carries the OPERATOR TOPOLOGY `endOpC` (N152
      `LorentzContinuumOperatorTopology.lean`) — the topology of pointwise convergence, with
      `endOpC_eval_continuous` and `endOpC_continuous_iff`.
  So the operator directional derivative is NOT a heavy new-topology build. It is: DEFINE the
  difference-quotient `Tendsto` in `endOpC`; prove the pointwise reduction (the `Tendsto` analogue of
  `endOpC_continuous_iff`); reduce each per-vector limit to banked scalar continuity over `Cut`.

  ── THE THEORY-NATIVE ANCHOR (the derivative IS C6 one level up; the `dΓ` piece IS the transport of the
     second field variation, NOT a posited coordinate partial) ──
  The derivative is the fold's C6 eternal-approach, one level up — exactly as N41g framed the scalar
  case ("the SAME C6 eternal-approach ... make a `Cut`-valued power series DIFFERENTIABLE at 0"). Here
  it is an OPERATOR-valued difference quotient in the banked operator topology. The physical metric
  variation is `k = ∂_λ h` (the directional change of the weak field, N347). So the theory-native heart
  is NOT a generic derivative library — it is that the LOOK-BACK TRANSPORT COMMUTES with the directional
  derivative: `∂_λ (Γ(h(λ))) = Γ(∂_λ h)` (`lbConn_opderiv`). This is FORCED by the SAME linearity of the
  transport (`lbConn_add`/`lbConn_smul`, N347) that forced metric-compatibility. ONE CAUSE (`η²=1` makes
  `Γ = ½·η·(·)` linear), TWO terminations: metric-compatibility (N347) AND the derivative commuting
  through the transport (here). That is the `dΓ` part of the linearized Riemann: the derivative-carried
  piece is the transport of the field's second-order variation, not a new posited object.

  ── SCOPE (W3 — this is the `dΓ` MACHINERY; the full Riemann assembly + tensorial Ricci are childed) ──
  This node banks the operator directional-derivative core (`HasOpDerivAt0`, its pointwise reduction,
  uniqueness, the derivative laws, non-vacuity) and the transport-commutation `lbConn_opderiv`. Assembling
  `dΓ − dΓ + Γ∧Γ` into the full derivative-level Riemann and contracting to the tensorial Ricci scalar is
  childed toward E2 (Einstein's equations unique via Lovelock literature import). Weak-field is sufficient
  to reach E2/E3 (docs/SEED_GR_BLACKHOLE_COSMOLOGY.md §E1). A MACHINERY node: it asserts NO physical value;
  it is flagged leading-order/mechanism-grade.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N152/N41b/N347 objects) ──
    HasOpDerivAt0                 — the operator directional-derivative predicate at 0: the difference
                                    quotient `s⁻¹ • (H s − H 0)` tends to `k` in the banked `endOpC`.
    hasOpDerivAt0_iff             — ★ THE STRUCTURAL HEART: the operator derivative reduces to per-vector
                                    `STVC` limits (the `Tendsto` analogue of `endOpC_continuous_iff`).
    opderiv_unique                — the operator derivative is unique (per-vector `T2Space STVC` +
                                    `LinearMap.ext`).
    const_opderiv                 — a constant operator field has zero derivative.
    opderiv_add                   — the derivative is additive.
    affine_opderiv                — `HasOpDerivAt0 (t ↦ A₀ + t•A₁) A₁` — the affine field's derivative is
                                    the linear coefficient (non-vacuity: derivatives are genuine).
    quadratic_opderiv             — `HasOpDerivAt0 (t ↦ A₀ + t•A₁ + t²•A₂) A₁` — the quadratic term dies;
                                    the difference quotient sees ONLY the linear coefficient (the operator
                                    analogue of `cut_powerseries_deriv`'s `→ a₁`).
    lbConn_opderiv                — ★★★ THE THEORY-NATIVE HEART: the look-back transport commutes with the
                                    directional derivative, `∂(Γ∘h) = Γ(∂h)` — the `dΓ` piece IS the
                                    transport of the derived field variation, forced by `lbConn`'s linearity.
    lbConn_offDiagVar_ne_zero     — a concrete nonzero transport `Γ(offDiagVar) ≠ 0`.
    opderiv_nonvacuous            — ★★ NON-VACUITY (W8): the transport-derivative of a genuinely
                                    non-constant field is a nonzero object; the `dΓ` machinery is not
                                    vacuous.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N152 `endOpC`, the N41b `O Cut` topology, the N347
  `lbConn`/`lbConn_add`/`lbConn_smul`, and the N346 `MetricEnd`/`sigOpC` ← the derived ℝ `Cut` ← the fold;
  `Module.End`/`Tendsto`/`nhds`/`induced`/`continuous_apply` are Mathlib MACHINERY on the DERIVED carrier
  (exactly as N152 used them). Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for
  every declaration. Words-removable: delete "connection / transport / Christoffel / Riemann / gravity /
  metric / spacetime": over the derived complete ordered field `Cut`, for a one-parameter family
  `H : Cut → Module.End Cut STVC`, the difference quotient `s⁻¹ • (H s − H 0)` converges in the
  pointwise-induced operator topology iff each evaluation converges over `Cut`; the derivative is unique
  and additive; `t ↦ A₀ + t•A₁ + t²•A₂` has difference-quotient limit `A₁`; and the linear map
  `g ↦ ½·η·g` (`η²=1`) commutes with this limit; pure topology/limit algebra over the derived ℝ + the
  banked operator topology. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/linearized — flagged). NO empirical number. NO Mathlib
  number-system content import (the field is the DERIVED `Cut`), NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/
  `NormedSpace`/`Real` as content (the derivative is the bare `Filter.Tendsto` over the banked `endOpC`,
  exactly as N41g built the scalar case). NO posited coordinate partial. NO kernel-trust bypass, NO
  `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeCurvatureScalar
import Phys.Algebra.LorentzContinuumOperatorTopology

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The operator directional-derivative predicate at 0, on the banked operator topology. -/

/-- THE OPERATOR-FIELD DIRECTIONAL DERIVATIVE at `0`: for a one-parameter family `H : Cut → MetricEnd`
    (physically `λ ↦ h(λ)`, the weak metric field varying along a direction), the difference quotient
    `s⁻¹ • (H s − H 0)` tends to `k` as `s → 0` in the banked operator topology `endOpC` (N152). The
    trunk-native `Tendsto` — the fold's C6 eternal-approach one level up, on operators. NO `HasDerivAt`,
    NO `NormedSpace`, NO ℝ-valued `Norm`. -/
def HasOpDerivAt0 (H : Cut → MetricEnd) (k : MetricEnd) : Prop :=
  Tendsto (fun s : Cut => s⁻¹ • (H s - H 0)) (𝓝[≠] (0 : Cut)) (𝓝 k)

/-- ★ THE STRUCTURAL HEART: the operator directional derivative reduces to PER-VECTOR limits over the
    derived ℝ `Cut`. `HasOpDerivAt0 H k` iff for every vector `v` the scalar-vector difference quotient
    `s⁻¹ • (H s v − H 0 v)` tends to `k v`. This is the `Tendsto` analogue of the banked
    `endOpC_continuous_iff` — the operator topology is pointwise convergence, so the operator derivative
    is computed vector by vector, each reducible to `Cut`-analysis. -/
theorem hasOpDerivAt0_iff (H : Cut → MetricEnd) (k : MetricEnd) :
    HasOpDerivAt0 H k ↔
      ∀ v, Tendsto (fun s : Cut => s⁻¹ • (H s v - H 0 v)) (𝓝[≠] (0 : Cut)) (𝓝 (k v)) := by
  unfold HasOpDerivAt0
  have hcongr : ∀ v, (fun s : Cut => (s⁻¹ • (H s - H 0)) v)
      = (fun s : Cut => s⁻¹ • (H s v - H 0 v)) := by
    intro v; funext s; simp only [LinearMap.smul_apply, LinearMap.sub_apply]
  rw [nhds_induced, tendsto_comap_iff, tendsto_pi_nhds]
  constructor
  · intro h v; have := h v; rw [Function.comp_def] at this; rw [← hcongr v]; exact this
  · intro h v; rw [Function.comp_def, hcongr v]; exact h v

/-- The operator directional derivative is UNIQUE. Per-vector uniqueness (the derived ℝ carrier `STVC`
    is `T2` in the product topology, so `Cut`-vector limits are unique), then `LinearMap.ext`. -/
theorem opderiv_unique {H : Cut → MetricEnd} {k₁ k₂ : MetricEnd}
    (h₁ : HasOpDerivAt0 H k₁) (h₂ : HasOpDerivAt0 H k₂) : k₁ = k₂ := by
  rw [hasOpDerivAt0_iff] at h₁ h₂
  exact LinearMap.ext (fun v => tendsto_nhds_unique (h₁ v) (h₂ v))

/-! ## (2) The derivative laws. -/

/-- A CONSTANT operator field has zero derivative — no variation, no `dΓ`. -/
theorem const_opderiv (A : MetricEnd) : HasOpDerivAt0 (fun _ => A) 0 := by
  rw [hasOpDerivAt0_iff]; intro v
  refine Tendsto.congr' (f₁ := fun _ : Cut => (0 : STVC)) ?_ tendsto_const_nhds
  filter_upwards with s
  simp only [sub_self, smul_zero]

/-- The operator directional derivative is ADDITIVE: `∂(H + K) = ∂H + ∂K`. -/
theorem opderiv_add {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t + K t) (a + b) := by
  rw [hasOpDerivAt0_iff] at hH hK ⊢
  intro v
  refine Tendsto.congr' ?_ ((hH v).add (hK v))
  filter_upwards with s
  simp only [LinearMap.add_apply]
  rw [← smul_add]; congr 1; abel

/-- The AFFINE field `H(t) = A₀ + t•A₁` has operator derivative `A₁` at `0` — the difference quotient
    recovers the linear coefficient. NON-VACUITY: derivatives are genuine, not always zero. -/
theorem affine_opderiv (A₀ A₁ : MetricEnd) :
    HasOpDerivAt0 (fun t => A₀ + t • A₁) A₁ := by
  rw [hasOpDerivAt0_iff]
  intro v
  refine Tendsto.congr' (f₁ := fun _ : Cut => A₁ v) ?_ tendsto_const_nhds
  filter_upwards [self_mem_nhdsWithin] with s hs
  have hs0 : s ≠ 0 := hs
  simp only [LinearMap.add_apply, LinearMap.smul_apply, zero_smul, add_zero]
  rw [show (A₀ v + s • A₁ v - A₀ v) = s • A₁ v by abel, smul_smul, inv_mul_cancel₀ hs0, one_smul]

/-- The QUADRATIC field `H(t) = A₀ + t•A₁ + t²•A₂` ALSO has operator derivative `A₁` at `0`: the
    quadratic term `t²•A₂` DIES in the limit. The difference quotient sees ONLY the linear coefficient —
    the operator analogue of the banked scalar `cut_powerseries_deriv` (`→ a₁`). This is the fact the
    linearized-Riemann `dΓ` uses: only the first-order variation of the field survives the derivative. -/
theorem quadratic_opderiv (A₀ A₁ A₂ : MetricEnd) :
    HasOpDerivAt0 (fun t => A₀ + t • A₁ + t ^ 2 • A₂) A₁ := by
  rw [hasOpDerivAt0_iff]
  intro v
  refine Tendsto.congr' (f₁ := fun s : Cut => A₁ v + s • A₂ v) ?_ ?_
  · filter_upwards [self_mem_nhdsWithin] with s hs
    have hs0 : s ≠ 0 := hs
    simp only [LinearMap.add_apply, LinearMap.smul_apply, zero_smul, add_zero]
    rw [show ((0 : Cut)) ^ 2 = 0 by ring, zero_smul, add_zero]
    rw [show (A₀ v + s • A₁ v + s ^ 2 • A₂ v - A₀ v) = s • A₁ v + s ^ 2 • A₂ v by abel]
    rw [smul_add, smul_smul, inv_mul_cancel₀ hs0, one_smul]
    congr 1
    rw [smul_smul, show s ^ 2 = s * s by ring, ← mul_assoc, inv_mul_cancel₀ hs0, one_mul]
  · have : Tendsto (fun s : Cut => A₁ v + s • A₂ v) (𝓝[≠] (0 : Cut))
        (𝓝 (A₁ v + (0 : Cut) • A₂ v)) := by
      refine Tendsto.const_add _ ?_
      exact ((continuous_id.smul continuous_const).tendsto (0 : Cut)).mono_left nhdsWithin_le_nhds
    simpa using this

/-! ## (3) THE THEORY-NATIVE HEART: the look-back transport commutes with the directional derivative. -/

/-- ★★★ THE THEORY-NATIVE HEART — the `dΓ` piece IS the transport of the field's derivative. If the
    metric field `H` has directional derivative `k` at `0`, then the look-back transport of the field,
    `t ↦ Γ(H t) = lbConn (H t)`, has directional derivative `Γ(k) = lbConn k`:
        `∂_λ (Γ(h(λ))) = Γ(∂_λ h)`.
    The derivative COMMUTES with the transport. This is FORCED by the linearity of the transport
    `Γ = ½·η·(·)` (`η²=1`, banked `lbConn_add`/`lbConn_smul`, N347) — the SAME `η²=1` cause that forced
    metric-compatibility (N347). ONE CAUSE, two terminations: metric-compatibility, and the derivative
    commuting through the transport. This is the derivative-carrying `dΓ` part of the linearized Riemann:
    it is not a new posited object, it is the transport of the derived second variation. -/
theorem lbConn_opderiv {H : Cut → MetricEnd} {k : MetricEnd} (h : HasOpDerivAt0 H k) :
    HasOpDerivAt0 (fun t => lbConn (H t)) (lbConn k) := by
  rw [hasOpDerivAt0_iff] at h ⊢
  intro v
  have hpt : ∀ (g : MetricEnd) (w : STVC), (lbConn g) w = (2⁻¹ : Cut) • sigOpC (g w) := by
    intro g w; unfold lbConn
    simp only [LinearMap.smul_apply, Module.End.mul_apply]
  have hce : (fun s : Cut => s⁻¹ • ((lbConn (H s)) v - (lbConn (H 0)) v))
      = (fun s : Cut => (2⁻¹ : Cut) • sigOpC (s⁻¹ • (H s v - H 0 v))) := by
    funext s
    rw [hpt, hpt, ← smul_sub, ← map_sub sigOpC, map_smul, smul_comm]
  rw [hce]
  have hkv : (lbConn k) v = (2⁻¹ : Cut) • sigOpC (k v) := hpt k v
  rw [hkv]
  have hsig : Continuous (fun p : STVC => sigOpC p) := by simp only [sigOpC_apply]; fun_prop
  have hcomp := (hsig.tendsto (k v)).comp (h v)
  have := hcomp.const_smul (2⁻¹ : Cut)
  simpa [Function.comp_def] using this

/-! ## (4) NON-VACUITY (W8): a genuine nonzero transport-derivative. -/

/-- A concrete nonzero transport: `Γ(offDiagVar) ≠ 0`. Applied to `(0,1,0)`: `offDiagVar (0,1,0) =
    (1,0,0)`, `η (1,0,0) = (1,0,0)`, so `Γ(offDiagVar)(0,1,0) = ½•(1,0,0)`, whose first component is
    `½ ≠ 0`. -/
theorem lbConn_offDiagVar_ne_zero : lbConn offDiagVar ≠ 0 := by
  intro hcon
  have h := congrArg (fun (f : MetricEnd) => (f ((0 : Cut), (1 : Cut), (0 : O Cut))).1) hcon
  simp only [lbConn, LinearMap.smul_apply, Module.End.mul_apply, offDiagVar_apply,
    sigOpC_apply, Prod.smul_fst, LinearMap.zero_apply, Prod.fst_zero, smul_eq_mul] at h
  exact (by norm_num : (2⁻¹ : Cut) * 1 ≠ 0) h

/-- ★★ NON-VACUITY (W8): the transport-derivative of a GENUINELY non-constant field is a NONZERO object.
    For the affine field `t ↦ timeProj + t•offDiagVar` (derivative `offDiagVar` by `affine_opderiv`), the
    transport family `t ↦ Γ(timeProj + t•offDiagVar)` has directional derivative `Γ(offDiagVar) = lbConn
    offDiagVar` (by the heart `lbConn_opderiv`), which is NONZERO (`lbConn_offDiagVar_ne_zero`). The `dΓ`
    machinery is not a vacuous "always zero" object — it genuinely measures the field's first variation
    carried by the look-back transport. -/
theorem opderiv_nonvacuous :
    HasOpDerivAt0 (fun t => lbConn (timeProj + t • offDiagVar)) (lbConn offDiagVar)
      ∧ lbConn offDiagVar ≠ 0 :=
  ⟨lbConn_opderiv (affine_opderiv timeProj offDiagVar), lbConn_offDiagVar_ne_zero⟩

end

end Phys.Algebra
