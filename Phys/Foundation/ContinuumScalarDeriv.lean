/-
  # N41g — THE SCALAR POWER-SERIES DERIVATIVE AT 0 over the DERIVED ℝ `ContinuumQ.Cut`
  #         (the analytic core of the `Der → Aut` tangent map, part 1: pure-`Cut` analysis).

  N41f (`Phys/Algebra/DerivationOAutomorphism.lean`) closed the GROUP end of `Der(𝕆) → Aut(𝕆)`:
  the exponential of a Leibniz derivation is a genuine `Cut`-side algebra automorphism of `O Cut`.
  THIS file builds the analytic infrastructure the TANGENT half `d/dt exp(tD)|₀ = D` needs —
  the differentiation of a `Cut`-valued power series at `0`, over the DERIVED ℝ, as a trunk-native
  `Tendsto` of the difference quotient over the N34 order topology.

  ## The genuine W1 BUILD (our library lacks the structure → BUILD it; reframe through the trunk)

  The banked trunk-native limit infrastructure over `Cut` was SEQUENCE-only (`cut_tendsto_atTop_ciSup`,
  the N37 Cauchy-completeness — all `atTop` over ℕ). There was NO continuous-parameter `𝓝[≠] 0`
  function-limit-at-a-point machinery, and NO remainder-tail bound with an order-topology squeeze. We
  BUILD exactly that, trunk-native, with NO ℝ-valued `Norm`/`Metric`, NO Mathlib `HasDerivAt`/`deriv`/
  `fderiv`/`NormedField` (each of which would need an ℝ/`NormedField`-valued derivative = a CONTENT
  trap, STANDARD §3). The derivative is the bare `Filter.Tendsto … (𝓝[≠] 0) (𝓝 …)` over the banked
  N34 `OrderTopology Cut`.

  ## The route (the C6 eternal-approach, one level up as a function limit)

    • `cut_tendsto_zero_of_abs_le` — THE SQUEEZE over the order topology: `|h t| ≤ u t` and `u → 0`
      force `h → 0` (the order-topology `tendsto_of_tendsto_of_tendsto_of_le_of_le'`, `-u ≤ h ≤ u`).
      NO Metric — pure `OrderTopology Cut`.
    • `cut_abs_tsum_le` — `|∑' f| ≤ ∑' |f|` (the absolute-value triangle inequality at the `tsum`
      level, via `Summable.tsum_le_tsum` twice over the banked N37 completeness).
    • `cut_geomdom_abssummable` / `cut_geomdom_tsum_le` — for `|t| ≤ 1`, the series `t^n · b n` is
      dominated coefficientwise by `b n` (the geometric factor `|t|^n ≤ 1`), so its absolute series is
      summable and bounded by `∑' |b|`. The majorant control for the remainder.
    • `cut_powerseries_deriv` (★ THE THEOREM): for `a : ℕ → Cut` with `∑ |a n|` summable (an ENTIRE
      series of radius `≥ 1`, exactly the exponential setting), the difference quotient
      `t⁻¹ ((∑' tⁿ aₙ) − a₀)` tends to `a₁` as `t → 0` in `𝓝[≠] 0`. PROOF: on `|t| ≤ 1`, peel the
      first two terms (`Summable.sum_add_tsum_nat_add`, one `range 2` step — explicit `f`, avoiding
      the higher-order-unification blowup RUNBOOK W9 flags) to write
      `f(t) = a₀ + a₁ t + t² R(t)` with `R(t) := ∑' n, tⁿ a₍ₙ₊₂₎`, so the difference quotient minus
      `a₁` is `t · R(t)`, bounded by `C · |t|` with `C := ∑' |a₍ₙ₊₂₎|`; `|t| → 0` and the squeeze
      finish.

  ## The one cause (THE ONE LAW)

  The SAME C6 eternal-approach + order completeness (N33) + order topology (N34) + Cauchy
  completeness (N37) that built the derived ℝ and made its nonneg bounded series converge now make a
  `Cut`-valued power series DIFFERENTIABLE at `0` — the difference quotient approaches the first
  coefficient. One engine (the eternal approach), several terminations (the convergent series, and
  now the function limit recovering the linear coefficient).

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): there are NO physics words in this file. It is the
  pure statement that over the completion-of-the-gather-of-closures of the derived rationals, an
  entire `Cut`-valued power series is differentiable at `0` with derivative its first-order
  coefficient, in the sense of a trunk-native difference-quotient `Tendsto`.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO ℝ-valued `Norm`, NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/
  `NormedField`/`NormedSpace`.
-/
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Order.Basic

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## The squeeze over the order topology (NO Metric). -/

