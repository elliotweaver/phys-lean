# N352 — arc-E E1-Ricci: THE GENUINE TENSORIAL RICCI via the SOLDERING/GRADIENT MAP, resolving the 3× deferral.

## SELECT (FRESH worker, theory-native FIRST — QUIET-DRIFT + REPEATED-DEFERRAL guard, S1–S4)

DIRECTED single successor of N351 (E1-assembly), which banked the full linearized Riemann 2-form
`F = dΓ + Γ∧Γ` + the two-layer structure. Gate-fast on N351 verified GREEN (`/tmp/n351_gate.log`:
GATE-FAST PASSED, D0–D6, C376 bites 1=376, 19 decls foundations-only).

### The theory-native question asked FIRST — and the REPEATED-DEFERRAL SIGNAL fired.
The ticket offers two framings: (a) `bornRiemann = EvC(linRiemann·p)(linRiemann·p)` — the Born
self-overlap of the FULL assembled Riemann; or (b) "a genuine tensorial Ricci if honestly buildable."

**The decisive observation (RUNBOOK REPEATED-DEFERRAL SIGNAL):** the TENSORIAL Ricci has now been
deferred/childed at N348, N349, AND N351 — THREE consecutive nodes — each for the SAME stated reason:
"the fiber trace is blind (`trace[Γ₁,Γ₂]=0`), so the Ricci must be the Born form / needs the finite
basis." That is exactly the signal the RUNBOOK names: a high-value front (the Ricci) rejected ≥3× for
the same structural reason. The rail says: do NOT defer a 4th time into an easier adjacent scalar.
NAME the blocker, and BUILD the richer structure the front actually requires.

**Option (a) is QUIET DRIFT and I reject it.** `bornRiemann` is QUADRATIC in curvature (a
Kretschmann/energy-density scalar), NOT the Ricci (which is LINEAR in Riemann). For an integrable
field it reduces to `F = lbCurv` so `bornRiemann` collapses to the ALREADY-BANKED N349 `bornCurv` —
it banks nothing new toward E2/E3 and grinds an adjacent object rather than the front. It FEELS like
progress (compiles cleanly, uses banked objects) but does not resolve the ceiling.

### The ceiling was MIS-DIAGNOSED — and the MEASUREMENT (probe1–4, all EXIT 0) resolves it.
The blind trace at N349/N351 is the ENDOMORPHISM / FIBER trace of `lbCurv`: it contracts the
curvature endomorphism's OWN target-vs-source index, and `trace[Γ₁,Γ₂]=0` by `trace_mul_comm`. But
the genuine RICCI is a DIFFERENT contraction: it contracts the LOOP-SOURCE index against the fiber
index — `Ric(Y,Z) = trace(X ↦ R(X,Y)Z)`. That contraction is TYPE-INCOHERENT in the banked
representation because the loop directions live INSIDE the metric variations `k : MetricEnd`, not as
genuine tangent vectors. The richer structure the deferral pointed to is exactly the missing piece:
the **SOLDERING / FIELD-GRADIENT map `G : STVC →ₗ[Cut] MetricEnd`**, `G X = ∂_X h` — each tangent
direction solders to "its" metric variation. This is NOT a new posit: it is the field gradient N350's
`lbConn_opderiv` (`∂(Γ∘h) = Γ(∂h)`) already grounds — the linear assignment of a metric variation to
a tangent direction. With `G` exposed, `R(X,Y) := lbCurv (G X) (G Y)` and the Ricci
`Ric(Y,Z) = trace(X ↦ R(X,Y)Z)` becomes formable.

**THE MEASUREMENT (decisive, all EXIT 0):**
- `lbCurv_solder`: for a rank-2 soldering `G X = X.1•timeProj + X.2.1•offDiagVar`, bilinearity +
  `lbCurv_self=0` give `R(X,Y) = (X.1·Y.2.1 − X.2.1·Y.1) • lbCurv timeProj offDiagVar` — the single
  banked curvature times the antisymmetric coefficient.
- `ricMap_solder`: the map `X ↦ R(X,Y)Z` is therefore genuinely RANK-1 (`ρ.smulRight w`) — NO 10-dim
  basis brute force needed; `LinearMap.trace_smulRight (f) (x) = f x` (Mathlib) closes the trace.
- `ricci_solder`: `Ric(Y,Z) = Y.2.1·(R·Z).1 − Y.1·(R·Z).2.1` computes.
- ★★ NON-VACUITY: `ricci solderWit (0,1,0) (0,1,0) = (lbCurv timeProj offDiagVar (0,1,0)).1 = ¼ ≠ 0`.
  **The genuine Ricci is NONZERO exactly where the fiber trace is BLIND.** The 3× deferral is
  RESOLVED: it was not that the Ricci is un-formable, but that the loop index had to be soldered.
