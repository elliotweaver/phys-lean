/-
  Phys.Algebra.SpacetimeFieldEquationLHS — N358 (arc-E E2): THE GRAVITATIONAL FIELD-EQUATION LHS
  DESCENDS FROM THE ONE LOOK-BACK TRANSPORT — both covariantly-conserved symmetric 2-tensors
  (the EINSTEIN tensor `G` from `Γ`'s NON-CLOSURE, the cosmological term `Λ·g` from `Γ`'s
  COMPATIBILITY) trace to the single `lbConn`, are LINEARLY INDEPENDENT (the derived candidate LHS
  is a genuine 2-PLANE, not a line), and span the derived 2-parameter family `{a·G + Λ·g}`;
  Lovelock's EXHAUSTIVENESS the CITED literature import (HIDDEN JOINT), over the derived ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N357 (E2-route, `Phys/Algebra/SpacetimeCovariantDerivative.lean`),
  which banked the full covariant derivative `∇ = D + ⁅Γ,·⁆` (uniting the fold's two faces), full
  metric-compatibility `∇g = 0` (the two-layer cancellation, forced by `η²=1`), and the cosmological
  term `Λ·g` FORCED as covariantly constant (`∇(Λg) = 0` for any `Λ` — the "+Λ g" existence). Toward
  E2 (Einstein's equations unique — Lovelock a LITERATURE IMPORT / HIDDEN JOINT), this node builds the
  CAPSTONE of the arc-E LHS geometry on the SAME banked derived-ℝ carrier `MetricEnd = Module.End Cut
  STVC`: the whole field-equation LHS descends from the ONE look-back transport, its two conserved
  generators are independent, and they span the derived 2-parameter candidate family.

  ── THE THEORY-NATIVE ANCHOR (the whole LHS is the ONE transport's two faces) ──
  The entire arc-E left-hand-side geometry descended from a SINGLE object `Γ = lbConn k = ½·η·k`
  (N347). Two faces of that one transport furnish the two covariantly-conserved symmetric 2-tensors
  the gravitational field equation is built from:
    • the COMPATIBILITY face: `Γ` preserves the Born self-overlap (`Γᵀη + ηΓ = k`, forced by `η²=1`,
      N347), so `∇g = 0` (N357) and hence `Λ·g` is covariantly constant for ANY `Λ` — the
      cosmological generator, existence DERIVED;
    • the NON-CLOSURE face: two transports fail to commute, `R = ⁅Γ,Γ⁆` (N348), giving the curvature,
      the Ricci/scalar/Einstein tensor `G` (N352–354), and the divergence structure = the bracket-
      Jacobi of `Γ` (N356) — the Einstein generator.
  Standard general relativity POSITS a connection and CLASSIFIES the divergence-free symmetric
  2-tensors (Lovelock's theorem) to FIND the menu `G_μν + Λ g_μν`. Here the connection is DERIVED
  (= the look-back transport) and BOTH generators are shown to descend from it — the field's
  classification result becomes the theory's "one cause, many terminations."

  ── THE FORCED FACTS (the heart): independence + the 2-parameter family ──
  The two conserved generators are GENUINELY INDEPENDENT: the Einstein form `einstein solderWit` is
  NOT a scalar multiple of the metric `BvC` (`einstein_not_metric_multiple`) — evaluated on two
  discriminating pairs, a common ratio `c` would force `c = ⅛` and `c = −⅛`. So the derived candidate
  LHS `{a·G + Λ·g}` is a genuine 2-PLANE, not a line: distinct coefficient pairs `(a,Λ)` give
  distinct rank-(0,2) forms (`lhsForm_faithful`). This 2-plane is exactly the candidate space Lovelock
  says (CITED) is EXHAUSTIVE — the framework content of E2, made a theorem.

  ── THE LHS IS CONSERVED-STRUCTURED (both metric terms bracket-inert) ──
  At the bracket layer, the covariant transport of the LHS endomorphism `a·einsteinRaiseMap G + Λ·id`
  is carried ENTIRELY by the Ricci part: `covTransport k (lhsRaiseMap a Λ G) = a·covTransport k
  (ricciRaiseMap G)` (`lhs_covTransport_eq_ricci`). BOTH metric terms drop — the `½R·id` in the
  Einstein part (N356 `einstein_covTransport_eq_ricci`, the trace-reversal metric term is bracket-
  inert) AND the `Λ·id` cosmological part (id central, N356 `metric_covTransport_zero`). The remaining
  content lives in the DERIVATIVE layer (childed).

  ── SCOPE (W3) + HONEST GRADE ──
  This node banks the LHS descent from the one transport, the independence of the two generators, the
  2-parameter faithful family, the conserved-structured transport, and the one-cause bundle. It is the
  WEAK-FIELD / algebraic layer: the full derivative-level covariant divergence `∇^μ G_μν = 0` is
  STRUCTURALLY BLOCKED here (the curvature scalars are CONSTANTS on the fixed field gradient — measured
  `ricciScalar solderWit = −¼`, `einsteinScalar solderWit = 1` — so `∇R = 0` trivially, a vacuous
  identity, the N356 fiber-trace blindness one layer up); it needs a COORDINATE-VARYING metric field
  and is CHILDED. Lovelock's EXHAUSTIVENESS (that `G + Λg` is the ONLY divergence-free symmetric
  2-tensor) is a LITERATURE IMPORT / HIDDEN JOINT — CITED IN PROSE, NEVER a Lean theorem (Mathlib lacks
  it; asserting it would be a bridge). A MACHINERY node — leading-order/mechanism-grade, flagged: it
  asserts NO physical value; no `κ`, no `Λ` value, no field equation `= κT` written down.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N354/N356/N357 objects) ──
    einstein_not_metric_multiple — ★★ INDEPENDENCE: the Einstein form `G` is NOT a scalar multiple of
                                   the metric `g` — the two conserved generators are linearly
                                   independent (the candidate LHS is a genuine 2-plane, not a line).
    lhsForm / lhsForm_faithful    — ★★★ THE 2-PARAMETER LHS FAMILY `a·G + Λ·g` is genuinely
                                   2-dimensional: distinct `(a,Λ)` give distinct forms. This IS the
                                   candidate space Lovelock (CITED) says is exhaustive.
    lhsRaiseMap                   — the LHS endomorphism `a·einsteinRaiseMap G + Λ·id`.
    lhs_covTransport_eq_ricci     — ★★ CONSERVED-STRUCTURED: the LHS's bracket-layer covariant
                                   transport is `a·(transport of ricciRaiseMap G)` — BOTH metric terms
                                   (Einstein's `½R·id` and the cosmological `Λ·id`) are bracket-inert.
    lhs_generators_from_lbConn    — ★ both generators from the one `lbConn`: the `+Λg` existence
                                   (`∇(Λg)=0` for any `Λ`, N357) + the Einstein metric part bracket-
                                   inert (N356).
    lhsForm_nonvacuous            — ★ W8: the LHS form is a genuine nonzero object for concrete
                                   coefficients and a concrete pair.
    field_equation_lhs_structure  — ★★★ THE HEART bundled: the LHS descends from the one transport
                                   (independence of `G` and `g`) ∧ the family is genuinely 2-parameter
                                   ∧ conserved-structured (both metric terms bracket-inert).

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N354 `einstein`/`einstein_solder_form`/
  `einsteinRaiseMap`, the N356 `covTransport`/`einstein_covTransport_eq_ricci`/`metric_covTransport_zero`,
  the N357 `cosmoTerm_covDeriv_zero`, the N353 `ricciRaiseMap`, the banked metric `BvC`/`gFormC_zero_right'`,
  and the N355 `covTransport_smul_right` (← the derived ℝ `Cut` ← the fold); `LinearMap`/`Module.End`/
  `lie_add`/`•` are Mathlib MACHINERY on the DERIVED carrier. Complete: `#print axioms ⊆ {propext,
  Classical.choice, Quot.sound}` for every declaration. Words-removable: delete "Einstein / gravity /
  cosmological / field-equation / Lovelock / conserved / metric": over the derived complete ordered
  field `Cut`, the symmetric form `einstein solderWit` is not a scalar multiple of the derived form
  `BvC`; distinct coefficient pairs `(a,Λ)` give distinct forms `a·einstein + Λ·BvC`; and
  `⁅Γk, a·E + Λ·1⁆ = a·⁅Γk, ricciRaiseMap⁆` because the identity is central and the trace-reversal term
  is bracket-inert; pure linear/bilinear-form + Lie-ring algebra over the derived ℝ. NO theorem
  STATEMENT needs a physics word.

  NO asserted value (machinery node, leading-order/weak-field — flagged; the independence and the
  2-plane FALL OUT of the banked `einstein_solder_form`/`BvC`; NO `Λ` value, NO `κ`, NO field
  equation). NO empirical number. NO Mathlib number-system content import (the field is the DERIVED
  `Cut`), NO Mathlib manifold/Riemannian/tensor/Lovelock-as-content (the Einstein tensor is the banked
  derived `einstein`, the metric the banked derived `BvC`, the transport the banked derived
  `covTransport`; `LinearMap`/`lie_add` are machinery on the derived carrier). NO posited field-
  equation LHS (both generators are the banked derived tensors; the independence + 2-plane are PROVED).
  Lovelock's exhaustiveness is CITED IN PROSE, NEVER a Lean declaration (asserting it would be a
  bridge). NO kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeCovariantDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) INDEPENDENCE — the two conserved generators `G` and `g` are linearly independent. -/

/-- ★★ INDEPENDENCE: the Einstein form `G` is NOT a scalar multiple of the metric `g`. Evaluated on
    two discriminating pairs of the concrete field-gradient soldering `solderWit`: at `(1,0,0)`,
    `einstein solderWit = ⅛` and `BvC = 1`, forcing `c = ⅛`; at `(0,1,0)`, `einstein solderWit = ⅛`
    (`= ¼·1·1 + ⅛·(−1)`) and `BvC = −1`, forcing `c = −⅛`. No single scalar `c` satisfies both — the
    two covariantly-conserved symmetric 2-tensors are LINEARLY INDEPENDENT, so the derived candidate
    LHS `{a·G + Λ·g}` is a genuine 2-PLANE (geometry not trivially Einstein). -/
theorem einstein_not_metric_multiple :
    ¬ ∃ c : Cut, ∀ Y Z : STVC, einstein solderWit Y Z = c * BvC Y Z := by
  rintro ⟨c, hc⟩
  have h1 := hc ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))
  have h2 := hc ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut))
  rw [einstein_solder_form] at h1 h2
  have hb1 : BvC ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut)) = (1:Cut) := by
    show (1:Cut)*1 - (0:Cut)*0 - gFormC (0:O Cut) 0 = 1
    rw [gFormC_zero_right']; ring
  have hb2 : BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) = -(1:Cut) := by
    show (0:Cut)*0 - (1:Cut)*1 - gFormC (0:O Cut) 0 = -1
    rw [gFormC_zero_right']; ring
  rw [hb1] at h1
  rw [hb2] at h2
  have e1 : c = (8⁻¹ : Cut) := by linarith [h1]
  have e2 : c * (-(1:Cut)) = (8⁻¹ : Cut) := by linarith [h2]
  rw [e1] at e2
  norm_num at e2

/-! ## (2) THE 2-PARAMETER LHS FAMILY `a·G + Λ·g` is genuinely 2-dimensional. -/

/-- THE FIELD-EQUATION LHS as a rank-(0,2) FORM: `lhsForm a Λ G Y Z = a·G(Y,Z) + Λ·g(Y,Z)`, the
    2-parameter family spanned by the two derived conserved generators — the banked Einstein tensor
    `einstein G` (coefficient `a`) and the banked derived metric `BvC` (coefficient `Λ`, the
    cosmological term). -/
def lhsForm (a Λ : Cut) (G : STVC →ₗ[Cut] MetricEnd) (Y Z : STVC) : Cut :=
  a * einstein G Y Z + Λ * BvC Y Z

/-- ★★★ THE CANDIDATE LHS SPACE IS GENUINELY 2-DIMENSIONAL: distinct coefficient pairs `(a,Λ)` give
    distinct LHS forms (for the concrete soldering). If `lhsForm a₁ Λ₁ = lhsForm a₂ Λ₂` as forms,
    then `a₁ = a₂ ∧ Λ₁ = Λ₂` — forced by the linear independence of `einstein solderWit` and `BvC`
    (evaluated on the two discriminating pairs). The two conserved generators `G` and `g` are a
    genuine 2-frame; the derived candidate LHS is a 2-PLANE, matching Lovelock's `G + Λg` (whose
    EXHAUSTIVENESS is the CITED external fact). -/
