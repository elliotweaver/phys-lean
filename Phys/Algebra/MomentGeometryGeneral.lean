import Phys.Foundation.ContinuumExpDeriv
import Phys.Algebra.UnaryNestCount

/-!
  # N680 — MOMENT GEOMETRY GENERAL: the ∀-n geometric weld (referee seam B, closed)
  ================================================================================
  MANAGER-AS-PROVER NODE (owner-directed airtight arc). PREREG:
  workbench/mirror-closure/PREREG-AIRTIGHT.md (extended).

  THE SEAM: `termMomentNorm` is a closed form, geometrically welded only at n = 1..5.
  THE FIX: the general constructed object `momentAntideriv n x := (1 − cutCos x^(n+1))/(n+1)`
  with THE GEOMETRY THEOREM — `CutHasDerivAt (momentAntideriv n) (cutCos x ^ n * cutSin x) x`
  for EVERY n and EVERY x — the n-ended integrand's antiderivative exhibited for all n at
  once, over the trunk-native derivative. Evaluating over the full return and normalizing
  by the banked measure yields `termMomentNorm n` for ALL n.

  NEW MACHINERY (reusable): CutHasDerivAt product/power/const-sub/div-const rules;
  cutSin' = cutCos and cutCos' = −cutSin (small-t tail bounds against the banked
  `cutExp 1`, transported everywhere by the banked addition formulas — the
  cutExp_hasDerivAt pattern, trig instance).
-/

namespace Phys.Algebra
namespace MirrorTermLanguage
open Phys.Foundation.ContinuumQ
open Phys.Algebra.DepthWeight
open Phys.Algebra.TwoEndsConstructed
open Phys.Algebra.ChainTermGrammar
open Filter Set
open scoped Topology

noncomputable section

/-! ## (1) CALCULUS RULES for the trunk-native derivative. -/

/-- Differentiability gives continuity along increments. -/
theorem cutHasDerivAt_tendsto_sub_zero {f : Cut → Cut} {d x : Cut}
    (hf : CutHasDerivAt f d x) :
    Tendsto (fun h : Cut => f (x + h) - f x) (𝓝[≠] (0 : Cut)) (𝓝 0) := by
  have hid : Tendsto (fun h : Cut => h) (𝓝[≠] (0 : Cut)) (𝓝 0) :=
    tendsto_id.mono_left nhdsWithin_le_nhds
  have hmul := hid.mul hf
  rw [zero_mul] at hmul
  refine hmul.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  have hne : h ≠ 0 := hh
  field_simp

/-- THE PRODUCT RULE. -/
theorem cutHasDerivAt_mul {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y * g y) (df * g x + f x * dg) x := by
  unfold CutHasDerivAt at *
  have hgc : Tendsto (fun h : Cut => g (x + h)) (𝓝[≠] (0:Cut)) (𝓝 (g x)) := by
    have := (cutHasDerivAt_tendsto_sub_zero (f := g) hg).add
      (tendsto_const_nhds (x := g x) (f := 𝓝[≠] (0:Cut)))
    simpa using this
  have h1 : Tendsto (fun h : Cut => (h⁻¹ * (f (x + h) - f x)) * g (x + h))
      (𝓝[≠] (0:Cut)) (𝓝 (df * g x)) := hf.mul hgc
  have h2 : Tendsto (fun h : Cut => f x * (h⁻¹ * (g (x + h) - g x)))
      (𝓝[≠] (0:Cut)) (𝓝 (f x * dg)) := hg.const_mul (f x)
  have hsum := h1.add h2
  refine hsum.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  have hne : h ≠ 0 := hh
  field_simp
  ring

/-- THE POWER RULE: `(f^(m+1))' = (m+1)·f^m·f'`. -/
theorem cutHasDerivAt_pow {f : Cut → Cut} {df x : Cut}
    (hf : CutHasDerivAt f df x) :
    ∀ m : ℕ, CutHasDerivAt (fun y => f y ^ (m + 1))
      (((m : Cut) + 1) * f x ^ m * df) x := by
  intro m
  induction m with
  | zero =>
    have h1 : CutHasDerivAt (fun y => f y ^ 1) df x := by
      have hcg : (fun y => f y ^ 1) = f := by funext y; ring
      rw [hcg]; exact hf
    convert h1 using 1
    push_cast; ring
  | succ k ih =>
    have hmul := cutHasDerivAt_mul ih hf
    have hcongr : (fun y => f y ^ (k + 1) * f y) = (fun y => f y ^ (k + 1 + 1)) := by
      funext y; ring
    rw [hcongr] at hmul
    convert hmul using 1
    push_cast
    ring