/-- ★ THE SQUEEZE over the derived ℝ's order topology: if `|h t| ≤ u t` eventually along a filter `l`
    and `u → 0`, then `h → 0`. From `-u ≤ h ≤ u` and `tendsto_of_tendsto_of_tendsto_of_le_of_le'`
    (the order-topology sandwich, banked N34 `OrderTopology Cut`). NO ℝ-valued metric — the bound is
    the `Cut`-valued `|·|`. -/
theorem cut_tendsto_zero_of_abs_le {l : Filter Cut} (h u : Cut → Cut)
    (hu : Tendsto u l (𝓝 0)) (hb : ∀ᶠ t in l, |h t| ≤ u t) :
    Tendsto h l (𝓝 0) := by
  have hneg : Tendsto (fun t => -u t) l (𝓝 0) := by simpa using hu.neg
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' hneg hu ?_ ?_
  · filter_upwards [hb] with t ht; linarith [(abs_le.mp ht).1]
  · filter_upwards [hb] with t ht; linarith [(abs_le.mp ht).2]

/-! ## The absolute-value triangle inequality at the `tsum` level. -/

/-- `|∑' f| ≤ ∑' |f|` over the derived ℝ, for an absolutely-summable `f`. The two-sided bound
    `-(∑'|f|) ≤ ∑' f ≤ ∑'|f|` by `Summable.tsum_le_tsum` (the banked N37 completeness + order
    topology), then `abs_le`. -/
theorem cut_abs_tsum_le {f : ℕ → Cut} (hf : Summable (fun n => |f n|)) :
    |∑' n, f n| ≤ ∑' n, |f n| := by
  have hfs : Summable f := cut_summable_of_abs hf
  have hub : ∑' n, f n ≤ ∑' n, |f n| := hfs.tsum_le_tsum (fun n => le_abs_self _) hf
  have hlb : -(∑' n, |f n|) ≤ ∑' n, f n := by
    rw [← tsum_neg]; exact hf.neg.tsum_le_tsum (fun n => neg_abs_le _) hfs
  exact abs_le.mpr ⟨hlb, hub⟩

/-! ## The geometric-dominated majorant control for the remainder. -/

/-- For `|t| ≤ 1` and `∑|b|` summable, the geometric-dominated series `∑|t^n · b n|` is summable.
    Coefficientwise `|t^n · b n| = |t|^n · |b n| ≤ |b n|` (since `|t|^n ≤ 1`), comparison with `∑|b|`. -/
theorem cut_geomdom_abssummable {b : ℕ → Cut} (hb : Summable (fun n => |b n|))
    {t : Cut} (ht : |t| ≤ 1) :
    Summable (fun n => |t ^ n * b n|) := by
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _) _ hb
  intro n
  rw [abs_mul, abs_pow]
  have htn : |t| ^ n ≤ 1 := by
    calc |t| ^ n ≤ 1 ^ n := pow_le_pow_left₀ (abs_nonneg _) ht n
      _ = 1 := one_pow n
  nlinarith [abs_nonneg (b n), pow_nonneg (abs_nonneg t) n]

/-- For `|t| ≤ 1`, `∑'|t^n · b n| ≤ ∑'|b n|` — the remainder tail is uniformly bounded by the
    `t`-free constant `∑'|b|`. -/
theorem cut_geomdom_tsum_le {b : ℕ → Cut} (hb : Summable (fun n => |b n|))
    {t : Cut} (ht : |t| ≤ 1) :
    ∑' n, |t ^ n * b n| ≤ ∑' n, |b n| := by
  apply (cut_geomdom_abssummable hb ht).tsum_le_tsum _ hb
  intro n
  rw [abs_mul, abs_pow]
  have htn : |t| ^ n ≤ 1 := by
    calc |t| ^ n ≤ 1 ^ n := pow_le_pow_left₀ (abs_nonneg _) ht n
      _ = 1 := one_pow n
  nlinarith [abs_nonneg (b n), pow_nonneg (abs_nonneg t) n]

/-! ## THE SCALAR POWER-SERIES DERIVATIVE AT 0. -/

/-- ★★ THE SCALAR POWER-SERIES DERIVATIVE AT 0 over the derived ℝ. For `a : ℕ → Cut` with
    `∑ |a n|` summable (an ENTIRE series — radius `≥ 1`, exactly the exponential setting), the
    difference quotient `t⁻¹ ((∑' n, tⁿ · aₙ) − a₀)` tends to `a₁` as `t → 0` in the punctured
    neighbourhood `𝓝[≠] 0`. The trunk-native `Tendsto` over the N34 order topology — NO
    `HasDerivAt`, NO `NormedField`, NO ℝ-valued `Norm`.

    PROOF (the remainder-tail + squeeze, BUILT here over the derived ℝ): on `|t| ≤ 1`, peel the
    first two terms (`Summable.sum_add_tsum_nat_add`) to write `f(t) = a₀ + a₁·t + t²·R(t)` with
    `R(t) := ∑' n, tⁿ · a₍ₙ₊₂₎`. Then the difference quotient minus `a₁` equals `t·R(t)`, with
    `|t·R(t)| ≤ C·|t|` for `C := ∑' |a₍ₙ₊₂₎|` (the geometric-dominated remainder bound). `|t| → 0`
    and the squeeze (`cut_tendsto_zero_of_abs_le`) close it; `key.add_const a₁` returns the limit
    point to `a₁`. -/
