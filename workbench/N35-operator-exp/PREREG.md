# PREREG — N35 increment 5: the ARCHIMEDEAN / C6-ETERNAL-APPROACH analytic foundation rung
# over the DERIVED ℝ `ContinuumQ.Cut` — the first rung of the analytic operator-exp tower.

FROZEN before production compute. Worker run 159, task t_181d615f.
Parent N34 (t_f19480d9) banked the order TOPOLOGY rung + Heine–Borel COMPACTNESS half over the
derived ℝ. This node banks the ARCHIMEDEAN property (the C6 eternal-approach as a property OF the
derived ℝ) + the order-native MONOTONE-BOUNDED CONVERGENCE — the analytic-convergence foundation
the power-series exp needs, BELOW the metric/uniform structure. The metric/uniform/Cauchy-complete
+ operator-norm + power-series-exp core is the genuine W1 hard build, childed N36.

## W9 MEASUREMENT (bounded #synth/example probes, ALL exit 0 ~8s — DECISIVE, fixed the scope)

workbench/N35-operator-exp/probe_synth.lean, probe_arch.lean, probe_arch2.lean, probe_metric.lean:

WHAT Cut CARRIES NOW (banked through N34):
  • `ConditionallyCompleteLinearOrder Cut` (N33), `TopologicalSpace Cut := Preorder.topology` +
    `OrderTopology Cut` (N34), `IsTopologicalRing Cut`, `T2Space Cut`, Heine–Borel (N34).

