import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumBracket

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

/-! PROBE — the general cos bracket instrument + leastCosZero bracket + 1/cutPi bracket. -/

/-- Partial cosine sum. -/
def partialCos (x : Cut) (N : ℕ) : Cut := ∑ i ∈ Finset.range N, cosTermC x i

/-- Explicit rational remainder majorant for the cos tail from index N (x≥0):
    (x^(2N)/(2N)!)·(1 − x²/((2N+1)(2N+2)))⁻¹. -/
def cosRemBound (x : Cut) (N : ℕ) : Cut :=
  (x ^ (2 * N) / ((2 * N).factorial : Cut)) * (1 - x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut))⁻¹

/-- Ratio-test crux (termwise), mirror of D1 `tail_termwise_le`. -/
theorem cosTail_termwise_le (x : Cut) (hx : 0 ≤ x) (N : ℕ) (m : ℕ) :
    |cosTermC x (m + N)| ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut))
      * (x ^ 2 / (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut)) ^ m := by
  induction m with
  | zero =>
    simp only [Nat.zero_add, pow_zero, mul_one]
    rw [cosTermC_abs_eq, abs_of_nonneg hx]
  | succ j ih =>
    -- |cosTermC x ((j+1)+N)| = |cosTermC x (j+N)| · x²/((2(j+N)+1)(2(j+N)+2))
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

/-- Tail summable (head-shift of banked cos summability). -/
theorem cosTail_summable (x : Cut) (N : ℕ) : Summable (fun m => cosTermC x (m + N)) :=
  (summable_nat_add_iff N).mpr (cosTermC_summable x)

theorem cosTail_abs_summable (x : Cut) (N : ℕ) : Summable (fun m => |cosTermC x (m + N)|) :=
  (summable_nat_add_iff N).mpr (cosTermC_abs_summable x)

/-- The tail-of-abs bound. Needs x² < (2N+1)(2N+2). -/
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
    _ ≤ (x ^ (2 * N) / ((2 * N).factorial : Cut)) * (1 - R)⁻¹ := mul_le_mul_of_nonneg_left hgeobound hcoef
    _ = cosRemBound x N := by rw [cosRemBound, hR]

/-- Split identity. -/
theorem cutCos_split (x : Cut) (N : ℕ) :
    partialCos x N + ∑' m, cosTermC x (m + N) = cutCos x := by
  have h := (cosTermC_summable x).sum_add_tsum_nat_add N
  simpa [partialCos, cutCos] using h

