/-
  Phys.Algebra.LorentzContinuumMetricCondition — N90: THE SIGNATURE INVOLUTION OPERATOR `J`
  + THE OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J`. The structural joint linking the
  function-level isometry monoid `qvIsomMonoidC` (N49) to the linear-operator EvC-adjoint /
  spectral / polar machinery (N58–N89) — over the DERIVED ℝ `Cut` and the terminal algebra
  `O Cut := CD (H Cut)`.
  ===========================================================================
  THE NEXT FORCED NODE after the COMPACT PART `k := g·(p^{1/2})⁻¹` WITH `k*k = 1` / THE POLAR
  RECONSTRUCTION `g = k·p^{1/2}` (N89). N49–N89 banked, over the derived ℝ `Cut`:
    • the continuum Born form `QvC`, the isometry monoid `qvIsomMonoidC` (N49), `gFormC_comp` (N50);
    • the tangent Lie algebra `infIsomLieAlg` + the polarized Minkowski form `BvC` + the
      infinitesimal boost `boostGenC`/rotation `rotGenC a` generators (N51);
    • the FORWARD soundness `genIsomMonoidC2 ≤ qvIsomMonoidC` with the TWO-SIDED `biMulFun` (N52–N55);
    • the BORN POSITIVITY `gFormC_nonneg` + the (1,9) signature split (N56);
    • the POSITIVE-DEFINITE SCALAR square root `cutSqrt` (N57);
    • the INFINITESIMAL CARTAN reference form `EvC` — POSITIVE-DEFINITE (`EvC_nonneg`,
      `EvC_eq_zero_iff`) (N58);
    • the OPERATOR FORM-ADJOINT `IsEvCAdjoint` + `IsEvCAdjoint.comp` (the EvC-adjoint composes
      contravariantly) (N59/N89);
    • the rank-`n` spectral operator `specOpN` + the full spectral existence + the global
      positive part + the resolution-of-identity + the concrete `(p^{1/2})⁻¹` + the polar
      assembly `comp_polar_decomposition` `g = k·p^{1/2}` (N63–N89).

  ── THE TARGET (N90) AND THE W3 DECOMPOSITION ──
  The ticket TARGET is the remaining HEAVY group-manifold core toward the GLOBAL reverse KAK
  surjectivity: CONNECTEDNESS, the isometry-compact-part lemma (the compact part `k` of an
  ISOMETRY is itself an isometry), the global reverse surjectivity, and the `Spin(9)→SO(9)`
  exhaustion. MEASURE-FIRST (ROADMAP §N90 priority (i)) finds: the FULL isometry-compact-part
  lemma — that `g ∈ qvIsomMonoidC` ⟹ the compact part `k := g·(p^{1/2})⁻¹` preserves `QvC` —
  needs positive-operator-square-root UNIQUENESS (`J p^{1/2} J = (p^{1/2})⁻¹`, so `k` is
  `J`-orthogonal), which is NOT yet banked. THIS node banks the IMMEDIATELY-BANKABLE structural
  prerequisite the isometry-compact-part lemma consumes — THE OPERATOR LORENTZ METRIC CONDITION
  `gᵀ J g = J` — the defining operator equation of the (pseudo-)orthogonal group, the joint
  linking `qvIsomMonoidC` to the linear-operator EvC-adjoint machinery. The remaining HEAVY
  remainder — the sqrt-uniqueness-dependent isometry-compact-part lemma, CONNECTEDNESS of the
  isometry group over `Cut`, the GLOBAL reverse KAK surjectivity, and the full `Spin(9)→SO(9)`
  exhaustion — is childed onto the chain tail.

  ── THE TRUNK REFRAME (THE ONE LAW): the metric condition collapses via the EvC↔BvC bridge ──
  The classical operator Lorentz metric condition `gᵀ J g = J` is normally read off matrix
  algebra against a fixed pseudo-metric. The trunk dissolves it: the positive-definite reference
  form `EvC` (N58) and the indefinite Minkowski form `BvC` (N51) are related by the SIGNATURE
  INVOLUTION operator `J := sigOpC : (t,x,v) ↦ (t,-x,-v)` via `BvC p q = EvC p (J q)`
  (`BvC_eq_EvC_sigOpC` — pure form algebra). A LINEAR isometry `g` (`IsQvIsomC g`) preserves
  the polarized form `BvC (g p)(g q) = BvC p q` (`linIsom_BvC_preserved`, from the Born
  polarization `QvC_polariz` + linearity). Pairing through the EvC↔BvC bridge and the
  EvC-adjoint `h` of `g`,
    `EvC p (h (J (g q))) = EvC (g p) (J (g q)) = BvC (g p)(g q) = BvC p q = EvC p (J q)`,
  for all `p`; by the right-nondegeneracy of `EvC` (`EvC_right_nondegen`, from the
  positive-definiteness `EvC_eq_zero_iff`, N58), `h (J (g q)) = J q` for all `q`, i.e.
  `h ∘ J ∘ g = J`. NO Mathlib pseudo-metric, NO posited Lorentz group, NO matrix algebra.

  WHAT IS PROVED (each a theorem, foundations-only, forward from the banked objects):
    sigOpC                       — the signature involution operator `J : (t,x,v) ↦ (t,-x,-v)`.
    sigOpC_apply / sigOpC_comp_self / sigOpC_isEvCAdjoint_self
                                 — its action; `J∘J = id` (involution); `J` is its own EvC-adjoint.
    BvC_eq_EvC_sigOpC            — ★ THE METRIC-OPERATOR BRIDGE: `BvC p q = EvC p (J q)`.
    QvC_polariz                  — the Born polarization `QvC (p+q) = QvC p + QvC q + 2·BvC p q`.
    EvC_right_nondegen           — ★ `EvC` right-nondegeneracy `(∀ p, EvC p X = EvC p Y) → X = Y`.
    linIsom_BvC_preserved        — a LINEAR `QvC`-isometry preserves `BvC`.
    linIsom_metric_condition     — ★★★ THE OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J`: for a
                                   linear isometry `g` with EvC-adjoint `h`, `h ∘ J ∘ g = J`.
    boostEndC / boostEndC_apply / boostEndC_isQvIsomC / boostEndC_isEvCAdjoint_self
                                 — the boost as a `Module.End`, an isometry when `a²−b²=1`, its
                                   own EvC-adjoint.
    boostEndC_metric_condition   — ★ NON-VACUITY (W8): a CONCRETE boost (`a²−b²=1`) satisfies the
                                   operator Lorentz metric condition `gᵀ J g = J` — not vacuous.

  ── THE STANDARD (the only bar) ──
  Unbroken: every object derives from the banked N49–N89 ← the order-completeness of the derived
  ℝ `Cut` ← the fold. Complete: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}` for
  every declaration (Audits/AxiomAudit.lean). Words-removable: delete "Lorentz/boost/rotation/
  signature/metric/isometry/orthogonal/adjoint/Minkowski/Cartan" → over the derived complete
  ordered field `Cut`, with the positive-definite symmetric form `EvC` and the indefinite
  symmetric form `BvC` related by the involution `J : (t,x,v) ↦ (t,-x,-v)` via `BvC p q =
  EvC p (J q)`: for a `Cut`-linear `g` preserving the quadratic form `QvC` with `∀ p q,
  EvC (g p) q = EvC p (h q)`, the composite `h ∘ J ∘ g = J`; pure linear-algebra math. NO
  theorem STATEMENT needs a physics word.

  NO Mathlib number-system content import (the field is the DERIVED `Cut`), NO posited Lorentz group.
-/
import Phys.Algebra.LorentzContinuumCompactPart

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- ★ THE SIGNATURE INVOLUTION OPERATOR `J : (t,x,v) ↦ (t,-x,-v)` — the metric operator relating
    the positive-definite reference form `EvC` to the indefinite Minkowski form `BvC` by
    `BvC p q = EvC p (J q)`. The `(1,9)` signature flip (N56) made an operator. -/
def sigOpC : Module.End Cut STVC where
  toFun p := (p.1, -p.2.1, -p.2.2)
  map_add' p q := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show -(p.2.1 + q.2.1) = -p.2.1 + -q.2.1; rw [neg_add]
    · show -(p.2.2 + q.2.2) = -p.2.2 + -q.2.2; rw [neg_add]
  map_smul' c p := by
    refine Prod.ext rfl (Prod.ext ?_ ?_)
    · show -(c • p.2.1) = c • -p.2.1; rw [smul_neg]
    · show -(c • p.2.2) = c • -p.2.2; rw [smul_neg]

/-- The action of the signature involution operator. -/
theorem sigOpC_apply (p : STVC) : sigOpC p = (p.1, -p.2.1, -p.2.2) := rfl

/-- `J∘J = id` — the signature operator is an involution. -/
theorem sigOpC_comp_self : sigOpC.comp sigOpC = LinearMap.id := by
  apply LinearMap.ext; intro p
  simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq, sigOpC_apply, neg_neg]

/-- The signature operator is its OWN EvC-adjoint (EvC-self-adjoint): `J* = J`. -/
theorem sigOpC_isEvCAdjoint_self : IsEvCAdjoint sigOpC sigOpC := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * t' + (-x) * x' + gFormC (-v) v' = t * t' + x * (-x') + gFormC v (-v')
  rw [gFormC_neg_left, show gFormC v (-v') = - gFormC v v' by
        rw [gFormC_symm v (-v'), gFormC_neg_left, gFormC_symm v' v]]
  ring

/-- ★ THE METRIC-OPERATOR BRIDGE: the indefinite Minkowski form is the positive-definite
    reference form composed with the signature involution — `BvC p q = EvC p (J q)`. The single
    identity that lets the function-level `QvC`-isometry condition flow into the linear-operator
    EvC-adjoint machinery. -/
theorem BvC_eq_EvC_sigOpC (p q : STVC) : BvC p q = EvC p (sigOpC q) := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * t' - x * x' - gFormC v v' = t * t' + x * (-x') + gFormC v (-v')
  rw [show gFormC v (-v') = - gFormC v v' by
        rw [gFormC_symm v (-v'), gFormC_neg_left, gFormC_symm v' v]]
  ring

/-- THE POLARIZATION of the continuum Born form: `QvC (p+q) = QvC p + QvC q + 2·BvC p q`. The
    quadratic form recovers its polarization `BvC`, by pure Born-form algebra. -/
theorem QvC_polariz (p q : STVC) : QvC (p + q) = QvC p + QvC q + 2 * BvC p q := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show QformC (t + t') (x + x') (v + v')
      = QformC t x v + QformC t' x' v' + 2 * (t * t' - x * x' - gFormC v v')
  unfold QformC
  rw [gFormC_add_left, gFormC_add_right, gFormC_add_right, gFormC_symm v' v]
  ring

/-- ★ `EvC` is NONDEGENERATE in the right slot: `(∀ p, EvC p X = EvC p Y) → X = Y`. From the
    positive-definiteness of the reference form (`EvC_eq_zero_iff`, N58): if `X` and `Y` pair
    identically against every `p`, then `EvC (X−Y)(X−Y) = 0`, forcing `X − Y = 0`. The
    nondegeneracy that turns a pairing identity into an operator identity. -/
theorem EvC_right_nondegen {X Y : STVC} (h : ∀ p, EvC p X = EvC p Y) : X = Y := by
  have hz : EvC (X - Y) (X - Y) = 0 := by
    rw [EvC_sub_right, h (X - Y)]; ring
  have := (EvC_eq_zero_iff (X - Y)).mp hz
  exact sub_eq_zero.mp this

/-- A LINEAR `QvC`-isometry preserves the polarized Minkowski form: `BvC (g p)(g q) = BvC p q`.
    From the Born polarization `QvC_polariz` (applied to `g(p+q) = g p + g q` by linearity) and
    `g`'s `QvC`-preservation, cancelling the scalar `2`. -/
theorem linIsom_BvC_preserved {g : Module.End Cut STVC} (hg : IsQvIsomC g) (p q : STVC) :
    BvC (g p) (g q) = BvC p q := by
  have h2 : (2 : Cut) * BvC (g p) (g q) = 2 * BvC p q := by
    have h1 := QvC_polariz (g p) (g q)
    have hadd : g (p + q) = g p + g q := map_add g p q
    rw [← hadd, hg (p + q), hg p, hg q] at h1
    have h0 := QvC_polariz p q
    linarith [h1, h0]
  exact mul_left_cancel₀ (two_ne_zero) h2

/-- ★★★ THE OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J`. For a LINEAR isometry `g`
    (`IsQvIsomC g`) with EvC-adjoint `h` (`IsEvCAdjoint g h`), the composite `h ∘ J ∘ g = J`
    (the signature involution `J = sigOpC`). The defining operator equation of the
    (pseudo-)orthogonal group, DISSOLVED from the trunk via the EvC↔BvC bridge: for all `p`,
    `EvC p (h (J (g q))) = EvC (g p)(J (g q)) = BvC (g p)(g q) = BvC p q = EvC p (J q)`
    (`IsEvCAdjoint`, `BvC_eq_EvC_sigOpC`, `linIsom_BvC_preserved`), hence `h (J (g q)) = J q`
    by `EvC` right-nondegeneracy. The structural joint linking the function-level isometry
    monoid `qvIsomMonoidC` to the linear-operator EvC-adjoint / spectral / polar machinery. -/
