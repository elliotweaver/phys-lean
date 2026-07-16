# PREREG — N470 / ARC-D D1: THE BRACKET INSTRUMENT

## Target
Certified two-sided rational brackets for the banked `cutExp`/`cutLog` at rational arguments,
to ANY demanded width — partial sums of the defining approximants + explicit remainder bound,
as kernel theorems over the derived ℝ `Cut`. The arc's ONE machinery build; every later node
(D2–D7) just AIMS it. Follow/sharpen the N340 bracket pattern (`m01_bracket_lo/hi`).

## Module
Phys/Foundation/ContinuumBracket.lean (N470). Root import appended to Phys.lean AFTER ContinuumLog.

## Front chosen (theory-native)
A derived real of Cut IS a set of rationals; "its digits" = a PAIR of theorems `lo < x`, `x < hi`
with `hi − lo` an explicit rational < ε. `cutExp q = ∑' qⁿ/n!` (banked N174), so:
  - LOWER bracket: the partial sum `partialExp q N := ∑_{i<N} qⁱ/i!` (rational) has
    `partialExp q N ≤ cutExp q` (nonneg tail, q ≥ 0).
  - UPPER bracket: `cutExp q ≤ partialExp q N + expRemBound q N`, where the explicit rational
    remainder `expRemBound q N := (qᴺ/N!)·(1 − q/(N+1))⁻¹` bounds the tail
    `∑' m, q^{m+N}/(m+N)!` via the SAME ratio-test structure as banked
    `cut_summable_pow_div_factorial` (termwise `q^{m+N}/(m+N)! ≤ (qᴺ/N!)·(q/(N+1))^m`,
    then `tsum_mul_left` + banked `geom_tsum_le`). Requires `0 ≤ q < N+1`.
  - cutLog transfer via strict monotonicity (banked `cutExp_strictMono`, `cutExp_cutLog`):
    `cutExp a ≤ y ⟹ a ≤ cutLog y`; `y ≤ cutExp b ⟹ cutLog y ≤ b`. Two-sided cutLog bracket.

## Deliverable theorems (planned)
- `partialExp`, `expRemBound` (defs, rational functions over Cut)
- `tail_termwise_le` (induction, the ratio-test crux — mirrors banked htail)
- `expTail_le` : `∑' m, expTermC q (m+N) ≤ expRemBound q N`  (0 ≤ q < N+1)
- `cutExp_ge_partial` (LOWER, q ≥ 0)
- `cutExp_le_partial_add_rem` (UPPER, 0 ≤ q < N+1) — the two-sided exp bracket
- `bracket_width` : the width IS `expRemBound q N` (explicit rational)
- `cutLog_ge_of_expUpper_le`, `cutLog_le_of_le_expLower` (transfer via banked instrument)
- `cutLog_bracket` : two-sided rational bracket for cutLog at a bracketed positive argument
- CONCRETE non-vacuity: an actual narrow numeral bracket for `cutExp 1` (= e), e.g.
  `65/24 < cutExp 1 ∧ cutExp 1 < 218/80` (or tighter) — proving the instrument BITES,
  produces a REAL narrow bracket, sharper than a trivial [0,∞).
- W8 teeth: `bracket_no_cross` (lo < hi strictly, so bounds never cross); a costume that a
  WRONG (crossed / too-wide-claim) bracket reduces to a false numeral.

## Guards (G1–G8, arc-D specials)
- G6: derived ℝ `Cut` only; NO Mathlib ℝ/ℂ as content; NO native_decide; NO foldRetention;
  floats NOWHERE in production. Only Mathlib = tsum/order MACHINERY on the DERIVED Cut.
- G2 NO-FIT: no measured value anywhere; the concrete witness brackets a pure math constant
  (cutExp 1 = e), NOT 1/α or any measured number. No bracket/N/edge chosen because of data.
- G5 words-removable: there are NO physics words — pure statements about rational brackets of a
  derived real over Cut.
- Import guard: NEVER Phys/OneAxiom/*. Imports = ContinuumLog (+ its transitive), Mathlib tsum.
- #print axioms ⊆ {propext, Classical.choice, Quot.sound}.

## Cost budget / KILL
Series-sum evaluation of a fixed-N partial sum via Finset.sum_range_succ + norm_num should be
cheap for N ≤ ~8. KILL: if a concrete numeral bracket's norm_num blows past ~60s or a single
obligation needs raised maxHeartbeats, the evaluation form is wrong (W9) — decompose the partial
sum into separately-banked term lemmas, do NOT grind. No monolithic brute on expanded goals.

## Successor (one-successor rail)
When D1 banks airtight → ONE directed child toward D2 (docs/SEED_DIGITS.md §D2, THE SUB-BAND
COMPLETION), carrying the enumerated ℝ-descent as context. NO generic SELECT ticket.

## Banked lemma names confirmed (probes 1–4, all compile over Cut)
sum_add_tsum_nat_add (method on Summable), tsum_mul_left, Summable.tsum_le_tsum,
(summable_nat_add_iff N).mpr, inv_anti₀, Filter.Eventually.of_forall, le_of_tendsto',
HasSum.tendsto_sum_nat, le_inv_comm₀, cut_summable_geometric, cut_geom_telescope,
le_div_iff₀'. NEW banked-here: geom_partial_le, geom_tsum_le (probe4 compiles clean).
