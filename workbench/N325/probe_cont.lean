import Phys.Foundation.ContinuumTrigAdd
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Order.IntermediateValue

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

/-- Fixed nonneg constant: the absolute sine series at 1. -/
def sinAbsSum : Cut := ∑' n, |sinTermC (1:Cut) n|
/-- Fixed nonneg constant: the shifted absolute cosine series at 1. -/
def cosAbsSumTail : Cut := ∑' n, |cosTermC (1:Cut) (n+1)|

theorem sinAbsSum_summable : Summable (fun n => |sinTermC (1:Cut) n|) := sinTermC_abs_summable 1
theorem cosAbsSumTail_summable : Summable (fun n => |cosTermC (1:Cut) (n+1)|) :=
  (summable_nat_add_iff 1).mpr (cosTermC_abs_summable 1)

/-- termwise sine majorant: for |h| ≤ 1, |sinTermC h n| ≤ |h| · |sinTermC 1 n|. -/
theorem sinTermC_abs_le_mul (h : Cut) (hh : |h| ≤ 1) (n : ℕ) :
    |sinTermC h n| ≤ |h| * |sinTermC (1:Cut) n| := by
  rw [sinTermC_abs_eq, sinTermC_abs_eq]
  have h1 : |(1:Cut)| ^ (2 * n + 1) = 1 := by simp
  rw [h1]
  have hpow : |h| ^ (2 * n + 1) ≤ |h| := by
    calc |h| ^ (2 * n + 1) = |h| * |h| ^ (2 * n) := by rw [pow_succ]; ring
      _ ≤ |h| * 1 := by
          apply mul_le_mul_of_nonneg_left _ (abs_nonneg h)
          exact pow_le_one₀ (abs_nonneg h) hh
      _ = |h| := mul_one _
  have hfac : (0:Cut) < ((2 * n + 1).factorial : Cut) := by positivity
  rw [mul_one_div, div_le_div_iff₀ hfac hfac]
  nlinarith [hpow, hfac, abs_nonneg h]

/-- termwise (shifted) cosine majorant: for |h| ≤ 1, |cosTermC h (n+1)| ≤ |h| · |cosTermC 1 (n+1)|. -/
theorem cosTermC_abs_le_mul (h : Cut) (hh : |h| ≤ 1) (n : ℕ) :
    |cosTermC h (n+1)| ≤ |h| * |cosTermC (1:Cut) (n+1)| := by
  rw [cosTermC_abs_eq, cosTermC_abs_eq]
  have h1 : |(1:Cut)| ^ (2 * (n+1)) = 1 := by simp
  rw [h1]
  have hpow : |h| ^ (2 * (n+1)) ≤ |h| := by
    have he : 2 * (n+1) = (2 * n + 1) + 1 := by ring
    calc |h| ^ (2 * (n+1)) = |h| * |h| ^ (2 * n + 1) := by rw [he, pow_succ]; ring
      _ ≤ |h| * 1 := by
          apply mul_le_mul_of_nonneg_left _ (abs_nonneg h)
          exact pow_le_one₀ (abs_nonneg h) hh
      _ = |h| := mul_one _
  have hfac : (0:Cut) < ((2 * (n+1)).factorial : Cut) := by positivity
  rw [mul_one_div, div_le_div_iff₀ hfac hfac]
  nlinarith [hpow, hfac, abs_nonneg h]

