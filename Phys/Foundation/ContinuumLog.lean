/-
# N175 — THE CONTINUOUS LOGARITHM `cutLog` AND THE CONTINUOUS REAL POWER `cutRpow`
  over the DERIVED ℝ `Cut` (the number-tower continuous power)

This file banks the inverse of the banked continuous exponential `cutExp` (N174) on the
positives, and from it the genuine continuous real power `cutRpow x p := cutExp (p · cutLog x)`.

Everything here is DERIVED from the derived ℝ `Cut` (N33–N37: a
`ConditionallyCompleteLinearOrder` / `Archimedean` / `CompleteSpace` / `Field` / `OrderTopology`)
and the banked `cutExp` (N174: `cutExp x = ∑' n, xⁿ/n!`, with `cutExp_zero`, the homomorphism
law `cutExp_add`, invertibility `cutExp_mul_neg`, Born positivity `cutExp_pos`). The only Mathlib
used is the topological-order / intermediate-value MACHINERY operating ON the derived `Cut`
(`intermediate_value_Icc`, `Tendsto`, `continuous_abs`, squeeze) — NOT a Mathlib `Real.log` /
`Real.rpow` / `Real.exp` imported as content. This is the standing number-tower discipline
(STANDARD §3): the continuous power is OWED from the fold, never borrowed.

The forced ladder:
  1. `one_add_le_cutExp`        — `1 + t ≤ cutExp t` for `0 ≤ t` (the n=0,1 terms of a nonneg series)
  2. `cutExp_le_at_zero`        — a matching upper bound near 0 (geometric-tail majorant by `cutExp 1`)
  3. `cutExp_continuousAt_zero` — continuity at 0 by squeezing between `1 ± |h|·cutExp 1`
  4. `cutExp_continuous`        — continuity everywhere, from `cutExp (x₀+h) = cutExp x₀ · cutExp h`
  5. `cutExp_strictMono`        — strict monotonicity, from `cutExp_add` + `cutExp_pos` + `1+t ≤ cutExp t`
  6. `cutExp_surjOn_pos`        — surjectivity onto the positives, by the IVT on the complete `Cut`
  7. `cutLog`                   — the inverse on the positives (Classical.choose of surjectivity)
  8. `cutExp_cutLog`/`cutLog_cutExp`/`cutLog_one`/`cutLog_mul` — the inverse + homomorphism laws
  9. `cutRpow x p := cutExp (p · cutLog x)` — the continuous power, with `cutRpow_add`/`cutRpow_one`/
     `cutRpow_two`/`cutRpow_zero`/`cutRpow_pos`.

Physics-words-removable: there are NO physics words. Delete nothing physical — this is pure math
about `cutExp` over the completion-of-the-gather-of-closures of the derived rationals.
-/
import Phys.Foundation.ContinuumExp
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.Order.Group
import Mathlib.Topology.Order.IntermediateValue

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

/-- `1 + t ≤ cutExp t` for `0 ≤ t`: the n=0,1 partial sum bounds the whole nonnegative series. -/
theorem one_add_le_cutExp (t : Cut) (ht : 0 ≤ t) : 1 + t ≤ cutExp t := by
  have hnn : ∀ n, 0 ≤ expTermC t n := by intro n; unfold expTermC; positivity
  have hle := sum_le_hasSum (Finset.range 2) (fun i _ => hnn i) (cutExp_hasSum t)
  have hfin : ∑ i ∈ Finset.range 2, expTermC t i = 1 + t := by
    rw [Finset.sum_range_succ, Finset.sum_range_one]; unfold expTermC; simp
  rw [hfin] at hle; exact hle

/-- `1 ≤ cutExp t` for `0 ≤ t`. -/
theorem one_le_cutExp (t : Cut) (ht : 0 ≤ t) : 1 ≤ cutExp t := by
  have := one_add_le_cutExp t ht; linarith

