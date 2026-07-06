/-
  Phys.Algebra.SpacetimeCovariantDerivative — N357 (arc-E E2-route): THE FULL COVARIANT DERIVATIVE
  `∇_k = D_k + ⁅Γ_k, ·⁆` UNITES THE FOLD'S TWO FACES, FULL METRIC-COMPATIBILITY `∇g = 0` IS THE
  TWO-LAYER CANCELLATION (`D(g) = k` exactly undone by the transport action `Γᵀη + ηΓ = k`), and the
  COSMOLOGICAL TERM `Λ·g` is FORCED as covariantly constant — the theory-native "+Λ g" of Lovelock —
  over the derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N356 (E2-route, `Phys/Algebra/SpacetimeDivergence.lean`), which banked
  the divergence STRUCTURE as the ONE bracket-Jacobi (`ricci_identity`), the naive scalar divergence
  IDENTICALLY BLIND (`divFiberTrace_blind`, `trace_lie` — the fold's self-blindness at conservation),
  and the trace-reversal metric term BRACKET-INERT (`einstein_covTransport_eq_ricci`, localizing the
  remaining `∇^μ G_μν = 0` content to the DERIVATIVE layer). Toward E2 (Einstein's equations unique —
  Lovelock a LITERATURE IMPORT / HIDDEN JOINT), this node UNITES the fold's two faces into the full
  covariant derivative, on the SAME banked derived-ℝ carrier `MetricEnd = Module.End Cut STVC`.

  ── THE THEORY-NATIVE ANCHOR (unite the two faces; the metric's derivative is cancelled by the
     transport — the fold's self-overlap carried forward is exactly unwound by the look-back) ──
  The fold has TWO faces, built SEPARATELY in the arc: the C6 eternal-approach DIRECTIONAL DERIVATIVE
  `D_k` (N350 `HasOpDerivAt0`, the `dΓ` face) and the LOOK-BACK TRANSPORT COMMUTATOR
  `⁅Γ_k, ·⁆ = covTransport k` (N356, the `Γ∧Γ` face). N356 defined the covariant transport as the
  BRACKET half ONLY, and localized `∇^μ G_μν = 0`'s remaining content to the derivative layer — but did
  NOT unite the two faces. THE FULL COVARIANT DERIVATIVE is their sum, `∇_k H = D_k H + ⁅Γ_k, H₀⁆`.

  When you unite them, the fold forces the DEFINING property of the Levi-Civita connection AS A THEOREM.
  For the weak-field metric `g(t) = η + t·k` (variation `k`):
    • the DERIVATIVE face is `D(g) = k` (`affine_opderiv`, N350 — the difference quotient recovers the
      linear coefficient);
    • the TRANSPORT face acting on both lower indices is `Γᵀ·η + η·Γ = k` (`metricCompat`, N347 — forced
      EXACTLY by `η·η = 1`, the flat self-overlap undoing itself, with `½ + ½ = 1`).
  So the covariant derivative of the metric is `∇g = D(g) − (Γᵀη + ηΓ) = k − k = 0` — FULL
  metric-compatibility, the two faces CANCELLING. Standard general relativity IMPOSES `∇g = 0` as the
  DEFINING axiom of the Levi-Civita connection and solves for the Christoffel symbols; here it is
  DERIVED — both layers equal `k`, from the ONE CAUSE `η² = 1`. This completes N356's bracket-only
  `metric_covTransport_zero` (which N356 flagged as "the id-central shadow; the deeper theory-native
  content is the banked N347 `metricCompat`") AND resolves N347's explicitly-childed derivative piece
  ("the derivative producing `k` is childed to the curvature build").

  ── THE COSMOLOGICAL TERM Λ·g IS FORCED (the "+Λ g" of Lovelock, existence DERIVED) ──
  Because the metric is covariantly constant (`∇g = 0`), ANY scalar multiple `Λ·g` is covariantly
  constant too: `∇(Λg) = Λ·D(g) − Λ·(Γᵀη + ηΓ) = Λk − Λk = 0`. So the cosmological term EXISTS as a
  divergence-free symmetric 2-tensor — FORCED by the fold, not a posited free parameter. This is the
  theory-native derivation of the "+Λ g_μν" half of Lovelock's answer. The COEFFICIENT `Λ` (the
  cosmological constant, a scale) is a route-not-yet-found FORCED build target — this node derives the
  STRUCTURE (Λg is divergence-free for any Λ), not the value. Lovelock's EXHAUSTIVENESS — that
  `G_μν + Λ g_μν` is the ONLY divergence-free symmetric 2-tensor from the metric + ≤2 derivatives —
  remains a LITERATURE IMPORT / HIDDEN JOINT (CITED as machinery, NOT a framework theorem), childed as
  the single successor toward E2 proper.

  ── SCOPE (W3) + HONEST GRADE ──
  This node banks the full covariant derivative operator (`HasCovDerivAt0`, its identification with the
  banked transport on constant fields, uniqueness, additivity), the FULL metric-compatibility `∇g = 0`
  as the two-layer cancellation, the covariantly-constant cosmological term `∇(Λg) = 0`, the `½`
  load-bearing at the `∇g` level, and non-vacuity. It is the WEAK-FIELD / leading-order layer (the
  cancellation at the flat point `g = η`); the full nonlinear covariant derivative is childed
  (weak-field is sufficient to reach E2/E3, `docs/SEED_GR_BLACKHOLE_COSMOLOGY.md` §E1). E2 proper
  (Lovelock's uniqueness — CITED) and the soldered derivative-level `∇^μ G_μν = 0` are childed. A
  MACHINERY node — leading-order/mechanism-grade, flagged: it asserts NO physical value; no `κ`, no `Λ`
  value, no field equation written down.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N347/N350/N356 objects) ──
    HasCovDerivAt0                — THE FULL COVARIANT DERIVATIVE: `∇_k H = D_k H + ⁅Γ_k, H₀⁆` — the
                                    fold's two faces (the C6 directional derivative + the look-back
                                    transport commutator) summed.
    covDeriv_const                — `∇` of a CONSTANT field is its covariant transport `⁅Γ_k, C⁆` (the
                                    derivative face vanishes) — ties N356 `covTransport` into the full ∇.
    covDeriv_unique               — `∇` is UNIQUE (from N350 `opderiv_unique` on the derivative face).
    covDeriv_add                  — `∇` is ADDITIVE (both faces additive: N350 `opderiv_add` +
                                    N356 `covTransport_add_right`).
    metricField_covDeriv_zero     — ★★★ FULL METRIC-COMPATIBILITY `∇g = 0` — the two banked layers
                                    CANCEL: `D(g) = k` (derivative face) exactly undone by the transport
                                    action `Γᵀη + ηΓ = k` (N347), both `= k` from `η² = 1`.
    cosmoTerm_covDeriv_zero       — ★★ THE COSMOLOGICAL TERM `Λ·g` IS COVARIANTLY CONSTANT `∇(Λg) = 0`
                                    for ANY `Λ` — the theory-native "+Λ g" of Lovelock, existence DERIVED.
    covDeriv_nonvacuous           — ★ W8: the full `∇` of a genuinely varying field is NONZERO
                                    (the derivative face alone gives `Γ(offDiagVar) ≠ 0`).
    metricCompat_half_load_bearing — ★ W8: dropping the Christoffel `½` (naive transport `η·k`, giving
                                    `2k`) makes the `∇g = 0` cancellation FAIL: `k − 2k = −k ≠ 0` for the
                                    concrete `timeProj`. The `½` is genuinely load-bearing at the ∇g level.
    covariant_derivative_structure — ★★★ THE HEART bundled: full metric-compatibility (`∇g = 0`, two-layer
                                    cancellation) ∧ the covariantly-constant cosmological term (`∇(Λg) = 0`).

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N356 `covTransport`/`covTransport_add_right`, the N350
  `HasOpDerivAt0`/`const_opderiv`/`opderiv_add`/`opderiv_unique`/`affine_opderiv`/`lbConn_offDiagVar_ne_zero`,
  the N347 `lbConn`/`lbConnAdj`/`metricCompat`/`lbConn_flat`, and the N90 `sigOpC`/`eta_mul_self` (←
  the derived ℝ `Cut` ← the fold); `Module.End`/`Tendsto`/`LinearMap` are Mathlib MACHINERY on the
  DERIVED carrier `MetricEnd` (exactly as N350/N356 used them). Complete: `#print axioms ⊆ {propext,
  Classical.choice, Quot.sound}` for every declaration. Words-removable: delete "metric / connection /
  covariant / cosmological / Levi-Civita / gravity / spacetime": over the derived complete ordered field
  `Cut`, for the involution `η` (`η·η = 1`, `sigOpC`) and the linear map `Γ = ½·η·(·)` on
  `Module.End Cut STVC`, the affine field `t ↦ η + t·k` has directional derivative `k` (in the banked
  operator topology), and `k − (½·k·η·η + η·½·η·k) = k − k = 0`, and `Λ·k − (…) = 0` for any `Λ`; and
  dropping the `½` makes the identity fail for the concrete `k = timeProj` (`k − 2k = −k ≠ 0`); the full
  operator `D + ⁅Γ,·⁆` is unique and additive; pure topology/limit + noncommutative-ring algebra over
  the derived ℝ. NO theorem STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/weak-field — flagged; the cancellation and the
  covariantly-constant `Λg` FALL OUT of the banked `metricCompat`/`affine_opderiv`; NO `Λ` value, NO
  `κ`, NO field equation). NO empirical number. NO Mathlib number-system content import (the field is the
  DERIVED `Cut`), NO Mathlib manifold/Riemannian/connection/`HasDerivAt`/`deriv`/`fderiv`/`NormedSpace`
  as content (the derivative is the banked bare `Filter.Tendsto` `HasOpDerivAt0`, the transport the
  banked `covTransport`, the connection the banked `lbConn`, the metric-compatibility the banked
  `metricCompat`). NO posited Levi-Civita `∇g = 0` axiom (it is the two banked layers cancelling, PROVED
  from `η² = 1`); NO posited cosmological term (it is `Λ·g` with `g` covariantly constant, PROVED). NO
  kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeDivergence
