# N39 — THE POWER-SERIES EXP, increment 9 (run 167). PREREG — FROZEN before production.

## The arc
N38 banked the Cut-valued submultiplicative operator norm `opNorm` (+ `opNorm_pow_le`,
`entry_abs_le_opNorm`). N37 banked `CompleteSpace Cut`. N39 = the power-series exp
`Der(𝕆) → Aut(𝕆)`. Ticket decomposition: (c) convergence `Summable (∑ Dⁿ/n!)`;
(d) `exp(D) ∈ AutO`; (e) `d/dt exp(tD)|₀ = D`. THIS RUN scopes increment **(c) ONLY** —
the absolute convergence of the matrix exponential series over the derived ℝ — per
DECOMPOSE-AGGRESSIVELY (W3/W9). (d)+(e) childed onto the chain tail.

## MEASUREMENT RESULT (bounded probes, all green ≤ 3 s user CPU each — W9 measure-first)
The W9 content-trap risk (does Summable over Cut pull an ℝ-valued norm?) is REAL but DODGED:
  - CONFIRMED ℝ-trap (NOT used): `Summable.of_norm_bounded`, `Summable.of_nonneg_of_le`,
    `summable_geometric_of_lt_one`, `summable_of_ratio_test_*` are ALL ℝ-valued-norm bound.
  - TRUNK-NATIVE route (all measured GREEN, NO ℝ norm):
    • L1 `cut_summable_of_nonneg_of_bddAbove`: nonneg + bounded partial sums ⟹ Summable, via
      `hasSum_of_isLUB_of_nonneg` (order topology) + N33 `isLUB_csSup`. (probe1 ✓)
    • L2 `cut_summable_of_nonneg_of_le`: nonneg comparison test, via L1 + `sum_le_hasSum`. (probe5 ✓)
    • L3 `cut_summable_of_abs`: ∑|f| summable ⟹ ∑f summable, via pos/neg parts + `Summable.sub`. (probe6 ✓)
    • L4 `cut_summable_geometric`: 0≤r<1 ⟹ Summable rⁿ, via L1 + an inline telescope identity
      `(1-r)·∑_{i<N} rⁱ = 1-rⁿ` (GeomSum.olean is NOT prebuilt — proved by induction). (probe7 ✓)
    • L5 `cut_summable_pow_div_factorial`: 0≤c ⟹ Summable cⁿ/n!, the analytic crux — ratio-test
      BY HAND: pick Archimedean M>c (N35 `cut_exists_nat_gt`), the tail from M is dominated by
      `(cᴹ/M!)·(c/M)ᵏ`, a geometric majorant (L4) × const. (probe9 ✓)
    • L6 `matrix_summable_of_entrywise`: Matrix instances are LITERALLY Pi's (`rfl` verified), so
      `show … (α := Fin8→Fin8→Cut)` + `Pi.summable` reduces matrix Summable entrywise. (probe ✓)
    • TARGET (c) `expTerm_summable`: `expTerm D n = (1/n!)•Dⁿ` is Summable — entrywise (L6), shift
      by 1 (`summable_nat_add_iff`), each entry `|·| ≤ (1/(n+1)!)·(opNorm D)^(n+1)` via
      N38 `entry_abs_le_opNorm`+`opNorm_pow_le`, majorized by L5. (probe11 ✓, full proof green)

## GO / NO-GO (frozen)
GO (increment (c)) — bank in TWO new files:
  • `Phys/Foundation/ContinuumSummable.lean` (Foundation): L1–L5 (the 5 scalar summability levers
    over the derived ℝ) + a non-vacuity witness. Imports ContinuumComplete + InfiniteSum machinery.
  • `Phys/Algebra/DerivationAutExp.lean` (Algebra): L6 + `expTerm` + `expTerm_entry_abs_le` +
    `expTerm_summable` (TARGET c). Imports DerivationAutOpNorm + ContinuumSummable + Instances.Matrix.
NO-GO / escalate (W1 child + block) only if an assembled file fails to elaborate after the probes
proved each piece (NOT expected — every piece compiled green standalone).

## KILL / compile-cost budget (W9)
  • Per-theorem KILL: any decl not elaborating ≤ 90 s at DEFAULT maxHeartbeats = INSTRUMENT failure
    → decompose, NEVER inflate heartbeats. (All probes ≤ 3 s user — far under budget.)
  • Whole-file build KILL: if either file does not build ≤ 6 min, decompose into ≤2 files.
  • NEVER an unbounded compile in the turn budget — probes already measured.

## TURN CHECKPOINT (anti-timeout — W9)
At ~55% turn budget: if both files + #print axioms are green, FINALIZE IMMEDIATELY (costume +
manifest + gate-bg + AxiomAudit + Phys.lean + LEDGER + ROADMAP + child + commit). Do NOT start (d).
If only the Foundation file is green by ~55%, COMMIT it, child (c-matrix)+(d)+(e), complete DECOMPOSED.
Every recent node (N28–N38) timed out finalizing AFTER committing — finalize with turns to spare.

## Anti-vacuity (W8) — the costume MUST bite
C61 must assert a WRONG convergence/exp fact and FAIL to compile. Candidate: a divergent series
asserted Summable (e.g. `Summable (fun n => (1:Cut))` the constant-1 series, which would force the
partial sums `∑_{i<N} 1 = N` to be bounded — contradicting Archimedean N35), routed through a banked
lever. OR a wrong entry bound. Reuse the banked `opNorm`/`opNorm_pow_le`/`Cut`/N35 — NEVER a fresh table.

## Physics-words-removable (STANDARD §2)
Delete "exp/gauge/G₂/colour/derivation": the files are a complete proof that, over the
completion-of-the-gather-of-closures of the derived rationals, (i) a nonneg series with bounded
partial sums converges, the absolute-comparison and geometric and pow/factorial series converge;
(ii) the matrix power series `∑ (1/n!)•Mⁿ` of any 8×8 matrix M is absolutely convergent, majorized
entrywise by `(1/n!)·(∑ᵢⱼ|Mᵢⱼ|)ⁿ`. NO physics name load-bearing.

## NOT on the menu
NO `import Mathlib.Data.Real` as content; NO `Norm`/`NormedRing`/`NormedSpace`/`Mathlib exp` (ℝ-valued
trap — CONFIRMED and dodged); NO posited exp/G₂/metric; NO bridge; NO weakening; NO heartbeat inflation.
