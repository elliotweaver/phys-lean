/-
  # N39 — THE POWER-SERIES EXP, increment 9 (part c·1): the SUMMABILITY LEVERS over the DERIVED ℝ.

  N37 banked `CompleteSpace Cut`; N38 banked the Cut-valued submultiplicative operator norm. The
  remaining analytic core of `Der(𝕆) → Aut(𝕆)` is the convergence of the matrix exponential series
  `exp(D) = ∑ Dⁿ/n!`. That convergence rests on a handful of summability facts about the DERIVED ℝ
  itself — a nonneg series with bounded partial sums converges, the comparison/absolute/geometric/
  pow-over-factorial series converge. THIS file banks those scalar summability levers; the matrix-level
  series is childed to `Phys/Algebra/DerivationAutExp.lean`.

  ★ THE W1 / THE-ONE-LAW REFRAME THROUGH THE TRUNK (the content-trap dodge, MEASURED first).
  Mathlib's standard convergence machinery is **ℝ-VALUED**: `Summable.of_norm_bounded`,
  `Summable.of_nonneg_of_le`, `summable_geometric_of_lt_one`, and the ratio test all take an
  ℝ-valued `Norm`/`NormedRing`. Using any of them would cast a `Cut`-valued magnitude into Mathlib's
  ℝ — importing ℝ as CONTENT (STANDARD §3), the SAME trap the metric (N35→N36), Cauchy-completeness
  (N37) and the operator norm (N38) each had to dodge. The trunk dodges it again: every lemma here is
  a statement ABOUT the derived `Cut`, proved from the order-native structure with NO ℝ-valued norm —

    • the foundation `cut_summable_of_nonneg_of_bddAbove`: a NONNEG series whose finite partial sums
      are BOUNDED-ABOVE converges, because the partial-sum set has a least upper bound (N33
      `ConditionallyCompleteLinearOrder`, `isLUB_csSup`) and `hasSum_of_isLUB_of_nonneg` (the ORDER
      topology, banked N34) turns that LUB into the sum. This is the C6 eternal-approach as a
      convergent series: the increasing partial sums approach their coherence point (the LUB).
    • the comparison/absolute/geometric/pow-factorial levers build on that foundation with order
      arithmetic only.

  ★ THE ONE CAUSE (the trunk). The SAME C6 eternal-approach + order-completeness (N33) + order
  topology (N34) + Archimedean property (N35) that built the derived ℝ now make its nonneg bounded
  series converge, its geometric series sum, and its `cⁿ/n!` series converge — the convergence the
  exponential's partial sums will ride. One engine, several terminations.

  ★ MACHINERY, NOT A POSIT (STANDARD §3). Each lemma is a property OF the derived ℝ, proved by
  `Finset.sum`/`abs`/order machinery on the DERIVED `Cut`. NO Mathlib ℝ imported as content, NO
  ℝ-valued `Norm`, NO `CauSeq`.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words in this file. It is the pure
  statement that over the completion-of-the-gather-of-closures of the derived rationals, a nonneg
  series with bounded partial sums converges, the comparison/absolute/geometric/`cⁿ·n!⁻¹` series
  converge. No physics name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO ℝ-valued `Norm`.
-/
import Phys.Foundation.ContinuumComplete
import Phys.Foundation.ContinuumArchimedean
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.Group
import Mathlib.Topology.Algebra.InfiniteSum.Basic

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## The foundation lever: nonneg + bounded partial sums ⟹ Summable (NO ℝ-valued norm). -/

/-- ★ THE FOUNDATION SUMMABILITY LEVER over the derived ℝ: a NONNEG series whose finite partial sums
    are BOUNDED ABOVE is `Summable`. The partial-sum set `{∑_{i∈s} f i | s : Finset ℕ}` is nonempty
    (the empty finset gives `0`) and bounded above, so by N33 `ConditionallyCompleteLinearOrder` it
    has a least upper bound `sSup`, and `hasSum_of_isLUB_of_nonneg` (the banked N34 ORDER topology)
    turns that LUB into the sum. The C6 eternal-approach as a convergent series — NO ℝ-valued norm. -/
theorem cut_summable_of_nonneg_of_bddAbove (f : ℕ → Cut) (hf : ∀ n, 0 ≤ f n)
    (hbdd : BddAbove (Set.range (fun s : Finset ℕ => ∑ i ∈ s, f i))) : Summable f := by
  have hne : (Set.range (fun s : Finset ℕ => ∑ i ∈ s, f i)).Nonempty := ⟨0, ⟨∅, by simp⟩⟩
  exact ⟨_, hasSum_of_isLUB_of_nonneg _ hf (isLUB_csSup hne hbdd)⟩