theorem linIsom_metric_condition {g h : Module.End Cut STVC}
    (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    h.comp (sigOpC.comp g) = sigOpC := by
  apply LinearMap.ext; intro q
  apply EvC_right_nondegen
  intro p
  simp only [LinearMap.comp_apply]
  rw [← H p (sigOpC (g q))]
  rw [← BvC_eq_EvC_sigOpC (g p) (g q), ← BvC_eq_EvC_sigOpC p q]
  exact linIsom_BvC_preserved hg p q

/-- THE CONTINUUM BOOST as a `Module.End Cut STVC`: `(t,x,v) ↦ (a·t+b·x, b·t+a·x, v)`. The
    linear-operator carrier of the boost (the N49 `boostFunC` packaged as a linear endomorphism). -/
def boostEndC (a b : Cut) : Module.End Cut STVC where
  toFun p := (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2)
  map_add' p q := by
    refine Prod.ext ?_ (Prod.ext ?_ rfl)
    · show a * (p.1 + q.1) + b * (p.2.1 + q.2.1) = (a * p.1 + b * p.2.1) + (a * q.1 + b * q.2.1)
      ring
    · show b * (p.1 + q.1) + a * (p.2.1 + q.2.1) = (b * p.1 + a * p.2.1) + (b * q.1 + a * q.2.1)
      ring
  map_smul' c p := by
    refine Prod.ext ?_ (Prod.ext ?_ rfl)
    · show a * (c • p.1) + b * (c • p.2.1) = c • (a * p.1 + b * p.2.1)
      simp only [smul_eq_mul]; ring
    · show b * (c • p.1) + a * (c • p.2.1) = c • (b * p.1 + a * p.2.1)
      simp only [smul_eq_mul]; ring

/-- The action of the boost endomorphism. -/
theorem boostEndC_apply (a b : Cut) (p : STVC) :
    boostEndC a b p = (a * p.1 + b * p.2.1, b * p.1 + a * p.2.1, p.2.2) := rfl

/-- The boost endomorphism is a `QvC`-isometry on the unit hyperbola `a² − b² = 1` (N49
    `boostC_isom`, now at the operator level). -/
theorem boostEndC_isQvIsomC {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    IsQvIsomC (boostEndC a b) := by
  intro p
  show QvC (boostFunC a b p) = QvC p
  exact boostC_isom hab p

/-- The boost endomorphism is its OWN EvC-adjoint (EvC-symmetric — the noncompact/self-adjoint
    factor): `g* = g`. Pure field arithmetic on the `(t,x)` block; the `v`-block is fixed. -/
theorem boostEndC_isEvCAdjoint_self (a b : Cut) :
    IsEvCAdjoint (boostEndC a b) (boostEndC a b) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show (a * t + b * x) * t' + (b * t + a * x) * x' + gFormC v v'
      = t * (a * t' + b * x') + x * (b * t' + a * x') + gFormC v v'
  ring

/-- ★ NON-VACUITY (W8): a CONCRETE boost (`a² − b² = 1`) satisfies the operator Lorentz metric
    condition `gᵀ J g = J`. The metric condition is not a vacuous statement — a genuine
    non-identity isometry over the derived ℝ `Cut` produces `h ∘ J ∘ g = J`. -/
theorem boostEndC_metric_condition {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    (boostEndC a b).comp (sigOpC.comp (boostEndC a b)) = sigOpC :=
  linIsom_metric_condition (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)

end

end Phys.Algebra
