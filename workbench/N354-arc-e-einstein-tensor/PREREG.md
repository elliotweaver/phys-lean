# N354 — arc-E E1-Einstein: THE EINSTEIN TENSOR G_μν = Ric_μν − ½ R g_μν, and its DIMENSION-FORCED trace-reversal.

## SELECT (FRESH worker, theory-native FIRST — QUIET-DRIFT + anti-bullshit gate, S1–S4)

DIRECTED single successor of N353 (E1-Ricci-Scalar), which banked the RICCI SCALAR `ricciScalar G`
= the metric (BvC) trace of the genuine tensorial Ricci, closing the N349→N352→N353 arc. Gate-fast on
N353 VERIFIED GREEN (`/tmp/n353_gate.log`: GATE-FAST PASSED, D0–D6, C378 bites 1=378, 20 decls
foundations-only). This is a FRESH node (N354) — resume-check confirmed no prior N354 workbench
(`ls workbench/N35*` shows only N350/N351/N352/N353). Derived from scratch.

### The theory-native question asked FIRST (do NOT run on the ticket's framing).
Toward E2 (Einstein's equations UNIQUE via Lovelock), the standard route needs the EINSTEIN TENSOR
`G_μν = Ric_μν − ½ R g_μν`. The QUIET-DRIFT trap (named + rejected): "just define G, prove it's
bilinear + symmetric by routine machinery from the banked ricci + BvC bilinearity, and move on" —
that is proving adjacent properties of a derived object by textbook machinery, the exact reflex the
SOUL's QUIET DRIFT warns against. So ask the theory-native question FIRST: what does the FOLD say
about the Einstein tensor that the textbook does not?

THE ANSWER (measured): the genuine content is the TRACE-REVERSAL, and it is DIMENSION-FORCED. In the
textbook, `g^μν G_μν = R·(1 − d/2)`, and "d = 4" is put in BY HAND as the spacetime dimension. On the
DERIVED carrier, the "d/2" is literally `½·trace(id_STVC)` = `½·finrank_STVC`, and `finrank_STVC = 10`
is a BANKED, DERIVED fact (N-SO8FinrankTower — the (1,9) = 1+1+8 split, the octonion block forced by
the terminal algebra). So the trace-reversal factor `1 − dim/2 = 1 − 5 = −4` is FORCED by the derived
spacetime dimension, NOT chosen. The raise of the metric g IS the identity endomorphism, whose trace
is exactly the derived dimension. This is the fold-native fact the textbook flattens: the spin-2
trace-reversal is DIMENSION-LOCKED to the derived (1,9) carrier.

### THE MEASUREMENT (decisive — probe1, probe2, probe3, probe_axioms, all EXIT 0, foundations-only).
- `einstein G Y Z := ricci G Y Z − (½·R)·BvC Y Z` — the rank-(0,2) Einstein form on the banked objects.
- BILINEAR (einstein_add_Y/_add_Z/_smul_Y) from banked ricci bilinearity (N352) + BvC bilinearity;
  SYMMETRIC for the concrete soldering (einstein_solder_symm) from ricci_solder_symm + BvC_symm.
- CONCRETE MIXED VALUE: `einstein solderWit Y Z = ¼·Y.2.1·Z.2.1 + ⅛·BvC Y Z` (einstein_solder_form,
  using R = −¼) — a genuine mixed object (the field-gradient Ricci form PLUS a metric term).
- NON-VACUOUS as a form: `einstein solderWit (0,1,0)(0,1,0) = ¼ + ⅛·(−1) = ⅛ ≠ 0` (einstein_solder_ne_zero).
- The einstein-RAISE is UNIQUE (einsteinRaise_unique, forced by banked BvC_nondegenerate) and EXISTS
  (einsteinRaiseMap = ricciRaiseMap − ½R·id, einsteinRaiseMap_isRaise: BvC Y (T Z) = einstein G Y Z).
- ★★★ THE DIMENSION-FORCED TRACE-REVERSAL: `einsteinScalar G = R − ½·(finrank STVC)·R`
  (einstein_traceReversal), so at the banked finrank_STVC = 10, `einsteinScalar G = −4·R`
  (einstein_traceReversal_value). The "−4" (not the textbook "−1") is FORCED by the DERIVED spacetime
  dimension = trace(id) = finrank_STVC. Concrete: `einsteinScalar solderWit = −4·(−¼) = 1`
  (einsteinScalar_solder).

### CHOICE.
Build the Einstein tensor as a rank-(0,2) form on the banked derived-ℝ objects (banked N352 `ricci`,
N353 `ricciScalar`/`ricciRaiseMap`/`BvC`/`BvCBilin`/`BvC_nondegenerate`, banked `finrank_STVC` N-SO8),
with the DIMENSION-FORCED trace-reversal as the heart:
- `einstein` (def), `einstein_add_Y`/`_add_Z`/`_smul_Y` (bilinear), `einstein_solder_symm` (symmetric).
- `einstein_solder_form` (¼·Y.2.1·Z.2.1 + ⅛·BvC Y Z), `einstein_solder_ne_zero` (W8 form-level).
- `IsEinsteinRaise`, `einsteinRaise_unique` (from BvC_nondegenerate), `einsteinRaiseMap`,
  `einsteinRaiseMap_isRaise`, `einsteinScalar` (the trace).
- ★★★ `einstein_traceReversal` (= R − ½·finrank·R), `einstein_traceReversal_value` (= −4·R at
  finrank=10), `einsteinScalar_solder` (=1), `einsteinScalar_solder_ne_zero` (W8).

## Target (over `MetricEnd = Module.End Cut STVC` / `STVC`, banked N352 `ricci` + N353 `ricciScalar` + banked `BvC` + banked `finrank_STVC`)
All theorem TYPES over the banked derived objects.

## ANTI-BULLSHIT LAW (run in writing)
STANDARD version: `G_μν = Ric_μν − ½ R g_μν`, the divergence-free symmetric 2-tensor; its trace
`g^μν G_μν = R(1 − d/2) = −R` at d=4 — the spin-2 trace-reversal feeding the `2` in `8πG = 2·4π·G`
(E3). Lovelock uniqueness (E2) is a LITERATURE IMPORT (a HIDDEN JOINT — CITED as machinery, not a
framework theorem), NOT touched in this node.
What the theory DOES to it:
  (1) Built ENTIRELY on the banked derived-ℝ carrier: `einstein` is the banked N352 `ricci` (the
      soldered loop-index trace of the banked N348 curvature) MINUS ½ the banked N353 `ricciScalar`
      times the banked DERIVED signature metric `BvC` — NOT a posited tensor. The einstein-raise is
      well-defined because the DERIVED metric is nondegenerate (banked `BvC_nondegenerate`); the raise
      of the metric g IS the identity endomorphism.
  (2) The genuine theory-native discovery: the TRACE-REVERSAL FACTOR IS DIMENSION-FORCED. The textbook
      writes `1 − d/2` and puts `d = 4` in BY HAND. Here `d/2 = ½·trace(id_STVC) = ½·finrank_STVC`,
      and `finrank_STVC = 10` is a BANKED DERIVED fact (the (1,9) = 1+1+8 split, the octonion block
      forced by the terminal algebra). So the factor `−4` (not `−1`) is FORCED by the derived
      spacetime dimension — the spin-2 trace-reversal is DIMENSION-LOCKED to the derived carrier, a
      fact the textbook flattens by fixing d=4 as an input.

Words-removable: delete "Einstein / Ricci / scalar / curvature / metric / gravity / spacetime" — a
pure statement that over the derived field `Cut`, for the banked bilinear form `ricci G`, the banked
scalar `ricciScalar G`, and the derived nondegenerate symmetric bilinear form `BvC`, the form
`Y,Z ↦ ricci G Y Z − (½·ricciScalar G)·BvC Y Z` is bilinear (and symmetric for the concrete `G`); the
unique endomorphism `T` with `BvC Y (T Z) = that form` exists; and its (Mathlib) trace equals
`ricciScalar G · (1 − ½·finrank_Cut STVC)`, which at `finrank = 10` is `−4·ricciScalar G`. Pure
linear/trace/bilinear-form algebra over the derived ℝ. NOT free-floating: every TYPE over
`Module.End Cut STVC`/`STVC` with the banked `ricci`/`ricciScalar`/`BvC`; the trace-reversal cites the
banked `finrank_STVC`; the concretes on banked `solderWit`/`timeProj`/`offDiagVar`.

Temptations REJECTED:
- (drift-A, QUIET DRIFT) "define G = Ric − ½Rg, prove bilinear + symmetric by routine machinery, ship"
  → REJECTED as the deliverable's HEART. The bilinearity/symmetry ARE banked (they fall out of ricci +
  BvC bilinearity) and are included, but they are NOT the theory-native content — they are the routine
  adjacent properties. The theory-native content is the DIMENSION-FORCED trace-reversal (`−4`, not the
  textbook `−1`), forced by the banked `finrank_STVC = 10`. Asked the theory-native question FIRST and
  found the real target.