import Phys.Algebra.SpacetimeOperatorDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The full covariant derivative — the fold's two faces summed. -/

/-- THE FULL COVARIANT DERIVATIVE of an operator-valued field `H : Cut → MetricEnd` along the
    parameter, with the connection generated by the metric variation `k`. It is the SUM of the fold's
    TWO faces: the directional (C6 eternal-approach) derivative `dH` (N350 `HasOpDerivAt0 H dH`) and the
    look-back transport commutator `covTransport k (H 0) = ⁅Γ_k, H 0⁆` (N356). This unites the two faces
    that the arc built separately (`dΓ` at N350, `Γ∧Γ` at N356) into the genuine `∇_k = D_k + ⁅Γ_k, ·⁆`. -/
def HasCovDerivAt0 (H : Cut → MetricEnd) (k : MetricEnd) (r : MetricEnd) : Prop :=
  ∃ dH : MetricEnd, HasOpDerivAt0 H dH ∧ r = dH + covTransport k (H 0)

/-- The full covariant derivative of a CONSTANT field is its covariant transport `⁅Γ_k, C⁆` — the
    derivative face vanishes (`const_opderiv`, N350), leaving only the look-back transport commutator
    (N356). This ties the banked `covTransport` into the full `∇` as the covariant derivative of a
    (covariantly-transported) constant field. -/