- Bilinearity of `ricci` in both `Y` and `Z` (probe4, all pass) — a genuine rank-(0,2) tensor.

### CHOICE.
Build the theory-native tensorial Ricci on the banked derived-ℝ objects:
- `lbCurvLeft`, `evalAt`, `ricMap G Y Z` (the loop-source curvature map), `ricci G Y Z` (its trace).
- The tensor structure: `ricMap`/`ricci` bilinear in `Y` and `Z` (genuine rank-(0,2) tensor), and
  `ricMap` LINEAR in the soldered loop index (the contraction is over a genuine tangent index).
- The soldering witness `solderWit` (grounded: the field gradient, N350) + the rank-1 reduction
  `lbCurv_solder`/`ricMap_solder`/`ricci_solder`.
- ★★ NON-VACUITY (W8): `ricci_solder_ne_zero` — the genuine Ricci is nonzero where the fiber trace is
  blind (`ricci ≠ 0` while `trace lbCurv = 0`, N349).
- THE HEART: `ricci_faithful_not_fiberTrace` — the fiber trace of the curvature is identically zero
  (N349) YET the genuine loop-index Ricci is nonzero. The Ricci is the contraction over the SOLDERED
  loop index, NOT the blind fiber trace; the 3× deferral was a mis-diagnosed ceiling.

## Target (over `MetricEnd = Module.End Cut STVC`, banked N348 `lbCurv` + soldering `G : STVC →ₗ MetricEnd`)
- `lbCurvLeft kY : MetricEnd →ₗ MetricEnd` — `k ↦ lbCurv k kY` (linear, from `lbCurv_add_left`/`_smul_left`).
- `evalAt Z : MetricEnd →ₗ STVC` — `LinearMap.applyₗ Z`.
- `ricMap G Y Z : STVC →ₗ STVC` — `X ↦ lbCurv (G X) (G Y) Z` (the curvature over the soldered loop index).
- `ricMap_apply`, `ricMap_add_Y`/`_add_Z`, `ricMap_smul_Y`/`_smul_Z` (bilinear rank-(0,2) tensor).
- `ricci G Y Z := trace (ricMap G Y Z)` — the genuine tensorial Ricci; `ricci_add_Y`/`_Z`, `ricci_smul_Y`/`_Z`.
- `solderWit` + `solderWit_apply` — the concrete rank-2 field-gradient soldering.
- `lbCurv_solder`, `ricMap_solder` (rank-1), `ricci_solder` (the computed trace).
- `lbCurv_sample_comp1`/`_comp2`, ★★ `ricci_solder_ne_zero` (W8 non-vacuity).
- ★★★ `ricci_faithful_not_fiberTrace` (THE HEART: fiber trace = 0 (N349) ∧ genuine Ricci ≠ 0).

## ANTI-BULLSHIT LAW (run in writing)
STANDARD version: `Ric_μν = R^ρ_μρν` — the Riemann tensor contracted on its first upper index with
the first lower loop index; the Ricci scalar `R = g^μν Ric_μν`. Lovelock uniqueness for E2.
What the theory DOES to it: (1) the contraction is built on the banked derived-ℝ carrier `Module.End
Cut STVC` + `STVC` — the curvature is the banked N348 commutator `lbCurv` (the look-back transport's
non-closure), the soldering `G` is the banked N350 field gradient; (2) it PROVES the naive
ENDOMORPHISM/FIBER trace (the "obvious" index contraction) is content-free — identically zero (N349),
and that the GENUINE Ricci is the contraction over the SOLDERED LOOP index, which requires the
gradient map `G` to expose the loop direction as a tangent vector; (3) it resolves a 3× deferral by
NAMING and BUILDING the richer structure (the soldering) the front needed — the RUNBOOK
repeated-deferral protocol, made a theorem: the Ricci is nonzero exactly where the fiber trace is
blind.

Words-removable: delete "curvature / Riemann / Ricci / soldering / gradient / tangent / gravity /
spacetime" — a pure statement that over the derived field `Cut`, for `η²=1`, `Γ=½ηk`, and a linear
map `G : STVC →ₗ MetricEnd`, the assignment `Y,Z ↦ trace(X ↦ [Γ(GX),Γ(GY)] Z)` is bilinear, and for
the concrete rank-2 `G` it is nonzero while the endomorphism trace of `[Γ₁,Γ₂]` is zero. Pure
linear/trace algebra over the derived ℝ. NOT free-floating: every TYPE is over `MetricEnd = Module.End
Cut STVC`/`STVC` with the banked `lbCurv`; `G : STVC →ₗ MetricEnd` is a genuine map INTO the banked
carrier, not an arbitrary abstraction; the non-vacuity is on the concrete `solderWit`/`timeProj`/`offDiagVar`.

