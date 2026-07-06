# N353 — arc-E E1-Ricci-Scalar: THE RICCI SCALAR = the metric (BvC) trace of the genuine tensorial Ricci `R = gᵘᵛ Ric_μν`.

## SELECT (FRESH worker, theory-native FIRST — QUIET-DRIFT + anti-bullshit gate, S1–S4)

DIRECTED single successor of N352 (E1-Ricci), which banked the GENUINE TENSORIAL RICCI `ricci G Y Z`
via the soldering/field-gradient map, resolving the 3× tensorial-Ricci deferral. Gate-fast on N352
verified GREEN (`/tmp/n352_gate.log`: GATE-FAST PASSED, D0–D6, C377 bites 1=377, 22 decls
foundations-only). This is a FRESH node (N353) — no prior workbench.

### The theory-native question asked FIRST.
On the fold's own terms, N349→N352→N353 is ONE arc about the SAME structural fact — the fold's
self-blindness at the connection level:
  • N349 PROVED the naive endomorphism/FIBER trace of the curvature is BLIND (identically 0,
    `trace[Γ₁,Γ₂]=0`) — the "obvious" scalar-curvature index contraction is content-free.
  • N352 PROVED the genuine tensorial Ricci lives on the SOLDERED LOOP index (via the field gradient
    `G:STVC→ₗMetricEnd`) and is FAITHFUL — nonzero exactly where the fiber trace is blind.
  • N353 (this node) asks the theory-native next beat: WHAT scalar does the fold read off the genuine
    Ricci? The physicist's Ricci scalar `R = gᵘᵛ Ric_μν` raises the second index with the INVERSE
    metric and traces. The theory-native content: does raising with the DERIVED signature metric
    (banked BvC, the fold's own indefinite Minkowski form) rescue the scalar contraction that the
    blind fiber trace destroyed? MEASURE (the N349/N352 lesson: measure whether a contraction carries
    content BEFORE assuming it).

### THE MEASUREMENT (decisive — probes 1–5 + full + axioms, all EXIT 0, foundations-only).
- `ricci solderWit Y Z = ¼·Y.2.1·Z.2.1` (`ricci_solder_form`, from the general-Z curvature components
  `lbCurv_gen_comp1/2`) — a rank-1 SYMMETRIC Ricci tensor supported on the spatial x-slot. (N352 only
  computed the single value at Z=(0,1,0); this generalizes to all Z.)
- `ricci_solder_symm`: Ric(Y,Z)=Ric(Z,Y) — the Ricci is symmetric here (the physical object GR uses).
- The metric-RAISE is UNIQUE: `ricciRaise_unique` — from banked `BvC_nondegenerate`, the endomorphism
  `T` with `BvC Y (T Z) = ricci G Y Z` is unique. This is the theory-native well-definedness: the
  DERIVED metric's nondegeneracy is what makes "raise the index" a well-defined operation.
- EXISTENCE for every soldering: `ricciRaiseMap G` via Mathlib's `BvCBilin.toDual` (the musical iso,
  needing `FiniteDimensional Cut STVC` (N76) + `BvCBilin_nondeg` (banked `BvC_nondegenerate` + symm)),
  with `ricciRaiseMap_isRaise`.
