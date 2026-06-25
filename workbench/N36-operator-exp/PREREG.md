# PREREG — N36 increment 6: the UNIFORM STRUCTURE on the DERIVED ℝ `ContinuumQ.Cut`,
# built from the banked topological-ring structure (the trunk-native group uniformity),
# with TOPOLOGY AGREEMENT to the banked order topology — the metric/uniform rung the
# N35 measurement isolated as "the genuine hard part," DISSOLVED through the trunk.

FROZEN before production compute. Worker run 161, task t_8a37d258.
Parent N35 (t_181d615f) banked `Archimedean Cut` + order-native monotone-bounded convergence.
This node banks the UNIFORM SPACE on the derived ℝ + the topology agreement + IsUniformAddGroup.

## W9 MEASUREMENT (bounded probes, ALL exit 0 ~7-8s — DECISIVE, fixed the scope)

workbench/N36-operator-exp/probe1_synth.lean, probe2_uniform.lean, probe3_complete.lean:

THE REFRAME-THROUGH-THE-TRUNK (W1 step 2) THAT DISSOLVED THE FEARED HARD PART:
  The N35 measurement feared the metric build: a `PseudoMetricSpace Cut` with `dist x y = |x-y|`
  whose induced topology = the FIXED `Preorder.topology Cut`, via `replaceTopology`. That route is
  ALSO a content trap — Mathlib's `PseudoMetricSpace.dist` is ℝ-VALUED, so `dist x y = |x-y|` would
  cast `|x-y| : Cut` into Mathlib's ℝ = importing ℝ as content (STANDARD §3 violation). THE TRUNK
  DODGES BOTH: `Cut` is a banked TOPOLOGICAL RING (`isTopologicalRing_cut`, N34) ⟹
  `IsTopologicalAddGroup Cut` (via `LinearOrderedAddCommGroup.toIsTopologicalAddGroup`) ⟹ the
  CANONICAL GROUP UNIFORMITY `IsTopologicalAddGroup.rightUniformSpace Cut` is a `UniformSpace Cut`
  whose `.toTopologicalSpace` EQUALS the banked `instTopologicalSpaceCut` BY `rfl` (the def reuses
  the ambient topology and proves `nhds_eq_comap_uniformity`). NO ℝ-valued metric, NO `replaceTopology`
  obligation, NO content import. MEASURED clean:
    • `example : UniformSpace Cut := IsTopologicalAddGroup.rightUniformSpace Cut` — elaborates.
    • `example : (rightUniformSpace Cut).toTopologicalSpace = instTopologicalSpaceCut := rfl` — PASSES.
    • `example : IsUniformAddGroup Cut := isUniformAddGroup_of_addCommGroup` — PASSES (comm case,
      left=right uniformity coincide).
    • `example (f : ℕ → Cut) : Cut := ∑' n, f n` — tsum is STATABLE over the uniform Cut.

WHAT IS A GENUINE SEPARATE BUILD (childed N37):
  • `CompleteSpace Cut` — `FirstCountableTopology Cut` does NOT synth (measured FAIL), so the
    seq-compact / Bolzano–Weierstrass route needs its own rung; OR a liminf-construction via the
    banked `cut_tendsto_atTop_ciSup`. Multi-lemma. NOT attempted here.
  • operator norm on `End (O Cut)` / `Matrix (Fin 8) (Fin 8) Cut`, tsum power-series `exp(D)`,
    `exp(D) ∈ AutO`, `d/dt exp(tD)|₀ = D` — the analytic operator core, childed N37.

## THE ONE CAUSE (the trunk read one level up)
The SAME C6 eternal-approach that built the cut (N6), gave order-completeness (N33), the order
topology + topological-ring continuity (N34), and the Archimedean/convergence rung (N35) now gives
the UNIFORM structure: the group uniformity IS the order topology's uniform refinement, and because
the field operations are continuous (the banked topological ring), the uniformity exists and AGREES
with the topology by construction. No posited metric, no borrowed ℝ.

## GO (this run — ONE clean bankable forward rung; FINALIZE EARLY)

