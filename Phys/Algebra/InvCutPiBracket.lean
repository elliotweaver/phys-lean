/-
  # N### — ARC-D D5 (FIRST NARROWING NODE, directed successor of D4): THE RESIDUAL `1/cutPi`
    BRACKETED — a certified two-sided rational bracket for the derived `1/cutPi` over the derived ℝ
    `Cut`, and the FIRST fully-concrete numerical bracket of the derived `1/α(0)` at the derived census.

  ARC-D (THE DIGITS, docs/SEED_DIGITS.md) is the ℝ-descent EVALUATION arc — the north star is a
  certified two-sided rational bracket of the derived `1/α(0)` BEYOND measured precision (D7). D4
  (`AssembledBracket`) proved the endpoint splits into TWO residual transcendentals of `Cut`:
      `invAlphaZero (completeBandList d) = 190/3 + (d/3)·cutLog(mass0/mass1)·(1/cutPi)`,
  aimed the D1 exp instrument at `cutLog(mass0/mass1) ∈ [1,9]`, and built the END-TO-END composition
  instrument PARAMETRIC over the ONE residual not yet concrete: `1/cutPi`. THIS node — D5's FIRST and
  HARDEST narrowing job — makes that residual CONCRETE: a certified two-sided rational bracket for
  `1/cutPi`. It is the trig-scale route-finder D4 handed forward (route-not-yet-found: there was no
  banked numeric bracket for `cutPi`/`leastCosZero`).

  ★ THE THEORY-NATIVE ROUTE (the cos analogue of the D1 exp instrument — the SAME partial-sum +
  remainder-bound pattern, on the banked alternating cosine series). `cutPi = 2·leastCosZero` (N325),
  where `leastCosZero = sInf {x ∈ [0,2] | cutCos x = 0}` is the least positive zero of the derived
  cosine. So a bracket for `1/cutPi` is a bracket for `leastCosZero`, which is a bracket for where the
  derived cosine's least zero sits. This node builds the cos bracket instrument — `partialCos`,
  `cosRemBound` (the `x^{2N}/(2N)!·(1 − x²/((2N+1)(2N+2)))⁻¹` geometric-ratio tail majorant),
  `cutCos_bracket` (two-sided), and `cosRemBound_lt` (the ANY-WIDTH guarantee, mirror of D1's
  `expRemBound_lt`, which GROUNDS the narrowing campaign) — then reads two facts off it:
    • UPPER: `cutCos (17/10) < 0` (split@2, remainder `< 89/200`), so the IVT supplies a zero
      `≤ 17/10`, hence `leastCosZero ≤ 17/10` (`csInf_le`);
    • LOWER: `0 < cutCos x` for `0 ≤ x < 7/5` (split@3, `cosRemBound x 3 ≤ x⁶/360`, and
      `1 − x²/2 + x⁴/24 − x⁶/360 > 0` for `x² < 49/25`), so NO zero lives below `7/5`, hence
      `7/5 ≤ leastCosZero` (`le_csInf`).
  Together `leastCosZero ∈ [7/5, 17/10]`, so `cutPi ∈ [14/5, 17/5]` and `1/cutPi ∈ [5/17, 5/14]` —
  the concrete residual bracket, a certified pair of rational inequalities of `Cut`.

  ★ THE PAYOFF — THE FIRST FULLY-CONCRETE NUMERAL of `1/α(0)`. D4's assembled bracket was parametric
  over BOTH residuals; here BOTH are concrete: feed `cutLog(mass0/mass1) ∈ [1,9]` (D4/D1) and the new
  `1/cutPi ∈ [5/17, 5/14]` into `endpoint_assembled_bracket` at the DERIVED census `d = chargeTraceDepth
  = 16/3` (banked `chargeTraceDepth_eq`), and the derived `1/α(0) = invAlphaZero (completeBandList
  chargeTraceDepth)` is PINNED between two explicit rationals of `Cut`. This is the pipeline evaluated
  end to end with NO residual left parametric — a first concrete (wide) numeral, the campaign's first
  rung. The dressed endpoint at the derived weight `w = 1/3` is bracketed the same way.

  ★ NO-FIT (G2/G7 — the credibility guard). NO measured value steers ANY bracket. The endpoints
  `7/5`, `17/10` are chosen by where the derived cosine's SIGN can be certified with a low-index
  partial sum, NOT by where `π/2` "should" sit. The census `16/3` is the banked derived charge trace,
  not tuned. The resulting concrete `1/α(0)` bracket is WIDE (the D4 first-pass shape at concrete
  residuals) and NOT near `137.036`; the campaign (this node's successors) narrows every bracket. The
  measured `1/α(0)` and `π ≈ 3.14159` appear NOWHERE in any proof — removable prose only. The ANY-WIDTH
  guarantee `cosRemBound_lt` proves the instrument tightens to any demanded rational width, so the
  narrowing is a THEOREM path, not a hope.

  ★ THE ONE CAUSE (the trunk). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  its `xⁿ/n!` series converge, forced `cutExp`'s inverse by the IVT, closed the trig group law, and
  forced a LEAST positive zero of the derived cosine (`cutPi`), now bounds the cosine tail
  geometrically and pins `1/cutPi` between explicit rationals of any demanded width. One engine, one
  more evaluation — the exact cos-mirror of the D1 exp instrument.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words in the instrument. Delete
  "coupling"/"fine-structure"/"census": the composition theorems are pure statements that a derived
  closed real of `Cut` (`invAlphaZero (completeBandList (16/3))`) is pinned between explicit rationals,
  read from certified two-sided rational brackets of `1/cutPi` and `cutLog(mass0/mass1)`. No name is
  load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-compiled decision bypass, no bridge, NO
  Mathlib number-system content import, NO `Real.pi`/`Real.cos`, NO floats. The only Mathlib used is
  the `tsum`/order/IVT/infimum MACHINERY operating ON the derived `Cut`. Import guard: AssembledBracket
  (transitively D3/D2/D1/Z6/N325/N323) only; NEVER `Phys/OneAxiom/*`.
-/
import Phys.Algebra.AssembledBracket

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## (A) THE COS BRACKET INSTRUMENT — the cos-mirror of the D1 exp instrument (partial sums +
    explicit geometric-ratio remainder bound), over the derived ℝ `Cut`. -/