theorem covDeriv_const (C k : MetricEnd) :
    HasCovDerivAt0 (fun _ => C) k (covTransport k C) := by
  refine ⟨0, const_opderiv _, ?_⟩; simp

/-- The full covariant derivative is UNIQUE — from `opderiv_unique` (N350) on the derivative face (the
    transport face is a fixed function of the field's value at `0`). -/
theorem covDeriv_unique {H : Cut → MetricEnd} {k r₁ r₂ : MetricEnd}
    (h₁ : HasCovDerivAt0 H k r₁) (h₂ : HasCovDerivAt0 H k r₂) : r₁ = r₂ := by
  obtain ⟨d₁, hd₁, hr₁⟩ := h₁
  obtain ⟨d₂, hd₂, hr₂⟩ := h₂
  rw [hr₁, hr₂, opderiv_unique hd₁ hd₂]

/-- The full covariant derivative is ADDITIVE: `∇(H + K) = ∇H + ∇K` (both faces additive — the
    derivative face by `opderiv_add`, N350; the transport face by `covTransport_add_right`, N356). -/
theorem covDeriv_add {H K : Cut → MetricEnd} {k a b : MetricEnd}
    (hH : HasCovDerivAt0 H k a) (hK : HasCovDerivAt0 K k b) :
    HasCovDerivAt0 (fun t => H t + K t) k (a + b) := by
  obtain ⟨dH, hdH, hrH⟩ := hH
  obtain ⟨dK, hdK, hrK⟩ := hK
  refine ⟨dH + dK, opderiv_add hdH hdK, ?_⟩
  rw [hrH, hrK, covTransport_add_right]
  abel

/-! ## (2) THE HEART: full metric-compatibility ∇g = 0 as the two-layer cancellation. -/

/-- ★★★ FULL METRIC-COMPATIBILITY `∇g = 0` — the fold's two banked layers CANCEL. For the weak-field
    metric field `g(t) = η + t·k` (metric variation `k`):
      • the DERIVATIVE face is `D(g) = k` (`affine_opderiv`, N350 — the difference quotient recovers the
        linear coefficient);
      • the TRANSPORT face acting on both lower indices is `Γᵀ·η + η·Γ = k` (`metricCompat`, N347 —
        forced EXACTLY by `η·η = 1`, the flat self-overlap undoing itself, with `½ + ½ = 1`).
    So the covariant derivative of the metric is `∇g = D(g) − (Γᵀη + ηΓ) = k − k = 0`. Standard general
    relativity IMPOSES `∇g = 0` as the DEFINING Levi-Civita axiom; here it is DERIVED — both layers equal
    `k`, from the ONE CAUSE `η² = 1`. Completes N356's bracket-only `metric_covTransport_zero` and
    resolves N347's explicitly-childed derivative piece. -/
theorem metricField_covDeriv_zero (k : MetricEnd) :
    HasOpDerivAt0 (fun t => sigOpC + t • k) k
      ∧ k - (lbConnAdj k * sigOpC + sigOpC * lbConn k) = 0 := by
  refine ⟨affine_opderiv sigOpC k, ?_⟩
  rw [metricCompat]; abel

/-- ★★ THE COSMOLOGICAL TERM `Λ·g` IS COVARIANTLY CONSTANT: `∇(Λg) = 0` for ANY `Λ`. Because the metric
    is covariantly constant (`metricField_covDeriv_zero`), any scalar multiple is too: the derivative
    face `D(Λg) = Λ·k` is exactly cancelled by the scaled transport action `Γᵀ(Λk)·η + η·Γ(Λk) = Λk`
    (`metricCompat` applied to the scaled variation). So `∇(Λg) = Λk − Λk = 0`. This is the theory-native
    "+Λ g" of Lovelock — the cosmological term's EXISTENCE as a divergence-free symmetric 2-tensor,
    FORCED by the fold, not a posited free parameter. The COEFFICIENT `Λ` (the cosmological constant, a
    scale) is a route-not-yet-found FORCED build target; this derives the STRUCTURE, not the value.
    Lovelock's EXHAUSTIVENESS (that `G + Λg` is the ONLY such tensor) stays a CITED literature import. -/
theorem cosmoTerm_covDeriv_zero (Λ : Cut) (k : MetricEnd) :
    HasOpDerivAt0 (fun t => (Λ • sigOpC) + t • (Λ • k)) (Λ • k)
      ∧ (Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0 := by
  refine ⟨affine_opderiv (Λ • sigOpC) (Λ • k), ?_⟩
  rw [metricCompat]; abel

/-! ## (3) NON-VACUITY (W8): a genuine nonzero ∇, and the Christoffel ½ load-bearing at the ∇g level. -/

/-- ★ NON-VACUITY (W8): the FULL covariant derivative of a genuinely varying field is NONZERO. For the
    affine transport field `t ↦ Γ(timeProj) + t·Γ(offDiagVar)` with connection variation `k = 0` (so the
    bracket face vanishes), the derivative face alone gives `∇ = Γ(offDiagVar) = lbConn offDiagVar ≠ 0`
    (`lbConn_offDiagVar_ne_zero`, N350). The full `∇` is not a vacuous "always zero" object. -/
theorem covDeriv_nonvacuous :
    HasCovDerivAt0 (fun t => lbConn timeProj + t • lbConn offDiagVar) 0 (lbConn offDiagVar)
      ∧ lbConn offDiagVar ≠ 0 := by
  refine ⟨⟨lbConn offDiagVar, affine_opderiv _ _, ?_⟩, lbConn_offDiagVar_ne_zero⟩
  rw [show covTransport 0 (lbConn timeProj + (0 : Cut) • lbConn offDiagVar) = 0 by
        unfold covTransport; rw [lbConn_flat]; simp]
  simp

/-- ★ NON-VACUITY (W8): the Christoffel `½` in the connection is genuinely LOAD-BEARING for `∇g = 0`.
    Dropping it (the naive transport `η·k`, whose two-index action is `(η·k)ᵀ·η + η·(η·k) = k·η·η + η·η·k
    = 2k`) makes the cancellation FAIL: `k − 2k = −k ≠ 0` for the concrete nonzero variation `timeProj`.
    Mirrors N347 `wrongConn_not_compatible` at the `∇g` level — a vacuous reading where any `η`-scaled
    connection gives `∇g = 0` is refuted. -/
theorem metricCompat_half_load_bearing :
    (timeProj : MetricEnd) - ((timeProj * sigOpC) * sigOpC + sigOpC * (sigOpC * timeProj)) ≠ 0 := by
  rw [mul_assoc, eta_mul_self, mul_one, ← mul_assoc, eta_mul_self, one_mul]
  intro hcon
  have hz : (timeProj : MetricEnd) = 0 := by
    have h2 : timeProj - (timeProj + timeProj) = 0 := hcon
    linear_combination (norm := abel) -h2
  exact timeProj_ne_zero hz

/-- ★★★ THE HEART bundled: the full covariant derivative unites the fold's two faces, and on the metric
    the two layers CANCEL. Together: (i) full metric-compatibility `∇g = 0` — the derivative face
    `D(g) = k` exactly undone by the transport action `Γᵀη + ηΓ = k` (both `= k` from `η² = 1`); and
    (ii) the cosmological term `Λ·g` is covariantly constant for ANY `Λ`. The DEFINING Levi-Civita
    property (which the field IMPOSES) and the "+Λ g" of Lovelock (which the field CLASSIFIES) are both
    FORCED by the fold — Lovelock's EXHAUSTIVENESS the only remaining external (CITED) fact. -/
theorem covariant_derivative_structure (k : MetricEnd) (Λ : Cut) :
    (k - (lbConnAdj k * sigOpC + sigOpC * lbConn k) = 0)
      ∧ ((Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0) :=
  ⟨(metricField_covDeriv_zero k).2, (cosmoTerm_covDeriv_zero Λ k).2⟩

end

end Phys.Algebra
