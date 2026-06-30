/-
  # N182 — THE SCALAR 2ND-ORDER POWER-SERIES DERIVATIVE AT 0 over the DERIVED ℝ `ContinuumQ.Cut`
  #         (the genuinely-unbanked analytic primitive the 2nd-order Taylor of `exp` over `Cut` needs).

  N41g (`Phys/Foundation/ContinuumScalarDeriv.lean`) banked the FIRST-order scalar power-series
  derivative `cut_powerseries_deriv`: for an entire `Cut`-valued series, the difference quotient
  `t⁻¹·((∑' tⁿ aₙ) − a₀)` tends to the first coefficient `a₁` as `t → 0`. Every banked tangent of
  the octonion exponential (`expO_tangent` N41g, `expMap_smul_tangent` N181, the adjoint-flow
  derivative `adjMap_tangent` N181) descends from THAT first-order limit — they recover only the
  FIRST derivative. The chain has NO second-order tangent / Taylor-remainder. The full 2-parameter
  group commutator `[exp(sD),exp(tE)] ≈ id + st·⁅D,E⁆` (deferred at N180/N181 as W9-HEAVY) is genuinely
  second-order: its first-order part vanishes, and recovering its `st`-coefficient needs the quadratic
  coefficient of the exponential — i.e. the SECOND-order power-series derivative this file builds.

  ## The genuine W1 BUILD (the chain lacks the structure → BUILD it; the trunk makes it the same shape)

  THIS file banks the exact 2nd-order analog of `cut_powerseries_deriv`, the genuinely-unbanked
  primitive: for `a : ℕ → Cut` with `∑ |a n|` summable (an ENTIRE series, radius `≥ 1`), the
  SECOND-order difference quotient

      `(t²)⁻¹ · ((∑' n, tⁿ · aₙ) − a₀ − t·a₁)`   tends to   `a₂`   as `t → 0` in `𝓝[≠] 0`.

  It descends ENTIRELY from the banked first-order machinery (`cut_tendsto_zero_of_abs_le` — the
  order-topology squeeze; `cut_abs_tsum_le`; `cut_geomdom_abssummable`/`cut_geomdom_tsum_le` — the
  geometric-dominated remainder bound) over the DERIVED ℝ `Cut`, with NO new analytic input.

  ## The route (mirror the first-order proof, one peel deeper — `range 3`)

  On `|t| ≤ 1`, `t ≠ 0`, peel the first THREE terms of the entire series
  (`Summable.sum_add_tsum_nat_add … 3`, explicit summand, avoiding higher-order-unification blowup,
  RUNBOOK W9) to write `f(t) = a₀ + t·a₁ + t²·a₂ + t³·R(t)` with `R(t) := ∑' n, tⁿ · a₍ₙ₊₃₎`. Then
  the 2nd-order difference quotient minus `a₂` equals `t·R(t)` (one `field_simp; ring` with `t ≠ 0`),
  bounded by `C·|t|` for `C := ∑' |a₍ₙ₊₃₎|` (the geometric-dominated tail bound). `|t| → 0` and the
  order-topology squeeze close it; `key.add_const a₂` returns the limit point to `a₂`.

  ## The one cause (THE ONE LAW)

  The SAME C6 eternal-approach + order completeness (N33) + order topology (N34) + Cauchy completeness
  (N37) that built the derived ℝ, made its entire series converge, and recovered the FIRST coefficient
  (N41g) now recover the SECOND coefficient — one engine, one more termination. The second derivative
  is not a new analytic posit; it is the same difference-quotient `Tendsto`, peeled one term deeper.

  PHYSICS-WORDS-REMOVABLE (docs/STANDARD.md §2): there are NO physics words in this file. It is the
  pure statement that over the completion-of-the-gather-of-closures of the derived rationals, an
  entire `Cut`-valued power series has a second-order difference quotient at `0` recovering its
  quadratic coefficient, as a trunk-native `Tendsto` over the N34 order topology.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge, NO Mathlib
  number-system content import, NO ℝ-valued `Norm`, NO Mathlib `HasDerivAt`/`deriv`/`fderiv`/
  `NormedField`/`NormedSpace`. The field, the series, and the limit are ALL the derived `Cut`.