/-- ★ THE NONNEG COMPARISON TEST over the derived ℝ: `0 ≤ f ≤ g` with `g` summable ⟹ `f` summable.
    The partial sums of `f` are dominated by those of `g`, which are bounded by the sum of `g`
    (`sum_le_hasSum`, the banked order topology). NO ℝ-valued norm. -/
theorem cut_summable_of_nonneg_of_le {f g : ℕ → Cut} (hf : ∀ n, 0 ≤ f n)
    (hfg : ∀ n, f n ≤ g n) (hg : Summable g) : Summable f := by
  obtain ⟨a, ha⟩ := hg
  apply cut_summable_of_nonneg_of_bddAbove f hf
  refine ⟨a, ?_⟩
  rintro x ⟨s, rfl⟩
  calc ∑ i ∈ s, f i ≤ ∑ i ∈ s, g i := Finset.sum_le_sum (fun i _ => hfg i)
    _ ≤ a := sum_le_hasSum s (fun i _ => le_trans (hf i) (hfg i)) ha

/-- ★ THE ABSOLUTE-CONVERGENCE LEVER over the (Cauchy-complete, N37) derived ℝ: if `∑ |f|` is
    summable then `∑ f` is summable. Split into positive and negative parts `max (f n) 0` and
    `max (-f n) 0`, each bounded by `|f n|` (so summable by the comparison test), then
    `f = (pos part) - (neg part)` and `Summable.sub`. NO ℝ-valued norm. -/
theorem cut_summable_of_abs {f : ℕ → Cut} (h : Summable (fun n => |f n|)) : Summable f := by
  have hpos : Summable (fun n => max (f n) 0) :=
    cut_summable_of_nonneg_of_le (fun n => le_max_right _ _)
      (fun n => max_le (le_abs_self _) (abs_nonneg _)) h
  have hneg : Summable (fun n => max (-f n) 0) :=
    cut_summable_of_nonneg_of_le (fun n => le_max_right _ _)
      (fun n => max_le (neg_le_abs _) (abs_nonneg _)) h
  have hsub := hpos.sub hneg
  convert hsub using 2 with n
  rcases le_total 0 (f n) with hp | hp
  · simp [max_eq_left hp, max_eq_right (neg_nonpos.2 hp)]
  · simp [max_eq_right hp, max_eq_left (neg_nonneg.2 hp)]

/-! ## The geometric series over the derived ℝ. -/

/-- The geometric telescope identity over the derived ℝ: `(1 - r)·∑_{i<N} rⁱ = 1 - rᴺ`, by induction.
    (Mathlib's `geom_sum_eq` lives in `GeomSum`, which is not in the prebuilt slice; this inline
    induction supplies the partial-sum control directly.) -/
theorem cut_geom_telescope (r : Cut) (N : ℕ) :
    (1 - r) * ∑ i ∈ Finset.range N, r ^ i = 1 - r ^ N := by
  induction N with
  | zero => simp
  | succ k ih => rw [Finset.sum_range_succ, mul_add, ih, pow_succ]; ring

/-- ★ THE GEOMETRIC SERIES over the derived ℝ: `0 ≤ r < 1 ⟹ Summable (fun n => rⁿ)`. The partial
    sums are nonneg and bounded above by `(1 - r)⁻¹`: any finite `s ⊆ range N`, and the telescope
    identity gives `(1-r)·∑_{i<N} rⁱ = 1 - rᴺ ≤ 1`, so `∑_{i<N} rⁱ ≤ (1-r)⁻¹`. Foundation lever L1.
    The geometric majorant the exponential series is compared against — NO ℝ-valued norm. -/
theorem cut_summable_geometric {r : Cut} (hr0 : 0 ≤ r) (hr1 : r < 1) :
    Summable (fun n => r ^ n) := by
  apply cut_summable_of_nonneg_of_bddAbove _ (fun n => pow_nonneg hr0 n)
  refine ⟨(1 - r)⁻¹, ?_⟩
  rintro x ⟨s, rfl⟩
  obtain ⟨N, hN⟩ : ∃ N, s ⊆ Finset.range N :=
    ⟨(s.sup id) + 1, fun a ha => Finset.mem_range.2 (Nat.lt_succ_of_le (Finset.le_sup (f := id) ha))⟩
  have h1r : (0 : Cut) < 1 - r := by linarith
  have hinv : (1 - r) * (1 - r)⁻¹ = 1 := mul_inv_cancel₀ (ne_of_gt h1r)
  have key : (1 - r) * ∑ i ∈ Finset.range N, r ^ i ≤ 1 := by
    rw [cut_geom_telescope]; nlinarith [pow_nonneg hr0 N]
  calc ∑ i ∈ s, r ^ i ≤ ∑ i ∈ Finset.range N, r ^ i :=
        Finset.sum_le_sum_of_subset_of_nonneg hN (fun i _ _ => pow_nonneg hr0 i)
    _ ≤ (1 - r)⁻¹ := le_of_mul_le_mul_left (by rw [hinv]; exact key) h1r

