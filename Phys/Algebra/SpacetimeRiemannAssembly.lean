/-
  Phys.Algebra.SpacetimeRiemannAssembly — N351 (arc-E E1-assembly): THE FULL LINEARIZED CURVATURE
  2-FORM `F = dΓ + Γ∧Γ` assembled from the banked operator-derivative (`dΓ`, N350) and the banked
  commutator (`Γ∧Γ`, N348), with the theory-native TWO-LAYER decomposition, over the DERIVED ℝ `Cut`.
  ===========================================================================
  DIRECTED SINGLE SUCCESSOR of N350 (E1-deriv, `Phys/Algebra/SpacetimeOperatorDerivative.lean`), which
  banked the `dΓ` machinery (the operator-field directional derivative `HasOpDerivAt0` + the
  transport-commutes-with-derivative heart `lbConn_opderiv`). N348 banked the `Γ∧Γ` machinery (the
  commutator `lbCurv = [Γ₁,Γ₂]`, the look-back transport's non-closure). BOTH pieces of the linearized
  Riemann `F = dΓ + Γ∧Γ` are now banked; this node ASSEMBLES them into the single curvature 2-form on
  the SAME banked carrier `MetricEnd = Module.End Cut STVC`, toward E2 (Einstein's equations unique via
  Lovelock).

  ── THE THEORY-NATIVE ANCHOR + THE ONE LAW (measured, not forced to match textbook GR) ──
  A FRESH-worker SELECT asked FIRST what the theory says the assembly IS, and MEASURED it (probe1–4, all
  EXIT 0). The measurement surfaced a genuine theory-native structure the naive "assemble `dΓ − dΓ + Γ∧Γ`"
  framing hides — and THE ONE LAW forbids forcing it to look like the textbook. In the look-back-transport
  operator model, the connection is `Γ = lbConn k = ½·η·k` (N347), a SINGLE-operator map. Its
  derivative-level (`dΓ`) layer is the antisymmetrized transport of the field's second variation,
      `dConn a₁₂ a₂₁ := Γ(a₁₂) − Γ(a₂₁) = lbConn (a₁₂ − a₂₁)`   (`dConn_eq`),
  where `a₁₂ = ∂₁∂₂ h`, `a₂₁ = ∂₂∂₁ h` are the two orders of the second field variation. By the linearity
  of the transport (`lbConn_sub`, forced by `η²=1`) this layer VANISHES whenever the field variations
  commute (`a₁₂ = a₂₁`, the INTEGRABLE / gradient case): `dConn a a = 0` (`dConn_integrable_zero`). So the
  `dΓ` layer measures ONLY the field's NON-INTEGRABILITY. The IRREDUCIBLE curvature content — the piece
  that survives even for an integrable field — is the COMMUTATOR `Γ∧Γ = lbCurv` (N348), the fold's
  self-blindness at the connection level. This is the theory REORDERING the significance the textbook
  bookkeeping flattens: the commutator is PRIMARY (the look-back non-closure), the derivative layer is
  SECONDARY (field non-integrability). We do NOT force `dΓ` to carry content it does not carry in this
  model; we NAME the two layers and prove which one holds the irreducible non-closure.

  ── THE ONE FORCED FACT (the heart): the two-layer structure ──
  The full linearized curvature 2-form is `F = dΓ + Γ∧Γ`:
      `linRiemann a₁₂ a₂₁ k₁ k₂ := dConn a₁₂ a₂₁ + lbCurv k₁ k₂`.
  It is antisymmetric under the joint loop-reversal (`linRiemann_antisymm`, a genuine 2-form). For an
  INTEGRABLE field (`a₁₂ = a₂₁`) it reduces EXACTLY to the commutator curvature (`linRiemann_integrable`:
  `F = lbCurv`), yet is genuinely NONZERO for the concrete pair (`linRiemann_ne_zero`). The `dΓ` layer is
  GROUNDED (not posited): `dConn` IS the operator directional derivative of a genuine difference of
  transport families, via the banked N350 heart `lbConn_opderiv` (`dConn_grounded`). And the fiber trace
  of the full 2-form sees ONLY the derivative layer — it is BLIND to the commutator
  (`linRiemann_fiberTrace_eq_dConn`, extending N349's trace no-go to the full assembly), so for an
  integrable field the naive Ricci-by-basis-trace vanishes identically
  (`linRiemann_fiberTrace_integrable_zero`) — the theory-native Ricci must again be the fold's Born form,
  not a basis trace (childed).

  ── SCOPE (W3 — this beat is the FULL 2-form ASSEMBLY + the two-layer structure; the Ricci is childed) ──
  This node banks the assembled curvature 2-form `linRiemann = dΓ + Γ∧Γ`, its 2-form antisymmetry, the
  integrable reduction to the commutator, the grounding of the `dΓ` layer in the banked operator
  derivative, the fiber-trace decomposition, and non-vacuity of both layers. The TENSORIAL Ricci
  contraction of `linRiemann` (theory-native, via the fold's Born form as N349 did for the commutator,
  since the basis trace is again blind) and E2 (Einstein's equations unique via Lovelock literature
  import, applied to the assembled curvature) are childed. Weak-field is sufficient to reach E2/E3
  (docs/SEED_GR_BLACKHOLE_COSMOLOGY.md §E1). A MACHINERY / assembly node: it asserts NO physical value; it
  is flagged leading-order/mechanism-grade.

  ── WHAT IS PROVED (each a theorem, foundations-only, forward from the banked N348/N349/N350 objects) ──
    lbConn_sub / lbConn_neg          — the look-back transport is linear (subtractive/negatable), from `η²=1`.
    opderiv_neg / opderiv_sub        — the operator directional derivative is subtractive (via `opderiv_add`
                                       + `opderiv_neg`; `ContinuousSub STVC` is not synthesized, so `neg`+`add`).
    dConn                            — the `dΓ` layer `Γ(a₁₂) − Γ(a₂₁)`, the antisymmetrized transport of the
                                       second field variation.
    dConn_eq                         — `dConn a₁₂ a₂₁ = lbConn (a₁₂ − a₂₁)` (transport linearity).
    dConn_antisymm                   — `dConn a₁₂ a₂₁ = − dConn a₂₁ a₁₂` (a 2-form layer).
    dConn_integrable_zero            — ★ `dConn a a = 0`: the `dΓ` layer VANISHES for an integrable field;
                                       it measures ONLY the field's non-integrability.
    dConn_grounded                   — ★★ GROUNDING (via N350 `lbConn_opderiv`): `dConn` IS the operator
                                       directional derivative of a genuine difference of transport families
                                       — NOT a posited tensor.
    dConn_ne_zero                    — a concrete nonzero `dΓ` layer (`dConn offDiagVar 0 ≠ 0`).
    linRiemann                       — the FULL linearized curvature 2-form `F = dΓ + Γ∧Γ`.
    linRiemann_eq                    — `F = lbConn (a₁₂ − a₂₁) + lbCurv k₁ k₂` (both banked layers).
    linRiemann_antisymm              — ★ `F(a₁₂,a₂₁,k₁,k₂) = − F(a₂₁,a₁₂,k₂,k₁)` (the full 2-form).
    linRiemann_integrable            — ★★★ THE HEART: for an INTEGRABLE field, `F = lbCurv` — the full
                                       curvature reduces to the commutator; the fold's self-blindness at the
                                       connection level is the irreducible layer.
    linRiemann_flat                  — the flat limit `F(0,0,0,0) = 0` (no field, no curvature).
    linRiemann_ne_zero               — ★★ NON-VACUITY (W8): `F ≠ 0` for the concrete pair.
    linRiemann_fiberTrace_eq_dConn   — ★ the fiber trace of `F` equals `trace(dΓ)` — BLIND to the commutator
                                       (extends N349's trace no-go to the full assembly).
    linRiemann_fiberTrace_integrable_zero — for an integrable field the naive Ricci-by-basis-trace is `0`;
                                       the theory-native Ricci must again be the Born form (childed).
    curvature_twoLayer               — ★★★ THE HEART (bundled): the `dΓ` layer vanishes for integrable
                                       fields, the full curvature then reduces to the commutator, and it is
                                       genuinely nonzero — the two-layer structure as one certificate.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N348 `lbCurv`/`lbCurv_antisymm`/`lbCurv_flat_left`/
  `lbCurv_ne_zero`, N349 `fiberTrace_lbCurv_zero`, N350 `lbConn_opderiv`/`opderiv_add`/`hasOpDerivAt0_iff`,
  N347 `lbConn`/`lbConn_flat`, N346 `offDiagVar`/`timeProj` ← N90 `sigOpC` ← the derived ℝ `Cut` ← the
  fold; `Module.End`/`•`/`LinearMap.trace`/`Tendsto`/`Filter` are Mathlib MACHINERY on the DERIVED carrier.
  Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for every declaration.
  Words-removable: delete "curvature / Riemann / Ricci / connection / transport / loop / gravity / spacetime
  / field": over the derived complete ordered field `Cut`, for the involution `η` (`η²=1`), endomorphisms
  `Γ = ½ηk`, the difference `dConn a b = lbConn (a−b)` is antisymmetric and vanishes at `a=b`; the sum
  `dConn + lbCurv` is antisymmetric under the joint swap, reduces to `lbCurv` when `a=b`, has fiber trace
  equal to `trace(dConn)`, and is nonzero for the concrete pair; and `dConn` is the operator
  difference-quotient limit of a difference of transport families in the banked operator topology. Pure
  operator/limit algebra over the derived ℝ + the banked operator topology. NO theorem STATEMENT needs a
  physics word.

  NO asserted value (assembly/machinery node, leading-order/linearized — flagged). NO empirical number. NO
  Mathlib number-system content import (the field is the DERIVED `Cut`), NO Mathlib manifold/Riemannian/
  curvature-tensor/`HasDerivAt`/`deriv` API as content (the derivative is the bare `Filter.Tendsto` over the
  banked `endOpC`, N350; the curvature is the banked commutator/derivative on `Module.End Cut STVC`). NO
  posited Riemann tensor (it is the sum of the banked `dΓ` derivative and `Γ∧Γ` commutator; both layers'
  non-vacuity is PROVED). NO kernel-trust bypass, NO `maxHeartbeats` raise, NO coordinate bash.
-/
import Phys.Algebra.SpacetimeOperatorDerivative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## (1) The look-back transport is linear (subtractive / negatable), from `η² = 1`. -/

/-- The transport is SUBTRACTIVE in the metric variation: `Γ(a − b) = Γ(a) − Γ(b)`. From `Γ = ½·η·(·)`
    and ring distributivity. -/
theorem lbConn_sub (a b : MetricEnd) : lbConn (a - b) = lbConn a - lbConn b := by
  unfold lbConn; rw [mul_sub, smul_sub]

/-- The transport is NEGATABLE: `Γ(−a) = −Γ(a)` (from `lbConn_sub` at the flat limit `lbConn 0 = 0`). -/
theorem lbConn_neg (a : MetricEnd) : lbConn (-a) = - lbConn a := by
  have h : (-a : MetricEnd) = (0 : MetricEnd) - a := by abel
  rw [h, lbConn_sub, lbConn_flat, zero_sub]

/-! ## (2) The operator directional derivative is subtractive (via `opderiv_add` + `opderiv_neg`). -/

/-- The operator directional derivative NEGATES: if `∂K = b` then `∂(−K) = −b`. The banked
    `ContinuousNeg STVC` (from the derived-ℝ `Cut` topology, N41b) carries the per-vector limit through
    the negation; there is no `ContinuousSub STVC` instance, so `neg` + `add` give `sub`. -/
theorem opderiv_neg {K : Cut → MetricEnd} {b : MetricEnd}
    (hK : HasOpDerivAt0 K b) : HasOpDerivAt0 (fun t => - K t) (-b) := by
  rw [hasOpDerivAt0_iff] at hK ⊢
  intro v
  refine Tendsto.congr' ?_ ((hK v).neg)
  filter_upwards with s
  simp only [LinearMap.neg_apply]
  rw [← smul_neg]; congr 1; abel

/-- The operator directional derivative is SUBTRACTIVE: `∂(H − K) = ∂H − ∂K`. From `opderiv_add` and
    `opderiv_neg` (`sub = add ∘ neg`). This is what makes the antisymmetrized derivative `dΓ` a genuine
    difference of operator derivatives. -/
theorem opderiv_sub {H K : Cut → MetricEnd} {a b : MetricEnd}
    (hH : HasOpDerivAt0 H a) (hK : HasOpDerivAt0 K b) :
    HasOpDerivAt0 (fun t => H t - K t) (a - b) := by
  have h := opderiv_add hH (opderiv_neg hK)
  simpa [sub_eq_add_neg] using h

/-! ## (3) The `dΓ` layer: the antisymmetrized transport of the second field variation. -/

/-- THE `dΓ` LAYER of the linearized curvature: the antisymmetrized transport of the field's second
    variation, `dConn a₁₂ a₂₁ := Γ(a₁₂) − Γ(a₂₁)`, where `a₁₂ = ∂₁∂₂ h`, `a₂₁ = ∂₂∂₁ h` are the two
    orders of the second variation of the metric field. It is the derivative-carried piece of the
    Riemann `F = dΓ + Γ∧Γ`. -/
def dConn (a₁₂ a₂₁ : MetricEnd) : MetricEnd := lbConn a₁₂ - lbConn a₂₁

/-- The `dΓ` layer is the transport of the DIFFERENCE of second variations: `dConn a₁₂ a₂₁ =
    lbConn (a₁₂ − a₂₁)` (transport linearity, from `η²=1`). -/
theorem dConn_eq (a₁₂ a₂₁ : MetricEnd) : dConn a₁₂ a₂₁ = lbConn (a₁₂ - a₂₁) := by
  unfold dConn; rw [lbConn_sub]

/-- The `dΓ` layer is a 2-form: `dConn a₁₂ a₂₁ = − dConn a₂₁ a₁₂` (antisymmetric in the two orders). -/
theorem dConn_antisymm (a₁₂ a₂₁ : MetricEnd) : dConn a₁₂ a₂₁ = - dConn a₂₁ a₁₂ := by
  unfold dConn; abel

/-- ★ THE `dΓ` LAYER VANISHES FOR AN INTEGRABLE FIELD: when the second field variations commute
    (`a₁₂ = a₂₁`, the gradient / integrable case), `dConn a a = 0`. So the `dΓ` layer measures ONLY the
    field's NON-INTEGRABILITY — the irreducible curvature content lives in the commutator layer. This is
    the theory-native structure THE ONE LAW forbids forcing to look like the textbook `dΓ`. -/
theorem dConn_integrable_zero (a : MetricEnd) : dConn a a = 0 := by unfold dConn; abel

/-- ★★ GROUNDING (via the banked N350 heart `lbConn_opderiv`): the `dΓ` layer IS the operator
    directional derivative of a genuine DIFFERENCE of transport families — NOT a posited tensor. If the
    two transport families `t ↦ Γ(f t)`, `t ↦ Γ(g t)` have operator derivatives `Γ(a₁₂)`, `Γ(a₂₁)`
    (each by `lbConn_opderiv`), their difference has operator derivative `dConn a₁₂ a₂₁`. -/
theorem dConn_grounded {f g : Cut → MetricEnd} {a₁₂ a₂₁ : MetricEnd}
    (hf : HasOpDerivAt0 f a₁₂) (hg : HasOpDerivAt0 g a₂₁) :
    HasOpDerivAt0 (fun t => lbConn (f t) - lbConn (g t)) (dConn a₁₂ a₂₁) :=
  opderiv_sub (lbConn_opderiv hf) (lbConn_opderiv hg)

/-- A CONCRETE nonzero `dΓ` layer: `dConn offDiagVar 0 ≠ 0` (the shear variation against no variation;
    reduces to the banked `lbConn_offDiagVar_ne_zero`). The `dΓ` layer is genuinely non-vacuous. -/
theorem dConn_ne_zero : dConn offDiagVar 0 ≠ 0 := by
  unfold dConn; rw [lbConn_flat, sub_zero]; exact lbConn_offDiagVar_ne_zero

/-! ## (4) The full linearized curvature 2-form `F = dΓ + Γ∧Γ` and the two-layer structure. -/

/-- THE FULL LINEARIZED CURVATURE 2-FORM `F = dΓ + Γ∧Γ`: the sum of the `dΓ` layer (the antisymmetrized
    transport of the field's second variation) and the `Γ∧Γ` layer (the banked commutator `lbCurv`, the
    look-back transport's non-closure, N348). The single curvature object the tensorial Ricci contraction
    and E2 (Lovelock) will consume. -/
def linRiemann (a₁₂ a₂₁ k₁ k₂ : MetricEnd) : MetricEnd := dConn a₁₂ a₂₁ + lbCurv k₁ k₂

/-- The closed form in the two banked layers: `F = lbConn (a₁₂ − a₂₁) + lbCurv k₁ k₂`. -/
theorem linRiemann_eq (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    linRiemann a₁₂ a₂₁ k₁ k₂ = lbConn (a₁₂ - a₂₁) + lbCurv k₁ k₂ := by
  unfold linRiemann; rw [dConn_eq]

/-- ★ THE FULL 2-FORM: reversing BOTH the derivative orders and the loop directions reverses the
    curvature — `F(a₁₂,a₂₁,k₁,k₂) = − F(a₂₁,a₁₂,k₂,k₁)`. Both layers are antisymmetric. -/
theorem linRiemann_antisymm (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    linRiemann a₁₂ a₂₁ k₁ k₂ = - linRiemann a₂₁ a₁₂ k₂ k₁ := by
  unfold linRiemann
  rw [dConn_antisymm a₁₂ a₂₁, lbCurv_antisymm k₁ k₂, neg_add]

/-- ★★★ THE THEORY-NATIVE HEART — for an INTEGRABLE field, the full curvature reduces to the commutator.
    When the second field variations commute (`a₁₂ = a₂₁`), the `dΓ` layer vanishes and
        `F = lbCurv k₁ k₂`,
    the commutator of the two look-back transports — the fold's self-blindness at the connection level
    (N348). The commutator layer is the IRREDUCIBLE curvature content that survives even for an integrable
    field; the `dΓ` layer only adds the field's non-integrability. The theory REORDERS the significance the
    textbook bookkeeping flattens: the look-back non-closure is primary. -/
theorem linRiemann_integrable (a k₁ k₂ : MetricEnd) :
    linRiemann a a k₁ k₂ = lbCurv k₁ k₂ := by
  unfold linRiemann; rw [dConn_integrable_zero, zero_add]

/-- THE FLAT LIMIT: no field, no curvature — `F(0,0,0,0) = 0`. -/
theorem linRiemann_flat : linRiemann 0 0 0 0 = 0 := by
  rw [linRiemann_integrable, lbCurv_flat_left]

/-- ★★ NON-VACUITY (W8): the full curvature 2-form is NONZERO for the concrete pair —
    `F(timeProj,timeProj,timeProj,offDiagVar) ≠ 0`. (Integrable in the derivative slots, so the content
    is the nonzero commutator, banked `lbCurv_ne_zero`.) The assembled Riemann is not a vacuous "always
    zero" object. -/
theorem linRiemann_ne_zero :
    linRiemann timeProj timeProj timeProj offDiagVar ≠ 0 := by
  rw [linRiemann_integrable]; exact lbCurv_ne_zero

/-! ## (5) The fiber-trace decomposition: the trace sees only `dΓ`, blind to the commutator. -/

/-- ★ THE FIBER TRACE OF THE FULL 2-FORM SEES ONLY THE `dΓ` LAYER: `trace F = trace(dΓ)` — the endomorphism
    trace is BLIND to the commutator layer (banked `fiberTrace_lbCurv_zero`, N349: `trace [Γ₁,Γ₂] = 0`).
    Extends N349's trace no-go from the commutator alone to the full assembled Riemann. -/
theorem linRiemann_fiberTrace_eq_dConn (a₁₂ a₂₁ k₁ k₂ : MetricEnd) :
    LinearMap.trace Cut STVC (linRiemann a₁₂ a₂₁ k₁ k₂)
      = LinearMap.trace Cut STVC (dConn a₁₂ a₂₁) := by
  unfold linRiemann
  rw [map_add, fiberTrace_lbCurv_zero, add_zero]

/-- For an INTEGRABLE field the naive Ricci-by-basis-trace vanishes identically: `trace F = 0` (the `dΓ`
    layer is zero, the commutator layer is trace-blind). So the theory-native Ricci contraction must
    again be the fold's Born form (as N349 did for the commutator scalar), NOT a basis trace — childed. -/
theorem linRiemann_fiberTrace_integrable_zero (a k₁ k₂ : MetricEnd) :
    LinearMap.trace Cut STVC (linRiemann a a k₁ k₂) = 0 := by
  rw [linRiemann_fiberTrace_eq_dConn, dConn_integrable_zero, map_zero]

/-! ## (6) THE HEART (bundled): the two-layer structure as one certificate. -/

/-- ★★★ THE THEORY-NATIVE HEART, bundled: (i) the `dΓ` layer vanishes for an integrable field
    (`dConn a a = 0`); (ii) the full curvature then reduces to the commutator `Γ∧Γ = lbCurv` (the fold's
    self-blindness at the connection level, the irreducible layer); (iii) it is genuinely NONZERO for the
    concrete pair. The look-back transport's curvature is FUNDAMENTALLY the commutator; the derivative
    layer adds only the field's non-integrability. -/
theorem curvature_twoLayer :
    (∀ a : MetricEnd, dConn a a = 0)
      ∧ (∀ a k₁ k₂ : MetricEnd, linRiemann a a k₁ k₂ = lbCurv k₁ k₂)
      ∧ linRiemann timeProj timeProj timeProj offDiagVar ≠ 0 :=
  ⟨dConn_integrable_zero, linRiemann_integrable, linRiemann_ne_zero⟩

end

end Phys.Algebra
