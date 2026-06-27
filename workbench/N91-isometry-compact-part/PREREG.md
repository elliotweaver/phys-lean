# PREREG — N91: THE METRIC-CONDITION CHARACTERIZATION OF ISOMETRIES + INJECTIVITY + ADJOINT-UNIQUENESS
*(the immediately-bankable structural pieces toward the isometry-compact-part lemma; the
sqrt-uniqueness-dependent compact-part remainder childed)*

## CONTEXT
N90 banked the OPERATOR LORENTZ METRIC CONDITION `gᵀ J g = J` (`linIsom_metric_condition`):
for a LINEAR isometry `g` (`IsQvIsomC g`) with EvC-adjoint `h` (`IsEvCAdjoint g h`),
`h ∘ J ∘ g = J` where `J = sigOpC : (t,x,v) ↦ (t,-x,-v)`.  N89 banked the polar assembly
`g = k·p^{1/2}` (`comp_polar_decomposition`).  The ROADMAP §N91 target — the FULL
isometry-compact-part lemma `IsQvIsomC g ⟹ IsQvIsomC (k := g·(p^{1/2})⁻¹)` — MEASURE-FIRST
reduces (via N90 + N89) to `J p^{1/2} J = (p^{1/2})⁻¹`, i.e. POSITIVE-OPERATOR-SQUARE-ROOT
UNIQUENESS, the genuine W1 heavy core, NOT yet banked.

## THE TRUNK REFRAME (THE ONE LAW)
N90 proved metric-condition is NECESSARY (`⟹`).  The CONVERSE (`⟸`) — that the operator
metric equation `h∘J∘g = J` has NO solutions outside the isometry group — DISSOLVES via the
SAME EvC↔BvC bridge, run the other way:
  `QvC (g p) = BvC (g p)(g p) = EvC (g p)(J (g p)) = EvC p (h (J (g p)))`
            `= EvC p ((h∘J∘g) p) = EvC p (J p) = BvC p p = QvC p`.
Pure pairing (`BvC_self`, `BvC_eq_EvC_sigOpC`, `IsEvCAdjoint`).  Banking BOTH directions PINS
the linear isometries as EXACTLY the solutions of the operator metric equation — the structural
characterization the group analysis consumes.  Plus two light helpers the compact-part lemma
needs: adjoint right-uniqueness (`EvC_right_nondegen`) and isometry injectivity (from
`h∘J∘g = J` + `J` injective).

## GO / NO-GO (frozen before compute)
GO (DELIVERABLE) if ALL hold:
  1. `metric_condition_imp_isQvIsom` : `IsEvCAdjoint g h → h∘J∘g = J → IsQvIsomC g` compiles
     foundations-only (the CONVERSE of N90 — the new structure).
  2. `isEvCAdjoint_right_unique` : `IsEvCAdjoint g h₁ → IsEvCAdjoint g h₂ → h₁ = h₂` compiles.
  3. `linIsom_injective` : `IsQvIsomC g → IsEvCAdjoint g h → Function.Injective g` compiles.
  4. (combined) `isQvIsom_iff_metric_condition` : the full ⟺ for a linear `g` with EvC-adjoint.
  5. Non-vacuity costume C122 bites a WRONG metric-condition characterization (a non-solution
     claimed as isometry, OR a wrong injectivity / adjoint-uniqueness), distinct false numeric.
MEASURE-ONLY (bank if LIGHT, else child):
  6. `g∘J∘h = J` (the INVERSE metric condition / `h` is an isometry / `g*g` is an isometry) —
     needs `g` bijective (injective + FiniteDimensional Cut STVC), then `h = J∘g⁻¹∘J`.  Measure
     whether `FiniteDimensional Cut STVC` + `LinearMap.injective_iff_surjective` resolve cheaply.
NO-GO → child: the operator sqrt-uniqueness lemma + the full isometry-compact-part lemma
  `IsQvIsomC (g·(p^{1/2})⁻¹)` onto the chain tail; block if it resists after measure+reframe.

## KILL (instrument-failure budget, W9)
KILL = 180s / obligation.  If ANY single obligation's `lake env lean` probe exceeds 180s, or
the bijectivity/findim route (item 6) drags, declare it an INSTRUMENT failure for THIS node,
DROP item 6, bank items 1–5, and child the heavier remainder.  No inflated maxHeartbeats, no
monolithic brute.  Measure each obligation in a bounded probe BEFORE committing to production.

## COSTUME (C122, W8)
Must bite a WRONG characterization/injectivity/adjoint-uniqueness claim, reducing to a false
numeric DISTINCT from the banked battery (… C117 36=9, C118 21=1, C119 16=1, C120 25=1, C121 5=1).

## WORDS-REMOVABLE
Delete "Lorentz/boost/rotation/signature/metric/isometry/orthogonal/adjoint/compact/spectral/
square-root/uniqueness/inverse/group/connected/Spin/SO(9)" → over the derived complete ordered
field `Cut` with the positive-definite form `EvC` and the indefinite form `BvC` related by the
involution `J` via `BvC p q = EvC p (J q)`: a `Cut`-linear `g` with `∀ p q, EvC (g p) q =
EvC p (h q)` preserves the quadratic form `QvC` IFF `h ∘ J ∘ g = J`; such a `g` is injective;
and `h` is unique.  Pure linear-algebra math.
