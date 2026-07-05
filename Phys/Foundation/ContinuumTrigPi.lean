/-
  # N325 — THE DERIVED "π" `cutPi` AND THE PERIODICITY STRUCTURE over the DERIVED ℝ `ContinuumQ.Cut`.

  N323 (`ContinuumTrig`) banked the derived circular functions `cutCos`/`cutSin` with the Born-unit-circle
  Pythagorean identity `cutSin² + cutCos² = 1`; N324 (`ContinuumTrigAdd`) banked the GROUP LAW of the
  Born-circle orbit — the addition formulas `cutCos(a+b) = cutCos a·cutCos b − cutSin a·cutSin b`,
  `cutSin(a+b) = cutSin a·cutCos b + cutCos a·cutSin b` — and boundedness `|cutCos|,|cutSin| ≤ 1`.
  THIS file CONSTRUCTS the derived `cutPi` — twice the least positive zero of the derived cosine — and
  banks the periodicity/shift structure the scale tower `e^(−Nπ)` is expressed in. It completes the
  arc-B π-prerequisite.

  ★ WHY THIS IS NOT A POSIT (STANDARD §3 — THE NUMBER-TOWER GATE). `cutPi` is NOT `Real.pi` imported as
  content; it is CONSTRUCTED as `2 · sInf {x ∈ [0,2] | cutCos x = 0}`, the least positive zero of the
  fold-descended cosine. It EXISTS because (a) `cutCos` is CONTINUOUS on the derived `Cut` (proved here,
  riding the banked addition formulas exactly as `cutExp_continuous` rode `cutExp_add`, N175), (b)
  `cutCos 0 = 1 > 0` while `cutCos 2 < 0` (a sign change, proved here by a head/tail split + a geometric
  majorant on the banked alternating series), so the INTERMEDIATE VALUE THEOREM on the Cauchy-complete
  `Cut` (N37) supplies a zero, and (c) the zero set is CLOSED and bounded-below, so its infimum is
  ATTAINED (`IsClosed.csInf_mem`). `cutPi` is FORCED by the orbit closing on the Born circle — not a
  posited number. The only Mathlib used is the topological-order / intermediate-value / infimum MACHINERY
  operating ON the derived `Cut` — NO `Real.pi`/`Real.cos`/`Real.sin`/`Complex` as content.

  ★ THE THEORY-NATIVE READING. `cutPi/2` is the QUARTER-TURN of the Born-circle orbit `t ↦ (cutCos t,
  cutSin t)` — the first parameter at which the orbit reaches the sine axis (`cutCos(cutPi/2) = 0`,
  `cutSin(cutPi/2)² = 1`). `cutCos(cutPi) = −1` is the HALF-TURN (the antipode), and the shift formulas
  `cutCos(x+cutPi) = −cutCos x`, `cutSin(x+cutPi) = −cutSin x` are the half-turn rotation of the whole
  orbit; `2·cutPi` is the full period. Crucially, the ENTIRE periodicity package falls out of
  `cutCos(cutPi/2) = 0` + the banked Pythagorean identity + the banked addition formulas, with NO
  sign-of-sine argument: it is pure consequence of the orbit's group law.

  ★ THE ROUTE (adapting the `cutExp` continuity/IVT template, N175, to the alternating trig series).
    (1) CONTINUITY: near-0 majorant bounds `|cutSin h| ≤ |h|·SS`, `|cutCos h − 1| ≤ |h|·SC` (from the
        banked absolute-term majorants), a squeeze giving continuity at 0, then the addition formulas
        give continuity everywhere (exactly the `cutExp` pattern).
    (2) SIGN CHANGE `cutCos 2 < 0`: head/tail split `cutCos 2 = (1 + (−2)) + ∑_{n≥2}`, the n≥2 tail
        bounded in magnitude by a geometric majorant `(2/3)·(2/15)^n` summing to `≤ 10/13 < 1`, so
        `cutCos 2 ≤ −1 + 10/13 < 0`.
    (3) `cutPi := 2 · sInf {x ∈ [0,2] | cutCos x = 0}`: nonempty by the IVT, closed + bddBelow so the
        infimum is a member; `cutPi > 0`, `cutCos(cutPi/2) = 0`.
    (4) PERIODICITY: `cutCos cutPi = −1`, `cutSin cutPi = 0`, the shift formulas, the full period — all
        from (3) + the banked Pythagorean identity + the banked addition formulas.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  its series converge, gave `cutExp` its inverse by the IVT, and closed the trig group law now forces a
  LEAST positive zero of the derived cosine and hence `cutPi`. One engine, one more termination.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2): there are NO physics words. Delete "Born"/"circle"/"orbit"/
  "Gauss-sphere"/"π" and the file is the pure statement that over the completion-of-the-gather-of-closures
  of the derived rationals, the derived cosine `C` is continuous, changes sign on `[0,2]`, has a least
  positive zero `z₀`, and `P := 2 z₀` satisfies `C(P/2) = 0`, `C(P) = −1`, `S(P) = 0`, `C(x+P) = −C(x)`,
  `S(x+P) = −S(x)`. No name is load-bearing.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib number-system content
  import, NO ℝ-valued `Norm`, NO `Real.cos`/`Real.sin`/`Real.pi`. `Classical.choice` enters only via the
  IVT / infimum machinery (`IsClosed.csInf_mem`), exactly as `cutLog`/`cutExp_surjOn_pos` used it (N175).
