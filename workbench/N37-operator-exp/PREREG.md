# PREREG — N37 increment 7: `CompleteSpace Cut` (Cauchy-completeness of the DERIVED ℝ
# `ContinuumQ.Cut`), built from the C6 eternal-approach (Archimedean countable basis) +
# the banked N34 Heine–Borel compactness + the N36 group uniformity — the analytic
# completeness rung that the operator-exp power series will rest on.

FROZEN before production compute. Worker run 163, task t_0d5eb5f5.
Parent N36 (t_8a37d258) banked the UNIFORM STRUCTURE `instUniformSpaceCut` + topology agreement.
This node banks `CompleteSpace Cut` — the Cauchy-completeness of the derived ℝ.

## W9 MEASUREMENT (bounded probes, ALL exit 0 ~7-9s — DECISIVE, fixed the scope)

workbench/N37-operator-exp/probe{1..6}*.lean, each `lake env lean` ~7-9s:

  • probe1: `IsCountablyGenerated (𝓝 (0:Cut))` does NOT synth (confirmed the task's flag —
    `FirstCountableTopology Cut` is not automatic). DenselyOrdered/NoMaxOrder/NoMinOrder DO synth.
  • probe2: `nhds_basis_abs_sub_lt (0:Cut)` APPLIES to the derived ℝ (LinearOrderedField + OrderTopology
    banked) → the abs nhds-basis `{x | |x| < ε}` at 0. Clean.
  • probe3: BUILT `IsCountablyGenerated (𝓝 0)` by reindexing the abs-basis to ℕ via `1/(n+1)`
    (`exists_nat_one_div_lt`, the Archimedean / C6 eternal-approach) + `HasBasis.to_hasBasis'` +
    `HasBasis.isCountablyGenerated`. Clean. ★ THIS is the C6 eternal-approach as countable nearness.
  • probe4: the abs-uniformity basis `{p | |p.2 - p.1| < ε}` = comap of the abs nhds-basis through
    subtraction (via the banked `cut_uniformity_eq`), and the `cauchySeq_iff'` characterization. Clean.
  • probe5: a Cauchy sequence has `BddAbove (range u)` (finite head ∪ tail within 1 of u N). Clean.
  • probe6: ★★ THE FULL `CompleteSpace Cut` — `UniformSpace.complete_of_cauchySeq_tendsto`
    (needs `IsCountablyGenerated (𝓤 Cut)`, built from probe3 via `comap.isCountablyGenerated`):
    Cauchy → range bounded both sides → range ⊆ `Icc lb ub` → `Icc` COMPACT (banked N34
    `isCompact_Icc`) → `IsCompact.tendsto_subseq` → `tendsto_nhds_of_cauchySeq_of_subseq`.
    ELABORATES TO EXIT 0 in 7.4s. `#print axioms` = [propext, Classical.choice, Quot.sound].

## THE ONE CAUSE / W1 REFRAME THROUGH THE TRUNK
Completeness IS the banked C6 eternal-approach one level up. Two trunk facts converge:
  (i) the countable nhds basis `{|x| < 1/(n+1)}` is the eternal approach by reciprocals of the
      Archimedean naturals (N35) — the nearness is countably generated because the approach is;
  (ii) a Cauchy sequence is BOUNDED, so it lives in a banked-compact closed box `Icc` (N34
       Heine–Borel), hence has a convergent subsequence, hence (being Cauchy) converges.
The SAME engine that built the cut (N6), order-completeness (N33), the order topology + Heine–Borel
(N34), the Archimedean/convergence rung (N35), and the uniform structure (N36) now closes Cauchy
completeness. NO ℝ-valued metric, NO `CauSeq`, NO Mathlib ℝ as content (STANDARD §3).

## GO (this run — ONE clean bankable forward rung; FINALIZE EARLY)

COMMIT 1 — `Phys/Foundation/ContinuumComplete.lean` (imports ContinuumArchimedean + ContinuumUniform
  + ContinuumTopology + Mathlib.Topology.Algebra.Order.Field + Mathlib.Order.Filter.CountablyGenerated
  + Mathlib.Topology.Sequences + Mathlib.Topology.UniformSpace.Cauchy):
  • `cut_nhds_zero_countablyGenerated : IsCountablyGenerated (𝓝 (0:Cut))` — the C6 eternal-approach
    countable basis.
  • `instance cut_uniformity_countablyGenerated : IsCountablyGenerated (𝓤 Cut)` — via comap.
  • `cut_uniformity_hasBasis_abs` — the order-native abs uniformity basis (reusable downstream).
  • `cauchySeq_bddAbove_range` / `cauchySeq_bddBelow_range` — a Cauchy seq is bounded.
  • ★★ `instance instCompleteSpaceCut : CompleteSpace Cut` — THE TARGET.
  + non-vacuity: a concrete convergent Cauchy seq witness (the constant sequence converges to its value).

Anti-vacuity costume C59 (MUST bite): a WRONG completeness/convergence claim — e.g. the constant
sequence `fun _ => c` asserted to converge to a DIFFERENT limit `c'` ≠ c (Hausdorff t2Space_cut +
limit-uniqueness force `c = c'`, reducing to a false equality of Cut elements), OR a Cauchy sequence
asserted NOT to converge. MUST FAIL to compile. Reuse banked ContinuumComplete/Topology/Archimedean —
NEVER a fresh order/field/uniform/number system.

## KILL / compile-cost budget (W9)
- Every decl measured clean ~7-9s in a bounded probe. KILL: if the production file's full build
  exceeds ~120s OR any single decl probe exceeds ~60s, STOP — hidden gap; decompose/reframe (NEVER
  inflate maxHeartbeats). No heavy coordinate computation in this rung — all order/filter reasoning.
- TURN CHECKPOINT ~55%: COMMIT 1 banked by then. FINALIZE EARLY (AxiomAudit + costume C59 + LEDGER +
  ROADMAP + child N38) with turns to spare. Do NOT attempt operator-norm/exp/exp∈AutO/d-dt this run.

## NO-GO (forbidden this run)
- NO `import Mathlib.Data.Real` / Mathlib ℝ as content (STANDARD §3 STANDING GATE).
- NO ℝ-valued `PseudoMetricSpace`/`dist`/`CauSeq` (the casting-into-ℝ content trap — use the order
  abs + group uniformity).
- NO posited exp / G₂ / Aut / metric / number system — BUILD on the derived `Cut`.
- NO bridge / asserted-at-grade / weakened target.
- NO attempt to grind operator-norm / tsum-exp / exp∈AutO / d/dt this run (child N38).

## NEXT (child N38, on the chain tail)
operator norm on `End (O Cut)` / `Matrix (Fin 8) (Fin 8) Cut` + power-series `exp(D) = ∑ Dⁿ/n!` for
skew-adjoint `D` (now `tsum`-able over the complete `Cut`) + `exp(D) ∈ AutO` + `d/dt exp(tD)|₀ = D`.