/-- `c − f` rule. -/
theorem cutHasDerivAt_const_sub {f : Cut → Cut} {df x : Cut} (c : Cut)
    (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => c - f y) (-df) x := by
  unfold CutHasDerivAt at *
  have hneg := hf.neg
  refine hneg.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  show -(h⁻¹ * (f (x + h) - f x)) = h⁻¹ * ((fun y => c - f y) (x + h) - (fun y => c - f y) x)
  simp only
  ring

/-- `f / c` rule. -/
theorem cutHasDerivAt_div_const {f : Cut → Cut} {df x : Cut} (c : Cut)
    (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => f y / c) (df / c) x := by
  unfold CutHasDerivAt at *
  have hmc := hf.mul_const c⁻¹
  have hcongr : (fun h : Cut => h⁻¹ * (f (x + h) - f x) * c⁻¹)
      = (fun h : Cut => h⁻¹ * (f (x + h) / c - f x / c)) := by
    funext h
    rw [div_eq_mul_inv, div_eq_mul_inv]
    ring
  rw [hcongr] at hmc
  rwa [div_eq_mul_inv df c]

/-! ## (2) SMALL-t TAIL BOUNDS — coarse factorial-tail comparison against `cutExp 1`. -/

/-- The dominating constant. -/
def tailK : Cut := cutExp 1

theorem tailK_pos : 0 < tailK := cutExp_pos 1

/-- For `|t| ≤ 1`: `(t²)^(k+1) ≤ t²` (each extra factor is ≤ 1). -/
theorem sq_pow_le_sq {t : Cut} (ht : |t| ≤ 1) (k : ℕ) : (t ^ 2) ^ (k + 1) ≤ t ^ 2 := by
  have ht2 : t ^ 2 ≤ 1 := by
    have := abs_nonneg t
    nlinarith [sq_abs t, ht]
  have ht0 : 0 ≤ t ^ 2 := sq_nonneg t
  induction k with
  | zero => simpa using le_refl (t ^ 2)
  | succ m ih =>
    calc (t ^ 2) ^ (m + 2) = (t ^ 2) ^ (m + 1) * t ^ 2 := by ring
      _ ≤ t ^ 2 * 1 := by
          apply mul_le_mul ih ht2 ht0 (sq_nonneg t)
      _ = t ^ 2 := by ring

/-- Factorial reciprocal comparison over Cut: `n ≤ m ⇒ 1/(m !) ≤ 1/(n !)`. -/
theorem one_div_factorial_le {n m : ℕ} (h : n ≤ m) :
    (1 : Cut) / (m.factorial : Cut) ≤ 1 / (n.factorial : Cut) := by
  apply one_div_le_one_div_of_le
  · exact_mod_cast Nat.factorial_pos n
  · exact_mod_cast Nat.factorial_le h