/-- The `N`-term partial cosine sum `∑_{i<N} (-1)ⁱ x²ⁱ/(2i)!` — a rational of `Cut` for rational `x`. -/
def partialCos (x : Cut) (N : ℕ) : Cut := ∑ i ∈ Finset.range N, cosTermC x i

/-- The explicit rational remainder majorant for the cosine tail from index `N` (for `0 ≤ x`):
    `(x^{2N}/(2N)!)·(1 − x²/((2N+1)(2N+2)))⁻¹`, the geometric-ratio tail bound. -/
def cosRemBound (x : Cut) (N : ℕ) : Cut :=
  (x ^ (2 * N) / ((2 * N).factorial : Cut)) * (1 - x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut))⁻¹

/-- ★ THE RATIO-TEST CRUX (termwise): `|cosTermC x (m+N)| ≤ (x^{2N}/(2N)!)·(x²/((2N+1)(2N+2)))ᵐ` for
    `0 ≤ x`, by induction on `m` — each step multiplies by `x²/((2(m+N)+1)(2(m+N)+2)) ≤ x²/((2N+1)(2N+2))`.
    The exact cos-mirror of the banked D1 `tail_termwise_le`. -/
theorem cosTail_termwise_le (x : Cut) (hx : 0 ≤ x) (N : ℕ) (m : ℕ) :
    |cosTermC x (m + N)| ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut))
      * (x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut)) ^ m := by
  induction m with
  | zero =>
    simp only [Nat.zero_add, pow_zero, mul_one]
    rw [cosTermC_abs_eq, abs_of_nonneg hx]
  | succ j ih =>
    have hfacj : (0 : Cut) < (((2 * (j + N)).factorial : ℕ) : Cut) := by
      exact_mod_cast (2 * (j + N)).factorial_pos
    have hsucc : |cosTermC x ((j + 1) + N)|
        = |cosTermC x (j + N)| * (x ^ 2 / (((2 * (j + N) + 1) * (2 * (j + N) + 2) : ℕ) : Cut)) := by
      rw [cosTermC_abs_eq, cosTermC_abs_eq, abs_of_nonneg hx]
      have he : 2 * ((j + 1) + N) = 2 * (j + N) + 2 := by ring
      have hfe : (2 * (j + N) + 2).factorial
          = (2 * (j + N)).factorial * ((2 * (j + N) + 1) * (2 * (j + N) + 2)) := by
        rw [Nat.factorial_succ, Nat.factorial_succ]; ring_nf
      rw [he, hfe]
      push_cast
      have hne : ((2 * (j + N)).factorial : Cut) ≠ 0 := ne_of_gt hfacj
      field_simp
      ring
    rw [hsucc]
    set R : Cut := x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) with hR
    have hden0 : (0 : Cut) < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) := by
      have : 0 < (2 * N + 1) * (2 * N + 2) := by positivity
      exact_mod_cast this
    have hdenj0 : (0 : Cut) < (((2 * (j + N) + 1) * (2 * (j + N) + 2) : ℕ) : Cut) := by
      have : 0 < (2 * (j + N) + 1) * (2 * (j + N) + 2) := by positivity
      exact_mod_cast this
    have hx2 : (0 : Cut) ≤ x ^ 2 := by positivity
    have hratio : x ^ 2 / (((2 * (j + N) + 1) * (2 * (j + N) + 2) : ℕ) : Cut) ≤ R := by
      rw [hR]
      apply div_le_div_of_nonneg_left hx2 hden0
      have : ((2 * N + 1) * (2 * N + 2) : ℕ) ≤ (2 * (j + N) + 1) * (2 * (j + N) + 2) := by
        apply Nat.mul_le_mul <;> omega
      exact_mod_cast this
    have hratio0 : 0 ≤ x ^ 2 / (((2 * (j + N) + 1) * (2 * (j + N) + 2) : ℕ) : Cut) :=
      div_nonneg hx2 (le_of_lt hdenj0)
    have hihnn : 0 ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut)) * R ^ j := by
      have : 0 ≤ R := by rw [hR]; exact div_nonneg hx2 (le_of_lt hden0)
      positivity
    calc |cosTermC x (j + N)| * (x ^ 2 / (((2 * (j + N) + 1) * (2 * (j + N) + 2) : ℕ) : Cut))
        ≤ ((x ^ (2 * N) / ((2 * N).factorial : Cut)) * R ^ j) * R :=
          mul_le_mul ih hratio hratio0 hihnn
      _ = (x ^ (2 * N) / ((2 * N).factorial : Cut)) * R ^ (j + 1) := by rw [pow_succ]; ring