Temptations REJECTED:
- (drift-A, the ticket's option a) "bank `bornRiemann = EvC(linRiemann·p)(linRiemann·p)`" → QUIET
  DRIFT. It is QUADRATIC (Kretschmann/energy), NOT the Ricci; for integrable fields it collapses to
  the banked N349 `bornCurv`; it does NOT resolve the 3× Ricci deferral. REJECTED — the front is the
  genuine (linear) Ricci, and the MEASUREMENT shows it IS buildable.
- (drift-B) "defer the tensorial Ricci a 4th time as 'needs the finite basis / must be the Born
  form'" → the REPEATED-DEFERRAL failure the RUNBOOK forbids. REJECTED — measured that the ceiling
  was mis-diagnosed (fiber trace ≠ loop-index Ricci) and the soldering map resolves it.
- (drift-C) "prove a long adjacency list — Bianchi identities, Ricci pair-symmetry, the scalar
  contraction, Einstein tensor" → QUIET DRIFT. REJECTED — the forced beat is the genuine Ricci
  EXISTS + is faithful (nonzero where the fiber trace is blind) + is a bilinear tensor. Ricci
  symmetry, the scalar `g^μν Ric`, and E2 (Lovelock) are the childed single successor.
- (free-floating) "state the Ricci generically over an arbitrary module + arbitrary bilinear
  curvature" → REJECTED, every TYPE is over `Module.End Cut STVC`/`STVC` with the banked `lbCurv`;
  the soldering maps INTO the banked carrier; non-vacuity is on banked concretes.
- import Mathlib manifold / `RiemannianMetric` / tensor-curvature / `HasDerivAt` as content →
  UNEARNED-IMPORT + CONTENT-ℝ trap. REJECTED — `LinearMap.trace`/`applyₗ`/`smulRight`/`Module.Free`
  are Mathlib MACHINERY on the DERIVED carrier; the curvature is the banked commutator, the soldering
  a genuine linear map into the banked `MetricEnd`.

GENUINELY DIFFERENT from textbook GR: the textbook writes `Ric_μν = R^ρ_μρν` as a bookkeeping index
contraction on a posited chart and never asks which contraction carries content. Here it is PROVED
that the naive endomorphism/fiber trace is BLIND (identically zero, N349), and that the genuine Ricci
is the contraction over the SOLDERED loop index — requiring the field-gradient map that assigns a
metric variation to a tangent direction (the N350 look-back gradient). "One cause (`η²=1` makes the
transport linear, so the curvature is the commutator and the fiber trace vanishes), the genuine Ricci
lives on the soldered loop index" is the theory-native structure the textbook flattens.

MACHINERY node — asserts NO physical value. HONEST GRADE: leading-order/linearized; the genuine
tensorial Ricci (existence + faithfulness + tensor structure). Ricci symmetry, the scalar contraction,
and E2 (Einstein's equations unique via Lovelock literature import) are the childed single successor.
Flagged in docstring.

## Guards
G1 no value asserted (machinery). G2 no empirical number. G3 no scale (linear/trace algebra). G4 the
Ricci IS the trace of the banked curvature over the soldered loop index, NOT a posited tensor; the
soldering is the banked N350 field gradient; the faithfulness (nonzero where the fiber trace is blind)
is DERIVED. G5 words-removable (delete curvature/Riemann/Ricci/soldering/gravity → pure linear/trace
algebra over the derived `Cut`). G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}, no
sorry/axiom/native-decide/maxHeartbeats-raise. ℝ-VIGILANCE: built on banked derived-ℝ `Cut` + banked
`lbCurv`/`timeProj`/`offDiagVar`; `LinearMap.trace`/`applyₗ`/`smulRight`/`Module.Free` are Mathlib
MACHINERY on the derived carrier; NO Mathlib manifold/curvature/`HasDerivAt`/`Real` as content. W8
non-vacuity C377 (a vacuous-Ricci / blind-contraction mis-reading reduces to 1=377). W9 LIGHT (the
rank-1 reduction makes the trace `trace_smulRight`; all identities dimension-free linear/trace algebra
+ two concrete component computations; probes close in seconds; olean expected LIGHT, NO maxHeartbeats).

## ONE SUCCESSOR (RAIL): DIRECTED child toward E2 (Einstein's equations UNIQUE via Lovelock literature
import, applied to the genuine Ricci built here) — likely preceded by the Ricci scalar contraction
`g^μν Ric` (the metric trace via the banked BvC) and/or Ricci pair-symmetry if E2 needs them. Single
tail successor; run the pre-complete fork check (kanban_list, non-terminal successors = exactly 1).