/-- Near-zero upper bound: for `0 ≤ h ≤ 1`, `cutExp h ≤ 1 + h · cutExp 1`. The tail
    `∑' n, hⁿ⁺¹/(n+1)!` is majorized term-by-term by `h · (1ⁿ/n!) = h · expTermC 1 n`. -/
theorem cutExp_le_at_zero (h : Cut) (h0 : 0 ≤ h) (h1 : h ≤ 1) :
    cutExp h ≤ 1 + h * cutExp 1 := by
  have hsplit : cutExp h = expTermC h 0 + ∑' n, expTermC h (n+1) := by
    unfold cutExp; exact (expTermC_summable h).tsum_eq_zero_add
  have h00 : expTermC h 0 = 1 := by unfold expTermC; simp
  have htermle : ∀ n, expTermC h (n+1) ≤ h * expTermC 1 n := by
    intro n
    unfold expTermC
    rw [pow_succ]
    have hpow : h ^ n ≤ 1 := pow_le_one₀ h0 h1
    have hfac_pos : (0:Cut) < ((n+1).factorial : Cut) := by positivity
    have hnfac_pos : (0:Cut) < (n.factorial : Cut) := by positivity
    have hfac_ge : (n.factorial : Cut) ≤ ((n+1).factorial : Cut) := by
      have : (n.factorial : ℕ) ≤ ((n+1).factorial : ℕ) := Nat.factorial_le (Nat.le_succ n)
      exact_mod_cast this
    rw [one_pow, div_le_iff₀ hfac_pos]
    have hrw : h * (1 / (n.factorial : Cut)) * ((n+1).factorial : Cut)
         = h * (((n+1).factorial : Cut) / (n.factorial : Cut)) := by ring
    rw [hrw]
    have hratio : (1:Cut) ≤ ((n+1).factorial : Cut) / (n.factorial : Cut) := by
      rw [le_div_iff₀ hnfac_pos]; simpa using hfac_ge
    calc h ^ n * h ≤ 1 * h := mul_le_mul_of_nonneg_right hpow h0
      _ = h := one_mul h
      _ = h * 1 := (mul_one h).symm
      _ ≤ h * (((n+1).factorial : Cut) / (n.factorial : Cut)) :=
            mul_le_mul_of_nonneg_left hratio h0
  have hshift_summ : Summable (fun n => expTermC h (n+1)) :=
    (summable_nat_add_iff 1).mpr (expTermC_summable h)
  have hrhs_summ : Summable (fun n => h * expTermC 1 n) := (expTermC_summable 1).mul_left h
  have htail_le : ∑' n, expTermC h (n+1) ≤ ∑' n, h * expTermC 1 n :=
    hshift_summ.tsum_le_tsum htermle hrhs_summ
  have hmul : ∑' n, h * expTermC 1 n = h * cutExp 1 := by
    rw [(expTermC_summable 1).tsum_mul_left]; rfl
  rw [hmul] at htail_le
  rw [hsplit, h00]; linarith [htail_le]

/-- For `h ≤ 0`, `cutExp h ≤ 1` (reciprocal of `cutExp (-h) ≥ 1`). -/
theorem cutExp_le_one_of_nonpos (h : Cut) (hh : h ≤ 0) : cutExp h ≤ 1 := by
  have hneg : 0 ≤ -h := by linarith
  have h1 : 1 ≤ cutExp (-h) := one_le_cutExp (-h) hneg
  have hmul : cutExp h * cutExp (-h) = 1 := cutExp_mul_neg h
  have hpos : 0 < cutExp h := cutExp_pos h
  nlinarith [cutExp_pos (-h)]

/-- `cutExp` is continuous at 0, by squeezing between `1 - |h|·cutExp 1` and `1 + |h|·cutExp 1`,
    both tending to 1 as `h → 0`. -/