- (drift-B, QUIET DRIFT) "also prove the contracted Bianchi ∇^μ G_μν = 0 and state E2 (Lovelock) in
  this node" → REJECTED. The forced beat is the Einstein tensor + its dimension-forced trace-reversal
  (the object E2/E3 need). The covariant divergence (needs the operator-derivative on the metric
  tensor field, banked N350 HasOpDerivAt0) and E2 (Lovelock literature import, a HIDDEN JOINT) are the
  childed single successor.
- (drift-C, FREE-FLOATING) "state einstein/trace-reversal generically over an arbitrary nondegenerate
  form on an arbitrary d-dim module" → FREE-FLOATING trap. REJECTED — every TYPE over
  `Module.End Cut STVC`/`STVC` with the banked `ricci`/`ricciScalar`/`BvC`; the dimension is the banked
  `finrank_STVC`, not a generic `d`; concretes on banked `solderWit`.
- import Mathlib manifold / tensor-curvature / `RiemannianMetric` / `HasDerivAt` / Mathlib-ℝ as content
  → UNEARNED-IMPORT + CONTENT-ℝ trap. REJECTED — `LinearMap.trace`/`trace_id`/`BilinForm.toDual`/
  `Module.finrank` are Mathlib MACHINERY on the DERIVED carrier; the metric is the banked derived
  `BvC`, the Ricci the banked derived `ricci`, the dimension the banked `finrank_STVC`, the field the
  derived `Cut`.