/-! ## The pow-over-factorial series (the analytic crux the exponential rides). -/

/-- ★ THE EXPONENTIAL MAJORANT over the derived ℝ: for any `0 ≤ c`, `Summable (fun n => cⁿ / n!)`.
    THE analytic crux. A ratio test BY HAND (no ℝ-valued norm, no Mathlib ratio test): pick an
    Archimedean natural `M > c` (N35 `cut_exists_nat_gt`); from index `M` on, the term satisfies the
    recurrence `a(k+1+M) = a(k+M)·c/(k+M+1)` with `c/(k+M+1) ≤ c/M = q < 1`, so by induction the tail
    is dominated by `(cᴹ/M!)·qᵏ` — a constant times the geometric series (L4, `cut_summable_geometric`).
    The comparison test (L2) then closes the tail, and `summable_nat_add_iff` restores the head. This
    is the C6 eternal-approach as a convergent series: the factorial outruns any fixed base. -/
theorem cut_summable_pow_div_factorial {c : Cut} (hc : 0 ≤ c) :
    Summable (fun n => c ^ n / (n.factorial : Cut)) := by
  obtain ⟨M, hM⟩ := cut_exists_nat_gt c
  have hMpos : (0 : Cut) < (M : Cut) := lt_of_le_of_lt hc hM
  set q : Cut := c / M with hqdef
  have hq0 : 0 ≤ q := div_nonneg hc (le_of_lt hMpos)
  have hq1 : q < 1 := by rw [hqdef, div_lt_one hMpos]; exact hM
  have htail : ∀ k, c ^ (k + M) / (((k + M).factorial : ℕ) : Cut)
      ≤ (c ^ M / ((M.factorial : ℕ) : Cut)) * q ^ k := by
    intro k
    induction k with
    | zero => simp
    | succ j ih =>
      have hfacj : (0 : Cut) < (((j + M).factorial : ℕ) : Cut) := by
        exact_mod_cast (j + M).factorial_pos
      have hsucc : c ^ ((j + 1) + M) / ((((j + 1) + M).factorial : ℕ) : Cut)
          = (c ^ (j + M) / (((j + M).factorial : ℕ) : Cut)) * (c / ((j + M + 1 : ℕ) : Cut)) := by
        have he : (j + 1) + M = (j + M) + 1 := by ring
        rw [he, pow_succ, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
        have hfne : (((j + M).factorial : ℕ) : Cut) ≠ 0 := ne_of_gt hfacj
        push_cast
        field_simp
      rw [hsucc]
      have hden : (0 : Cut) < ((j + M + 1 : ℕ) : Cut) := by exact_mod_cast Nat.succ_pos _
      have hratio : c / ((j + M + 1 : ℕ) : Cut) ≤ q := by
        rw [hqdef, div_le_div_iff₀ hden hMpos]
        have hle : (M : Cut) ≤ ((j + M + 1 : ℕ) : Cut) := by
          exact_mod_cast (by omega : M ≤ j + M + 1)
        nlinarith [hc, hle, hMpos]
      calc (c ^ (j + M) / (((j + M).factorial : ℕ) : Cut)) * (c / ((j + M + 1 : ℕ) : Cut))
          ≤ (c ^ M / ((M.factorial : ℕ) : Cut) * q ^ j) * q :=
            mul_le_mul ih hratio (div_nonneg hc (le_of_lt hden)) (by positivity)
        _ = c ^ M / ((M.factorial : ℕ) : Cut) * q ^ (j + 1) := by rw [pow_succ]; ring
  apply (summable_nat_add_iff M).mp
  apply cut_summable_of_nonneg_of_le
    (fun k => div_nonneg (pow_nonneg hc _) (by exact_mod_cast (k + M).factorial_pos.le))
    htail
  exact (cut_summable_geometric hq0 hq1).mul_left _

/-! ## NON-VACUITY (W8): the levers are not vacuous — a concrete convergent series. -/

/-- NON-VACUITY: a concrete instance of `cut_summable_pow_div_factorial` — `∑ 1ⁿ/n! = ∑ 1/n!`
    converges over the derived ℝ (the exponential series at the unit). Witnesses that the analytic
    crux is inhabited and the bound is achievable, not an empty statement. -/
theorem cut_summable_one_div_factorial :
    Summable (fun n => (1 : Cut) ^ n / (n.factorial : Cut)) :=
  cut_summable_pow_div_factorial (le_refl 0 |>.trans zero_le_one)

end

end ContinuumQ
end Phys.Foundation
