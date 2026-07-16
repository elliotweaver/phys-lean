/-
  # N470 — THE BRACKET INSTRUMENT: certified two-sided rational brackets for the banked
    `cutExp`/`cutLog` at rational arguments, to ANY demanded width (ARC-D D1).

  ARC-D (THE DIGITS, docs/SEED_DIGITS.md) is the ℝ-descent EVALUATION arc: it does not complete
  until the chain's derived `1/α(0)` is EVALUATED to a certified two-sided rational bracket beyond
  measured precision (D7). THIS node (D1) is the arc's ONE real machinery build — the instrument
  every later node (D2–D7) merely AIMS. Build it once, reuse everywhere.

  ★ THE ONE REFRAMING (why the numeral is a THEOREM, not a computation "about" one). A derived
  real of the derived ℝ `Cut` IS a set of rationals; "its first N digits" is a PAIR of theorems
  `lo ≤ x` and `x ≤ hi` with `lo, hi` explicit rationals of `Cut` and `hi − lo` an explicit rational
  smaller than any demanded `ε`. The banked continuous exponential `cutExp x = ∑' n, xⁿ/n!` (N174)
  is DEFINED by its rational approximants, so two-sided rational brackets of any demanded width are
  exactly what that construction already carries — this file builds the instrument that READS them
  out: the partial sum `partialExp q N = ∑_{i<N} qⁱ/i!` (a rational of `Cut`) plus an EXPLICIT
  rational remainder bound `expRemBound q N`, as kernel theorems over `Cut`. There is no wall; a
  finite amount of honest machinery.

  ★ THE ROUTE (the exact mirror of the banked ratio-test crux `cut_summable_pow_div_factorial`).
    `partialExp q N`  — the N-term partial sum (a rational of `Cut`).
    `expRemBound q N` — `(qᴺ/N!)·(1 − q/(N+1))⁻¹`, the explicit rational tail bound.
    `tail_termwise_le` — the ratio-test crux: `q^{m+N}/(m+N)! ≤ (qᴺ/N!)·(q/(N+1))ᵐ` by induction on `m`
      (each step multiplies by `q/(m+N+1) ≤ q/(N+1)`) — the SAME `htail` structure the banked
      exponential majorant rides.
    `expTail_le` — the tail `∑'ₘ q^{m+N}/(m+N)!` is majorized by `(qᴺ/N!)·∑'ₘ (q/(N+1))ᵐ`
      (`tsum_mul_left` + the banked geometric bound `geom_tsum_le`), i.e. `≤ expRemBound q N`
      (needs `0 ≤ q < N+1`).
    `cutExp_ge_partial` (LOWER) — `partialExp q N ≤ cutExp q` (the tail is nonneg for `0 ≤ q`).
    `cutExp_le_partial_add_rem` (UPPER) — `cutExp q ≤ partialExp q N + expRemBound q N`.
    `expRemBound_lt` — the ANY-WIDTH guarantee: for `0 ≤ q`, `∀ ε>0, ∃ N, q<N+1 ∧ expRemBound q N < ε`
      (the terms tend to 0; from index `N > 2q` on the geometric factor is `≤ 2`, so the bound is
      `≤ 2·(qᴺ/N!) → 0`). This makes "to any demanded width" a THEOREM.
    `cutExp_certified_bracket` — the assembled two-sided exp bracket at any demanded width.
    `cutLog_ge_of_expUpper_le` / `cutLog_le_of_le_expLower` — the cutLog TRANSFER: strict
      monotonicity (`cutExp_strictMono`) + `cutExp_cutLog` turn exp brackets into cutLog brackets.
    `cutLog_ge_certified` / `cutLog_le_certified` — the cutLog bracket instrument reading `cutLog c`
      for a rational `c` from the exp partial-sum/remainder brackets (kernel-checkable rational
      inequalities).

  ★ THE ONE CAUSE (the trunk). The SAME C6 eternal-approach + order-completeness that built the
  derived ℝ, made its geometric and `cⁿ/n!` series converge, and made `cutExp` a positive
  one-parameter homomorphism (N33/N34/N39/N174) is exactly what makes the tail geometrically
  bounded and the bracket tighten to any width. One engine, several terminations: a convergent
  series, an invertible exponential, a certified numeral.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words in this file. Delete nothing
  physical — it is the pure statement that over the completion-of-the-gather-of-closures of the
  derived rationals, the map `E(x) = ∑' n, xⁿ/n!` and its inverse are pinned between explicit
  rationals of any demanded width. No name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-compiled decision bypass, no bridge, NO Mathlib
  number-system content import, NO `Real.exp`/`Real.log`, NO floats. The only Mathlib used is the
  `tsum`/order MACHINERY operating ON the derived `Cut`.