/-- The cos tail family `m ↦ cosTermC x (m+N)` is summable (a head-shift of the banked summability). -/
theorem cosTail_summable (x : Cut) (N : ℕ) : Summable (fun m => cosTermC x (m + N)) :=
  (summable_nat_add_iff N).mpr (cosTermC_summable x)

/-- The absolute cos tail family is summable. -/
theorem cosTail_abs_summable (x : Cut) (N : ℕ) : Summable (fun m => |cosTermC x (m + N)|) :=
  (summable_nat_add_iff N).mpr (cosTermC_abs_summable x)

/-- ★ THE TAIL-OF-ABS BOUND: `∑'ₘ |cosTermC x (m+N)| ≤ cosRemBound x N`, for `0 ≤ x` with
    `x² < (2N+1)(2N+2)`. The termwise ratio-test bound + `tsum_mul_left` + the banked geometric
    bound close it (the exact cos-mirror of the D1 `expTail_le`). -/
theorem cosTail_abs_le (x : Cut) (hx : 0 ≤ x) (N : ℕ)
    (hxN : x ^ 2 < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut)) :
    ∑' m, |cosTermC x (m + N)| ≤ cosRemBound x N := by
  set R : Cut := x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) with hR
  have hden0 : (0 : Cut) < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) := by
    have : 0 < (2 * N + 1) * (2 * N + 2) := by positivity
    exact_mod_cast this
  have hx2 : (0 : Cut) ≤ x ^ 2 := by positivity
  have hr0 : 0 ≤ R := by rw [hR]; exact div_nonneg hx2 (le_of_lt hden0)
  have hr1 : R < 1 := by rw [hR, div_lt_one hden0]; exact hxN
  have hmaj_summ : Summable (fun m => (x ^ (2 * N) / ((2 * N).factorial : Cut)) * R ^ m) :=
    (cut_summable_geometric hr0 hr1).mul_left _
  have hle : ∀ m, |cosTermC x (m + N)| ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut)) * R ^ m := by
    intro m; rw [hR]; exact cosTail_termwise_le x hx N m
  have hstep : ∑' m, |cosTermC x (m + N)| ≤ ∑' m, (x ^ (2 * N) / ((2 * N).factorial : Cut)) * R ^ m :=
    (cosTail_abs_summable x N).tsum_le_tsum hle hmaj_summ
  have hgeo : ∑' m, (x ^ (2 * N) / ((2 * N).factorial : Cut)) * R ^ m
      = (x ^ (2 * N) / ((2 * N).factorial : Cut)) * ∑' m, R ^ m := tsum_mul_left
  have hgeobound : ∑' m, R ^ m ≤ (1 - R)⁻¹ := geom_tsum_le R hr0 hr1
  have hcoef : (0 : Cut) ≤ x ^ (2 * N) / ((2 * N).factorial : Cut) := by positivity
  calc ∑' m, |cosTermC x (m + N)|
      ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut)) * ∑' m, R ^ m := by rw [← hgeo]; exact hstep
    _ ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut)) * (1 - R)⁻¹ :=
        mul_le_mul_of_nonneg_left hgeobound hcoef
    _ = cosRemBound x N := by rw [cosRemBound, hR]

