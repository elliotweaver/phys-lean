# N351 — arc-E E1-assembly: THE FULL LINEARIZED CURVATURE 2-FORM F = dΓ + Γ∧Γ + the two-layer structure.

## SELECT (FRESH worker, theory-native FIRST — QUIET-DRIFT + ONE-LAW guard, S1–S4)

DIRECTED single successor of N350 (E1-deriv), which banked the `dΓ` machinery (`HasOpDerivAt0`,
`hasOpDerivAt0_iff`, `lbConn_opderiv` — the transport commutes with the derivative). N348 banked the
`Γ∧Γ` machinery (`lbCurv = [Γ₁,Γ₂]`). N349 banked the commutator's Born scalar + the trace no-go. BOTH
layers of the linearized Riemann `F = dΓ + Γ∧Γ` are banked; this node ASSEMBLES them. Gate-fast on N350
verified GREEN (`/tmp/n350_gate.log`: D0–D6, C375 bites 1=375, 10 decls foundations-only).

### The theory-native question asked FIRST (QUIET DRIFT) — and THE ONE LAW fired on the MEASUREMENT.
The ticket's naive framing is "assemble `dΓ − dΓ + Γ∧Γ`". Asked theory-native FIRST: what does the
look-back-transport model actually SAY the derivative-level curvature is? MEASURED it (probe1–probe4, all
EXIT 0). The measurement surfaced a genuine structure the textbook bookkeeping flattens, and THE ONE LAW
forbids forcing it to look like the standard `dΓ`:

- The connection is `Γ = lbConn k = ½·η·k` (N347), a SINGLE-operator map, LINEAR in `k` (from `η²=1`).
- Its `dΓ` layer is `dConn a₁₂ a₂₁ = Γ(a₁₂) − Γ(a₂₁) = lbConn(a₁₂ − a₂₁)` (by transport linearity), where
  `a₁₂ = ∂₁∂₂ h`, `a₂₁ = ∂₂∂₁ h` are the two orders of the field's second variation.
- **KEY MEASUREMENT: `dConn a a = 0`.** For an INTEGRABLE (gradient) field — commuting second variations,
  `a₁₂ = a₂₁` — the `dΓ` layer VANISHES identically. So `dΓ` measures ONLY the field's NON-INTEGRABILITY.
- The IRREDUCIBLE curvature content — surviving even for an integrable field — is the COMMUTATOR
  `Γ∧Γ = lbCurv` (N348), the fold's self-blindness at the connection level.

**THE ONE LAW applied:** rather than force `dΓ` to carry content it does not carry in this model (which
would mean positing a non-linear or multi-index connection just to reproduce the textbook `∂Γ` term), the
theory-native reading is the TWO-LAYER structure: the commutator is PRIMARY (the look-back non-closure),
the derivative layer SECONDARY (field non-integrability). This is the theory reordering the significance
the standard `R = ∂Γ − ∂Γ + ΓΓ` bookkeeping flattens. This is NOT a defect and NOT a scope-reduction —
it is the honest content, and it is a genuine theory-native statement.