- ★ THE RICCI SCALAR `ricciScalar G := trace(g⁻¹ Ric) = trace(ricciRaiseMap G)`, and for the concrete
  field gradient `ricciScalar solderWit = −¼` (`ricciScalar_solder`, via the uniqueness bridge
  `ricciRaiseMap_solder_eq` to the hand-exhibited `solderRicciRaise Z = (0,−¼·Z.2.1,0)` +
  `trace_smulRight`). The sign `−` is FIXED by the DERIVED (1,9) signature (BvC's spatial minus).
- ★★ NON-VACUITY (W8): `ricciScalar_solder_ne_zero` (−¼ ≠ 0).
- ★★★ THE HEART: `ricciScalar_contentful_not_fiberTrace` — the endomorphism fiber trace of the
  curvature is identically 0 (N349) YET the metric-raised Ricci scalar is −¼ ≠ 0. Raising with the
  DERIVED metric rescues the scalar contraction the blind fiber trace destroyed. This CLOSES the
  N349→N352→N353 arc: fiber trace BLIND → soldered Ricci FAITHFUL → its metric trace CONTENTFUL.

### CHOICE.
Build the theory-native Ricci scalar on the banked derived-ℝ objects (banked N352 `ricci`, banked
`BvC`/`BvCBilin`/`BvC_nondegenerate`, `FiniteDimensional Cut STVC` N76):
- `BvCBilin_nondeg` — the derived metric is nondegenerate (SeparatingLeft/Right from banked
  `BvC_nondegenerate` + `BvC_symm`).
- `IsRicciRaise G T` (the raising relation), `ricciRaise_unique` (uniqueness from nondegeneracy).
- `ricciRightFun`/`ricciRaiseMap`/`ricciRaiseMap_isRaise` — existence via `toDual`.
- `ricciScalar G := trace(ricciRaiseMap G)` — the genuine metric trace.
- concrete: `lbCurv_gen_comp1/2`, `ricci_solder_form`, `ricci_solder_symm`, `xFun`, `solderRicciRaise`,
  `solder_isRicciRaise`, `ricciRaiseMap_solder_eq`, `ricciScalar_solder` (=−¼).
- W8: `ricciScalar_solder_ne_zero`; THE HEART: `ricciScalar_contentful_not_fiberTrace`.

## Target (over `MetricEnd = Module.End Cut STVC` / `STVC`, banked N352 `ricci` + banked `BvC`)
As listed above. All theorem TYPES over the banked derived objects.

## ANTI-BULLSHIT LAW (run in writing)
STANDARD version: the Ricci scalar `R = gᵘᵛ Ric_μν` — raise the second index of the Ricci tensor with
the inverse metric and contract. In GR this is a bookkeeping index contraction on a posited chart.
What the theory DOES to it:
  (1) It is built ENTIRELY on the banked derived-ℝ carrier: the Ricci is the banked N352 `ricci`
      (the soldered loop-index trace of the banked N348 curvature `lbCurv` = the look-back transport's
      non-closure), and the "inverse metric" that raises the index is the banked DERIVED signature form
      `BvC` (the fold's own indefinite Minkowski form) — NOT a posited metric. The raise is well-defined
      because the DERIVED metric is nondegenerate (banked `BvC_nondegenerate`), and that nondegeneracy
      IS the theory-native content of "the index can be raised."
  (2) It CLOSES a genuine theory-native discovery the textbook cannot see: the naive endomorphism/fiber
      trace of the curvature is content-free (identically 0, N349), the genuine Ricci is faithful on the
      soldered loop index (N352), and NOW its METRIC trace is a genuine nonzero scalar invariant (−¼) —
      the DERIVED signature metric rescues the scalar contraction the blind fiber trace destroyed. The
      SIGN of the scalar (−) is FORCED by the DERIVED (1,9) signature. The textbook writes `R=gᵘᵛRic`
      and never asks which contraction carries content; here it is PROVED that ONLY the metric-raised
      contraction (not the fiber trace) does, and the sign is the derived signature.

Words-removable: delete "curvature / Riemann / Ricci / scalar / metric / soldering / gradient /
gravity / spacetime" — a pure statement that over the derived field `Cut`, for `η²=1`, `Γ=½ηk`, the
soldering-linear-map `G`, and the derived nondegenerate symmetric bilinear form `BvC`, the unique
endomorphism `T` with `BvC Y (T Z) = trace(X↦[Γ(GX),Γ(GY)]Z)` exists, and its (Mathlib) trace for the
concrete `G` is `−¼`, while the endomorphism trace of `[Γ₁,Γ₂]` is `0`. Pure linear/trace/bilinear-form
algebra over the derived ℝ. NOT free-floating: every TYPE is over `MetricEnd = Module.End Cut STVC` /
`STVC` with banked `ricci`/`lbCurv`/`BvC`/`BvCBilin`; `ricciScalar`/`ricciRaiseMap` instantiated to the
banked `solderWit`; non-vacuity on banked concretes `timeProj`/`offDiagVar`.

Temptations REJECTED:
- (drift-A) "the naive basis trace of `ricci` over the bST basis IS the scalar" — MEASURED risk: the
  fiber trace was PROVEN blind (N349). REJECTED as the default — the theory-native scalar is the
  METRIC (BvC) trace, which MEASURING shows is contentful (−¼); the sign is the derived signature. The
  metric-raise (not the bare basis trace) is what carries content.
- (drift-B, QUIET DRIFT) "prove a long adjacency list — the Einstein tensor `G=Ric−½Rg`, the
  contracted Bianchi/divergence, then E2" in this node → REJECTED. The forced beat is the Ricci SCALAR
  (the genuine metric trace + its faithfulness/contentfulness) — the smallest forced beat. The Einstein
  tensor + Lovelock (E2) are the childed single successor.
- (drift-C) "state `ricciScalar` generically over an arbitrary nondegenerate form on an arbitrary
  module" → FREE-FLOATING trap. REJECTED — every TYPE over `Module.End Cut STVC`/`STVC` with the banked
  `ricci`/`BvC`; the scalar is instantiated to the banked `solderWit`; the non-vacuity/heart are on
  banked concretes.
- import Mathlib manifold / `RiemannianMetric` / tensor-curvature / `HasDerivAt` / Mathlib-ℝ as content
  → UNEARNED-IMPORT + CONTENT-ℝ trap. REJECTED — `LinearMap.trace`/`BilinForm.toDual`/`smulRight`/
  `Module.Dual`/`FiniteDimensional` are Mathlib MACHINERY on the DERIVED carrier; the metric is the
  banked derived `BvC`, the Ricci the banked derived `ricci`, the field is the derived `Cut`.

GENUINELY DIFFERENT from textbook GR: the textbook contracts `Ric` with a coordinate inverse metric on
a posited chart. Here the "inverse metric" is the DERIVED signature form `BvC` whose nondegeneracy (a
banked theorem) is the reason the raise is well-defined; and it is PROVED that the metric-raised trace
is the ONLY contraction carrying content (the fiber trace is blind, N349), with its SIGN fixed by the
DERIVED (1,9) signature. "One cause (η²=1 makes the curvature the commutator so the fiber trace
vanishes), the genuine scalar is the metric trace of the soldered Ricci, sign = the derived signature"
is the theory-native structure the textbook flattens.

MACHINERY node — asserts NO physical value. HONEST GRADE: leading-order/linearized; the genuine Ricci
scalar (the metric trace, well-defined + faithful/contentful + the concrete −¼). The Einstein tensor +
Lovelock (E2, Einstein's equations unique — a LITERATURE IMPORT, HIDDEN JOINT) are the childed single
successor. Flagged in docstring.

## Guards (SEED_GR relaxes NONE)
G1 no value asserted (machinery; −¼ FALLS OUT of the banked curvature components + the derived
signature, never premised). G2 no empirical number. G3 no scale (linear/trace/form algebra;
dimensionless). G4 the Ricci scalar IS the metric (BvC) trace of the banked Ricci over the DERIVED
metric, NOT a posited invariant; the metric-raise is well-defined by the banked `BvC_nondegenerate`;
the contentfulness (vs the blind fiber trace) is DERIVED. G5 words-removable (delete Ricci/scalar/
metric/curvature/gravity → pure linear/trace/bilinear-form algebra over the derived `Cut`). G6
foundations-only ⊆ {propext,Classical.choice,Quot.sound} (VERIFIED on all probe decls), no
sorry/axiom/native-decide/maxHeartbeats-raise. ℝ-VIGILANCE: built on banked derived-ℝ `Cut` + banked
`ricci`/`lbCurv`/`BvC`/`BvCBilin`/`BvC_nondegenerate`; `LinearMap.trace`/`BilinForm.toDual`/
`smulRight`/`Module.Dual`/`FiniteDimensional` are Mathlib MACHINERY on the derived carrier; NO Mathlib
manifold/curvature/`HasDerivAt`/`Real` as content. W8 non-vacuity C378 (a vacuous-scalar / wrong-value
mis-reading reduces to 1=378). W9 LIGHT (full route + axioms EXIT 0 in ~10s; the rank-1 reduction makes
the concrete trace `trace_smulRight`; the general existence is `toDual`; all identities dimension-free;
NO maxHeartbeats).

## ONE SUCCESSOR (RAIL): DIRECTED child toward E2 (Einstein's equations UNIQUE via Lovelock literature
import) — likely via the EINSTEIN TENSOR `G_μν = Ric_μν − ½ R g_μν` (now stateable: `ricci` banked at
N352, `ricciScalar` + `BvC` metric banked here) and then Lovelock uniqueness (HIDDEN JOINT — CITED).
Single tail successor; run the pre-complete fork check (kanban_list, non-terminal successors = exactly 1).