theorem cutExp_continuousAt_zero : ContinuousAt cutExp 0 := by
  set C : Cut := cutExp 1 with hC
  have hCpos : 0 < C := cutExp_pos 1
  have hupper : ∀ h : Cut, |h| ≤ 1 → cutExp h ≤ 1 + |h| * C := by
    intro h hb
    rcases le_or_gt 0 h with hpos | hneg
    · have : |h| = h := abs_of_nonneg hpos
      rw [this]; exact cutExp_le_at_zero h hpos (by rwa [abs_of_nonneg hpos] at hb)
    · have habs : |h| = -h := abs_of_neg hneg
      have h1 : cutExp h ≤ 1 := cutExp_le_one_of_nonpos h (le_of_lt hneg)
      have : (0:Cut) ≤ |h| * C := mul_nonneg (abs_nonneg h) (le_of_lt hCpos)
      linarith
  have hlower : ∀ h : Cut, |h| ≤ 1 → 1 - |h| * C ≤ cutExp h := by
    intro h hb
    rcases le_or_gt 0 h with hpos | hneg
    · have h1 : 1 ≤ cutExp h := one_le_cutExp h hpos
      have : (0:Cut) ≤ |h| * C := mul_nonneg (abs_nonneg h) (le_of_lt hCpos)
      linarith
    · have habs : |h| = -h := abs_of_neg hneg
      have hnh : 0 ≤ -h := by linarith
      have hub : cutExp (-h) ≤ 1 + (-h) * C := by
        rcases le_or_gt (-h) 1 with hle1 | hgt1
        · exact cutExp_le_at_zero (-h) hnh hle1
        · exfalso; rw [habs] at hb; linarith
      have hrecip : cutExp h * cutExp (-h) = 1 := cutExp_mul_neg h
      have hposh : 0 < cutExp h := cutExp_pos h
      have hposnh : 0 < cutExp (-h) := cutExp_pos (-h)
      rw [habs]
      have key : (1 - (-h) * C) * cutExp (-h) ≤ cutExp h * cutExp (-h) := by
        rw [hrecip]
        rcases le_or_gt (1 - (-h)*C) 0 with hneg2 | hpos2
        · have : (1 - (-h)*C) * cutExp (-h) ≤ 0 :=
            mul_nonpos_of_nonpos_of_nonneg hneg2 (le_of_lt hposnh)
          linarith
        · calc (1 - (-h)*C) * cutExp (-h) ≤ (1 - (-h)*C) * (1 + (-h)*C) := by
                apply mul_le_mul_of_nonneg_left hub (le_of_lt hpos2)
          _ = 1 - ((-h)*C)^2 := by ring
          _ ≤ 1 := by nlinarith [sq_nonneg ((-h)*C)]
      exact le_of_mul_le_mul_right key hposnh
  rw [ContinuousAt, cutExp_zero]
  have hg : Tendsto (fun h : Cut => 1 - |h| * C) (𝓝 0) (𝓝 1) := by
    have : Tendsto (fun h : Cut => 1 - |h| * C) (𝓝 0) (𝓝 (1 - |(0:Cut)| * C)) := by
      apply Tendsto.sub tendsto_const_nhds
      exact ((continuous_abs.tendsto 0).mul tendsto_const_nhds)
    simpa using this
  have hu : Tendsto (fun h : Cut => 1 + |h| * C) (𝓝 0) (𝓝 1) := by
    have : Tendsto (fun h : Cut => 1 + |h| * C) (𝓝 0) (𝓝 (1 + |(0:Cut)| * C)) := by
      apply Tendsto.add tendsto_const_nhds
      exact ((continuous_abs.tendsto 0).mul tendsto_const_nhds)
    simpa using this
  have hnbhd : ∀ᶠ h : Cut in 𝓝 0, |h| ≤ 1 := by
    have h01 : |(0:Cut)| < 1 := by simp
    exact (continuous_abs.tendsto (0:Cut)).eventually_le_const h01
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le' hg hu
  · filter_upwards [hnbhd] with h hb using hlower h hb
  · filter_upwards [hnbhd] with h hb using hupper h hb