/-- COSINE TAIL: for `|t| ≤ 1`, `|cutCos t − 1| ≤ t² · tailK`. -/
theorem cutCos_sub_one_bound {t : Cut} (ht : |t| ≤ 1) :
    |cutCos t - 1| ≤ t ^ 2 * tailK := by
  have hshift : cutCos t - 1 = ∑' n, cosTermC t (n + 1) := by
    have hz := (cosTermC_summable t).tsum_eq_zero_add
    have h0 : cosTermC t 0 = 1 := by unfold cosTermC; simp
    rw [h0] at hz
    have hct : cutCos t = ∑' n, cosTermC t n := rfl
    rw [← hct] at hz
    linarith
  rw [hshift]
  have hsummable : Summable (fun n => |cosTermC t (n + 1)|) :=
    ((summable_nat_add_iff 1).mpr (cosTermC_summable t)).abs
  refine le_trans (cut_abs_tsum_le hsummable) ?_
  have hterm : ∀ n, |cosTermC t (n + 1)| ≤ t ^ 2 * expTermC 1 n := by
    intro n
    unfold cosTermC expTermC
    rw [abs_div, abs_mul, abs_pow, abs_pow, abs_neg, abs_one, one_pow, one_mul,
      abs_of_pos (by positivity : (0:Cut) < ((2 * (n+1)).factorial : Cut)), one_pow]
    have hpow : |t| ^ (2 * (n + 1)) ≤ t ^ 2 := by
      have heq : |t| ^ (2 * (n + 1)) = (t ^ 2) ^ (n + 1) := by
        rw [← sq_abs t, ← pow_mul]
      rw [heq]
      exact sq_pow_le_sq ht n
    have hfact : (1 : Cut) / ((2 * (n + 1)).factorial : Cut) ≤ 1 / (n.factorial : Cut) :=
      one_div_factorial_le (by omega)
    calc |t| ^ (2 * (n + 1)) / ((2 * (n + 1)).factorial : Cut)
        = |t| ^ (2 * (n + 1)) * (1 / ((2 * (n + 1)).factorial : Cut)) := by ring
      _ ≤ (t ^ 2) * (1 / (n.factorial : Cut)) := by
          apply mul_le_mul hpow hfact (by positivity) (sq_nonneg t)
      _ = t ^ 2 * (1 / (n.factorial : Cut)) := rfl
  have hsum2 : Summable (fun n => t ^ 2 * expTermC 1 n) :=
    (cut_summable_of_abs (expTermC_abs_summable 1)).mul_left _
  refine le_trans (hsummable.tsum_le_tsum hterm hsum2) ?_
  rw [tsum_mul_left]
  unfold tailK cutExp
  apply mul_le_mul_of_nonneg_left _ (sq_nonneg t)
  apply le_of_eq
  unfold expTermC
  apply tsum_congr
  intro n
  rw [one_pow]

/-- SINE TAIL: for `|t| ≤ 1`, `|cutSin t − t| ≤ t² · tailK` (the tail past the linear
    term starts at |t|³/3!; coarsely |t|^(2n+3) ≤ t² for |t| ≤ 1). -/
theorem cutSin_sub_self_bound {t : Cut} (ht : |t| ≤ 1) :
    |cutSin t - t| ≤ t ^ 2 * tailK := by
  have hshift : cutSin t - t = ∑' n, sinTermC t (n + 1) := by
    have hz := (sinTermC_summable t).tsum_eq_zero_add
    have h0 : sinTermC t 0 = t := by unfold sinTermC; simp
    rw [h0] at hz
    have hst : cutSin t = ∑' n, sinTermC t n := rfl
    rw [← hst] at hz
    linarith
  rw [hshift]
  have hsummable : Summable (fun n => |sinTermC t (n + 1)|) :=
    ((summable_nat_add_iff 1).mpr (sinTermC_summable t)).abs
  refine le_trans (cut_abs_tsum_le hsummable) ?_
  have hterm : ∀ n, |sinTermC t (n + 1)| ≤ t ^ 2 * expTermC 1 n := by
    intro n
    unfold sinTermC expTermC
    rw [abs_div, abs_mul, abs_pow, abs_pow, abs_neg, abs_one, one_pow, one_mul,
      abs_of_pos (by positivity : (0:Cut) < ((2 * (n+1) + 1).factorial : Cut)), one_pow]
    have hpow : |t| ^ (2 * (n + 1) + 1) ≤ t ^ 2 := by
      have hsplit : |t| ^ (2 * (n + 1) + 1) = (t ^ 2) ^ (n + 1) * |t| := by
        rw [← sq_abs t, ← pow_mul]
        ring
      rw [hsplit]
      calc (t ^ 2) ^ (n + 1) * |t| ≤ (t ^ 2) ^ (n + 1) * 1 := by
            apply mul_le_mul_of_nonneg_left ht (by positivity)
        _ = (t ^ 2) ^ (n + 1) := by ring
        _ ≤ t ^ 2 := sq_pow_le_sq ht n
    have hfact : (1 : Cut) / ((2 * (n + 1) + 1).factorial : Cut) ≤ 1 / (n.factorial : Cut) :=
      one_div_factorial_le (by omega)
    calc |t| ^ (2 * (n + 1) + 1) / ((2 * (n + 1) + 1).factorial : Cut)
        = |t| ^ (2 * (n + 1) + 1) * (1 / ((2 * (n + 1) + 1).factorial : Cut)) := by ring
      _ ≤ (t ^ 2) * (1 / (n.factorial : Cut)) := by
          apply mul_le_mul hpow hfact (by positivity) (sq_nonneg t)
      _ = t ^ 2 * (1 / (n.factorial : Cut)) := rfl
  have hsum2 : Summable (fun n => t ^ 2 * expTermC 1 n) :=
    (cut_summable_of_abs (expTermC_abs_summable 1)).mul_left _
  refine le_trans (hsummable.tsum_le_tsum hterm hsum2) ?_
  rw [tsum_mul_left]
  unfold tailK cutExp
  apply mul_le_mul_of_nonneg_left _ (sq_nonneg t)
  apply le_of_eq
  unfold expTermC
  apply tsum_congr
  intro n
  rw [one_pow]