/-- ★ TWO-SIDED cos bracket: partialCos ∓ cosRemBound. -/
theorem cutCos_bracket (x : Cut) (hx : 0 ≤ x) (N : ℕ)
    (hxN : x ^ 2 < (((2 * N + 1) * (2 * N + 2) : ℕ) : Cut)) :
    partialCos x N - cosRemBound x N ≤ cutCos x
      ∧ cutCos x ≤ partialCos x N + cosRemBound x N := by
  have hsplit := cutCos_split x N
  have habs := cosTail_abs_le x hx N hxN
  have hup : ∑' m, cosTermC x (m + N) ≤ cosRemBound x N :=
    le_trans ((cosTail_summable x N).tsum_le_tsum (fun m => le_abs_self _) (cosTail_abs_summable x N)) habs
  have hlow : -(cosRemBound x N) ≤ ∑' m, cosTermC x (m + N) := by
    have hneg : -(∑' m, cosTermC x (m + N)) ≤ cosRemBound x N := by
      calc -(∑' m, cosTermC x (m + N)) = ∑' m, -(cosTermC x (m + N)) := by rw [tsum_neg]
        _ ≤ ∑' m, |cosTermC x (m + N)| :=
            ((cosTail_summable x N).neg).tsum_le_tsum (fun m => neg_le_abs _) (cosTail_abs_summable x N)
        _ ≤ cosRemBound x N := habs
    linarith
  constructor <;> linarith [hsplit, hup, hlow]

/-! ## Targets. -/

/-- partialCos x 2 = 1 - x²/2. -/
theorem partialCos_two (x : Cut) : partialCos x 2 = 1 - x ^ 2 / 2 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

/-- partialCos x 3 = 1 - x²/2 + x⁴/24. -/
theorem partialCos_three (x : Cut) : partialCos x 3 = 1 - x ^ 2 / 2 + x ^ 4 / 24 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num; ring

/-- ★ UPPER: cutCos (17/10) < 0. -/
theorem cutCos_seventeen_tenths_neg : cutCos (17 / 10 : Cut) < 0 := by
  have hb := (cutCos_bracket (17 / 10) (by norm_num) 2 (by norm_num)).2
  rw [partialCos_two] at hb
  have hrem : cosRemBound (17 / 10 : Cut) 2 ≤ 1 / 2 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  -- 1 - (17/10)²/2 = -89/200 ; plus ≤ 1/2 ... need tighter. Check:
  have hpart : (1 : Cut) - (17 / 10) ^ 2 / 2 = -89 / 200 := by norm_num
  rw [hpart] at hb
  -- need cosRemBound < 89/200 = 0.445 ; it's ~0.385
  have hrem2 : cosRemBound (17 / 10 : Cut) 2 < 89 / 200 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  linarith

/-- ★ LOWER positivity: 0 < cutCos x for 0 ≤ x < 7/5. -/
theorem cutCos_pos_of_lt_seven_fifths (x : Cut) (hx0 : 0 ≤ x) (hx : x < 7 / 5) :
    0 < cutCos x := by
  have hx2 : x ^ 2 < 49 / 25 := by nlinarith [hx0, hx]
  have hxN : x ^ 2 < (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hx2]
  have hb := (cutCos_bracket x hx0 3 hxN).1
  rw [partialCos_three] at hb
  -- cosRemBound x 3 ≤ x⁶/360 (since (1 - x²/56)⁻¹ ≤ 2)
  have hden : (0 : Cut) < 1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hx2]
  have hinv2 : (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹ ≤ 2 := by
    rw [inv_le_comm₀ hden (by norm_num)]
    push_cast; nlinarith [hx2]
  have hrembd : cosRemBound x 3 ≤ x ^ 6 / 360 := by
    unfold cosRemBound
    have hcoef : (0 : Cut) ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) := by positivity
    have : x ^ (2 * 3) / ((2 * 3).factorial : Cut)
        * (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹
        ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) * 2 :=
      mul_le_mul_of_nonneg_left hinv2 hcoef
    calc x ^ (2 * 3) / ((2 * 3).factorial : Cut)
            * (1 - x ^ 2 / (((2 * 3 + 1) * (2 * 3 + 2) : ℕ) : Cut))⁻¹
          ≤ x ^ (2 * 3) / ((2 * 3).factorial : Cut) * 2 := this
      _ = x ^ 6 / 360 := by norm_num [Nat.factorial]; ring
  -- now 0 < 1 - x²/2 + x⁴/24 - x⁶/360  for x²<49/25
  have hpos : 0 < 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 360 := by
    have ht : x ^ 4 = (x ^ 2) ^ 2 := by ring
    have ht6 : x ^ 6 = (x ^ 2) ^ 3 := by ring
    nlinarith [hx2, sq_nonneg (x ^ 2), pow_nonneg (sq_nonneg x) 2, hx0, sq_nonneg x]
  linarith [hb, hrembd, hpos]

/-- ★ leastCosZero ≤ 17/10 (upper). -/
theorem leastCosZero_le : leastCosZero ≤ 17 / 10 := by
  have h02 : (0 : Cut) ≤ 17 / 10 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (17 / 10)) := cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (17 / 10)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_seventeen_tenths_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-- ★ 7/5 ≤ leastCosZero (lower). -/
theorem le_leastCosZero : (7 / 5 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have := cutCos_pos_of_lt_seven_fifths b hb0 hlt
  rw [hb.2] at this
  exact lt_irrefl _ this

/-- ★★ cutPi ∈ [14/5, 17/5]. -/
theorem cutPi_bracket : (14 / 5 : Cut) ≤ cutPi ∧ cutPi ≤ 17 / 5 := by
  unfold cutPi
  constructor
  · have := le_leastCosZero; linarith
  · have := leastCosZero_le; linarith

/-- ★★★ 1/cutPi ∈ [5/17, 5/14] — the concrete residual bracket D5 hands the assembled pipeline. -/
theorem inv_cutPi_bracket : (5 / 17 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 5 / 14 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket
  have hpos : 0 < cutPi := cutPi_pos
  constructor
  · rw [le_div_iff₀ hpos]
    nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]
    nlinarith [hlo, hpos]

end
end ContinuumQ
end Phys.Foundation