theorem cut_powerseries_deriv (a : ℕ → Cut) (hsum1 : Summable (fun n => |a n|)) :
    Tendsto (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) (𝓝[≠] (0 : Cut)) (𝓝 (a 1)) := by
  set C : Cut := ∑' n, |a (n + 2)| with hC
  have hsum2 : Summable (fun n => |a (n + 2)|) := (summable_nat_add_iff 2).2 hsum1
  have key : Tendsto (fun t : Cut => (t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) - a 1)
      (𝓝[≠] (0 : Cut)) (𝓝 0) := by
    apply cut_tendsto_zero_of_abs_le _ (fun t => C * |t|)
    · -- the bound `C · |t| → 0`
      have habs : Tendsto (fun t : Cut => |t|) (𝓝[≠] (0:Cut)) (𝓝 0) := by
        have h := (continuous_abs (G := Cut)).tendsto (0:Cut)
        rw [abs_zero] at h
        exact h.mono_left nhdsWithin_le_nhds
      have := habs.const_mul C
      simpa using this
    · -- the difference quotient bound, eventually on `𝓝[≠] 0`
      have hmem : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), |t| ≤ 1 ∧ t ≠ 0 := by
        have hIcc : Set.Icc (-1 : Cut) 1 ∈ 𝓝 (0:Cut) :=
          Icc_mem_nhds (by norm_num) (by norm_num)
        have h1 : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), |t| ≤ 1 := by
          have : ∀ᶠ t : Cut in 𝓝 (0:Cut), |t| ≤ 1 := by
            filter_upwards [hIcc] with t ht; rw [abs_le]; exact ⟨ht.1, ht.2⟩
          exact this.filter_mono nhdsWithin_le_nhds
        have h2 : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), t ≠ 0 :=
          eventually_mem_nhdsWithin.mono (fun t ht => ht)
        exact h1.and h2
      filter_upwards [hmem] with t ht
      obtain ⟨htle, htne⟩ := ht
      -- `f := the power-series summand`, explicit (avoids higher-order unification, RUNBOOK W9)
      have hsumf : Summable (fun n => t ^ n * a n) :=
        cut_summable_of_abs (cut_geomdom_abssummable hsum1 htle)
      have hRsum : Summable (fun n => t ^ n * a (n+2)) :=
        cut_summable_of_abs (cut_geomdom_abssummable hsum2 htle)
      -- peel `range 2` in ONE step:  ∑ i∈range 2, fᵢ + ∑' n, f(n+2) = ∑' n, fₙ
      have hpeel : (∑ i ∈ Finset.range 2, t ^ i * a i)
          + ∑' n, t ^ (n+2) * a (n+2) = ∑' n, t ^ n * a n :=
        Summable.sum_add_tsum_nat_add (f := fun n => t ^ n * a n) 2 hsumf
      have htail_eq : (∑' n, t ^ (n+2) * a (n+2)) = t ^ 2 * ∑' n, t ^ n * a (n+2) := by
        rw [← tsum_mul_left]; apply tsum_congr; intro n; ring
      -- assemble:  f(t) = a₀ + a₁·t + t²·R(t)
      have hf : (∑' n, t ^ n * a n) = a 0 + t * a 1 + t ^ 2 * ∑' n, t ^ n * a (n+2) := by
        rw [← hpeel, htail_eq]
        simp only [Finset.sum_range_succ, Finset.sum_range_zero]
        ring
      -- the difference quotient minus a₁ is exactly t·R(t)
      have hquot : (t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) - a 1
          = t * ∑' n, t ^ n * a (n+2) := by
        rw [hf]; field_simp; ring
      rw [hquot, abs_mul]
      -- |R(t)| ≤ C
      have hRbound : |∑' n, t ^ n * a (n+2)| ≤ C := by
        calc |∑' n, t ^ n * a (n+2)| ≤ ∑' n, |t ^ n * a (n+2)| :=
              cut_abs_tsum_le (cut_geomdom_abssummable hsum2 htle)
          _ ≤ ∑' n, |a (n+2)| := cut_geomdom_tsum_le hsum2 htle
          _ = C := by rw [hC]
      calc |t| * |∑' n, t ^ n * a (n+2)|
          ≤ |t| * C := mul_le_mul_of_nonneg_left hRbound (abs_nonneg _)
        _ = C * |t| := by ring
  have := key.add_const (a 1)
  simpa using this

end

end Phys.Foundation.ContinuumQ