-/
import Phys.Foundation.ContinuumTrigAdd
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Topology.Order.Monotone

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-! ## (1) CONTINUITY of `cutCos` and `cutSin` over the derived ℝ (adapting the `cutExp` template). -/

/-- Fixed nonneg constant: the absolute sine series at `1`. -/
def sinAbsSum : Cut := ∑' n, |sinTermC (1 : Cut) n|

/-- Fixed nonneg constant: the shifted absolute cosine series at `1`. -/
def cosAbsSumTail : Cut := ∑' n, |cosTermC (1 : Cut) (n + 1)|

theorem sinAbsSum_summable : Summable (fun n => |sinTermC (1 : Cut) n|) := sinTermC_abs_summable 1

theorem cosAbsSumTail_summable : Summable (fun n => |cosTermC (1 : Cut) (n + 1)|) :=
  (summable_nat_add_iff 1).mpr (cosTermC_abs_summable 1)

/-- Termwise sine majorant near 0: for `|h| ≤ 1`, `|sinTermC h n| ≤ |h| · |sinTermC 1 n|`. -/
theorem sinTermC_abs_le_mul (h : Cut) (hh : |h| ≤ 1) (n : ℕ) :
    |sinTermC h n| ≤ |h| * |sinTermC (1 : Cut) n| := by
  rw [sinTermC_abs_eq, sinTermC_abs_eq]
  have h1 : |(1 : Cut)| ^ (2 * n + 1) = 1 := by simp
  rw [h1]
  have hpow : |h| ^ (2 * n + 1) ≤ |h| := by
    calc |h| ^ (2 * n + 1) = |h| * |h| ^ (2 * n) := by rw [pow_succ]; ring
      _ ≤ |h| * 1 := by
          apply mul_le_mul_of_nonneg_left _ (abs_nonneg h)
          exact pow_le_one₀ (abs_nonneg h) hh
      _ = |h| := mul_one _
  have hfac : (0 : Cut) < ((2 * n + 1).factorial : Cut) := by positivity
  rw [mul_one_div, div_le_div_iff₀ hfac hfac]
  nlinarith [hpow, hfac, abs_nonneg h]

/-- Termwise (shifted) cosine majorant near 0: for `|h| ≤ 1`,
    `|cosTermC h (n+1)| ≤ |h| · |cosTermC 1 (n+1)|`. -/