GENUINELY DIFFERENT from textbook GR: the textbook writes `G_μν = Ric_μν − ½ R g_μν` and takes the
trace at "d = 4" as an input. Here the trace-reversal factor is `1 − ½·finrank_STVC` with the
dimension a DERIVED banked fact (finrank_STVC = 10, the (1,9) split from the terminal algebra), so the
factor `−4` is FORCED, not chosen. "One cause (η²=1 makes the curvature the commutator; the raise of
the metric is the identity), the trace-reversal is the derived dimension" is the theory-native
structure the textbook flattens.

MACHINERY node — asserts NO physical value. HONEST GRADE: leading-order/linearized; the Einstein
tensor + its dimension-forced trace-reversal on the banked objects. E2 (Einstein's equations unique
via Lovelock — a LITERATURE IMPORT, HIDDEN JOINT) + the contracted Bianchi/divergence are the childed
single successor.

## Guards (SEED_GR relaxes NONE)
G1 no value asserted (machinery; −4·R and ⅛ and 1 FALL OUT of the banked ricci/ricciScalar/BvC/finrank,
never premised). G2 no empirical number. G3 no scale (linear/trace/form algebra; dimensionless). G4 the
Einstein tensor IS the banked ricci − ½ banked ricciScalar · banked BvC, NOT a posited tensor; the raise
well-defined by banked BvC_nondegenerate; the trace-reversal factor DERIVED from banked finrank_STVC. G5
words-removable (above). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound} (VERIFIED on the
heart decls via probe_axioms), no sorry/axiom/native-decide/maxHeartbeats-raise. ℝ-VIGILANCE: built on
banked derived-ℝ `Cut` + banked `ricci`/`ricciScalar`/`BvC`/`BvCBilin`/`BvC_nondegenerate`/`finrank_STVC`;
`LinearMap.trace`/`trace_id`/`BilinForm.toDual`/`Module.finrank` are Mathlib MACHINERY on the derived
carrier; NO Mathlib manifold/curvature/`HasDerivAt`/`Real` as content. W8 non-vacuity C379 (a
wrong-Einstein-tensor / wrong-trace-reversal mis-reading reduces to 1=379). W9 LIGHT (full route + axioms
EXIT 0 in ~10s; trace-reversal is trace_id + finrank_STVC; all identities dimension-free; NO
maxHeartbeats).

## ONE SUCCESSOR (RAIL): DIRECTED child toward E2 (Einstein's equations UNIQUE via Lovelock literature
import) applied to the Einstein tensor, OR a further decompose-remainder if E2 needs the contracted
Bianchi / covariant divergence ∇^μ G_μν = 0 (which would use the banked N350 operator-derivative on the
metric tensor field) as a preceding beat. Single tail successor; run the pre-complete fork check
(kanban_list, non-terminal successors = exactly 1).