/-! ## (3) THE DIFFERENCE QUOTIENTS AT 0. -/

/-- `|t| → 0` along the punctured filter. -/
theorem abs_tendsto_zero : Tendsto (fun t : Cut => |t|) (𝓝[≠] (0:Cut)) (𝓝 0) := by
  have h := (continuous_abs (G := Cut)).tendsto (0:Cut)
  rw [abs_zero] at h
  exact h.mono_left nhdsWithin_le_nhds

/-- `t⁻¹ (cutCos t − 1) → 0`. -/
theorem cutCos_diffquot_zero :
    Tendsto (fun t : Cut => t⁻¹ * (cutCos t - 1)) (𝓝[≠] (0 : Cut)) (𝓝 0) := by
  apply cut_tendsto_zero_of_abs_le _ (fun t => |t| * tailK)
  · have := abs_tendsto_zero.mul_const tailK
    simpa using this
  · have hev : ∀ᶠ t in 𝓝[≠] (0:Cut), |t| ≤ 1 := by
      have hmem : Icc (-1 : Cut) 1 ∈ 𝓝 (0:Cut) := Icc_mem_nhds (by norm_num) (by norm_num)
      filter_upwards [nhdsWithin_le_nhds hmem] with t htI
      rw [abs_le]; exact ⟨htI.1, htI.2⟩
    filter_upwards [hev, self_mem_nhdsWithin] with t htle htne
    have hne : t ≠ 0 := htne
    have hb := cutCos_sub_one_bound htle
    rw [abs_mul, abs_inv]
    have habs : (0:Cut) < |t| := abs_pos.mpr hne
    rw [inv_mul_le_iff₀ habs]
    calc |cutCos t - 1| ≤ t ^ 2 * tailK := hb
      _ = |t| * (|t| * tailK) := by rw [← sq_abs]; ring

/-- `t⁻¹ · cutSin t → 1`. -/
theorem cutSin_diffquot_zero :
    Tendsto (fun t : Cut => t⁻¹ * cutSin t) (𝓝[≠] (0 : Cut)) (𝓝 1) := by
  have hzero : Tendsto (fun t : Cut => t⁻¹ * cutSin t - 1) (𝓝[≠] (0:Cut)) (𝓝 0) := by
    apply cut_tendsto_zero_of_abs_le _ (fun t => |t| * tailK)
    · have := abs_tendsto_zero.mul_const tailK
      simpa using this
    · have hev : ∀ᶠ t in 𝓝[≠] (0:Cut), |t| ≤ 1 := by
        have hmem : Icc (-1 : Cut) 1 ∈ 𝓝 (0:Cut) := Icc_mem_nhds (by norm_num) (by norm_num)
        filter_upwards [nhdsWithin_le_nhds hmem] with t htI
        rw [abs_le]; exact ⟨htI.1, htI.2⟩
      filter_upwards [hev, self_mem_nhdsWithin] with t htle htne
      have hne : t ≠ 0 := htne
      have hb := cutSin_sub_self_bound htle
      have hrw : t⁻¹ * cutSin t - 1 = t⁻¹ * (cutSin t - t) := by
        field_simp
      rw [hrw, abs_mul, abs_inv]
      have habs : (0:Cut) < |t| := abs_pos.mpr hne
      rw [inv_mul_le_iff₀ habs]
      calc |cutSin t - t| ≤ t ^ 2 * tailK := hb
        _ = |t| * (|t| * tailK) := by rw [← sq_abs]; ring
  have hfin := hzero.add (tendsto_const_nhds (x := (1:Cut)) (f := 𝓝[≠] (0:Cut)))
  rw [zero_add] at hfin
  refine hfin.congr ?_
  intro t
  ring