/-- THE SPLIT IDENTITY: `partialCos x N + (tail) = cutCos x` (the banked series splits at index N). -/
theorem cutCos_split (x : Cut) (N : ℕ) :
    partialCos x N + ∑' m, cosTermC x (m + N) = cutCos x := by
  have h := (cosTermC_summable x).sum_add_tsum_nat_add N
  simpa [partialCos, cutCos] using h

/-- ★ THE TWO-SIDED COS BRACKET: `partialCos x N − cosRemBound x N ≤ cutCos x ≤ partialCos x N +
    cosRemBound x N`, for `0 ≤ x` with `x² < (2N+1)(2N+2)`. The instrument the leastCosZero bracket
    reads. -/
theorem cutCos_bracket (x : Cut) (hx : 0 ≤ x) (N : ℕ)
    (hxN : x ^ 2 < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut)) :
    partialCos x N - cosRemBound x N ≤ cutCos x
      ∧ cutCos x ≤ partialCos x N + cosRemBound x N := by
  have hsplit := cutCos_split x N
  have habs := cosTail_abs_le x hx N hxN
  have hup : ∑' m, cosTermC x (m + N) ≤ cosRemBound x N :=
    le_trans ((cosTail_summable x N).tsum_le_tsum (fun m => le_abs_self _) (cosTail_abs_summable x N))
      habs
  have hlow : -(cosRemBound x N) ≤ ∑' m, cosTermC x (m + N) := by
    have hneg : -(∑' m, cosTermC x (m + N)) ≤ cosRemBound x N := by
      calc -(∑' m, cosTermC x (m + N)) = ∑' m, -(cosTermC x (m + N)) := by rw [tsum_neg]
        _ ≤ ∑' m, |cosTermC x (m + N)| :=
            ((cosTail_summable x N).neg).tsum_le_tsum (fun m => neg_le_abs _) (cosTail_abs_summable x N)
        _ ≤ cosRemBound x N := habs
    linarith
  constructor <;> linarith [hsplit, hup, hlow]

/-- ★★ THE ANY-WIDTH GUARANTEE (the cos-mirror of the banked D1 `expRemBound_lt` — this GROUNDS the
    narrowing campaign): for `0 ≤ x` and ANY `ε > 0` there is an index `N` with the bracket valid
    (`x² < (2N+1)(2N+2)`) and `cosRemBound x N < ε`. The cos terms tend to `0` (banked absolute
    summability); from `N` large the geometric factor `(1 − x²/((2N+1)(2N+2)))⁻¹ ≤ 2`, so the whole
    bound is `≤ 2·(x^{2N}/(2N)!) → 0`. This makes "to any demanded width" a THEOREM, so every later
    narrowing node has a guaranteed target. -/
theorem cosRemBound_lt (x : Cut) (hx : 0 ≤ x) (ε : Cut) (hε : 0 < ε) :
    ∃ N : ℕ, x ^ 2 < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) ∧ cosRemBound x N < ε := by
  obtain ⟨N₀, hN₀⟩ := cut_exists_nat_gt (2 * x ^ 2)
  have ht : Tendsto (fun n => |cosTermC x n|) atTop (𝓝 0) :=
    (cosTermC_abs_summable x).tendsto_atTop_zero
  have hev1 : ∀ᶠ N in atTop, |cosTermC x N| < ε / 2 := ht.eventually_lt_const (by linarith)
  have hev2 : ∀ᶠ N in atTop, N₀ ≤ N := eventually_ge_atTop N₀
  obtain ⟨N, hNlt, hNge⟩ := (hev1.and hev2).exists
  have hNle : (N₀ : Cut) ≤ (N : Cut) := by exact_mod_cast hNge
  have hDge : (2 * x ^ 2) < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) := by
    have hchain : (2 * x ^ 2) < (N : Cut) := lt_of_lt_of_le hN₀ hNle
    have hND : (N : Cut) ≤ (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) := by
      have : (N : ℕ) ≤ (2 * N + 1) * (2 * N + 2) := by nlinarith [Nat.zero_le N]
      exact_mod_cast this
    linarith
  have hx2 : (0 : Cut) ≤ x ^ 2 := by positivity
  have hxN : x ^ 2 < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) := by linarith
  refine ⟨N, hxN, ?_⟩
  have hDpos : (0 : Cut) < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) := by linarith
  have hfacpos : (0 : Cut) < 1 - x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) := by
    rw [sub_pos, div_lt_one hDpos]; exact hxN
  have hfacle : (1 - x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut))⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ hfacpos (by norm_num)]
    rw [le_sub_iff_add_le, ← le_sub_iff_add_le', div_le_iff₀ hDpos]
    nlinarith [hDge]
  have hterm_nonneg : (0 : Cut) ≤ x ^ (2 * N) / ((2 * N).factorial : Cut) := by positivity
  have hterm_eq : |cosTermC x N| = x ^ (2 * N) / ((2 * N).factorial : Cut) := by
    rw [cosTermC_abs_eq, abs_of_nonneg hx]
  calc cosRemBound x N
      = (x ^ (2 * N) / ((2 * N).factorial : Cut))
          * (1 - x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut))⁻¹ := rfl
    _ ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut)) * 2 :=
        mul_le_mul_of_nonneg_left hfacle hterm_nonneg
    _ = |cosTermC x N| * 2 := by rw [hterm_eq]
    _ < (ε / 2) * 2 := mul_lt_mul_of_pos_right hNlt (by norm_num)
    _ = ε := by ring

