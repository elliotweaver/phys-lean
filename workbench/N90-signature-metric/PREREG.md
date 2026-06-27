# N90 PREREG — frozen before compute

## NODE
N90 — the forward joint after N89's operator-level polar/KAK assembly (g = k·p^{1/2}).
MEASURE-FIRST resolved priority (i): the FULL isometry-compact-part lemma (k preserves QvC)
needs positive-operator-square-root UNIQUENESS (J p^{1/2} J = (p^{1/2})⁻¹ ⟹ k orthogonal),
which is NOT banked. So N90 banks the IMMEDIATELY-BANKABLE structural prerequisite the
isometry-compact-part lemma consumes — THE OPERATOR LORENTZ METRIC CONDITION `gᵀJg = J` —
and childs the sqrt-uniqueness-dependent isometry-compact-part + connectedness + global
reverse-KAK surjectivity + Spin(9)→SO(9) exhaustion onto the chain tail (N91).

## THE TARGET (what gets PROVED, all over the derived ℝ Cut + terminal algebra O Cut)
The signature involution operator `sigOpC : (t,x,v) ↦ (t,-x,-v)` is the metric operator J
relating the positive-definite reference form EvC to the indefinite Minkowski form BvC by
`BvC p q = EvC p (J q)`. For a LINEAR isometry g (IsQvIsomC g) with EvC-adjoint h, the
operator Lorentz metric condition `h ∘ J ∘ g = J` (= gᵀJg = J) holds — DERIVED from:
  (1) the polarization `QvC (p+q) = QvC p + QvC q + 2·BvC p q` (pure Born-form algebra),
  (2) g linear ⟹ BvC (g p)(g q) = BvC p q (polarized isometry),
  (3) the EvC↔BvC bridge `BvC p q = EvC p (J q)`,
  (4) EvC right-nondegeneracy `(∀ p, EvC p X = EvC p Y) → X = Y` (from EvC_eq_zero_iff).
This is the defining operator equation of the (pseudo-)orthogonal group — the structural
joint linking the function-level isometry monoid `qvIsomMonoidC` to the linear-operator
EvC-adjoint / spectral / polar machinery (N58–N89). NO posited Lorentz group, NO Mathlib ℝ/ℂ.

Decls to bank (namespace Phys.Algebra), foundations-only:
  • sigOpC                       — the signature involution operator (linear), J(t,x,v)=(t,-x,-v)
  • sigOpC_apply                 — its action
  • sigOpC_comp_self             — J∘J = id (involution)
  • sigOpC_isEvCAdjoint_self     — IsEvCAdjoint sigOpC sigOpC (J is EvC-self-adjoint)
  • BvC_eq_EvC_sigOpC            — BvC p q = EvC p (sigOpC q) (the metric-operator bridge)
  • QvC_polariz                  — QvC (p+q) = QvC p + QvC q + 2·BvC p q
  • EvC_right_nondegen           — (∀ p, EvC p X = EvC p Y) → X = Y
  • linIsom_BvC_preserved        — IsQvIsomC g (g linear) ⟹ ∀ p q, BvC (g p)(g q) = BvC p q
  • linIsom_metric_condition     — ★ THE OPERATOR LORENTZ METRIC CONDITION: IsQvIsomC g (g lin)
                                   + IsEvCAdjoint g h ⟹ h.comp (sigOpC.comp g) = sigOpC
  • boostEndC                    — the boost as a Module.End (non-vacuity carrier)
  • boostEndC_isQvIsomC          — boostEndC a b is a QvC-isometry when a²-b²=1
  • boostEndC_isEvCAdjoint_self  — the boost is its own EvC-adjoint
  • boostEndC_metric_condition   — ★ NON-VACUITY (W8): a CONCRETE non-trivial boost (a²-b²=1)
                                   satisfies the operator Lorentz metric condition gᵀJg = J

## GO / NO-GO
GO if the probe family compiles clean (0 sorry, foundations-only) within the KILL budget.
NO-GO ⟹ decompose further: bank sigOpC + the bridge + nondegeneracy first, child the rest.

## KILL (W9 instrument budget)
KILL = 180s per single obligation. If any one lemma's elaboration exceeds 180s, it is an
INSTRUMENT failure (not theory) — measure the smallest sub-obligation, decompose, do NOT
inflate maxHeartbeats. The whole probe is pure linear/form algebra over banked objects;
expected light (cf N89 full family 43s). If linIsom_metric_condition resists ⟹ bank the
bridge + nondegeneracy + sigOpC pieces, child the metric condition.

## COSTUME (C121) — must BITE
A WRONG metric-operator claim. Reuse the banked boost: a bogus claim that the boost's metric
condition reads a WRONG value at a concrete vector via the banked forms — false numeric
DISTINCT from the banked battery (C115 1=7, C116 4=13, C117 36=9, C118 21=1, C119 16=1,
C120 25=1). Plan: a wrong signature/metric reading forcing e.g. `9 = 1` or similar distinct
false numeric, reducing through sigOpC/EvC/BvC on a banked concrete vector. Must fail compile.

## STANDARD (applied at finalize)
Unbroken (every object from banked N49–N89 ← order-completeness of derived ℝ Cut ← the fold);
complete (#print axioms ⊆ {propext, Classical.choice, Quot.sound}); words-removable (delete
Lorentz/boost/rotation/signature/metric/isometry/orthogonal/adjoint/Minkowski → pure
linear-algebra over the derived Cut + the forms EvC/BvC/QvC). NO bridge.