/-- Two-sided sine bound near 0: for |h| ≤ 1, -(|h|·sinAbsSum) ≤ cutSin h ≤ |h|·sinAbsSum. -/
theorem cutSin_abs_bound (h : Cut) (hh : |h| ≤ 1) :
    cutSin h ≤ |h| * sinAbsSum ∧ -(|h| * sinAbsSum) ≤ cutSin h := by
  have hmajsum : Summable (fun n => |h| * |sinTermC (1:Cut) n|) := sinAbsSum_summable.mul_left |h|
  have hmid : (∑' n, |sinTermC h n|) ≤ |h| * sinAbsSum := by
    have h1 : (∑' n, |sinTermC h n|) ≤ ∑' n, |h| * |sinTermC (1:Cut) n| :=
      (sinTermC_abs_summable h).tsum_le_tsum (sinTermC_abs_le_mul h hh) hmajsum
    rw [sinAbsSum_summable.tsum_mul_left] at h1
    exact h1
  constructor
  · calc cutSin h = ∑' n, sinTermC h n := rfl
      _ ≤ ∑' n, |sinTermC h n| :=
          (sinTermC_summable h).tsum_le_tsum (fun n => le_abs_self _) (sinTermC_abs_summable h)
      _ ≤ |h| * sinAbsSum := hmid
  · have hneg : -cutSin h ≤ |h| * sinAbsSum := by
      calc -cutSin h = ∑' n, -(sinTermC h n) := by
            rw [tsum_neg]; rfl
        _ ≤ ∑' n, |sinTermC h n| :=
            ((sinTermC_summable h).neg).tsum_le_tsum (fun n => neg_le_abs _) (sinTermC_abs_summable h)
        _ ≤ |h| * sinAbsSum := hmid
    linarith

/-- Two-sided cosine bound near 0: for |h| ≤ 1, 1 - |h|·cosAbsSumTail ≤ cutCos h ≤ 1 + |h|·cosAbsSumTail. -/
theorem cutCos_abs_bound (h : Cut) (hh : |h| ≤ 1) :
    cutCos h ≤ 1 + |h| * cosAbsSumTail ∧ 1 - |h| * cosAbsSumTail ≤ cutCos h := by
  have hsplit : cutCos h = 1 + ∑' n, cosTermC h (n+1) := by
    have := (cosTermC_summable h).tsum_eq_zero_add
    have h0 : cosTermC h 0 = 1 := by unfold cosTermC; simp
    rw [h0] at this; exact this
  have hshiftsumm : Summable (fun n => cosTermC h (n+1)) :=
    (summable_nat_add_iff 1).mpr (cosTermC_summable h)
  have hshiftabs : Summable (fun n => |cosTermC h (n+1)|) :=
    (summable_nat_add_iff 1).mpr (cosTermC_abs_summable h)
  have hmajsum : Summable (fun n => |h| * |cosTermC (1:Cut) (n+1)|) := cosAbsSumTail_summable.mul_left |h|
  have hmid : (∑' n, |cosTermC h (n+1)|) ≤ |h| * cosAbsSumTail := by
    have h1 : (∑' n, |cosTermC h (n+1)|) ≤ ∑' n, |h| * |cosTermC (1:Cut) (n+1)| :=
      hshiftabs.tsum_le_tsum (cosTermC_abs_le_mul h hh) hmajsum
    rw [cosAbsSumTail_summable.tsum_mul_left] at h1
    exact h1
  constructor
  · have : (∑' n, cosTermC h (n+1)) ≤ |h| * cosAbsSumTail :=
      le_trans (hshiftsumm.tsum_le_tsum (fun n => le_abs_self _) hshiftabs) hmid
    rw [hsplit]; linarith
  · have hneg : -(∑' n, cosTermC h (n+1)) ≤ |h| * cosAbsSumTail := by
      calc -(∑' n, cosTermC h (n+1)) = ∑' n, -(cosTermC h (n+1)) := by rw [tsum_neg]
        _ ≤ ∑' n, |cosTermC h (n+1)| :=
            (hshiftsumm.neg).tsum_le_tsum (fun n => neg_le_abs _) hshiftabs
        _ ≤ |h| * cosAbsSumTail := hmid
    rw [hsplit]; linarith

/-- cutSin continuous at 0. -/
theorem cutSin_continuousAt_zero : ContinuousAt cutSin 0 := by
  rw [ContinuousAt, cutSin_zero]
  have hupp : Tendsto (fun h : Cut => |h| * sinAbsSum) (𝓝 0) (𝓝 0) := by
    have : Tendsto (fun h : Cut => |h| * sinAbsSum) (𝓝 0) (𝓝 (|(0:Cut)| * sinAbsSum)) :=
      (continuous_abs.tendsto 0).mul tendsto_const_nhds
    simpa using this
  have hlow : Tendsto (fun h : Cut => -(|h| * sinAbsSum)) (𝓝 0) (𝓝 0) := by
    have := hupp.neg; simpa using this
  have hnbhd : ∀ᶠ h : Cut in 𝓝 0, |h| ≤ 1 := by
    have h01 : |(0:Cut)| < 1 := by simp
    exact (continuous_abs.tendsto (0:Cut)).eventually_le_const h01
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hlow hupp
  · filter_upwards [hnbhd] with h hb using (cutSin_abs_bound h hb).2
  · filter_upwards [hnbhd] with h hb using (cutSin_abs_bound h hb).1

/-- cutCos continuous at 0. -/
theorem cutCos_continuousAt_zero : ContinuousAt cutCos 0 := by
  rw [ContinuousAt, cutCos_zero]
  have hupp : Tendsto (fun h : Cut => 1 + |h| * cosAbsSumTail) (𝓝 0) (𝓝 1) := by
    have : Tendsto (fun h : Cut => 1 + |h| * cosAbsSumTail) (𝓝 0) (𝓝 (1 + |(0:Cut)| * cosAbsSumTail)) :=
      tendsto_const_nhds.add ((continuous_abs.tendsto 0).mul tendsto_const_nhds)
    simpa using this
  have hlow : Tendsto (fun h : Cut => 1 - |h| * cosAbsSumTail) (𝓝 0) (𝓝 1) := by
    have : Tendsto (fun h : Cut => 1 - |h| * cosAbsSumTail) (𝓝 0) (𝓝 (1 - |(0:Cut)| * cosAbsSumTail)) :=
      tendsto_const_nhds.sub ((continuous_abs.tendsto 0).mul tendsto_const_nhds)
    simpa using this
  have hnbhd : ∀ᶠ h : Cut in 𝓝 0, |h| ≤ 1 := by
    have h01 : |(0:Cut)| < 1 := by simp
    exact (continuous_abs.tendsto (0:Cut)).eventually_le_const h01
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hlow hupp
  · filter_upwards [hnbhd] with h hb using (cutCos_abs_bound h hb).2
  · filter_upwards [hnbhd] with h hb using (cutCos_abs_bound h hb).1

/-- cutCos continuous everywhere via the addition formula. -/
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

/-- cutSin continuous everywhere via the addition formula. -/
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

end
end ContinuumQ
end Phys.Foundation