/-- `cutExp` is continuous everywhere: `cutExp (x₀+h) = cutExp x₀ · cutExp h`, continuous at 0. -/
theorem cutExp_continuous : Continuous cutExp := by
  rw [continuous_iff_continuousAt]
  intro x₀
  have hfun : cutExp = fun x => cutExp x₀ * cutExp (x - x₀) := by
    funext x; rw [cutExp_add]; congr 1; ring
  rw [hfun]
  have hsub : ContinuousAt (fun x : Cut => x - x₀) x₀ :=
    (continuous_id.sub continuous_const).continuousAt
  have hcomp : ContinuousAt (fun x : Cut => cutExp (x - x₀)) x₀ := by
    have : ContinuousAt (cutExp ∘ (fun x : Cut => x - x₀)) x₀ := by
      apply ContinuousAt.comp _ hsub
      rw [sub_self]; exact cutExp_continuousAt_zero
    exact this
  exact continuousAt_const.mul hcomp

/-- STRICT MONOTONICITY of `cutExp`: `x < y → cutExp x < cutExp y`. -/
theorem cutExp_strictMono : StrictMono cutExp := by
  intro x y hxy
  have hd : 0 < y - x := by linarith
  have hgt1 : 1 < cutExp (y - x) := by
    have h := one_add_le_cutExp (y - x) (le_of_lt hd); linarith
  have hpos : 0 < cutExp x := cutExp_pos x
  have hmul : cutExp x * 1 < cutExp x * cutExp (y - x) := mul_lt_mul_of_pos_left hgt1 hpos
  have hadd : cutExp x * cutExp (y - x) = cutExp y := by rw [cutExp_add]; congr 1; ring
  rw [hadd, mul_one] at hmul; exact hmul

/-- SURJECTIVITY onto the positives: for any `y > 0`, there is `x` with `cutExp x = y`, via the
    IVT on the complete `Cut`. Lower bracket `-y⁻¹` (where `cutExp (-y⁻¹) ≤ y`), upper bracket `y`
    (where `y ≤ cutExp y`). -/
theorem cutExp_surjOn_pos : ∀ y : Cut, 0 < y → ∃ x : Cut, cutExp x = y := by
  intro y hy
  set t : Cut := y⁻¹ with ht
  have htpos : 0 < t := by rw [ht]; exact inv_pos.mpr hy
  have hcexp_t : 1 + t ≤ cutExp t := one_add_le_cutExp t (le_of_lt htpos)
  have hcexp_t_pos : 0 < cutExp t := cutExp_pos t
  have hmul : cutExp (-t) * cutExp t = 1 := by
    have := cutExp_mul_neg (-t); rwa [neg_neg] at this
  have hlow : cutExp (-t) ≤ y := by
    have h1t : 0 < 1 + t := by linarith
    have hA : cutExp (-t) * (1 + t) ≤ 1 := by
      calc cutExp (-t) * (1 + t) ≤ cutExp (-t) * cutExp t :=
            mul_le_mul_of_nonneg_left hcexp_t (le_of_lt (cutExp_pos (-t)))
        _ = 1 := hmul
    have hB : (1:Cut) ≤ y * (1 + t) := by
      have : y * (1 + t) = y + y * t := by ring
      rw [this, ht]; rw [mul_inv_cancel₀ (ne_of_gt hy)]; linarith
    have := le_trans hA hB
    exact le_of_mul_le_mul_right this h1t
  have hhigh : y ≤ cutExp y := by
    have := one_add_le_cutExp y (le_of_lt hy); linarith
  have hab : -t ≤ y := by linarith
  have hcont : ContinuousOn cutExp (Set.Icc (-t) y) := cutExp_continuous.continuousOn
  have hmem : y ∈ Set.Icc (cutExp (-t)) (cutExp y) := ⟨hlow, hhigh⟩
  have hsub := intermediate_value_Icc hab hcont
  obtain ⟨x, _, hx⟩ := hsub hmem
  exact ⟨x, hx⟩