WHAT IS MISSING (= #synth FAILED — genuine gaps, NOT yet banked):
  • `Archimedean Cut` — FAILS to synthesize (the scoped `to_archimedean` is NOT a global instance
    on Cut). REACHABLE cheaply as MACHINERY: `ConditionallyCompleteLinearOrderedField.to_archimedean`
    `[Field][ConditionallyCompleteLinearOrder][IsStrictOrderedRing] : Archimedean α` — all three
    banked for Cut. CONFIRMED elaborates clean (probe_arch2 `example : Archimedean Cut := …`).
    This IS the C6 eternal-approach / no-infinite-element property of the derived ℝ.
  • `UniformSpace Cut`, `MetricSpace Cut`, `PseudoMetricSpace Cut`, `CompleteSpace Cut` — ALL FAIL.
    These are the GENUINE HARD CORE: ℝ's own completeness is built in a whole `UniformSpace/Real.lean`
    via `CauSeq`/`complete_of_cauchySeq_tendsto`, and there is NO generic "metric from order topology"
    instance. Building a `PseudoMetricSpace Cut` (dist x y = |x-y|) whose induced topology equals the
    FIXED `Preorder.topology Cut` requires a topology-agreement proof (`replaceTopology`) — a genuine
    multi-file W1 build. → CHILD N36 (NOT attempted here, NOT asserted).

WHAT IS CHEAPLY REACHABLE THIS RUN (the C6 eternal-approach as the analytic convergence rung — NO
metric needed, uses only the banked ORDER topology):
  • `SupConvergenceClass Cut` synthesizes (`LinearOrder.supConvergenceClass` from OrderTopology).
  • `tendsto_atTop_ciSup : Monotone f → BddAbove (range f) → Tendsto f atTop (𝓝 (⨆ i, f i))` and the
    dual `tendsto_atTop_ciInf` — monotone bounded sequences converge to their sup/inf in the banked
    order topology. CONFIRMED elaborates clean (probe_arch2). This IS the C6 eternal-approach spoken
    at the continuum level: the bounded monotone approach eternally tends to its coherence point.

## THE REFRAME (W1 step 2 — through the trunk) + THE ONE CAUSE

The Archimedean property IS the C6 eternal-approach / no-infinite-element fact one level up: the
gather of cuts has no point beyond every natural number — the approach is never trapped at an
infinite magnitude. The monotone-bounded convergence IS the same eternal-approach as the standard
analytic limit: a bounded increasing sequence eternally approaches and converges to its supremum
(the gather's coherence point, banked N33 as `isLUB_csSupCut`). Same engine that built the cut,
now read as the analytic convergence the exp's partial sums will ride.

## GO (this run — ONE clean bankable forward rung; FINALIZE EARLY)

COMMIT 1 — `Phys/Foundation/ContinuumArchimedean.lean` (imports ContinuumTopology +
  Mathlib.Algebra.Order.CompleteField + Mathlib.Topology.Order.MonotoneConvergence):
  • `instance instArchimedeanCut : Archimedean Cut := ConditionallyCompleteLinearOrderedField.to_archimedean`
    — the C6 eternal-approach as a banked global instance of the derived ℝ.
  • `theorem cut_exists_nat_gt (x : Cut) : ∃ n : ℕ, x < n := exists_nat_gt x` — the EXPLICIT
    eternal-approach: every magnitude of the derived ℝ is exceeded by some natural (no infinite element).
  • `theorem cut_tendsto_atTop_ciSup (f : ℕ → Cut) (hmono : Monotone f) (hbdd : BddAbove (Set.range f)) :
       Tendsto f atTop (𝓝 (⨆ i, f i))` — monotone bounded ⟹ converges to sup (the C6 eternal-approach
    as analytic convergence in the banked order topology).
  • `theorem cut_tendsto_atTop_ciInf` — the antitone/inf dual.
  • non-vacuity: a concrete witness — e.g. `cut_exists_nat_gt` at a concrete element, and an explicit
    monotone bounded sequence whose sup-limit is named (the constant-1 or a banked simple monotone seq).

Anti-vacuity costume C57 (MUST bite): a WRONG claim — Cut has an INFINITE element `∀ n : ℕ, (n:Cut) < c`
for a fixed `c` (a non-Archimedean magnitude) — must FAIL to compile (contradicts `cut_exists_nat_gt c`,
reduces to `False`). OR a wrong monotone-limit (a bounded increasing seq asserted to converge to
something ≠ its sup). Reuse the banked ContinuumTopology/ContinuumCCLO/order topology — NEVER a fresh
order/field/number system.

## KILL / compile-cost budget (W9)
- Every decl is an `inferInstance`/scoped-instance call or a one-line Mathlib convergence lemma
  application (each measured clean ~8s in the probes). KILL: if any single decl's tactic block
  exceeds ~60s in a bounded probe, STOP — it means a hidden gap; decompose/reframe (NEVER inflate
  maxHeartbeats). No heavy coordinate computation in this rung.
- TURN CHECKPOINT ~55%: COMMIT 1 banked by then. FINALIZE EARLY (AxiomAudit + costume C57 + LEDGER +
  ROADMAP + child N36) with turns to spare. Do NOT attempt the metric/uniform/exp core this run.

## NO-GO (forbidden this run)
- NO `import Mathlib.Data.Real` / Mathlib ℝ as content (STANDARD §3 STANDING GATE).
- NO posited exp / G₂ / Aut / metric / uniform-space / number system — BUILD on the derived `Cut`.
- NO bridge / asserted-at-grade / weakened target.
- NO attempt to grind the metric/uniform/Cauchy-complete + operator-norm + tsum-exp + exp∈AutO + d/dt
  core this run (W9 — measured the genuine multi-file hard core, child N36).

## STANDARD pre-commitment
- UNBROKEN: `Archimedean Cut` is `to_archimedean` on the banked Field + ConditionallyCompleteLinearOrder
  (N33) + IsStrictOrderedRing — standard order MACHINERY on the DERIVED object (STANDARD §3: a property
  OF the derived ℝ, the metalanguage in which "this derived ℝ is Archimedean" is a theorem, NOT a
  posited number system). The convergence reuses the banked order topology (N34) + SupConvergenceClass.
- COMPLETE: foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide.
- PHYSICS-WORDS-REMOVABLE: there are NO physics words in this file. It is the pure statement that the
  completion of the gather-of-closures of the derived rationals is Archimedean (no infinite element)
  and that its monotone bounded sequences converge to their suprema in the order topology. No physics
  name is load-bearing.