/-! ## (B) READING THE LEAST-ZERO LOCATION off the instrument. -/

/-- `partialCos x 2 = 1 − x²/2`. -/
theorem partialCos_two (x : Cut) : partialCos x 2 = 1 - x ^ 2 / 2 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

/-- `partialCos x 3 = 1 − x²/2 + x⁴/24`. -/
theorem partialCos_three (x : Cut) : partialCos x 3 = 1 - x ^ 2 / 2 + x ^ 4 / 24 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

/-- ★ THE UPPER SIGN FACT: `cutCos (17/10) < 0`, split at index 2 (`1 − x²/2 = −89/200`, remainder
    `< 89/200`). Read entirely off the cos instrument. -/
theorem cutCos_seventeen_tenths_neg : cutCos (17 / 10 : Cut) < 0 := by
  have hb := (cutCos_bracket (17 / 10) (by norm_num) 2 (by norm_num)).2
  rw [partialCos_two] at hb
  have hpart : (1 : Cut) - (17 / 10) ^ 2 / 2 = -89 / 200 := by norm_num
  rw [hpart] at hb
  have hrem2 : cosRemBound (17 / 10 : Cut) 2 < 89 / 200 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  linarith

/-- ★ THE LOWER POSITIVITY FACT: `0 < cutCos x` for `0 ≤ x < 7/5`, split at index 3
    (`cosRemBound x 3 ≤ x⁶/360`, and `1 − x²/2 + x⁴/24 − x⁶/360 > 0` for `x² < 49/25`). Read off the
    cos instrument. -/