theorem lhsForm_faithful (a₁ Λ₁ a₂ Λ₂ : Cut)
    (h : ∀ Y Z : STVC, lhsForm a₁ Λ₁ solderWit Y Z = lhsForm a₂ Λ₂ solderWit Y Z) :
    a₁ = a₂ ∧ Λ₁ = Λ₂ := by
  have h1 := h ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut))
  have h2 := h ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut))
  unfold lhsForm at h1 h2
  rw [einstein_solder_form] at h1 h2
  have hb1 : BvC ((1:Cut),(0:Cut),(0:O Cut)) ((1:Cut),(0:Cut),(0:O Cut)) = (1:Cut) := by
    show (1:Cut)*1 - (0:Cut)*0 - gFormC (0:O Cut) 0 = 1
    rw [gFormC_zero_right']; ring
  have hb2 : BvC ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut)) = -(1:Cut) := by
    show (0:Cut)*0 - (1:Cut)*1 - gFormC (0:O Cut) 0 = -1
    rw [gFormC_zero_right']; ring
  rw [hb1] at h1
  rw [hb2] at h2
  refine ⟨?_, ?_⟩
  · linarith [h1, h2]
  · linarith [h1, h2]

/-! ## (3) THE LHS ENDOMORPHISM is conserved-structured (both metric terms bracket-inert). -/

/-- THE FIELD-EQUATION LHS ENDOMORPHISM: `a·G + Λ·g` raised, `a • einsteinRaiseMap G + Λ • id` (the
    metric-raise of `g` is the identity, N354). The 2-parameter candidate space at the endomorphism
    level. -/
def lhsRaiseMap (a Λ : Cut) (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd :=
  a • einsteinRaiseMap G + Λ • (LinearMap.id : MetricEnd)

/-- ★★ THE LHS FAMILY IS CONSERVED-STRUCTURED at the bracket layer: the covariant transport of the
    LHS endomorphism equals `a·(transport of ricciRaiseMap G)`. BOTH metric terms drop out — the
    `½R·id` in the Einstein part (N356 `einstein_covTransport_eq_ricci`, the trace-reversal metric
    term is bracket-inert) AND the `Λ·id` cosmological part (id central, N356
    `metric_covTransport_zero`). The bracket-layer transport of the whole LHS is carried ENTIRELY by
    the Ricci part; the remaining content lives in the DERIVATIVE layer (childed). -/
theorem lhs_covTransport_eq_ricci (a Λ : Cut) (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd) :
    covTransport k (lhsRaiseMap a Λ G) = a • covTransport k (ricciRaiseMap G) := by
  unfold lhsRaiseMap
  rw [show covTransport k (a • einsteinRaiseMap G + Λ • (LinearMap.id : MetricEnd))
        = covTransport k (a • einsteinRaiseMap G) + covTransport k (Λ • (LinearMap.id : MetricEnd))
      from by unfold covTransport; rw [lie_add]]
  rw [covTransport_smul_right, covTransport_smul_right, metric_covTransport_zero, smul_zero,
    add_zero, einstein_covTransport_eq_ricci]

/-- ★ BOTH GENERATORS FROM THE ONE `lbConn`: the cosmological generator `Λ·g` is covariantly constant
    (`∇(Λg) = 0` for ANY `Λ`, N357 `cosmoTerm_covDeriv_zero` — the "+Λ g" existence, from
    metric-compatibility of the single look-back transport, `η²=1`), and the Einstein generator's
    trace-reversal metric part is bracket-inert (N356 `einstein_covTransport_eq_ricci`). Both
    conserved 2-tensors trace to the one `lbConn`, no free parameter posited. -/
theorem lhs_generators_from_lbConn (Λ : Cut) (k : MetricEnd) (G : STVC →ₗ[Cut] MetricEnd) :
    ((Λ • k) - (lbConnAdj (Λ • k) * sigOpC + sigOpC * lbConn (Λ • k)) = 0)
      ∧ covTransport k (einsteinRaiseMap G) = covTransport k (ricciRaiseMap G) :=
  ⟨(cosmoTerm_covDeriv_zero Λ k).2, einstein_covTransport_eq_ricci G k⟩

/-! ## (4) NON-VACUITY (W8): the LHS form is a genuine nonzero object. -/

/-- ★ NON-VACUITY (W8): the LHS form is a genuine nonzero object for concrete coefficients and a
    concrete pair. At `a = 1, Λ = 0`, `lhsForm 1 0 solderWit (0,1,0)(0,1,0) = einstein solderWit
    (0,1,0)(0,1,0) = ⅛ ≠ 0` (the banked `einstein_solder_ne_zero`). The 2-parameter family is not a
    vacuous "always zero" object. -/
theorem lhsForm_nonvacuous :
    lhsForm (1 : Cut) (0 : Cut) solderWit ((0:Cut),(1:Cut),(0:O Cut)) ((0:Cut),(1:Cut),(0:O Cut))
      ≠ 0 := by
  unfold lhsForm
  rw [zero_mul, add_zero, one_mul]
  exact einstein_solder_ne_zero

/-! ## (5) THE HEART: the field-equation LHS descends from the one transport. -/

/-- ★★★ THE THEORY-NATIVE HEART bundled — the gravitational field-equation LHS descends from the ONE
    look-back transport. Together: (i) the two conserved generators `G` and `g` are LINEARLY
    INDEPENDENT (the Einstein form is not a scalar multiple of the metric) — the derived candidate LHS
    is a genuine 2-PLANE; (ii) the family is genuinely 2-parameter (distinct `(a,Λ)` → distinct
    forms); and (iii) the LHS is CONSERVED-STRUCTURED (both metric terms bracket-inert, the transport
    carried by the Ricci part). Standard GR POSITS the connection and CLASSIFIES the divergence-free
    2-tensors (Lovelock) to find `G + Λg`; here the connection is DERIVED (look-back transport) and
    BOTH generators descend from it — Lovelock's EXHAUSTIVENESS the only remaining external (CITED,
    prose-only) fact. -/
theorem field_equation_lhs_structure (a₁ Λ₁ a₂ Λ₂ : Cut) (a Λ : Cut)
    (G : STVC →ₗ[Cut] MetricEnd) (k : MetricEnd)
    (h : ∀ Y Z : STVC, lhsForm a₁ Λ₁ solderWit Y Z = lhsForm a₂ Λ₂ solderWit Y Z) :
    (¬ ∃ c : Cut, ∀ Y Z : STVC, einstein solderWit Y Z = c * BvC Y Z)
      ∧ (a₁ = a₂ ∧ Λ₁ = Λ₂)
      ∧ covTransport k (lhsRaiseMap a Λ G) = a • covTransport k (ricciRaiseMap G) :=
  ⟨einstein_not_metric_multiple, lhsForm_faithful a₁ Λ₁ a₂ Λ₂ h,
    lhs_covTransport_eq_ricci a Λ G k⟩

end

end Phys.Algebra