/-! ## (4) ★★ THE TRIG DERIVATIVES — transported everywhere by the addition formulas. -/

/-- ★★ `cutSin' = cutCos` at every point. -/
theorem cutSin_hasDerivAt (x : Cut) : CutHasDerivAt cutSin (cutCos x) x := by
  unfold CutHasDerivAt
  have h1 : Tendsto (fun h : Cut => cutSin x * (h⁻¹ * (cutCos h - 1)))
      (𝓝[≠] (0:Cut)) (𝓝 0) := by
    have := cutCos_diffquot_zero.const_mul (cutSin x)
    simpa using this
  have h2 : Tendsto (fun h : Cut => cutCos x * (h⁻¹ * cutSin h))
      (𝓝[≠] (0:Cut)) (𝓝 (cutCos x)) := by
    have := cutSin_diffquot_zero.const_mul (cutCos x)
    simpa using this
  have hsum := h1.add h2
  rw [zero_add] at hsum
  refine hsum.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  have hne : h ≠ 0 := hh
  rw [cutSin_add]
  field_simp
  ring

/-- ★★ `cutCos' = −cutSin` at every point. -/
theorem cutCos_hasDerivAt (x : Cut) : CutHasDerivAt cutCos (-cutSin x) x := by
  unfold CutHasDerivAt
  have h1 : Tendsto (fun h : Cut => cutCos x * (h⁻¹ * (cutCos h - 1)))
      (𝓝[≠] (0:Cut)) (𝓝 0) := by
    have := cutCos_diffquot_zero.const_mul (cutCos x)
    simpa using this
  have h2 : Tendsto (fun h : Cut => -(cutSin x) * (h⁻¹ * cutSin h))
      (𝓝[≠] (0:Cut)) (𝓝 (-cutSin x)) := by
    have := cutSin_diffquot_zero.const_mul (-(cutSin x))
    simpa using this
  have hsum := h1.add h2
  rw [zero_add] at hsum
  refine hsum.congr' ?_
  filter_upwards [self_mem_nhdsWithin] with h hh
  have hne : h ≠ 0 := hh
  rw [cutCos_add]
  field_simp
  ring

/-! ## (5) ★★★ THE GENERAL MOMENT GEOMETRY — the antiderivative for EVERY n. -/

/-- The n-ended moment antiderivative: `(1 − cutCos x^(n+1)) / (n+1)`. -/
def momentAntideriv (n : ℕ) (x : Cut) : Cut :=
  (1 - cutCos x ^ (n + 1)) / ((n : Cut) + 1)

/-- ★★★ THE GEOMETRY THEOREM, ∀ n ∀ x: the rate of change of `momentAntideriv n` at `x`
    IS the n-ended return integrand `cutCos x ^ n · cutSin x`. The chain: power rule on
    `cutCos` (derivative −cutSin), constant-minus, divide by (n+1) — the (n+1) cancels.
    This is the u-substitution the per-n constructions encode, exhibited uniformly. -/