COMMIT 1 — `Phys/Foundation/ContinuumUniform.lean` (imports ContinuumArchimedean +
  Mathlib.Topology.Algebra.IsUniformGroup.Defs + .Basic + Mathlib.Topology.Algebra.InfiniteSum.Basic):
  • `instance instUniformSpaceCut : UniformSpace Cut := IsTopologicalAddGroup.rightUniformSpace Cut`
    — the trunk-native group uniformity. Its `.toTopologicalSpace` is DEFEQ to `instTopologicalSpaceCut`.
  • `theorem cut_uniformSpace_toTopologicalSpace_eq :
       instUniformSpaceCut.toTopologicalSpace = instTopologicalSpaceCut := rfl`
    — ★ THE KEY: the uniformity's induced topology AGREES with the banked order topology (the
    "topology-agreement" the N35 measurement isolated, here by construction).
  • `instance instIsUniformAddGroupCut : IsUniformAddGroup Cut := isUniformAddGroup_of_addCommGroup`
    — left=right uniformity coincide (the derived ℝ is a uniform additive group).
  • `theorem cut_uniformity_eq : 𝓤 Cut = Filter.comap (fun p : Cut × Cut => p.2 - p.1) (𝓝 0)` (rfl)
    — the explicit uniformity (the entourages are the "difference near 0" sets — the order-native form).
  • non-vacuity: `cut_tsum_statable`/`cut_const_cauchySeq` — tsum is expressible + the constant
    sequence is Cauchy in this uniformity (the uniform structure is inhabited & non-degenerate).

Anti-vacuity costume C58 (MUST bite): a WRONG uniform-structure claim — e.g. the constant sequence
asserted to converge (Tendsto) to the WRONG limit, OR the uniformity-induced topology asserted to
be discrete (⊥) — must FAIL to compile (the banked Hausdorff t2Space_cut + the agreement force a
contradiction reducing to a false equality of Cut elements). Reuse banked ContinuumTopology/
ContinuumArchimedean — NEVER a fresh order/field/uniform/number system.

## KILL / compile-cost budget (W9)
- Every decl is an instance-construction or `rfl` (each measured clean ~7s). KILL: if any decl's
  elaboration exceeds ~60s in a bounded probe, STOP — hidden gap; decompose/reframe (NEVER inflate
  maxHeartbeats). No heavy coordinate computation in this rung.
- TURN CHECKPOINT ~55%: COMMIT 1 banked by then. FINALIZE EARLY (AxiomAudit + costume C58 + LEDGER +
  ROADMAP + child N37) with turns to spare. Do NOT attempt CompleteSpace/operator-norm/exp core.

## NO-GO (forbidden this run)
- NO `import Mathlib.Data.Real` / Mathlib ℝ as content (STANDARD §3 STANDING GATE).
- NO ℝ-valued `PseudoMetricSpace`/`dist` (the casting-into-ℝ content trap — use the group uniformity).
- NO posited exp / G₂ / Aut / metric / number system — BUILD on the derived `Cut`.
- NO bridge / asserted-at-grade / weakened target.
- NO attempt to grind CompleteSpace / operator-norm / tsum-exp / exp∈AutO / d/dt this run (childed N37).

## STANDARD pre-commitment
- UNBROKEN: `instUniformSpaceCut` is the standard group uniformity (`IsTopologicalAddGroup.rightUniformSpace`)
  on the banked topological-ring `Cut` (N34) — standard uniform-space MACHINERY on the DERIVED object
  (STANDARD §3: a property OF the derived ℝ — the metalanguage in which "this derived ℝ is a uniform
  additive group whose uniformity refines its order topology" is a theorem, NOT a posited number system).
- COMPLETE: foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no sorry/axiom/native_decide.
- PHYSICS-WORDS-REMOVABLE: there are NO physics words in this file. It is the pure statement that the
  completion of the gather-of-closures of the derived rationals carries a uniform structure (the group
  uniformity of its additive group) whose induced topology equals its order topology. No physics name
  is load-bearing.