theorem cutCos_pos_of_lt_seven_fifths (x : Cut) (hx0 : 0 ≤ x) (hx : x < 7 / 5) :
    0 < cutCos x := by
  have hx2 : x ^ 2 < 49 / 25 := by nlinarith [hx0, hx]
  have hxN : x ^ 2 < (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hx2]
  have hb := (cutCos_bracket x hx0 3 hxN).1
  rw [partialCos_three] at hb
  have hden : (0 : Cut) < 1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hx2]
  have hinv2 : (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ hden (by norm_num)]
    push_cast; nlinarith [hx2]
  have hrembd : cosRemBound x 3 ≤ x ^ 6 / 360 := by
    unfold cosRemBound
    have hcoef : (0 : Cut) ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) := by positivity
    have hstep : x ^ (2 * 3) / ((2 * 3).factorial : Cut)
        * (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹
        ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) * 2 :=
      mul_le_mul_of_nonneg_left hinv2 hcoef
    calc x ^ (2 * 3) / ((2 * 3).factorial : Cut)
            * (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹
          ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) * 2 := hstep
      _ = x ^ 6 / 360 := by norm_num [Nat.factorial]; ring
  have hpos : 0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 360 := by
    nlinarith [hx2, sq_nonneg (x ^ 2), pow_nonneg (sq_nonneg x) 2, hx0, sq_nonneg x]
  linarith [hb, hrembd, hpos]

/-- ★ `leastCosZero ≤ 17/10` (the UPPER bound on the least positive cosine zero): the IVT on `[0,17/10]`
    supplies a cosine zero `≤ 17/10` (since `cutCos (17/10) < 0 ≤ cutCos 0`), and the infimum of the
    zero set is `≤` any member (`csInf_le`). -/
theorem leastCosZero_le : leastCosZero ≤ 17 / 10 := by
  have h02 : (0 : Cut) ≤ 17 / 10 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (17 / 10)) := cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (17 / 10)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_seventeen_tenths_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-- ★ `7/5 ≤ leastCosZero` (the LOWER bound): the cosine is strictly positive on `[0,7/5)`, so NO
    zero lives below `7/5`, hence `7/5` is a lower bound of the zero set and `≤` its infimum
    (`le_csInf`). -/