### CHOICE.
Bank the assembled 2-form `linRiemann = dConn + lbCurv`, its 2-form antisymmetry
(`linRiemann_antisymm`), the integrable reduction to the commutator (`linRiemann_integrable`, THE HEART),
the grounding of the `dΓ` layer in the banked N350 operator derivative (`dConn_grounded` via
`lbConn_opderiv`), the fiber-trace decomposition (`linRiemann_fiberTrace_eq_dConn` — the trace sees only
`dΓ`, blind to the commutator, extending N349's no-go to the full assembly), the integrable-field naive
Ricci-trace vanishing (`linRiemann_fiberTrace_integrable_zero` — signals the theory-native Ricci must be
the Born form, childed), and non-vacuity of both layers (`dConn_ne_zero`, `linRiemann_ne_zero`).

## Target (over `MetricEnd = Module.End Cut STVC`, banked N348 `lbCurv` + N350 `lbConn_opderiv`/`opderiv_add`)
- `lbConn_sub`/`lbConn_neg` — transport linearity (subtractive/negatable) from `η²=1`.
- `opderiv_neg`/`opderiv_sub` — operator derivative subtractive (via `opderiv_add` + `opderiv_neg`; no
  `ContinuousSub STVC` instance, `ContinuousNeg STVC` resolves from N41b `Cut` topology).
- `dConn a₁₂ a₂₁ := lbConn a₁₂ − lbConn a₂₁` — the `dΓ` layer; `dConn_eq` = `lbConn(a₁₂−a₂₁)`.
- `dConn_antisymm`, `dConn_integrable_zero` (★ vanishes for integrable field), `dConn_grounded`
  (★★ via `lbConn_opderiv`), `dConn_ne_zero`.
- `linRiemann a₁₂ a₂₁ k₁ k₂ := dConn a₁₂ a₂₁ + lbCurv k₁ k₂` — the full 2-form.
- `linRiemann_eq`, `linRiemann_antisymm` (★), `linRiemann_integrable` (★★★ HEART: `= lbCurv`),
  `linRiemann_flat`, `linRiemann_ne_zero` (★★ W8).
- `linRiemann_fiberTrace_eq_dConn` (★), `linRiemann_fiberTrace_integrable_zero`.
- `curvature_twoLayer` (★★★ bundled heart).

## ANTI-BULLSHIT LAW (run in writing)
STANDARD version: `R^ρ_σμν = ∂_μ Γ^ρ_νσ − ∂_ν Γ^ρ_μσ + Γ^ρ_μλ Γ^λ_νσ − Γ^ρ_νλ Γ^λ_μσ` — the
antisymmetrized DERIVATIVE of the Christoffel symbols plus the connection commutator, on a posited chart.
What the theory DOES to it: (1) both layers are built on the banked derived-ℝ carrier `Module.End Cut STVC`
— the `dΓ` layer is the banked N350 operator directional derivative (the C6 eternal-approach on the banked
operator topology), the `Γ∧Γ` layer is the banked N348 commutator; (2) it PROVES the `dΓ` layer vanishes
for integrable fields, isolating the commutator as the irreducible curvature — a statement the textbook
bookkeeping never articulates; (3) it PROVES (fiber-trace decomposition) that the naive Ricci-by-basis-trace
is blind to the commutator and vanishes for integrable fields, forcing the theory-native Born-form Ricci
(childed, following N349). Words-removable: delete "curvature/Riemann/Ricci/connection/transport/gravity" —
a pure statement that over the derived field `Cut`, for `η²=1` and `Γ=½ηk`, `dConn a b = lbConn(a−b)` is
antisymmetric and zero at `a=b`; `dConn + lbCurv` is antisymmetric under joint swap, reduces to `lbCurv` at
`a=b`, has fiber trace `= trace(dConn)`, is nonzero for the concrete pair; and `dConn` is the operator
difference-quotient limit of a difference of transport families. Pure operator/limit algebra. NOT
free-floating: every TYPE is over `MetricEnd = Module.End Cut STVC`/`STVC`, with the banked `lbConn`,
`lbCurv`, `HasOpDerivAt0`.

Temptations REJECTED:
- (drift-A) "posit a multi-index / non-linear connection just to make `dΓ` reproduce the textbook `∂Γ`
  term" → THE ONE LAW violation (forcing the theory to match standard bookkeeping). REJECTED — the honest
  measured content is the two-layer structure with `dΓ` vanishing on integrable fields.
- (drift-B) "prove a long adjacency list of 2-form identities (Bianchi, symmetry pairs, ...) because that
  is the obvious next step" → QUIET DRIFT. REJECTED — the forced beat is the ASSEMBLY + the two-layer heart
  + the fiber-trace decomposition that signals the childed Born-Ricci. Bianchi etc. are not forced here.
- (free-floating) "state the assembly generically over an arbitrary [Ring]/[Module]" → REJECTED, every
  TYPE is the banked `Module.End Cut STVC` with the banked `lbConn`/`lbCurv`.
- import Mathlib manifold/`RiemannianMetric`/curvature-tensor/`HasDerivAt`/`deriv` as content →
  UNEARNED-IMPORT + CONTENT-ℝ trap. REJECTED — the derivative is the banked N350 `HasOpDerivAt0` (bare
  `Tendsto` over `endOpC`), the curvature the banked commutator; `LinearMap.trace`/`Filter`/`Module.End`
  are Mathlib MACHINERY on the DERIVED carrier.
- claim this builds the tensorial Ricci / E2 → it does NOT. It assembles the 2-form + the two-layer
  structure + the fiber-trace decomposition that MOTIVATES the childed Born-Ricci. Flagged leading-order.

GENUINELY DIFFERENT from textbook GR: textbook writes `R = ∂Γ − ∂Γ + ΓΓ` as flat bookkeeping and never
distinguishes which piece is irreducible. Here it is PROVED that in the look-back-transport model the `dΓ`
piece vanishes for integrable fields, so the commutator (the fold's self-blindness at the connection level)
is the irreducible curvature — "one cause (η²=1 makes the transport linear), the derivative layer becomes
integrability-only, the commutator carries the non-closure" is the theory-native heart the textbook flattens.

MACHINERY / assembly node — asserts NO physical value. HONEST GRADE: leading-order/linearized; the full
2-form assembly + the two-layer structure + the fiber-trace decomposition. The tensorial Ricci (Born-form,
childed following N349) and E2 (Einstein's equations unique via Lovelock) are childed. Flagged in docstring.

## Guards
G1 no value asserted (assembly/machinery). G2 no empirical number. G3 no scale (operator/limit algebra).
G4 the Riemann IS the sum of the banked `dΓ` derivative (N350) and `Γ∧Γ` commutator (N348), NOT a posited
tensor; the two-layer structure + the `dΓ`-integrable-vanishing are DERIVED, not assumed. G5 words-removable
(delete curvature/Riemann/Ricci/connection/transport/gravity → pure operator/limit algebra over the derived
`Cut`). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}, no sorry/axiom/native-decide/
maxHeartbeats-raise. ℝ-VIGILANCE: built on banked derived-ℝ `Cut` + banked `lbConn`/`lbCurv`/`HasOpDerivAt0`/
`fiberTrace_lbCurv_zero`; `Module.End`/`LinearMap.trace`/`Filter`/`Tendsto` are Mathlib MACHINERY on the
derived carrier; NO Mathlib manifold/curvature/`HasDerivAt`/`Real` as content. W8 non-vacuity C376 (a
vacuous-Riemann / wrong-assembly mis-reading reduces to 1=376). W9 LIGHT (all identities dimension-free
operator algebra + the banked pointwise limit; probes close in seconds; olean ~27s, NO maxHeartbeats).

## ONE SUCCESSOR (RAIL): DIRECTED child toward the TENSORIAL RICCI of `linRiemann` (theory-native, via the
fold's Born form as N349 did for the commutator scalar — the basis trace is blind, `linRiemann_fiberTrace_*`
proves it) and E2 (Einstein's equations unique via Lovelock literature import, applied to the assembled
curvature). Single tail successor; run the pre-complete fork check.