theorem cosTermC_abs_le_mul (h : Cut) (hh : |h| ≤ 1) (n : ℕ) :
    |cosTermC h (n + 1)| ≤ |h| * |cosTermC (1 : Cut) (n + 1)| := by
  rw [cosTermC_abs_eq, cosTermC_abs_eq]
  have h1 : |(1 : Cut)| ^ (2 * (n + 1)) = 1 := by simp
  rw [h1]
  have hpow : |h| ^ (2 * (n + 1)) ≤ |h| := by
    have he : 2 * (n + 1) = (2 * n + 1) + 1 := by ring
    calc |h| ^ (2 * (n + 1)) = |h| * |h| ^ (2 * n + 1) := by rw [he, pow_succ]; ring
      _ ≤ |h| * 1 := by
          apply mul_le_mul_of_nonneg_left _ (abs_nonneg h)
          exact pow_le_one₀ (abs_nonneg h) hh
      _ = |h| := mul_one _
  have hfac : (0 : Cut) < ((2 * (n + 1)).factorial : Cut) := by positivity
  rw [mul_one_div, div_le_div_iff₀ hfac hfac]
  nlinarith [hpow, hfac, abs_nonneg h]

/-- Two-sided sine bound near 0: for `|h| ≤ 1`, `-(|h|·sinAbsSum) ≤ cutSin h ≤ |h|·sinAbsSum`. -/
theorem cutSin_abs_bound (h : Cut) (hh : |h| ≤ 1) :
    cutSin h ≤ |h| * sinAbsSum ∧ -(|h| * sinAbsSum) ≤ cutSin h := by
  have hmajsum : Summable (fun n => |h| * |sinTermC (1 : Cut) n|) := sinAbsSum_summable.mul_left |h|
  have hmid : (∑' n, |sinTermC h n|) ≤ |h| * sinAbsSum := by
    have h1 : (∑' n, |sinTermC h n|) ≤ ∑' n, |h| * |sinTermC (1 : Cut) n| :=
      (sinTermC_abs_summable h).tsum_le_tsum (sinTermC_abs_le_mul h hh) hmajsum
    rw [sinAbsSum_summable.tsum_mul_left] at h1
    exact h1
  constructor
  · calc cutSin h = ∑' n, sinTermC h n := rfl
      _ ≤ ∑' n, |sinTermC h n| :=
          (sinTermC_summable h).tsum_le_tsum (fun n => le_abs_self _) (sinTermC_abs_summable h)
      _ ≤ |h| * sinAbsSum := hmid
  · have hneg : -cutSin h ≤ |h| * sinAbsSum := by
      calc -cutSin h = ∑' n, -(sinTermC h n) := by rw [tsum_neg]; rfl
        _ ≤ ∑' n, |sinTermC h n| :=
            ((sinTermC_summable h).neg).tsum_le_tsum (fun n => neg_le_abs _) (sinTermC_abs_summable h)
        _ ≤ |h| * sinAbsSum := hmid
    linarith

/-- Two-sided cosine bound near 0: for `|h| ≤ 1`,
    `1 - |h|·cosAbsSumTail ≤ cutCos h ≤ 1 + |h|·cosAbsSumTail`. -/
theorem cutCos_abs_bound (h : Cut) (hh : |h| ≤ 1) :
    cutCos h ≤ 1 + |h| * cosAbsSumTail ∧ 1 - |h| * cosAbsSumTail ≤ cutCos h := by
  have hsplit : cutCos h = 1 + ∑' n, cosTermC h (n + 1) := by
    have hz := (cosTermC_summable h).tsum_eq_zero_add
    have h0 : cosTermC h 0 = 1 := by unfold cosTermC; simp
    rw [h0] at hz; exact hz
  have hshiftsumm : Summable (fun n => cosTermC h (n + 1)) :=
    (summable_nat_add_iff 1).mpr (cosTermC_summable h)
  have hshiftabs : Summable (fun n => |cosTermC h (n + 1)|) :=
    (summable_nat_add_iff 1).mpr (cosTermC_abs_summable h)
  have hmajsum : Summable (fun n => |h| * |cosTermC (1 : Cut) (n + 1)|) :=
    cosAbsSumTail_summable.mul_left |h|
  have hmid : (∑' n, |cosTermC h (n + 1)|) ≤ |h| * cosAbsSumTail := by
    have h1 : (∑' n, |cosTermC h (n + 1)|) ≤ ∑' n, |h| * |cosTermC (1 : Cut) (n + 1)| :=
      hshiftabs.tsum_le_tsum (cosTermC_abs_le_mul h hh) hmajsum
    rw [cosAbsSumTail_summable.tsum_mul_left] at h1
    exact h1
  constructor
  · have : (∑' n, cosTermC h (n + 1)) ≤ |h| * cosAbsSumTail :=
      le_trans (hshiftsumm.tsum_le_tsum (fun n => le_abs_self _) hshiftabs) hmid
    rw [hsplit]; linarith
  · have hneg : -(∑' n, cosTermC h (n + 1)) ≤ |h| * cosAbsSumTail := by
      calc -(∑' n, cosTermC h (n + 1)) = ∑' n, -(cosTermC h (n + 1)) := by rw [tsum_neg]
        _ ≤ ∑' n, |cosTermC h (n + 1)| :=
            (hshiftsumm.neg).tsum_le_tsum (fun n => neg_le_abs _) hshiftabs
        _ ≤ |h| * cosAbsSumTail := hmid
    rw [hsplit]; linarith

/-- `cutSin` is continuous at `0`, by squeezing between `∓|h|·sinAbsSum` (both `→ 0`). -/
theorem cutSin_continuousAt_zero : ContinuousAt cutSin 0 := by
  rw [ContinuousAt, cutSin_zero]
  have hupp : Tendsto (fun h : Cut => |h| * sinAbsSum) (𝓝 0) (𝓝 0) := by
    have : Tendsto (fun h : Cut => |h| * sinAbsSum) (𝓝 0) (𝓝 (|(0 : Cut)| * sinAbsSum)) :=
      (continuous_abs.tendsto 0).mul tendsto_const_nhds
    simpa using this
  have hlow : Tendsto (fun h : Cut => -(|h| * sinAbsSum)) (𝓝 0) (𝓝 0) := by
    have := hupp.neg; simpa using this
  have hnbhd : ∀ᶠ h : Cut in 𝓝 0, |h| ≤ 1 := by
    have h01 : |(0 : Cut)| < 1 := by simp
    exact (continuous_abs.tendsto (0 : Cut)).eventually_le_const h01
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hlow hupp
  · filter_upwards [hnbhd] with h hb using (cutSin_abs_bound h hb).2
  · filter_upwards [hnbhd] with h hb using (cutSin_abs_bound h hb).1

/-- `cutCos` is continuous at `0`, by squeezing between `1 ∓ |h|·cosAbsSumTail` (both `→ 1`). -/
theorem cutCos_continuousAt_zero : ContinuousAt cutCos 0 := by
  rw [ContinuousAt, cutCos_zero]
  have hupp : Tendsto (fun h : Cut => 1 + |h| * cosAbsSumTail) (𝓝 0) (𝓝 1) := by
    have : Tendsto (fun h : Cut => 1 + |h| * cosAbsSumTail) (𝓝 0)
        (𝓝 (1 + |(0 : Cut)| * cosAbsSumTail)) :=
      tendsto_const_nhds.add ((continuous_abs.tendsto 0).mul tendsto_const_nhds)
    simpa using this
  have hlow : Tendsto (fun h : Cut => 1 - |h| * cosAbsSumTail) (𝓝 0) (𝓝 1) := by
    have : Tendsto (fun h : Cut => 1 - |h| * cosAbsSumTail) (𝓝 0)
        (𝓝 (1 - |(0 : Cut)| * cosAbsSumTail)) :=
      tendsto_const_nhds.sub ((continuous_abs.tendsto 0).mul tendsto_const_nhds)
    simpa using this
  have hnbhd : ∀ᶠ h : Cut in 𝓝 0, |h| ≤ 1 := by
    have h01 : |(0 : Cut)| < 1 := by simp
    exact (continuous_abs.tendsto (0 : Cut)).eventually_le_const h01
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hlow hupp
  · filter_upwards [hnbhd] with h hb using (cutCos_abs_bound h hb).2
  · filter_upwards [hnbhd] with h hb using (cutCos_abs_bound h hb).1

/-- ★ `cutCos` is continuous everywhere, via the addition formula (the `cutExp_continuous` pattern). -/
theorem cutCos_continuous : Continuous cutCos := by
  rw [continuous_iff_continuousAt]; intro x₀
  have hfun : cutCos = fun x => cutCos x₀ * cutCos (x - x₀) - cutSin x₀ * cutSin (x - x₀) := by
    funext x; rw [← cutCos_add]; congr 1; ring
  rw [hfun]
  have hsub : ContinuousAt (fun x : Cut => x - x₀) x₀ :=
    (continuous_id.sub continuous_const).continuousAt
  have hc : ContinuousAt (fun x : Cut => cutCos (x - x₀)) x₀ := by
    have : ContinuousAt (cutCos ∘ (fun x : Cut => x - x₀)) x₀ := by
      apply ContinuousAt.comp _ hsub; rw [sub_self]; exact cutCos_continuousAt_zero
    exact this
  have hs : ContinuousAt (fun x : Cut => cutSin (x - x₀)) x₀ := by
    have : ContinuousAt (cutSin ∘ (fun x : Cut => x - x₀)) x₀ := by
      apply ContinuousAt.comp _ hsub; rw [sub_self]; exact cutSin_continuousAt_zero
    exact this
  exact (continuousAt_const.mul hc).sub (continuousAt_const.mul hs)

/-- ★ `cutSin` is continuous everywhere, via the addition formula. -/
theorem cutSin_continuous : Continuous cutSin := by
  rw [continuous_iff_continuousAt]; intro x₀
  have hfun : cutSin = fun x => cutSin x₀ * cutCos (x - x₀) + cutCos x₀ * cutSin (x - x₀) := by
    funext x; rw [← cutSin_add]; congr 1; ring
  rw [hfun]
  have hsub : ContinuousAt (fun x : Cut => x - x₀) x₀ :=
    (continuous_id.sub continuous_const).continuousAt
  have hc : ContinuousAt (fun x : Cut => cutCos (x - x₀)) x₀ := by
    have : ContinuousAt (cutCos ∘ (fun x : Cut => x - x₀)) x₀ := by
      apply ContinuousAt.comp _ hsub; rw [sub_self]; exact cutCos_continuousAt_zero
    exact this
  have hs : ContinuousAt (fun x : Cut => cutSin (x - x₀)) x₀ := by
    have : ContinuousAt (cutSin ∘ (fun x : Cut => x - x₀)) x₀ := by
      apply ContinuousAt.comp _ hsub; rw [sub_self]; exact cutSin_continuousAt_zero
    exact this
  exact (continuousAt_const.mul hc).add (continuousAt_const.mul hs)

/-! ## (2) THE SIGN CHANGE `cutCos 2 < 0` (head/tail split + geometric majorant). -/

/-- Termwise geometric majorant for the `n ≥ 2` cosine tail at `x = 2`:
    `|cosTermC 2 (n+2)| ≤ (2/3)·(2/15)^n`. The ratio `2²/((2n+5)(2n+6)) ≤ 2/15` for all `n`. -/
theorem cos2_tail_termbound (n : ℕ) :
    |cosTermC (2 : Cut) (n + 2)| ≤ (2 / 3) * (2 / 15) ^ n := by
  rw [cosTermC_abs_eq]
  have habs2 : |(2 : Cut)| = 2 := by norm_num
  rw [habs2]
  induction n with
  | zero => norm_num [Nat.factorial]
  | succ k ih =>
    have hfk : (0 : Cut) < ((2 * (k + 2)).factorial : Cut) := by positivity
    have hstep : (2 : Cut) ^ (2 * (k + 1 + 2)) / ((2 * (k + 1 + 2)).factorial : Cut)
        = ((2 : Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut))
          * (4 / (((2 * k + 5) * (2 * k + 6) : ℕ) : Cut)) := by
      have he : 2 * (k + 1 + 2) = 2 * (k + 2) + 2 := by ring
      have hfe : (2 * (k + 2) + 2).factorial
          = (2 * (k + 2)).factorial * ((2 * k + 5) * (2 * k + 6)) := by
        rw [Nat.factorial_succ, Nat.factorial_succ]; ring_nf
      rw [he, hfe]
      push_cast
      have hne : ((2 * (k + 2)).factorial : Cut) ≠ 0 := ne_of_gt hfk
      have hne2 : ((2 * k + 5 : ℕ) : Cut) ≠ 0 := by positivity
      have hne3 : ((2 * k + 6 : ℕ) : Cut) ≠ 0 := by positivity
      push_cast at hne2 hne3
      field_simp
      ring
    rw [hstep]
    have hratio : (4 : Cut) / (((2 * k + 5) * (2 * k + 6) : ℕ) : Cut) ≤ 2 / 15 := by
      rw [div_le_div_iff₀ (by positivity) (by norm_num)]
      have hge : ((2 * k + 5 : ℕ) : Cut) * ((2 * k + 6 : ℕ) : Cut) ≥ 5 * 6 := by
        have h5 : (5 : Cut) ≤ ((2 * k + 5 : ℕ) : Cut) := by push_cast; nlinarith [Nat.zero_le k]
        have h6 : (6 : Cut) ≤ ((2 * k + 6 : ℕ) : Cut) := by push_cast; nlinarith [Nat.zero_le k]
        nlinarith [h5, h6, (by positivity : (0 : Cut) ≤ ((2 * k + 5 : ℕ) : Cut))]
      push_cast at hge ⊢
      nlinarith [hge]
    have htermnn : (0 : Cut) ≤ (2 : Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut) := by
      positivity
    calc ((2 : Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut))
          * (4 / (((2 * k + 5) * (2 * k + 6) : ℕ) : Cut))
        ≤ ((2 : Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut)) * (2 / 15) :=
          mul_le_mul_of_nonneg_left hratio htermnn
      _ ≤ ((2 / 3) * (2 / 15) ^ k) * (2 / 15) := by
          apply mul_le_mul_of_nonneg_right _ (by norm_num); exact ih
      _ = (2 / 3) * (2 / 15) ^ (k + 1) := by rw [pow_succ]; ring

/-- The geometric majorant value bound: `∑' n, (2/3)·(2/15)^n ≤ 10/13`. -/
theorem cos2_geo_value : (∑' n, (2 / 3 : Cut) * (2 / 15) ^ n) ≤ 10 / 13 := by
  have hgeo : Summable (fun n => (2 / 15 : Cut) ^ n) :=
    cut_summable_geometric (by norm_num) (by norm_num)
  rw [hgeo.tsum_mul_left]
  have hgv : (∑' n, (2 / 15 : Cut) ^ n) ≤ 15 / 13 := by
    apply hgeo.tsum_le_of_sum_le
    intro s
    obtain ⟨N, hN⟩ : ∃ N, s ⊆ Finset.range N :=
      ⟨(s.sup id) + 1, fun a ha => Finset.mem_range.2 (Nat.lt_succ_of_le (Finset.le_sup (f := id) ha))⟩
    have hmono : ∑ i ∈ s, (2 / 15 : Cut) ^ i ≤ ∑ i ∈ range N, (2 / 15 : Cut) ^ i :=
      Finset.sum_le_sum_of_subset_of_nonneg hN (fun i _ _ => by positivity)
    have htel := cut_geom_telescope (2 / 15 : Cut) N
    have hpow : (0 : Cut) ≤ (2 / 15 : Cut) ^ N := by positivity
    have hle1 : (1 - 2 / 15) * ∑ i ∈ range N, (2 / 15 : Cut) ^ i ≤ 1 := by rw [htel]; nlinarith [hpow]
    nlinarith [hmono, hle1]
  nlinarith [hgv]

/-- ★ THE SIGN CHANGE `cutCos 2 < 0`. Head/tail split at `n = 2`: the head `1 + (−2) = −1`, and the
    `n ≥ 2` tail is bounded in magnitude by the geometric majorant `≤ 10/13 < 1`, so
    `cutCos 2 ≤ −1 + 10/13 = −3/13 < 0`. -/
theorem cutCos_two_neg : cutCos (2 : Cut) < 0 := by
  have hsplit : cutCos (2 : Cut)
      = (∑ i ∈ range 2, cosTermC (2 : Cut) i) + ∑' n, cosTermC (2 : Cut) (n + 2) := by
    unfold cutCos
    exact ((cosTermC_summable 2).sum_add_tsum_nat_add 2).symm
  have hhead : (∑ i ∈ range 2, cosTermC (2 : Cut) i) = -1 := by
    rw [Finset.sum_range_succ, Finset.sum_range_one]
    unfold cosTermC; norm_num
  have hshiftsumm : Summable (fun n => cosTermC (2 : Cut) (n + 2)) :=
    (summable_nat_add_iff 2).mpr (cosTermC_summable 2)
  have habssumm : Summable (fun n => |cosTermC (2 : Cut) (n + 2)|) :=
    (summable_nat_add_iff 2).mpr (cosTermC_abs_summable 2)
  have hgeomaj : Summable (fun n => (2 / 3 : Cut) * (2 / 15) ^ n) :=
    (cut_summable_geometric (by norm_num) (by norm_num)).mul_left _
  have htailbound : ∑' n, cosTermC (2 : Cut) (n + 2) ≤ 10 / 13 := by
    calc ∑' n, cosTermC (2 : Cut) (n + 2)
        ≤ ∑' n, |cosTermC (2 : Cut) (n + 2)| :=
          hshiftsumm.tsum_le_tsum (fun n => le_abs_self _) habssumm
      _ ≤ ∑' n, (2 / 3 : Cut) * (2 / 15) ^ n := habssumm.tsum_le_tsum cos2_tail_termbound hgeomaj
      _ ≤ 10 / 13 := cos2_geo_value
  rw [hsplit, hhead]
  linarith [htailbound]

/-! ## (3) THE DERIVED `cutPi`: twice the least positive zero of `cutCos`, via the IVT + infimum. -/

/-- The zero set of `cutCos` in `[0,2]`. -/
def cosZeroSet : Set Cut := {x : Cut | x ∈ Icc (0 : Cut) 2 ∧ cutCos x = 0}

/-- The zero set is NONEMPTY: `cutCos 2 ≤ 0 ≤ cutCos 0`, so the IVT on `[0,2]` supplies a zero. -/
theorem cosZeroSet_nonempty : cosZeroSet.Nonempty := by
  have h02 : (0 : Cut) ≤ 2 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) 2) := cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos 2) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_two_neg, by norm_num⟩
  obtain ⟨x, hx, hxval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  exact ⟨x, hx, hxval⟩

/-- The zero set is CLOSED (a continuous preimage of `{0}` intersected with a closed interval). -/
theorem cosZeroSet_closed : IsClosed cosZeroSet := by
  have h1 : IsClosed (Icc (0 : Cut) 2) := isClosed_Icc
  have h2 : IsClosed {x : Cut | cutCos x = 0} := by
    have : {x : Cut | cutCos x = 0} = cutCos ⁻¹' {0} := rfl
    rw [this]; exact isClosed_singleton.preimage cutCos_continuous
  have hset : cosZeroSet = Icc (0 : Cut) 2 ∩ {x : Cut | cutCos x = 0} := by
    ext x; simp [cosZeroSet, Set.mem_inter_iff]
  rw [hset]; exact h1.inter h2

/-- The zero set is BOUNDED BELOW (by `0`). -/
theorem cosZeroSet_bddBelow : BddBelow cosZeroSet := ⟨0, fun _ hx => hx.1.1⟩

/-- The LEAST zero of `cutCos` — attained by continuity + completeness (`IsClosed.csInf_mem`). -/
def leastCosZero : Cut := sInf cosZeroSet

theorem leastCosZero_mem : leastCosZero ∈ cosZeroSet :=
  cosZeroSet_closed.csInf_mem cosZeroSet_nonempty cosZeroSet_bddBelow

theorem leastCosZero_cos : cutCos leastCosZero = 0 := leastCosZero_mem.2

theorem leastCosZero_nonneg : 0 ≤ leastCosZero := leastCosZero_mem.1.1

/-- The least zero is STRICTLY POSITIVE: `cutCos 0 = 1 ≠ 0`, so `0` is not a zero. -/
theorem leastCosZero_pos : 0 < leastCosZero := by
  rcases lt_or_eq_of_le leastCosZero_nonneg with h | h
  · exact h
  · exfalso
    have hc := leastCosZero_cos
    rw [← h, cutCos_zero] at hc
    norm_num at hc

/-- ★★ THE DERIVED `cutPi` over the derived ℝ: TWICE the least positive zero of the derived cosine.
    CONSTRUCTED (not imported): the Gauss-sphere circumference the scale tower `e^(−Nπ)` is expressed in,
    forced by the Born-circle orbit reaching the sine axis. -/
def cutPi : Cut := 2 * leastCosZero

/-- ★ `cutPi > 0`. -/
theorem cutPi_pos : 0 < cutPi := by
  unfold cutPi; have := leastCosZero_pos; linarith

/-- ★ `cutCos (cutPi/2) = 0`: the quarter-turn lands on the sine axis. -/
theorem cutCos_cutPi_half : cutCos (cutPi / 2) = 0 := by
  unfold cutPi
  rw [show (2 * leastCosZero) / 2 = leastCosZero by ring]
  exact leastCosZero_cos

/-! ## (4) PERIODICITY — all from `cutCos(cutPi/2)=0` + the banked Pythagorean identity + addition
    formulas, with NO sign-of-sine argument. -/

/-- `cutSin (cutPi/2)² = 1`: the orbit at the quarter-turn is on the sine axis (Pythagorean). -/
theorem cutSin_cutPi_half_sq : cutSin (cutPi / 2) * cutSin (cutPi / 2) = 1 := by
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 2)
  rw [cutCos_cutPi_half] at hp
  linarith [hp]

/-- ★ `cutCos cutPi = −1` (the half-turn), from the addition formula + the Pythagorean identity. -/
theorem cutCos_cutPi : cutCos cutPi = -1 := by
  have hhalf : cutPi = cutPi / 2 + cutPi / 2 := by ring
  rw [hhalf, cutCos_add, cutCos_cutPi_half]
  have hsq := cutSin_cutPi_half_sq
  rw [hsq]; ring

/-- ★ `cutSin cutPi = 0`, from the addition formula. -/
theorem cutSin_cutPi : cutSin cutPi = 0 := by
  have hhalf : cutPi = cutPi / 2 + cutPi / 2 := by ring
  rw [hhalf, cutSin_add, cutCos_cutPi_half]
  ring

/-- ★ SHIFT: `cutCos (x + cutPi) = −cutCos x`. -/
theorem cutCos_add_cutPi (x : Cut) : cutCos (x + cutPi) = -cutCos x := by
  rw [cutCos_add, cutCos_cutPi, cutSin_cutPi]; ring

/-- ★ SHIFT: `cutSin (x + cutPi) = −cutSin x`. -/
theorem cutSin_add_cutPi (x : Cut) : cutSin (x + cutPi) = -cutSin x := by
  rw [cutSin_add, cutCos_cutPi, cutSin_cutPi]; ring

/-- ★ FULL PERIOD: `cutCos (x + (cutPi + cutPi)) = cutCos x`. -/
theorem cutCos_add_two_cutPi (x : Cut) : cutCos (x + (cutPi + cutPi)) = cutCos x := by
  rw [show x + (cutPi + cutPi) = (x + cutPi) + cutPi by ring, cutCos_add_cutPi, cutCos_add_cutPi]; ring

/-- ★ FULL PERIOD: `cutSin (x + (cutPi + cutPi)) = cutSin x`. -/
theorem cutSin_add_two_cutPi (x : Cut) : cutSin (x + (cutPi + cutPi)) = cutSin x := by
  rw [show x + (cutPi + cutPi) = (x + cutPi) + cutPi by ring, cutSin_add_cutPi, cutSin_add_cutPi]; ring

/-! ## NON-VACUITY (W8): the periodicity values are the genuine forced ones. -/

/-- NON-VACUITY: `cutCos cutPi = −1` is a concrete forced value (not `0`, not `1`) — witnessing the
    half-turn is genuine. A WRONG value (e.g. `cutCos cutPi = 1`) contradicts this. -/
theorem cutCos_cutPi_eq_neg_one : cutCos cutPi = -1 := cutCos_cutPi

end

end ContinuumQ
end Phys.Foundation