theorem le_leastCosZero : (7 / 5 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_seven_fifths b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-- ★★ THE `cutPi` BRACKET: `cutPi ∈ [14/5, 17/5]`, from `cutPi = 2·leastCosZero` and
    `leastCosZero ∈ [7/5, 17/10]`. A certified two-sided rational bracket for the derived `π`. -/
theorem cutPi_bracket : (14 / 5 : Cut) ≤ cutPi ∧ cutPi ≤ 17 / 5 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero; linarith
  · have := leastCosZero_le; linarith

/-- ★★★ THE RESIDUAL BRACKET (D5's first job): `1/cutPi ∈ [5/17, 5/14]` — a certified two-sided
    rational bracket of `Cut` for the derived `1/cutPi`, the residual D4 left parametric. Fed into the
    D4 assembled pipeline below, it makes the second residual concrete. -/
theorem inv_cutPi_bracket : (5 / 17 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 5 / 14 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- ★ W8 — THE RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `5/17 < 5/14` (the bounds do not cross; the
    bracket is genuine, not a collapsed point). -/
theorem inv_cutPi_bracket_strict : (5 / 17 : Cut) < 5 / 14 := by norm_num

/-- ★ W8 — `1/cutPi` IS GENUINELY POSITIVE AND BELOW `1` (a real number strictly inside `(0,1)`, not a
    degenerate value): `0 < 1/cutPi` and `1/cutPi < 1` (from `1 < 14/5 ≤ cutPi`). -/
theorem inv_cutPi_in_unit : (0 : Cut) < 1 / cutPi ∧ 1 / cutPi < 1 := by
  refine ⟨by positivity [cutPi_pos], ?_⟩
  have := inv_cutPi_bracket.2; linarith

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.InvCutPiBracket

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (C) THE FIRST FULLY-CONCRETE NUMERAL — the D4 assembled bracket with BOTH residuals concrete,
    at the derived census `d = chargeTraceDepth = 16/3`. -/

/-- ★★★ THE FIRST FULLY-CONCRETE BRACKET of the derived `1/α(0)`. D4's `endpoint_assembled_bracket`
    was parametric over BOTH residuals `cutLog(mass0/mass1)` and `1/cutPi`; here BOTH are concrete —
    `cutLog(mass0/mass1) ∈ [1,9]` (D4/D1, `cutLog_content_lo`/`_hi`) and `1/cutPi ∈ [5/17, 5/14]`
    (this node) — at the DERIVED census `d = chargeTraceDepth = 16/3` (banked `chargeTraceDepth_eq`).
    So the derived `1/α(0) = invAlphaZero (completeBandList chargeTraceDepth)` is PINNED between two
    EXPLICIT rationals of `Cut`:

        190/3 + (16/9)·(1·(5/17))  ≤  1/α(0)  ≤  190/3 + (16/9)·(9·(5/14)),
        i.e.  190/3 + 80/153  ≤  1/α(0)  ≤  190/3 + 360/14 = 190/3 + 180/7.

    The pipeline evaluated END TO END with NO residual left parametric — the campaign's first concrete
    (wide) rung. ⚠ NO-FIT: the endpoints are the D4 first-pass residual brackets, not tuned to
    `137.036`; the bracket is WIDE and the campaign narrows it. -/
theorem invAlphaZero_concrete_bracket :
    (190 / 3 + 80 / 153 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 190 / 3 + 180 / 7 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    1 9 (by norm_num) cutLog_content_lo cutLog_content_hi
    (5 / 17) (5 / 14) (by norm_num) inv_cutPi_bracket.1 inv_cutPi_bracket.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (190 / 3 + 80 / 153 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * 1 * (5 / 17) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * 9 * (5 / 14) : Cut)
        ≤ 190 / 3 + 180 / 7 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- ★★ THE DRESSED FIRST CONCRETE BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned between
    explicit rationals with BOTH residuals concrete, at `d = 16/3`:

        74 + (8/3)·(1·(5/17))  ≤  ·  ≤  74 + (8/3)·(9·(5/14)),
        i.e.  74 + 40/51  ≤  ·  ≤  74 + 60/7. -/
theorem dressed_concrete_bracket :
    (74 + 40 / 51 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 74 + 60 / 7 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    1 9 (by norm_num) cutLog_content_lo cutLog_content_hi
    (5 / 17) (5 / 14) (by norm_num) inv_cutPi_bracket.1 inv_cutPi_bracket.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (74 + 40 / 51 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * 1 * (5 / 17) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * 9 * (5 / 14) : Cut)
        ≤ 74 + 60 / 7 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- ★ W8 — THE CONCRETE BRACKET IS STRICTLY TWO-SIDED (non-degenerate): the lower endpoint is strictly
    below the upper, `190/3 + 80/153 < 190/3 + 180/7`. -/
theorem invAlphaZero_concrete_strict : (190 / 3 + 80 / 153 : Cut) < 190 / 3 + 180 / 7 := by norm_num

/-- ★ W8 — THE CONCRETE ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT: the lower bound
    `190/3 + 80/153` strictly exceeds the confinement way-point `190/3` — the lepton tail runs `1/α`
    genuinely UP at the physical census, not a collapse. -/
theorem invAlphaZero_concrete_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_concrete_bracket.1
  have : (190 / 3 : Cut) < 190 / 3 + 80 / 153 := by norm_num
  linarith

/-! ## (D) THE D5-FIRST CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE RESIDUAL BRACKETED + THE FIRST CONCRETE NUMERAL (arc-D D5, first narrowing node, welded
    landing). The trig-scale route-finder resolved and the D4 pipeline evaluated with NO residual left
    parametric:

    (1) THE RESIDUAL BRACKET: `1/cutPi ∈ [5/17, 5/14]` (`inv_cutPi_bracket`) — a certified two-sided
        rational bracket for the derived `1/cutPi`, built on the new cos bracket instrument;
    (2) THE `cutPi` BRACKET: `cutPi ∈ [14/5, 17/5]` (`cutPi_bracket`), from `leastCosZero ∈ [7/5,17/10]`;
    (3) THE ANY-WIDTH GUARANTEE: the cos instrument tightens to any demanded rational width
        (`cosRemBound_lt`) — the campaign's narrowing is a THEOREM path, not a hope;
    (4) THE FIRST FULLY-CONCRETE BRACKET of `1/α(0)` at the derived census `16/3`:
        `190/3 + 80/153 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 190/3 + 180/7`
        (`invAlphaZero_concrete_bracket`) — the pipeline evaluated end to end;
    (5) THE DRESSED FIRST CONCRETE BRACKET at the derived weight: `74 + 40/51 ≤ · ≤ 74 + 60/7`
        (`dressed_concrete_bracket`);
    (6) TEETH: the residual bracket is strictly two-sided (`inv_cutPi_bracket_strict`), `1/cutPi ∈ (0,1)`
        (`inv_cutPi_in_unit`), the concrete bracket is strictly two-sided
        (`invAlphaZero_concrete_strict`), and the concrete endpoint screens above `190/3`
        (`invAlphaZero_concrete_gt_waypoint`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (exact rationals or certified two-sided rational brackets of closed reals of `Cut`, no error bar).
    The concrete `1/α(0)` bracket is WIDE (the first concrete rung); the narrowing campaign (this
    node's successors) tightens every bracket via deeper indices, grounded by (3). The measured
    `1/α(0) ≈ 137.036` and `π` are REMOVABLE PROSE ONLY; no empirical number in any proof; explicit
    NO-FIT (the bracket endpoints `7/5`, `17/10` are chosen by where the derived cosine's sign is
    certifiable at low index, not by the measured value). -/
theorem invCutPi_landing :
    -- (1) the residual bracket
    ((5 / 17 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 5 / 14)
    -- (2) the cutPi bracket
    ∧ ((14 / 5 : Cut) ≤ cutPi ∧ cutPi ≤ 17 / 5)
    -- (3) the any-width guarantee (the campaign is a theorem path): the cos instrument tightens to
    --     any demanded rational width at any nonneg argument
    ∧ (∀ x : Cut, 0 ≤ x → ∀ ε : Cut, 0 < ε → ∃ N : ℕ,
        x ^ 2 < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut) ∧ cosRemBound x N < ε)
    -- (4) the first fully-concrete bracket of 1/α(0)
    ∧ ((190 / 3 + 80 / 153 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 190 / 3 + 180 / 7)
    -- (5) the dressed first concrete bracket at the derived weight
    ∧ ((74 + 40 / 51 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 74 + 60 / 7)
    -- (6) teeth
    ∧ (5 / 17 : Cut) < 5 / 14
    ∧ ((0 : Cut) < 1 / cutPi ∧ 1 / cutPi < 1)
    ∧ (190 / 3 + 80 / 153 : Cut) < 190 / 3 + 180 / 7
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  refine ⟨inv_cutPi_bracket, cutPi_bracket, ?_, invAlphaZero_concrete_bracket,
    dressed_concrete_bracket, inv_cutPi_bracket_strict, inv_cutPi_in_unit,
    invAlphaZero_concrete_strict, invAlphaZero_concrete_gt_waypoint⟩
  intro x hx ε hε
  exact cosRemBound_lt x hx ε hε

end

end Phys.Algebra.InvCutPiBracket