theorem momentAntideriv_hasDerivAt (n : ℕ) (x : Cut) :
    CutHasDerivAt (momentAntideriv n) (cutCos x ^ n * cutSin x) x := by
  have hpow := cutHasDerivAt_pow (cutCos_hasDerivAt x) n
  have hsub := cutHasDerivAt_const_sub 1 hpow
  have hdiv := cutHasDerivAt_div_const ((n : Cut) + 1) hsub
  have hfun : (fun y => (1 - cutCos y ^ (n + 1)) / ((n : Cut) + 1)) = momentAntideriv n := by
    funext y; rfl
  rw [hfun] at hdiv
  convert hdiv using 1
  have hn1 : ((n : Cut) + 1) ≠ 0 := by positivity
  field_simp

/-- The general full-return moment: the antiderivative evaluated over `[0, π]`. -/
def momentGeneral (n : ℕ) : Cut := momentAntideriv n cutPi - momentAntideriv n 0

/-- Its closed value: `(1 − (−1)^(n+1)) / (n+1)` — from `cutCos π = −1`, `cutCos 0 = 1`. -/
theorem momentGeneral_eq (n : ℕ) :
    momentGeneral n = (1 - (-1 : Cut) ^ (n + 1)) / ((n : Cut) + 1) := by
  unfold momentGeneral momentAntideriv
  rw [cutCos_cutPi, cutCos_zero]
  have h1 : (1 : Cut) ^ (n + 1) = 1 := one_pow _
  rw [h1]
  ring

/-- ★★★ THE ∀-n WELD (referee seam B closed): `termMomentNorm n` IS the constructed
    general moment per unit return measure, for EVERY n — the closed form is no longer
    definitional; it is the evaluation of the object whose derivative is the n-ended
    integrand (`momentAntideriv_hasDerivAt`), normalized by the banked measure
    (`sinAntideriv cutPi = 2`). -/
theorem termMomentNorm_eq_geometry (n : ℕ) :
    termMomentNorm n = momentGeneral n / sinAntideriv cutPi := by
  rw [momentGeneral_eq, sinAntideriv_cutPi, termMomentNorm]
  have hn1 : ((n : Cut) + 1) ≠ 0 := by positivity
  field_simp

/-- The measure itself is the n = 0 instance: `sinAntideriv π = momentGeneral 0`
    (the return measure is the zero-ended moment — one construction, all n). -/
theorem measure_is_moment_zero : sinAntideriv cutPi = momentGeneral 0 := by
  rw [sinAntideriv_cutPi, momentGeneral_eq]
  norm_num

/-! ## (6) THE AGREEMENT THEOREMS — the general geometry meets the five per-n tsum
    constructions (both compute the same normalized moments). -/

theorem geometry_agrees_one :
    momentGeneral 1 / sinAntideriv cutPi = firstMomentFlux cutPi / sinAntideriv cutPi := by
  rw [← termMomentNorm_eq_geometry, termMomentNorm_one_weld]

theorem geometry_agrees_two :
    momentGeneral 2 / sinAntideriv cutPi = depthWeight := by
  rw [← termMomentNorm_eq_geometry, termMomentNorm_two_weld]

theorem geometry_agrees_three :
    momentGeneral 3 / sinAntideriv cutPi = thirdMomentFlux cutPi / sinAntideriv cutPi := by
  rw [← termMomentNorm_eq_geometry, termMomentNorm_three_weld]

theorem geometry_agrees_four :
    momentGeneral 4 / sinAntideriv cutPi = fourthEvenMomentFlux cutPi / sinAntideriv cutPi := by
  rw [← termMomentNorm_eq_geometry, termMomentNorm_four_weld]

theorem geometry_agrees_five :
    momentGeneral 5 / sinAntideriv cutPi = fifthMomentFlux cutPi / sinAntideriv cutPi := by
  rw [← termMomentNorm_eq_geometry, termMomentNorm_five_weld]

/-- ★★★ THE ENDS SELECTION, FULLY GEOMETRIC ∀ n: the ends-count whose CONSTRUCTED
    normalized return moment equals the banked weight is exactly 2 — the composition of
    the ∀-n weld with the ∀-n arithmetic selection. -/
theorem moment_geometry_selects_two (n : ℕ) :
    momentGeneral n / sinAntideriv cutPi = depthWeight ↔ n = 2 := by
  rw [← termMomentNorm_eq_geometry]
  exact termMomentNorm_eq_weight_iff n

end
end MirrorTermLanguage
end Phys.Algebra
