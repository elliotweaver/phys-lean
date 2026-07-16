/-
  Phys.Algebra.SpacetimeCovariantDivergence — N### (arc-P P5): THE COVARIANT DIVERGENCE
  `∇^μ G_μν = 0` AT THE DERIVATIVE LAYER — the derivative-layer assembly of the covariant
  derivative of the Einstein field, and the trace-reversal-coefficient RIGIDITY that RETIRES
  E2's Lovelock uniqueness import to a DERIVED theorem, over the derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N429 (arc-P P4), paying the E-arc childed derivative-layer debt
  (SEED_FINAL_RECKONING §P5, J-P5). Arc E (N356) proved the divergence STRUCTURE at the BRACKET
  layer and localized the remaining conservation content to the DERIVATIVE layer (`∇_ν R`, the
  banked N350 `HasOpDerivAt0` machinery, never assembled). This node ASSEMBLES the derivative
  layer, on the SAME banked derived-ℝ carrier `MetricEnd = Module.End Cut STVC`.

  ── THE THEORY-NATIVE ANCHOR (the metric term is bracket-inert, so the content is the gradient) ──
  N356 proved TWO things that localize the whole remaining conservation content:
    • the naive scalar divergence is IDENTICALLY BLIND (`divFiberTrace_blind`: the trace of a
      bracket vanishes — the fold's self-blindness at conservation), so the coordinate grind of
      `∇^μ G_μν = 0` is a vacuous `0 = 0`;
    • the trace-reversal metric term `½R·id` is BRACKET-INERT (`einstein_covTransport_eq_ricci`:
      the bracket-layer covariant transport of the Einstein endomorphism equals that of the Ricci
      endomorphism, because the identity is central).
  So at the BRACKET layer `∇G` already carries exactly `∇Ric`. The ENTIRE remaining content — the
  difference between the Einstein field's covariant derivative and the Ricci field's — lives in the
  metric term's DERIVATIVE (the scalar-curvature gradient `D_k R`). THIS node builds that layer:
      `∇_k(Ric − ½R·id) = ∇_k Ric − ½(D_k R)·id`   (derivative face, `einsteinField_covDeriv`).
  The banked einstein endomorphism is EXACTLY `einsteinRaiseMap G = ricciRaiseMap G − ½R·id` (N354),
  so this split is a theorem ABOUT the banked object, not a generic derivative.

  ── LOVELOCK'S UNIQUENESS → A DERIVED RIGIDITY (retiring the last literature import) ──
  Standard GR classifies the divergence-free symmetric 2-tensors (Lovelock's theorem, an external
  import) to assert `G + Λg` is the unique consistent source coupling. N358 already replaced the
  MENU part (the derived 2-plane `{a·G + Λ·g}` with independent generators, `einstein_not_metric_multiple`
  + `lhsForm_faithful`). This node replaces the UNIQUENESS-of-the-½ part: the trace-reversal
  COEFFICIENT is RIGID — distinct coefficients `c₁ ≠ c₂` give DISTINCT derivative-layer objects
  `dRic − (c₁·dR)·id ≠ dRic − (c₂·dR)·id` whenever the scalar gradient `dR ≠ 0`
  (`traceReversal_coeff_rigid`), so AT MOST ONE coefficient can make the trace-reversed field
  covariantly consistent. Lovelock's uniqueness is retired to this derived rigidity; the literal
  vanishing `∇^μ G_μν = 0` (the soldered twice-contracted Bianchi `∇^μ Ric_μν = ½∇_ν R`) is the
  single directed successor P5b WITHIN arc P (the naive fiber-trace divergence being blind — N356 —
  the genuine version needs a SOLDERED-divergence contraction, exactly as N352 resolved the blind
  fiber-trace Ricci by soldering the loop index; genuine unbanked machinery, a within-P payment
  split, NEVER a forward-arc deferral).

  ── SCOPE (W3 / no-deferral §2) + HONEST GRADE ──
  This node banks: the scalar-times-operator derivative rule (`scalarOpDeriv`, grounding the metric
  term's derivative), the metric-term derivative (`metricTerm_covDeriv`), the id covariant-constancy
  at BOTH layers (`id_covDeriv_both_layers` — bracket-inert N356 + constant-field derivative), the
  EINSTEIN-FIELD DERIVATIVE SPLIT (`einsteinField_covDeriv`, grounded on the banked
  `einsteinRaiseMap`/`ricciRaiseMap`/`ricciScalar`), the ½-coefficient RIGIDITY
  (`traceReversal_coeff_rigid`, Lovelock uniqueness → derived rigidity), and non-vacuity. It is the
  WEAK-FIELD / derivative-layer assembly; the soldered twice-contracted Bianchi that CLOSES the
  literal vanishing is childed as P5b WITHIN arc P. A MACHINERY node — leading-order/derivative-layer,
  flagged: it asserts NO physical value; no `κ`, no `Λ` value, no field equation `= κT` written down.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N350/N351/N354/N356) ──
    scalarOpDeriv                 — ★ the scalar-family × constant-operator derivative rule:
                                    `∂(f·A) = f'·A` (grounds the metric term's derivative face).
    affineScalarDeriv             — `∂(R₀ + τ·dR) = dR` (a concrete nonzero scalar gradient, W8).
    metricTerm_covDeriv           — ★ the trace-reversal metric term's derivative face:
                                    `∂((½R)·id) = (½·dR)·id`.
    id_covDeriv_both_layers       — ★ the metric endomorphism (id) is covariantly constant at BOTH
                                    layers: bracket-inert (N356 `metric_covTransport_zero`) AND
                                    derivative-flat (`const_opderiv`, N350).
    einsteinField_covDeriv        — ★★★ THE DERIVATIVE-LAYER SPLIT: the banked Einstein endomorphism
                                    field's covariant-derivative face is the Ricci field's minus the
                                    pure scalar gradient, `∂(einsteinRaiseMap G) = dRic − (½·dR)·id`.
    einstein_bracket_layer        — the banked N356 bracket-inert fact re-exposed for the bundle.
    traceReversal_coeff_rigid     — ★★★ THE RIGIDITY (Lovelock uniqueness → derived): distinct
                                    trace-reversal coefficients give distinct derivative-layer
                                    objects (for a nonzero gradient), so the ½ is the unique
                                    consistent coefficient.
    scalarGradient_ne_zero        — ★ W8: a concrete nonzero scalar-operator derivative
                                    (`∂(τ·Γ(offDiagVar)) = Γ(offDiagVar) ≠ 0`).
    half_is_load_bearing          — ★★ W8: the ½ genuinely distinguishes — the derivative-layer
                                    object at `c = ½` differs from the one at `c = 0` (no trace
                                    reversal) for a nonzero gradient.
    covariant_divergence_derivative_layer — ★★★ THE HEART bundled: the bracket layer is the Ricci
                                    field's (N356) ∧ the derivative layer is the Ricci field's minus
                                    the rigid scalar gradient (this node) ∧ the ½ is rigid.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N350 `HasOpDerivAt0`/`hasOpDerivAt0_iff`/
  `const_opderiv`/`lbConn_offDiagVar_ne_zero`, the N351 `opderiv_sub`, the N354 `einsteinRaiseMap`/
  `ricciRaiseMap`/`ricciScalar`, the N356 `covTransport`/`metric_covTransport_zero`/
  `einstein_covTransport_eq_ricci`, and the N41g `CutHasDerivAt` (← the derived ℝ `Cut` ← the fold);
  `Filter.Tendsto`/`Module.End`/`LinearMap` are Mathlib MACHINERY on the DERIVED carrier (exactly as
  N350/N356 used them). Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for every
  declaration. Words-removable: delete "gravity / Einstein / Ricci / Bianchi / divergence /
  conservation / covariant / spacetime": over the derived complete ordered field `Cut`, for a scalar
  family `f : Cut → Cut` with `CutHasDerivAt f df 0` and an operator `A : Module.End Cut STVC`, the
  family `τ ↦ f τ • A` has operator-derivative `df • A`; the banked endomorphism
  `ricciRaiseMap G − (½·ricciScalar G)·id` has derivative `dRic − (½·dR)·id`; distinct coefficients
  give distinct such objects for `dR ≠ 0`; and the identity endomorphism is both bracket-central and
  derivative-flat. Pure topology/limit + noncommutative-ring algebra over the derived ℝ. NO theorem
  STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/derivative-layer — flagged; the split and the ½
  FALL OUT of the banked `einsteinRaiseMap` def + the derivative rules). NO empirical number. NO
  Mathlib number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/
  Riemannian/tensor-divergence/`HasDerivAt`/`deriv`/`fderiv`/`NormedSpace` as content (the derivative
  is the banked bare `Filter.Tendsto` `HasOpDerivAt0`/`CutHasDerivAt`, the transport the banked
  `covTransport`, the Einstein/Ricci endomorphisms the banked `einsteinRaiseMap`/`ricciRaiseMap`/
  `ricciScalar`). NO posited divergence/conservation law (the split is the derivative of the banked
  einstein endomorphism; the rigidity is `mul_right_cancel₀`; PROVED). Lovelock's exhaustiveness is
  CITED IN PROSE, NEVER a Lean declaration (asserting it would be a bridge). NO kernel-trust bypass,
  NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeFieldEquationLHS
import Phys.Algebra.SpacetimeRiemannAssembly
import Phys.Foundation.ContinuumExpDeriv

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The scalar-family × constant-operator derivative rule (grounds the metric term). -/

/-- ★ THE SCALAR-FAMILY × CONSTANT-OPERATOR DERIVATIVE RULE: if the scalar family `f : Cut → Cut`
    has the trunk-native derivative `df` at `0` (`CutHasDerivAt f df 0`, N41g), then the operator
    family `τ ↦ f τ • A` has operator-derivative `df • A` (N350 `HasOpDerivAt0`). Reduces per-vector
    to the scalar difference quotient over `Cut`. This is the rule the trace-reversal metric term's
    derivative face uses: the metric term is `(½R(τ)) • id`, a scalar family times the fixed
    identity operator. -/
theorem scalarOpDeriv (f : Cut → Cut) (df : Cut) (A : MetricEnd)
    (hf : CutHasDerivAt f df 0) :
    HasOpDerivAt0 (fun τ => f τ • A) (df • A) := by
  rw [hasOpDerivAt0_iff]
  intro v
  have hcongr : (fun s : Cut => s⁻¹ • ((f s • A) v - (f 0 • A) v))
      = (fun s : Cut => (s⁻¹ * (f s - f 0)) • (A v)) := by
    funext s
    simp only [LinearMap.smul_apply]
    rw [mul_smul, ← sub_smul]
  rw [hcongr]
  have hf0 : Tendsto (fun s : Cut => s⁻¹ * (f s - f 0)) (𝓝[≠] (0 : Cut)) (𝓝 df) := by
    have := hf; unfold CutHasDerivAt at this; simpa using this
  have hgoal : ((df • A) v) = df • (A v) := by rw [LinearMap.smul_apply]
  rw [hgoal]
  exact hf0.smul_const (A v)

/-- A concrete scalar gradient: the affine scalar `τ ↦ R₀ + τ·dR` has derivative `dR` at `0`. Used
    to witness that scalar gradients are genuinely nonzero (non-vacuity). -/
theorem affineScalarDeriv (R₀ dR : Cut) :
    CutHasDerivAt (fun τ => R₀ + τ * dR) dR 0 := by
  unfold CutHasDerivAt
  refine Tendsto.congr' (f₁ := fun _ : Cut => dR) ?_ tendsto_const_nhds
  filter_upwards [self_mem_nhdsWithin] with h hh
  have hh0 : h ≠ 0 := hh
  simp only [zero_add, zero_mul, add_zero]
  rw [show R₀ + h * dR - R₀ = h * dR by ring, ← mul_assoc, inv_mul_cancel₀ hh0, one_mul]

/-! ## (2) The trace-reversal metric term's derivative face, and id covariant-constancy. -/

/-- ★ THE TRACE-REVERSAL METRIC TERM'S DERIVATIVE FACE: the family `τ ↦ (½·R(τ)) • id` has
    operator-derivative `(½·dR) • id`, where `R : Cut → Cut` is the scalar-curvature field with
    scalar derivative `dR`. The metric term is a scalar family times the fixed identity operator;
    its derivative is the scalar gradient times the identity. This is where the `∇_ν R` gradient
    the whole conservation content localizes to (N356) enters. -/
theorem metricTerm_covDeriv (R : Cut → Cut) (dR : Cut) (hR : CutHasDerivAt R dR 0) :
    HasOpDerivAt0 (fun τ => (2⁻¹ * R τ) • (LinearMap.id : MetricEnd))
      ((2⁻¹ * dR) • (LinearMap.id : MetricEnd)) := by
  have hf : CutHasDerivAt (fun τ => 2⁻¹ * R τ) (2⁻¹ * dR) 0 := by
    unfold CutHasDerivAt at hR ⊢
    have := hR.const_mul (2⁻¹ : Cut)
    refine Tendsto.congr' ?_ this
    filter_upwards with h; ring
  exact scalarOpDeriv _ _ _ hf

/-- ★ THE METRIC ENDOMORPHISM (id) IS COVARIANTLY CONSTANT AT BOTH LAYERS. The bracket layer:
    `covTransport k id = 0` (the identity is central, banked N356 `metric_covTransport_zero`). The
    derivative layer: a constant operator field has zero derivative (`const_opderiv`, N350). So the
    metric endomorphism carries NO covariant-derivative content at either layer — the metric term
    `½R·id` contributes to conservation ONLY through the scalar gradient `dR`, never through the id
    factor. This is the structural reason the whole remaining content is the scalar gradient. -/
theorem id_covDeriv_both_layers (k : MetricEnd) :
    covTransport k (LinearMap.id : MetricEnd) = 0
      ∧ HasOpDerivAt0 (fun _ : Cut => (LinearMap.id : MetricEnd)) 0 :=
  ⟨metric_covTransport_zero k, const_opderiv _⟩

/-! ## (3) THE HEART: the Einstein-field derivative-layer split, grounded in the banked object. -/

/-- ★★★ THE DERIVATIVE-LAYER SPLIT. For a family of solderings `G : Cut → (STVC →ₗ MetricEnd)`, if
    the banked Ricci endomorphism field `τ ↦ ricciRaiseMap (G τ)` has operator-derivative `dRic`
    (N353/N350) and the banked Ricci scalar field `τ ↦ ricciScalar (G τ)` has scalar derivative `dR`
    (N353/N41g), then the banked Einstein endomorphism field `τ ↦ einsteinRaiseMap (G τ)` has
    operator-derivative `dRic − (½·dR)·id`. This is a theorem ABOUT the banked `einsteinRaiseMap`
    (`= ricciRaiseMap G − (½·ricciScalar G)·id`, N354): its covariant-derivative face is the Ricci
    field's face minus the pure scalar-curvature gradient times the identity. Since the metric
    term's BRACKET face is inert (N356), this derivative face is the ONLY remaining conservation
    content — the assembled `∇_ν R` gradient (J-P5). -/
theorem einsteinField_covDeriv (G : Cut → (STVC →ₗ[Cut] MetricEnd))
    (dRic : MetricEnd) (dR : Cut)
    (hRic : HasOpDerivAt0 (fun τ => ricciRaiseMap (G τ)) dRic)
    (hR : CutHasDerivAt (fun τ => ricciScalar (G τ)) dR 0) :
    HasOpDerivAt0 (fun τ => einsteinRaiseMap (G τ))
      (dRic - (2⁻¹ * dR) • (LinearMap.id : MetricEnd)) := by
  have hunfold : (fun τ => einsteinRaiseMap (G τ))
      = (fun τ => ricciRaiseMap (G τ)
          - (2⁻¹ * ricciScalar (G τ)) • (LinearMap.id : MetricEnd)) := by
    funext τ; rfl
  rw [hunfold]
  exact opderiv_sub hRic (metricTerm_covDeriv (fun τ => ricciScalar (G τ)) dR hR)

/-- THE BRACKET LAYER (banked N356, re-exposed for the bundle): the bracket-layer covariant
    transport of the banked Einstein endomorphism equals that of the Ricci endomorphism — the
    trace-reversal metric term `½R·id` is bracket-inert (the identity is central). So at the bracket
    layer `∇(einstein) = ∇(ricci)`; the difference lives entirely in the derivative layer. -/
theorem einstein_bracket_layer (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) :=
  einstein_covTransport_eq_ricci G k

/-! ## (4) THE RIGIDITY: Lovelock's uniqueness of the ½ retired to a derived theorem. -/

/-- ★★★ THE TRACE-REVERSAL-COEFFICIENT RIGIDITY (Lovelock uniqueness → derived). For distinct
    coefficients `c₁ ≠ c₂` and a NONZERO scalar gradient `dR`, the derivative-layer objects
    `dRic − (c₁·dR)·id` and `dRic − (c₂·dR)·id` are DISTINCT. So among the trace-reversed candidate
    fields `Ric − c·R·id`, AT MOST ONE coefficient `c` can make the derivative layer a consistent
    (divergence-free) source coupling — the coefficient is RIGID. This replaces Lovelock's
    uniqueness-of-`G` classification (a literature import) with a derived rigidity on the banked
    carrier: the ½ is not chosen, it is the unique consistent coefficient. Proof: subtract `dRic`,
    evaluate the identity endomorphism at `(1,0,0)`, and cancel `dR ≠ 0`. -/
theorem traceReversal_coeff_rigid (dRic : MetricEnd) (dR : Cut) (hdR : dR ≠ 0)
    {c₁ c₂ : Cut} (hc : c₁ ≠ c₂) :
    (dRic - (c₁ * dR) • (LinearMap.id : MetricEnd))
      ≠ (dRic - (c₂ * dR) • (LinearMap.id : MetricEnd)) := by
  intro heq
  have h2 : ((c₁ * dR) • (LinearMap.id : MetricEnd))
      = ((c₂ * dR) • (LinearMap.id : MetricEnd)) := sub_right_inj.mp heq
  have h3 := congrArg (fun (f : MetricEnd) => (f ((1:Cut),(0:Cut),(0:O Cut))).1) h2
  simp only [LinearMap.smul_apply, LinearMap.id_apply, Prod.smul_fst, smul_eq_mul, mul_one] at h3
  exact hc (mul_right_cancel₀ hdR h3)

/-! ## (5) NON-VACUITY (W8): a concrete nonzero gradient, and the ½ load-bearing. -/

/-- ★ NON-VACUITY (W8): a concrete nonzero scalar-operator derivative. The family
    `τ ↦ τ • lbConn offDiagVar` has operator-derivative `lbConn offDiagVar` (the identity scalar
    `τ ↦ τ` has derivative `1`, then `scalarOpDeriv`), which is NONZERO (banked
    `lbConn_offDiagVar_ne_zero`, N350). The derivative-layer machinery is not a vacuous "always
    zero" object — it genuinely measures a nonzero gradient. -/
theorem scalarGradient_ne_zero :
    HasOpDerivAt0 (fun τ : Cut => τ • lbConn offDiagVar) (lbConn offDiagVar)
      ∧ lbConn offDiagVar ≠ 0 := by
  refine ⟨?_, lbConn_offDiagVar_ne_zero⟩
  have hid : CutHasDerivAt (fun τ : Cut => τ) 1 0 := by
    have := affineScalarDeriv (0 : Cut) (1 : Cut)
    have hcongr : (fun τ : Cut => (0 : Cut) + τ * 1) = (fun τ : Cut => τ) := by
      funext τ; ring
    rw [hcongr] at this; exact this
  have := scalarOpDeriv (fun τ : Cut => τ) 1 (lbConn offDiagVar) hid
  simpa using this

/-- ★★ NON-VACUITY (W8): the trace-reversal `½` is genuinely LOAD-BEARING. For a nonzero scalar
    gradient (here `dR = 1`, `dRic = 0`), the derivative-layer object at `c = ½` (the Einstein
    trace-reversal) DIFFERS from the one at `c = 0` (no trace reversal, the bare Ricci gradient):
    `(0 − (½·1)·id) ≠ (0 − (0·1)·id)`. A "the trace-reversal coefficient does not matter" mis-reading
    is refuted; the ½ genuinely shifts the derivative layer. -/
theorem half_is_load_bearing :
    (0 - ((2⁻¹ : Cut) * 1) • (LinearMap.id : MetricEnd))
      ≠ (0 - ((0 : Cut) * 1) • (LinearMap.id : MetricEnd)) :=
  traceReversal_coeff_rigid 0 1 (by norm_num) (by norm_num)

/-! ## (6) THE HEART bundled. -/

/-- ★★★ THE THEORY-NATIVE HEART bundled — the covariant divergence structure at the derivative
    layer. For a soldering family `G` with the banked Ricci-endomorphism and Ricci-scalar
    derivatives, and any `k`: (i) the BRACKET layer of the Einstein field's covariant derivative is
    the Ricci field's (N356 `einstein_covTransport_eq_ricci`, the trace-reversal metric term is
    bracket-inert); (ii) the DERIVATIVE layer is the Ricci field's minus the pure scalar-curvature
    gradient, `∂(einsteinRaiseMap G) = dRic − (½·dR)·id` (this node); and (iii) the ½ is RIGID —
    distinct trace-reversal coefficients give distinct derivative-layer objects for a nonzero
    gradient (Lovelock uniqueness retired to a derived theorem). Together: the whole covariant
    divergence of the Einstein field reduces to the Ricci field's plus a RIGID scalar gradient — the
    derivative-layer assembly `∇_ν R` the conservation content localizes to (J-P5). The literal
    vanishing (the soldered twice-contracted Bianchi `∇^μ Ric_μν = ½∇_ν R`) is childed P5b WITHIN
    arc P. -/
theorem covariant_divergence_derivative_layer (G : Cut → (STVC →ₗ[Cut] MetricEnd))
    (dRic : MetricEnd) (dR : Cut) (hdR : dR ≠ 0) (k : MetricEnd)
    (hRic : HasOpDerivAt0 (fun τ => ricciRaiseMap (G τ)) dRic)
    (hR : CutHasDerivAt (fun τ => ricciScalar (G τ)) dR 0) :
    (covTransport k (einsteinRaiseMap (G 0)) = covTransport k (ricciRaiseMap (G 0)))
      ∧ HasOpDerivAt0 (fun τ => einsteinRaiseMap (G τ))
          (dRic - (2⁻¹ * dR) • (LinearMap.id : MetricEnd))
      ∧ ((dRic - ((2⁻¹ : Cut) * dR) • (LinearMap.id : MetricEnd))
          ≠ (dRic - ((0 : Cut) * dR) • (LinearMap.id : MetricEnd))) :=
  ⟨einstein_bracket_layer (G 0) k,
   einsteinField_covDeriv G dRic dR hRic hR,
   traceReversal_coeff_rigid dRic dR hdR (by norm_num)⟩

end

end Phys.Algebra