-/
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-- ★★ THE SCALAR 2ND-ORDER POWER-SERIES DERIVATIVE AT 0 over the derived ℝ. For `a : ℕ → Cut`
    with `∑ |a n|` summable (an ENTIRE series — radius `≥ 1`, exactly the exponential setting), the
    SECOND-order difference quotient `(t²)⁻¹ ((∑' n, tⁿ · aₙ) − a₀ − t·a₁)` tends to the quadratic
    coefficient `a₂` as `t → 0` in the punctured neighbourhood `𝓝[≠] 0`. The trunk-native `Tendsto`
    over the N34 order topology — NO `HasDerivAt`, NO `NormedField`, NO ℝ-valued `Norm`.

    The exact 2nd-order analog of `cut_powerseries_deriv` (N41g), the genuinely-unbanked primitive
    the second-order Taylor of `exp` over `Cut` needs. PROOF (the remainder-tail + squeeze, BUILT
    here over the derived ℝ): on `|t| ≤ 1`, peel the first THREE terms (`Summable.sum_add_tsum_nat_add`,
    `range 3`) to write `f(t) = a₀ + a₁·t + a₂·t² + t³·R(t)` with `R(t) := ∑' n, tⁿ · a₍ₙ₊₃₎`. The
    2nd-order difference quotient minus `a₂` equals `t·R(t)`, with `|t·R(t)| ≤ C·|t|` for
    `C := ∑' |a₍ₙ₊₃₎|` (the geometric-dominated remainder bound). `|t| → 0` and the squeeze
    (`cut_tendsto_zero_of_abs_le`) close it; `key.add_const a₂` returns the limit point to `a₂`. -/
theorem cut_powerseries_deriv2 (a : ℕ → Cut) (hsum1 : Summable (fun n => |a n|)) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ * ((∑' n, t ^ n * a n) - a 0 - t * a 1))
      (𝓝[≠] (0 : Cut)) (𝓝 (a 2)) := by
  set C : Cut := ∑' n, |a (n + 3)| with hC
  have hsum3 : Summable (fun n => |a (n + 3)|) := (summable_nat_add_iff 3).2 hsum1
  have key : Tendsto (fun t : Cut => ((t ^ 2)⁻¹ * ((∑' n, t ^ n * a n) - a 0 - t * a 1)) - a 2)
      (𝓝[≠] (0 : Cut)) (𝓝 0) := by
    apply cut_tendsto_zero_of_abs_le _ (fun t => C * |t|)
    · -- the bound `C · |t| → 0`
      have habs : Tendsto (fun t : Cut => |t|) (𝓝[≠] (0:Cut)) (𝓝 0) := by
        have h := (continuous_abs (G := Cut)).tendsto (0:Cut)
        rw [abs_zero] at h
        exact h.mono_left nhdsWithin_le_nhds
      have := habs.const_mul C
      simpa using this
    · -- the second-order difference-quotient bound, eventually on `𝓝[≠] 0`
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
      have hRsum : Summable (fun n => t ^ n * a (n+3)) :=
        cut_summable_of_abs (cut_geomdom_abssummable hsum3 htle)
      -- peel `range 3` in ONE step:  ∑ i∈range 3, fᵢ + ∑' n, f(n+3) = ∑' n, fₙ
      have hpeel : (∑ i ∈ Finset.range 3, t ^ i * a i)
          + ∑' n, t ^ (n+3) * a (n+3) = ∑' n, t ^ n * a n :=
        Summable.sum_add_tsum_nat_add (f := fun n => t ^ n * a n) 3 hsumf
      have htail_eq : (∑' n, t ^ (n+3) * a (n+3)) = t ^ 3 * ∑' n, t ^ n * a (n+3) := by
        rw [← tsum_mul_left]; apply tsum_congr; intro n; ring
      -- assemble:  f(t) = a₀ + a₁·t + a₂·t² + t³·R(t)
      have hf : (∑' n, t ^ n * a n)
          = a 0 + t * a 1 + t ^ 2 * a 2 + t ^ 3 * ∑' n, t ^ n * a (n+3) := by
        rw [← hpeel, htail_eq]
        simp only [Finset.sum_range_succ, Finset.sum_range_zero]
        ring
      -- the 2nd-order difference quotient minus a₂ is exactly t·R(t)
      have hquot : ((t ^ 2)⁻¹ * ((∑' n, t ^ n * a n) - a 0 - t * a 1)) - a 2
          = t * ∑' n, t ^ n * a (n+3) := by
        rw [hf]; field_simp; ring
      rw [hquot, abs_mul]
      -- |R(t)| ≤ C
      have hRbound : |∑' n, t ^ n * a (n+3)| ≤ C := by
        calc |∑' n, t ^ n * a (n+3)| ≤ ∑' n, |t ^ n * a (n+3)| :=
              cut_abs_tsum_le (cut_geomdom_abssummable hsum3 htle)
          _ ≤ ∑' n, |a (n+3)| := cut_geomdom_tsum_le hsum3 htle
          _ = C := by rw [hC]
      calc |t| * |∑' n, t ^ n * a (n+3)|
          ≤ |t| * C := mul_le_mul_of_nonneg_left hRbound (abs_nonneg _)
        _ = C * |t| := by ring
  have := key.add_const (a 2)
  simpa using this

end

end Phys.Foundation.ContinuumQ
