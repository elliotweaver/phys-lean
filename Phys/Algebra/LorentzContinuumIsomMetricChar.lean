/-
  Phys.Algebra.LorentzContinuumIsomMetricChar — N91: THE METRIC-CONDITION CHARACTERIZATION OF
  THE LINEAR ISOMETRIES + INJECTIVITY + ADJOINT-UNIQUENESS + THE TWO-SIDED METRIC CONDITION
  `g∘J∘h = J` + THE `J`-CONJUGATION INVERSION `J p J = p⁻¹`. The immediately-bankable structural
  pieces toward the FULL isometry-compact-part lemma — over the DERIVED ℝ `Cut` and the terminal
  algebra `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after THE OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J` (N90). N49–N90
  banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC`, `IsQvIsomC` (N49);
    • the polarized Minkowski form `BvC` with `BvC_self : BvC p p = QvC p` (N51);
    • the POSITIVE-DEFINITE reference form `EvC` (N58), the OPERATOR FORM-ADJOINT `IsEvCAdjoint`
      + `IsEvCAdjoint.symm` + `IsEvCAdjoint.comp` (the EvC-adjoint composes contravariantly)
      (N59/N89);
    • the spectral operator `specOpN` + the full spectral existence + the polar/KAK assembly
      `comp_polar_decomposition` `g = k·p^{1/2}` (N63–N89);
    • ★ THE SIGNATURE INVOLUTION operator `J := sigOpC : (t,x,v) ↦ (t,-x,-v)`, `sigOpC_comp_self`
      (`J∘J = id`), `sigOpC_isEvCAdjoint_self` (`J* = J`), THE METRIC-OPERATOR BRIDGE
      `BvC_eq_EvC_sigOpC : BvC p q = EvC p (J q)`, the Born polarization `QvC_polariz`, `EvC`
      right-nondegeneracy `EvC_right_nondegen`, `linIsom_BvC_preserved`, and ★★★ THE OPERATOR
      LORENTZ METRIC CONDITION `linIsom_metric_condition : IsQvIsomC g → IsEvCAdjoint g h →
      h∘J∘g = J` (N90).

  ── THE TARGET (N91) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the remaining HEAVY group-manifold core toward the GLOBAL reverse KAK
  surjectivity: the FULL isometry-compact-part lemma — that the compact part `k := g·(p^{1/2})⁻¹`
  (N89) of an ISOMETRY `g ∈ qvIsomMonoidC` itself preserves `QvC` — CONNECTEDNESS, the GLOBAL
  reverse surjectivity, and the `Spin(9)→SO(9)` exhaustion. MEASURE-FIRST (ROADMAP §N91
  priority (i)) confirms: the full isometry-compact-part lemma reduces (via the polar assembly
  `g = k·p^{1/2}` N89 + the operator Lorentz metric condition `h∘J∘g = J` N90) to
  `J p^{1/2} J = (p^{1/2})⁻¹` — POSITIVE-OPERATOR-SQUARE-ROOT UNIQUENESS lifted to the operator
  via the spectral resolution, the genuine W1 spectral remainder, NOT yet banked. THIS node banks
  the IMMEDIATELY-BANKABLE structural pieces the compact-part lemma consumes — the full
  METRIC-CONDITION CHARACTERIZATION of the linear isometries (the CONVERSE of N90 +
  injectivity + adjoint-uniqueness + the TWO-SIDED metric condition `g∘J∘h = J` + the precise
  `J`-conjugation inversion lever `J p J = p⁻¹`). The remaining HEAVY remainder — the operator
  sqrt-uniqueness lemma `J p^{1/2} J = (p^{1/2})⁻¹` and the full isometry-compact-part lemma
  `IsQvIsomC (g·(p^{1/2})⁻¹)`, CONNECTEDNESS, the GLOBAL reverse KAK surjectivity, and the
  `Spin(9)→SO(9)` exhaustion — is childed onto the chain tail.

  ── THE TRUNK REFRAME (THE ONE LAW): the characterization collapses via the EvC↔BvC bridge ──
  N90 proved the metric condition is NECESSARY for an isometry (`⟹`). The trunk dissolves BOTH
  remaining directions with the SAME bridge:
    • THE CONVERSE (`⟸`): for a linear `g` with EvC-adjoint `h`, if `h∘J∘g = J` then for all `p`,
        `QvC (g p) = BvC (g p)(g p) = EvC (g p)(J (g p)) = EvC p (h (J (g p)))`
                  `= EvC p ((h∘J∘g) p) = EvC p (J p) = BvC p p = QvC p`,
      so `g` is a `QvC`-isometry (`BvC_self`, `BvC_eq_EvC_sigOpC`, `IsEvCAdjoint`). The metric
      equation has NO solutions outside the isometry group — the linear isometries are EXACTLY
      its solutions.
    • INJECTIVITY: `h∘J∘g = J` with `J` injective (an involution) forces `g` injective.
    • THE TWO-SIDED CONDITION `g∘J∘h = J`: with `g` bijective over the FINITE-DIMENSIONAL `Cut`-
      module `STVC` (`LinearMap.injective_iff_surjective`), `m := J∘h∘J` is the two-sided inverse
      of `g`, giving `g∘J∘h∘J = id`, hence `g∘J∘h = J` — `h` is also an isometry's adjoint.
    • THE `J`-CONJUGATION INVERSION `J p J = p⁻¹` (`p := g*g = h∘g`): from both metric conditions,
        `J p J p = J∘h∘g∘J∘h∘g = J∘h∘(g∘J∘h)∘g = J∘h∘J∘g = J∘(h∘J∘g) = J∘J = id`,
      pure composition algebra — NO sqrt, NO spectral inverse. THE PRECISE LEVER the
      operator-sqrt-uniqueness step (`J p^{1/2} J = (p^{1/2})⁻¹`) consumes.
  NO Mathlib pseudo-metric, NO posited Lorentz group, NO matrix algebra.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    metric_condition_imp_isQvIsom   — ★ THE CONVERSE of N90: `IsEvCAdjoint g h → h∘J∘g = J →
                                       IsQvIsomC g`.
    isEvCAdjoint_right_unique       — the EvC-adjoint is unique: `IsEvCAdjoint g h₁ →
                                       IsEvCAdjoint g h₂ → h₁ = h₂` (EvC right-nondegeneracy).
    sigOpC_injective                — `J` is injective (an involution).
    linIsom_injective               — a linear isometry with an EvC-adjoint is injective.
    isQvIsom_iff_metric_condition   — ★★ THE FULL CHARACTERIZATION: `IsQvIsomC g ↔ h∘J∘g = J`
                                       (for a linear `g` with EvC-adjoint `h`).
    linIsom_inverse_metric_condition— ★ THE TWO-SIDED METRIC CONDITION `g∘J∘h = J` (bijectivity).
    linIsom_posPart_J_conj_inv      — ★★★ THE `J`-CONJUGATION INVERSION `J p J p = id`
                                       (`p := h∘g = g*g`) — the precise sqrt-uniqueness lever.
    boostEndC_metric_char / boostEndC_inverse_metric_condition / boostEndC_posPart_J_conj_inv
                                     — ★ NON-VACUITY (W8): a CONCRETE boost (`a²−b²=1`) realises
                                       the characterization, the two-sided condition, and the
                                       `J`-conjugation inversion — not vacuous.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N49–N90 ← the order-completeness of the derived
  ℝ `Cut` ← the fold (`LinearMap.injective_iff_surjective` is standard MACHINERY on the DERIVED
  finite-dimensional `Cut`-module `STVC`, STANDARD §3). Complete: `#print axioms ⊆
  {propext, Classical.choice, Quot.sound}` for every declaration (Audits/AxiomAudit.lean).
  Words-removable: delete "Lorentz/boost/rotation/signature/metric/isometry/orthogonal/adjoint/
  compact/spectral/square-root/uniqueness/inverse/group/connected/Spin/SO(9)" → over the derived
  complete ordered field `Cut`, with the positive-definite symmetric form `EvC` and the
  indefinite symmetric form `BvC` related by the involution `J : (t,x,v) ↦ (t,-x,-v)` via
  `BvC p q = EvC p (J q)`: a `Cut`-linear `g` with `∀ p q, EvC (g p) q = EvC p (h q)` preserves
  the quadratic form `QvC` IFF `h ∘ J ∘ g = J`; such a `g` is injective; `h` is unique; `g∘J∘h
  = J`; and `J∘(h∘g)∘J∘(h∘g) = id`; pure linear-algebra math. NO theorem STATEMENT needs a
  physics word.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumMetricCondition
import Mathlib.LinearAlgebra.FiniteDimensional.Basic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

/-- ★ THE CONVERSE of N90: the operator metric condition `h∘J∘g = J` FORCES `g` to be a
    `QvC`-isometry. The same EvC↔BvC bridge run the other way: for all `p`,
    `QvC (g p) = BvC (g p)(g p) = EvC (g p)(J (g p)) = EvC p (h (J (g p))) = EvC p ((h∘J∘g) p)
    = EvC p (J p) = BvC p p = QvC p` (`BvC_self`, `BvC_eq_EvC_sigOpC`, `IsEvCAdjoint`, the metric
    condition). The metric equation has NO solutions outside the isometry group. -/
theorem metric_condition_imp_isQvIsom
    (H : IsEvCAdjoint g h) (hmc : h.comp (sigOpC.comp g) = sigOpC) :
    IsQvIsomC g := by
  intro p
  rw [← BvC_self (g p), ← BvC_self p,
      BvC_eq_EvC_sigOpC (g p) (g p), BvC_eq_EvC_sigOpC p p,
      H p (sigOpC (g p))]
  have hpoint : h (sigOpC (g p)) = sigOpC p := by
    have := congrArg (fun (f : Module.End Cut STVC) => f p) hmc
    simpa only [LinearMap.comp_apply] using this
  rw [hpoint]

/-- The EvC-adjoint is unique in its right slot: `IsEvCAdjoint g h₁ → IsEvCAdjoint g h₂ →
    h₁ = h₂`. From `EvC` right-nondegeneracy (`EvC_right_nondegen`, N90 ← `EvC_eq_zero_iff`, N58):
    `h₁ q` and `h₂ q` pair identically against every `p` via the shared adjunction with `g`. -/
theorem isEvCAdjoint_right_unique {h₁ h₂ : Module.End Cut STVC}
    (H1 : IsEvCAdjoint g h₁) (H2 : IsEvCAdjoint g h₂) : h₁ = h₂ := by
  apply LinearMap.ext; intro q
  apply EvC_right_nondegen
  intro p
  rw [← H1 p q, ← H2 p q]

/-- `J = sigOpC` is injective — it is an involution (`sigOpC_comp_self`, N90). -/
theorem sigOpC_injective : Function.Injective (sigOpC : Module.End Cut STVC) := by
  intro p q hpq
  have := congrArg sigOpC hpq
  rw [← LinearMap.comp_apply, ← LinearMap.comp_apply, sigOpC_comp_self] at this
  simpa using this

/-- A linear isometry with an EvC-adjoint is INJECTIVE. From the operator Lorentz metric
    condition `h∘J∘g = J` (N90) and `J` injective: if `g p = g q` then `J(g p) = J(g q)` so
    `(h∘J∘g) p = (h∘J∘g) q`, i.e. `J p = J q`, hence `p = q`. -/
theorem linIsom_injective (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    Function.Injective g := by
  have hmc := linIsom_metric_condition hg H
  intro p q hpq
  apply sigOpC_injective
  have e1 : (h.comp (sigOpC.comp g)) p = sigOpC p := by rw [hmc]
  have e2 : (h.comp (sigOpC.comp g)) q = sigOpC q := by rw [hmc]
  simp only [LinearMap.comp_apply] at e1 e2
  rw [← e1, ← e2, hpq]

/-- ★★ THE FULL METRIC-CONDITION CHARACTERIZATION: for a linear `g` with EvC-adjoint `h`,
    `IsQvIsomC g ↔ h∘J∘g = J`. The linear isometries are EXACTLY the solutions of the operator
    Lorentz metric equation — N90 (`⟹`) packaged with the converse (`⟸`). -/
theorem isQvIsom_iff_metric_condition (H : IsEvCAdjoint g h) :
    IsQvIsomC g ↔ h.comp (sigOpC.comp g) = sigOpC :=
  ⟨fun hg => linIsom_metric_condition hg H, metric_condition_imp_isQvIsom H⟩

/-- ★ THE TWO-SIDED / INVERSE METRIC CONDITION `g∘J∘h = J`. From `h∘J∘g = J` (N90) and `g`
    bijective (injective `linIsom_injective` + `LinearMap.injective_iff_surjective` over the
    finite-dimensional `Cut`-module `STVC`): the map `m := J∘h∘J` is the two-sided inverse of
    `g` (`m∘g = id` from the metric condition + `J∘J = id`; `g∘m = id` by surjectivity), so
    `g∘J∘h∘J = id`; right-composing with `J` and `J∘J = id` gives `g∘J∘h = J`. The adjoint `h`
    of an isometry's metric pairing also satisfies the orthogonality equation. -/
theorem linIsom_inverse_metric_condition (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    g.comp (sigOpC.comp h) = sigOpC := by
  have hmc := linIsom_metric_condition hg H
  have hinj := linIsom_injective hg H
  have hsurj := LinearMap.injective_iff_surjective.mp hinj
  set m : Module.End Cut STVC := sigOpC.comp (h.comp sigOpC) with hm
  have hleft : m.comp g = LinearMap.id := by
    apply LinearMap.ext; intro p
    simp only [hm, LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    have hpoint : h (sigOpC (g p)) = sigOpC p := by
      have := congrArg (fun (f : Module.End Cut STVC) => f p) hmc
      simpa only [LinearMap.comp_apply] using this
    rw [hpoint, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]
  have hright : g.comp m = LinearMap.id := by
    apply LinearMap.ext; intro y
    obtain ⟨x, hx⟩ := hsurj y
    simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    have hmx : m (g x) = x := by
      have := congrArg (fun (f : Module.End Cut STVC) => f x) hleft
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [← hx, hmx]
  apply LinearMap.ext; intro q
  have e := congrArg (fun (f : Module.End Cut STVC) => f (sigOpC q)) hright
  simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] at e
  simp only [hm, LinearMap.comp_apply] at e
  rw [show sigOpC (sigOpC q) = q by
        rw [← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]] at e
  simp only [LinearMap.comp_apply]
  exact e

/-- ★★★ THE `J`-CONJUGATION INVERSION `J p J = p⁻¹` (stated as `J∘p∘J∘p = id`), where
    `p := h∘g (= g*g)` is the positive part. Conjugating the positive part by the signature
    involution INVERTS it — pure composition algebra from BOTH metric conditions:
    `J p J p = J∘h∘g∘J∘h∘g = J∘h∘(g∘J∘h)∘g = J∘h∘J∘g = J∘(h∘J∘g) = J∘J = id`
    (`linIsom_inverse_metric_condition`, `linIsom_metric_condition`, `sigOpC_comp_self`). NO
    sqrt, NO spectral inverse — THE PRECISE LEVER the operator-sqrt-uniqueness step
    `J p^{1/2} J = (p^{1/2})⁻¹` (childed) consumes to land the compact part in the maximal
    compact. -/
theorem linIsom_posPart_J_conj_inv (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    (sigOpC.comp ((h.comp g).comp sigOpC)).comp (h.comp g) = LinearMap.id := by
  have hmc := linIsom_metric_condition hg H
  have hinv := linIsom_inverse_metric_condition hg H
  apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
  have step1 : g (sigOpC (h (g p))) = sigOpC (g p) := by
    have := congrArg (fun (f : Module.End Cut STVC) => f (g p)) hinv
    simpa only [LinearMap.comp_apply] using this
  rw [step1]
  have step2 : h (sigOpC (g p)) = sigOpC p := by
    have := congrArg (fun (f : Module.End Cut STVC) => f p) hmc
    simpa only [LinearMap.comp_apply] using this
  rw [step2, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

/-! ## Non-vacuity (W8): a CONCRETE boost realises the characterization, the two-sided condition,
    and the `J`-conjugation inversion. -/

/-- ★ NON-VACUITY (W8): a CONCRETE boost operator realises the metric-condition
    characterization — it preserves `QvC` IFF it satisfies `gᵀ J g = J` (the iff holds for any
    boost endomorphism; instantiated here at the concrete boost carrier). -/
theorem boostEndC_metric_char (a b : Cut) :
    IsQvIsomC (boostEndC a b) ↔
      (boostEndC a b).comp (sigOpC.comp (boostEndC a b)) = sigOpC :=
  isQvIsom_iff_metric_condition (boostEndC_isEvCAdjoint_self a b)

/-- ★ NON-VACUITY (W8): a CONCRETE boost (`a²−b²=1`) satisfies the TWO-SIDED metric condition
    `g∘J∘h = J` (here `h = g`, so it coincides with `gᵀ J g = J`, but produced by the
    bijectivity route `linIsom_inverse_metric_condition`, not by `boostEndC_metric_condition`). -/
theorem boostEndC_inverse_metric_condition {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    (boostEndC a b).comp (sigOpC.comp (boostEndC a b)) = sigOpC :=
  linIsom_inverse_metric_condition (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)

/-- ★ NON-VACUITY (W8): a CONCRETE boost (`a²−b²=1`) realises the `J`-conjugation inversion
    `J p J p = id` with `p = g*g` a genuine non-identity positive operator over the derived ℝ
    `Cut` — the inversion lever is not vacuous. -/
theorem boostEndC_posPart_J_conj_inv {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    (sigOpC.comp (((boostEndC a b).comp (boostEndC a b)).comp sigOpC)).comp
        ((boostEndC a b).comp (boostEndC a b)) = LinearMap.id :=
  linIsom_posPart_J_conj_inv (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)

end

end Phys.Algebra