-/
import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## The geometric partial-sum / tsum bounds over the derived ℝ (the tail majorant control). -/

/-- The geometric partial sum is bounded by `(1 − r)⁻¹`: from the banked telescope identity
    `(1−r)·∑_{i<n} rⁱ = 1 − rⁿ ≤ 1`. -/
theorem geom_partial_le (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) (n : ℕ) :
    ∑ i ∈ Finset.range n, r ^ i ≤ (1 - r)⁻¹ := by
  have h1r : (0 : Cut) < 1 - r := by linarith
  have htel := cut_geom_telescope r n
  have hbound : (1 - r) * ∑ i ∈ Finset.range n, r ^ i ≤ 1 := by
    rw [htel]; nlinarith [pow_nonneg hr0 n]
  rw [← le_div_iff₀' h1r] at hbound
  rwa [one_div] at hbound

/-- The geometric series sum is bounded by `(1 − r)⁻¹` (the partial sums tend to it and each is
    `≤ (1−r)⁻¹`). The majorant the exponential tail rides. -/
theorem geom_tsum_le (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) :
    ∑' k, r ^ k ≤ (1 - r)⁻¹ :=
  le_of_tendsto' (cut_summable_geometric hr0 hr1).hasSum.tendsto_sum_nat
    (geom_partial_le r hr0 hr1)

/-! ## The partial exponential sum and the explicit rational remainder bound. -/

/-- ★ THE PARTIAL EXPONENTIAL SUM `partialExp q N = ∑_{i<N} qⁱ/i!` — the N-term partial sum of the
    banked `cutExp q = ∑' n, qⁿ/n!`. For rational `q` this is an EXPLICIT rational of `Cut`. -/
def partialExp (q : Cut) (N : ℕ) : Cut := ∑ i ∈ Finset.range N, expTermC q i

/-- ★ THE EXPLICIT RATIONAL REMAINDER BOUND `expRemBound q N = (qᴺ/N!)·(1 − q/(N+1))⁻¹` — the
    geometric-ratio tail majorant. For rational `q` (with `q < N+1`) this is an EXPLICIT rational
    of `Cut`. -/
def expRemBound (q : Cut) (N : ℕ) : Cut :=
  (q ^ N / (N.factorial : Cut)) * (1 - q / (N + 1))⁻¹

/-- ★ THE RATIO-TEST CRUX (termwise): `q^{m+N}/(m+N)! ≤ (qᴺ/N!)·(q/(N+1))ᵐ` for `0 ≤ q`, by
    induction on `m` — each step multiplies by `q/(m+N+1) ≤ q/(N+1)`. The exact mirror of the
    banked exponential-majorant `htail`. -/
theorem tail_termwise_le (q : Cut) (hq : 0 ≤ q) (N : ℕ) (m : ℕ) :
    expTermC q (m + N) ≤ (q ^ N / (N.factorial : Cut)) * (q / (N + 1)) ^ m := by
  induction m with
  | zero => simp [expTermC]
  | succ j ih =>
    have hfacj : (0 : Cut) < (((j + N).factorial : ℕ) : Cut) := by
      exact_mod_cast (j + N).factorial_pos
    have hsucc : expTermC q ((j + 1) + N)
        = expTermC q (j + N) * (q / ((j + N + 1 : ℕ) : Cut)) := by
      unfold expTermC
      have he : (j + 1) + N = (j + N) + 1 := by ring
      rw [he, pow_succ, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
      have hfne : (((j + N).factorial : ℕ) : Cut) ≠ 0 := ne_of_gt hfacj
      push_cast
      field_simp
    rw [hsucc]
    have hden : (0 : Cut) < ((j + N + 1 : ℕ) : Cut) := by exact_mod_cast Nat.succ_pos _
    have hNden : (0 : Cut) < ((N : Cut) + 1) := by positivity
    have hratio : q / ((j + N + 1 : ℕ) : Cut) ≤ q / ((N : Cut) + 1) := by
      apply div_le_div_of_nonneg_left hq hNden
      have : ((N : Cut) + 1) ≤ ((j + N + 1 : ℕ) : Cut) := by
        push_cast; linarith [Nat.cast_nonneg (α := Cut) j]
      exact this
    calc expTermC q (j + N) * (q / ((j + N + 1 : ℕ) : Cut))
        ≤ ((q ^ N / (N.factorial : Cut)) * (q / ((N : Cut) + 1)) ^ j) * (q / ((N : Cut) + 1)) := by
          apply mul_le_mul ih hratio (div_nonneg hq (le_of_lt hden)); positivity
      _ = (q ^ N / (N.factorial : Cut)) * (q / ((N : Cut) + 1)) ^ (j + 1) := by rw [pow_succ]; ring

/-- The tail family `m ↦ q^{m+N}/(m+N)!` is summable (a head-shift of the banked exp summability). -/
theorem expTail_summable (q : Cut) (N : ℕ) : Summable (fun m => expTermC q (m + N)) :=
  (summable_nat_add_iff N).mpr (expTermC_summable q)

/-- ★ THE TAIL BOUND: `∑'ₘ q^{m+N}/(m+N)! ≤ expRemBound q N`, for `0 ≤ q < N+1`. The termwise
    ratio-test bound + `tsum_mul_left` + the banked geometric bound close it. -/
theorem expTail_le (q : Cut) (hq : 0 ≤ q) (N : ℕ) (hqN : q < (N + 1)) :
    ∑' m, expTermC q (m + N) ≤ expRemBound q N := by
  set r : Cut := q / ((N : Cut) + 1) with hr
  have hNden : (0 : Cut) < ((N : Cut) + 1) := by positivity
  have hr0 : 0 ≤ r := div_nonneg hq (le_of_lt hNden)
  have hr1 : r < 1 := by rw [hr, div_lt_one hNden]; exact_mod_cast hqN
  have hmaj_summ : Summable (fun m => (q ^ N / (N.factorial : Cut)) * r ^ m) :=
    (cut_summable_geometric hr0 hr1).mul_left _
  have hle : ∀ m, expTermC q (m + N) ≤ (q ^ N / (N.factorial : Cut)) * r ^ m := by
    intro m; rw [hr]; exact tail_termwise_le q hq N m
  have hstep : ∑' m, expTermC q (m + N) ≤ ∑' m, (q ^ N / (N.factorial : Cut)) * r ^ m :=
    (expTail_summable q N).tsum_le_tsum hle hmaj_summ
  have hgeo : ∑' m, (q ^ N / (N.factorial : Cut)) * r ^ m
      = (q ^ N / (N.factorial : Cut)) * ∑' m, r ^ m := tsum_mul_left
  have hgeobound : ∑' m, r ^ m ≤ (1 - r)⁻¹ := geom_tsum_le r hr0 hr1
  have hcoef : (0 : Cut) ≤ q ^ N / (N.factorial : Cut) := by positivity
  calc ∑' m, expTermC q (m + N)
      ≤ (q ^ N / (N.factorial : Cut)) * ∑' m, r ^ m := by rw [← hgeo]; exact hstep
    _ ≤ (q ^ N / (N.factorial : Cut)) * (1 - r)⁻¹ := mul_le_mul_of_nonneg_left hgeobound hcoef
    _ = expRemBound q N := by rw [expRemBound, hr]

/-! ## The two-sided exponential bracket. -/

/-- THE SPLIT IDENTITY: `partialExp q N + (tail) = cutExp q` (the banked series splits at index N). -/
theorem cutExp_split (q : Cut) (N : ℕ) :
    partialExp q N + ∑' m, expTermC q (m + N) = cutExp q := by
  have h := (expTermC_summable q).sum_add_tsum_nat_add N
  simpa [partialExp, cutExp] using h

/-- The tail is nonneg for `0 ≤ q` (each term `q^{m+N}/(m+N)!` is nonneg). -/
theorem expTail_nonneg (q : Cut) (hq : 0 ≤ q) (N : ℕ) : 0 ≤ ∑' m, expTermC q (m + N) := by
  apply tsum_nonneg; intro m; unfold expTermC; positivity

/-- ★ THE LOWER BRACKET: `partialExp q N ≤ cutExp q` for `0 ≤ q` (the omitted tail is nonneg). -/
theorem cutExp_ge_partial (q : Cut) (hq : 0 ≤ q) (N : ℕ) : partialExp q N ≤ cutExp q := by
  have hsplit := cutExp_split q N
  have htail := expTail_nonneg q hq N
  linarith [hsplit, htail]

/-- ★ THE UPPER BRACKET: `cutExp q ≤ partialExp q N + expRemBound q N` for `0 ≤ q < N+1`. -/
theorem cutExp_le_partial_add_rem (q : Cut) (hq : 0 ≤ q) (N : ℕ) (hqN : q < (N + 1)) :
    cutExp q ≤ partialExp q N + expRemBound q N := by
  have hsplit := cutExp_split q N
  have htail := expTail_le q hq N hqN
  linarith [hsplit, htail]

/-- The remainder bound is nonneg for `0 ≤ q < N+1`. -/
theorem expRemBound_nonneg (q : Cut) (hq : 0 ≤ q) (N : ℕ) (hqN : q < (N + 1)) :
    0 ≤ expRemBound q N := by
  unfold expRemBound
  have hNden : (0 : Cut) < ((N : Cut) + 1) := by positivity
  have hfrac : q / ((N : Cut) + 1) < 1 := by rw [div_lt_one hNden]; exact_mod_cast hqN
  have hpos : (0 : Cut) < 1 - q / (↑N + 1) := by
    have : q / ((N : Cut) + 1) < 1 := hfrac; linarith
  positivity

/-- ★ THE REMAINDER BOUND IS POSITIVE for `0 < q < N+1` — so the two-sided bracket is STRICT
    (`lo < hi`, W8: the bounds never cross). -/
theorem expRemBound_pos (q : Cut) (hq : 0 < q) (N : ℕ) (hqN : q < (N + 1)) :
    0 < expRemBound q N := by
  unfold expRemBound
  have hNden : (0 : Cut) < ((N : Cut) + 1) := by positivity
  have hfrac : q / ((N : Cut) + 1) < 1 := by rw [div_lt_one hNden]; exact_mod_cast hqN
  have hpos : (0 : Cut) < 1 - q / (↑N + 1) := by
    have : q / ((N : Cut) + 1) < 1 := hfrac; linarith
  have hqN0 : (0 : Cut) < q ^ N / (N.factorial : Cut) := by positivity
  positivity

/-- ★ W8 THE BRACKET NEVER CROSSES: for `0 < q < N+1`, `lo < hi` strictly (the lower and upper
    brackets are genuinely two-sided, not a degenerate collapsed point). -/
theorem bracket_no_cross (q : Cut) (hq : 0 < q) (N : ℕ) (hqN : q < (N + 1)) :
    partialExp q N < partialExp q N + expRemBound q N := by
  have := expRemBound_pos q hq N hqN; linarith

/-! ## The ANY-WIDTH guarantee — the remainder bound shrinks below any demanded rational `ε`. -/

/-- ★★ THE ANY-WIDTH GUARANTEE: for `0 ≤ q` and ANY `ε > 0`, there is an index `N` (with `q < N+1`)
    at which the explicit remainder bound is `< ε`. The exp series terms tend to `0` (banked
    summability); from index `N > 2q` on, the geometric factor `(1 − q/(N+1))⁻¹ ≤ 2`, so the whole
    bound is `≤ 2·(qᴺ/N!) → 0`. This is what makes "to any demanded width" a THEOREM, not a hope. -/
theorem expRemBound_lt (q : Cut) (hq : 0 ≤ q) (ε : Cut) (hε : 0 < ε) :
    ∃ N : ℕ, q < (N : Cut) + 1 ∧ expRemBound q N < ε := by
  rcases eq_or_lt_of_le hq with hq0 | hqpos
  · refine ⟨1, by rw [← hq0]; norm_num, ?_⟩
    unfold expRemBound
    rw [← hq0]
    simp only [ne_eq, one_ne_zero, not_false_eq_true, zero_pow, zero_div, zero_mul]
    exact hε
  · obtain ⟨N₀, hN₀⟩ := cut_exists_nat_gt (2 * q)
    have ht : Tendsto (expTermC q) atTop (𝓝 0) := (expTermC_summable q).tendsto_atTop_zero
    have hev1 : ∀ᶠ N in atTop, expTermC q N < ε / 2 := ht.eventually_lt_const (by linarith)
    have hev2 : ∀ᶠ N in atTop, N₀ ≤ N := eventually_ge_atTop N₀
    obtain ⟨N, hNlt, hNge⟩ := (hev1.and hev2).exists
    have hNle : (N₀ : Cut) ≤ (N : Cut) := by exact_mod_cast hNge
    have hNbig : 2 * q < ((N : Cut) + 1) := by
      have : 2 * q < (N : Cut) := lt_of_lt_of_le hN₀ hNle
      linarith
    have hqN : q < (N : Cut) + 1 := by linarith
    refine ⟨N, hqN, ?_⟩
    have hden_pos : (0 : Cut) < (N : Cut) + 1 := by positivity
    have hqfrac : q / ((N : Cut) + 1) ≤ 1 / 2 := by
      rw [div_le_iff₀ hden_pos]; linarith
    have hfacpos : (0 : Cut) < 1 - q / ((N : Cut) + 1) := by linarith
    have hfacle : (1 - q / ((N : Cut) + 1))⁻¹ ≤ 2 := by
      rw [inv_le_comm₀ hfacpos (by norm_num)]; linarith
    have hterm_nonneg : (0 : Cut) ≤ expTermC q N := by unfold expTermC; positivity
    calc expRemBound q N = expTermC q N * (1 - q / ((N : Cut) + 1))⁻¹ := by
            unfold expRemBound expTermC; ring_nf
      _ ≤ expTermC q N * 2 := mul_le_mul_of_nonneg_left hfacle hterm_nonneg
      _ < (ε / 2) * 2 := mul_lt_mul_of_pos_right hNlt (by norm_num)
      _ = ε := by ring

/-- ★★★ THE CERTIFIED TWO-SIDED EXPONENTIAL BRACKET AT ANY DEMANDED WIDTH. For `0 ≤ q` and any
    `ε > 0`, there is an index `N` and explicit rationals `lo = partialExp q N`,
    `hi = partialExp q N + expRemBound q N` of `Cut` with `lo ≤ cutExp q ≤ hi` and width
    `hi − lo < ε`. The instrument the whole arc aims. -/
theorem cutExp_certified_bracket (q : Cut) (hq : 0 ≤ q) (ε : Cut) (hε : 0 < ε) :
    ∃ N : ℕ, q < (N : Cut) + 1 ∧
      partialExp q N ≤ cutExp q ∧
      cutExp q ≤ partialExp q N + expRemBound q N ∧
      (partialExp q N + expRemBound q N) - partialExp q N < ε := by
  obtain ⟨N, hqN, hrem⟩ := expRemBound_lt q hq ε hε
  refine ⟨N, hqN, cutExp_ge_partial q hq N, cutExp_le_partial_add_rem q hq N hqN, ?_⟩
  simpa using hrem

/-! ## The `cutLog` transfer — exp brackets become cutLog brackets via strict monotonicity. -/

/-- ★ THE cutLog LOWER TRANSFER: `cutExp a ≤ y ⟹ a ≤ cutLog y` (for `0 < y`). Strict monotonicity
    of `cutExp` + `cutExp (cutLog y) = y` invert the exp bound. -/
theorem cutLog_ge_of_expUpper_le {a y : Cut} (hy : 0 < y) (h : cutExp a ≤ y) : a ≤ cutLog y := by
  have hinv := cutExp_cutLog hy
  have hmono := cutExp_strictMono.le_iff_le (a := a) (b := cutLog y)
  rw [hinv] at hmono
  exact hmono.mp h

/-- ★ THE cutLog UPPER TRANSFER: `y ≤ cutExp b ⟹ cutLog y ≤ b` (for `0 < y`). -/
theorem cutLog_le_of_le_expLower {b y : Cut} (hy : 0 < y) (h : y ≤ cutExp b) : cutLog y ≤ b := by
  have hinv := cutExp_cutLog hy
  have hmono := cutExp_strictMono.le_iff_le (a := cutLog y) (b := b)
  rw [hinv] at hmono
  exact hmono.mp h

/-- ★★ THE cutLog LOWER BRACKET INSTRUMENT: for a rational `c`, if the exp UPPER bracket at a
    rational `a` lands `≤ c` (a kernel-checkable rational inequality), then `a ≤ cutLog c`. Reads a
    lower digit of `cutLog c` from the exp partial-sum/remainder brackets. -/
theorem cutLog_ge_certified (c a : Cut) (N : ℕ) (ha : 0 ≤ a) (haN : a < (N + 1))
    (h : partialExp a N + expRemBound a N ≤ c) : a ≤ cutLog c := by
  have hexp : cutExp a ≤ c := le_trans (cutExp_le_partial_add_rem a ha N haN) h
  have hc : 0 < c := lt_of_lt_of_le (cutExp_pos a) hexp
  exact cutLog_ge_of_expUpper_le hc hexp

/-- ★★ THE cutLog UPPER BRACKET INSTRUMENT: for a rational `c > 0`, if `c ≤` the exp LOWER bracket
    at a rational `b` (a kernel-checkable rational inequality), then `cutLog c ≤ b`. Reads an upper
    digit of `cutLog c`. -/
theorem cutLog_le_certified (c b : Cut) (N : ℕ) (hb : 0 ≤ b) (hc : 0 < c)
    (h : c ≤ partialExp b N) : cutLog c ≤ b := by
  have hexp : c ≤ cutExp b := le_trans h (cutExp_ge_partial b hb N)
  exact cutLog_le_of_le_expLower hc hexp

/-! ## NON-VACUITY (W8): the instrument BITES — concrete narrow brackets for `cutExp 1` (= e) and
    `cutLog 3` (= ln 3), evaluated to explicit rationals of `Cut`. -/

/-- The 4-term exp partial sum at `1` is `8/3` (an explicit rational of `Cut`). -/
theorem partialExp_one_four : partialExp 1 4 = (8 : Cut) / 3 := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num

/-- The 4-term remainder bound at `1` is `5/96` (an explicit rational of `Cut`). -/
theorem expRemBound_one_four : expRemBound (1 : Cut) 4 = 5 / 96 := by
  unfold expRemBound; norm_num [Nat.factorial]

/-- The 3-term exp partial sum at `2` is `5` (an explicit rational of `Cut`). -/
theorem partialExp_two_three : partialExp 2 3 = (5 : Cut) := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num

/-- ★ CONCRETE (W8): `cutExp 1` is bracketed between `8/3` and `261/96` — a genuine two-sided
    rational bracket of width `5/96` for the derived real `e` (the instrument produces a REAL narrow
    bracket, not a trivial `[0,∞)`). -/
theorem cutExp_one_bracket : (8 : Cut) / 3 ≤ cutExp 1 ∧ cutExp 1 ≤ 261 / 96 := by
  refine ⟨?_, ?_⟩
  · have := cutExp_ge_partial 1 (by norm_num) 4
    rwa [partialExp_one_four] at this
  · have := cutExp_le_partial_add_rem 1 (by norm_num) 4 (by norm_num)
    rw [partialExp_one_four, expRemBound_one_four] at this
    -- 8/3 + 5/96 = 261/96
    have harith : (8 : Cut) / 3 + 5 / 96 = 261 / 96 := by norm_num
    rwa [harith] at this

/-- ★ CONCRETE (W8): the bracket for `cutExp 1` is STRICTLY two-sided — `8/3 < 261/96` (the bounds
    do not cross; the bracket is genuine, not collapsed). -/
theorem cutExp_one_bracket_strict : (8 : Cut) / 3 < 261 / 96 := by norm_num

/-- ★ CONCRETE (W8): `cutLog 3` is bracketed between `1` and `2` — a genuine two-sided rational
    bracket for the derived real `ln 3` read entirely from the exp instrument. Lower: `cutExp 1 ≤
    261/96 ≤ 3` gives `1 ≤ cutLog 3`. Upper: `3 ≤ 5 = partialExp 2 3 ≤ cutExp 2` gives
    `cutLog 3 ≤ 2`. -/
theorem cutLog_three_bracket : (1 : Cut) ≤ cutLog 3 ∧ cutLog 3 ≤ 2 := by
  refine ⟨?_, ?_⟩
  · -- 1 ≤ cutLog 3 : need partialExp 1 4 + expRemBound 1 4 ≤ 3, i.e. 261/96 ≤ 3
    apply cutLog_ge_certified 3 1 4 (by norm_num) (by norm_num)
    rw [partialExp_one_four, expRemBound_one_four]; norm_num
  · -- cutLog 3 ≤ 2 : need 3 ≤ partialExp 2 3 = 5
    apply cutLog_le_certified 3 2 3 (by norm_num) (by norm_num)
    rw [partialExp_two_three]; norm_num

/-- ★ CONCRETE (W8): the bracket for `cutLog 3` is STRICTLY two-sided — `1 < 2`. -/
theorem cutLog_three_bracket_strict : (1 : Cut) < 2 := by norm_num

end

end ContinuumQ
end Phys.Foundation