/-- THE CONTINUOUS LOGARITHM `cutLog` over the derived ℝ: the inverse of `cutExp` on the positives.
    For `0 < y`, `cutLog y` is the unique `x` with `cutExp x = y` (exists by surjectivity, unique by
    strict monotonicity). For `y ≤ 0` it is junk (0). -/
def cutLog (y : Cut) : Cut :=
  if hy : 0 < y then Classical.choose (cutExp_surjOn_pos y hy) else 0

/-- `cutExp (cutLog y) = y` for `0 < y` (the right inverse on the positives). -/
theorem cutExp_cutLog {y : Cut} (hy : 0 < y) : cutExp (cutLog y) = y := by
  unfold cutLog; rw [dif_pos hy]
  exact Classical.choose_spec (cutExp_surjOn_pos y hy)

/-- `cutLog (cutExp x) = x` (the left inverse), by strict-monotone injectivity. -/
theorem cutLog_cutExp (x : Cut) : cutLog (cutExp x) = x := by
  have hpos : 0 < cutExp x := cutExp_pos x
  have h := cutExp_cutLog hpos
  exact cutExp_strictMono.injective h

/-- `cutLog 1 = 0`. -/
theorem cutLog_one : cutLog 1 = 0 := by
  have : cutLog (cutExp 0) = 0 := cutLog_cutExp 0
  rwa [cutExp_zero] at this

/-- THE LOGARITHM HOMOMORPHISM: `cutLog (a * b) = cutLog a + cutLog b` for `0 < a`, `0 < b`. -/
theorem cutLog_mul {a b : Cut} (ha : 0 < a) (hb : 0 < b) :
    cutLog (a * b) = cutLog a + cutLog b := by
  have hab : 0 < a * b := _root_.mul_pos ha hb
  apply cutExp_strictMono.injective
  rw [cutExp_cutLog hab, ← cutExp_add, cutExp_cutLog ha, cutExp_cutLog hb]

/-- THE CONTINUOUS REAL POWER `cutRpow x p := cutExp (p · cutLog x)` over the derived ℝ, for `x > 0`.
    For `x ≤ 0` it is junk (0). The number-tower continuous power, DERIVED from `Cut` + `cutExp`. -/
def cutRpow (x p : Cut) : Cut :=
  if 0 < x then cutExp (p * cutLog x) else 0

/-- `cutRpow x` is strictly positive for `x > 0` (Born positivity propagates). -/
theorem cutRpow_pos {x : Cut} (hx : 0 < x) (p : Cut) : 0 < cutRpow x p := by
  unfold cutRpow; rw [if_pos hx]; exact cutExp_pos _

/-- THE POWER ADDITION LAW: `cutRpow x (p + q) = cutRpow x p * cutRpow x q` for `x > 0`. -/
theorem cutRpow_add {x : Cut} (hx : 0 < x) (p q : Cut) :
    cutRpow x (p + q) = cutRpow x p * cutRpow x q := by
  unfold cutRpow; rw [if_pos hx, if_pos hx, if_pos hx, cutExp_add]; congr 1; ring

/-- `cutRpow x 0 = 1` for `x > 0`. -/
theorem cutRpow_zero {x : Cut} (hx : 0 < x) : cutRpow x 0 = 1 := by
  unfold cutRpow; rw [if_pos hx, zero_mul, cutExp_zero]

/-- `cutRpow x 1 = x` for `x > 0` (the power-one normalization, genuinely uses `cutExp ∘ cutLog = id`). -/
theorem cutRpow_one {x : Cut} (hx : 0 < x) : cutRpow x 1 = x := by
  unfold cutRpow; rw [if_pos hx, one_mul, cutExp_cutLog hx]

/-- `cutRpow x 2 = x * x` for `x > 0` (the integer power matches the algebraic square). -/
theorem cutRpow_two {x : Cut} (hx : 0 < x) : cutRpow x 2 = x * x := by
  have h2 : (2:Cut) = 1 + 1 := by norm_num
  rw [h2, cutRpow_add hx, cutRpow_one hx]

end
end ContinuumQ
end Phys.Foundation
