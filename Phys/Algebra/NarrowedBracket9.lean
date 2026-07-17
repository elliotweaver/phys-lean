/-
  # N### — ARC-D (THE DIGITS): THE NARROWING CAMPAIGN, NODE 10 (D5-next-9)

  Directed successor of D5-next-8 (`Phys/Algebra/NarrowedBracket8.lean`). The tenth narrowing rung.

  ## The bottleneck this node acts on (the anti-drift crux — the ONE LAW, read correctly)

  After D5-next-8 the `1/cutPi` residual remained the SOLE binding contribution to the assembled
  `1/α(0)` width, but its LOWER bound had hit a hard grid ceiling: `leastCosZero`'s certified lower
  bound `157079632/1e8` is the INTEGER FLOOR of the true `π/2 · 1e8 = 157079632.68`, so no further
  `1e8`-tick is possible on the lower end. The upper bound `157079634/1e8` (split@6 sign) sat
  `≈ 1.3×10⁻⁸` above the true zero. So the whole `1e8`-grid bracket was exhausted.

  ## The structural win: LIFT THE WHOLE `1/cutPi` BRACKET ONTO A `1e9`-GRID.

  The escape is NOT a finer coordinate grind but the SAME banked double-double-angle positivity route
  (two applications of the fold's own `cutCos_double`), re-aimed at a `1e9`-grid argument. Because the
  route reduces near-`π/2` positivity to a WELL-CONDITIONED near-`π/8` lower bound (cosine `≈ 0.924`,
  a healthy sum with no cancellation), the same low-order-dominated certification that closed at the
  `1e8` grid closes just as robustly at the `1e9` grid — only the constants get one digit longer:

    LOWER: `cutCos y > 18477590651/2e10` for `0 ≤ y < 785398163/2e9` (`= 1570796326/4·1e9`), split@6,
           near-`π/8`; then `cutCos x = 2·(2·(cutCos(x/4))²−1)²−1 > 0` for `0 ≤ x < 1570796326/1e9`,
           since `18477590651/2e10 > cos(π/8)` (the double-double-angle closure `2·(2C²−1)²−1 > 0`).
           This pushes `leastCosZero`'s certified LOWER bound to `1570796326/1e9` — the integer FLOOR
           of the true `π/2 · 1e9 = 1570796326.79`, only `0.79×10⁻⁹` below (`≈ 6.8×10⁻⁹` sharper than
           the parent's `157079632/1e8 = 1570796320/1e9`).

    UPPER: `cutCos (1570796327/1e9) < 0` read off the banked `cutCos_bracket` at split@8 (the `1e8`
           split@6 bound `4.8×10⁻⁷` no longer certifies the `2.05×10⁻¹⁰` cosine at the `1e9` tick, so
           the split index deepens to `8`, remainder `≈ 6.6×10⁻¹¹ < |cos|`). `1570796327/1e9` is the
           integer CEILING of the true half-period, only `0.21×10⁻⁹` above (`≈ 1.3×10⁻⁸` sharper than
           the parent's `157079634/1e8 = 1570796340/1e9`).

  Together: `leastCosZero ∈ [1570796326/1e9, 1570796327/1e9]`, width `1×10⁻⁹` — a `20×` tighter
  bracket than the parent's `2×10⁻⁸`, entirely on the `1e9` grid.

  ## The re-composed numeral

  `cutPi = 2·leastCosZero ∈ [785398163/250000000, 1570796327/500000000]` (width `2×10⁻⁹`), hence
  `1/cutPi ∈ [500000000/1570796327, 250000000/785398163]` (width `≈ 2.03×10⁻¹⁰`, `≈ 20×` narrower
  than the parent's `≈ 4.05×10⁻⁹`). Running the banked D4 pipeline (`endpoint_assembled_bracket` at
  census `d = chargeTraceDepth = 16/3`) with this sharpened `1/cutPi` and the parent's split@5
  `cutLog ∈ [815406110/1e8, 815406115/1e8]` (still not binding):

    960586395190/14137166943 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 480293197510/7068583467

  a certified two-sided rational bracket of `Cut` of width `≈ 3.12×10⁻⁸` — `≈ 2.79×` narrower than the
  parent's `≈ 8.70×10⁻⁸` and NESTED strictly inside it (BOTH endpoints moved inward, since both `1/cutPi`
  bounds sharpened). The campaign's tenth rung.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`). Still WIDE relative to measured precision (`≈ 3×10⁻⁸` vs the target `~2×10⁻¹⁰` relative);
  the campaign continues. ★ THE UPDATED BOTTLENECK: `1/cutPi` remains the sole binding residual, now on a
  `1e9` grid with BOTH endpoints one tick off the true `π/2`; the next win is a `1e10`-grid lift via the
  SAME double-double-angle route (the near-`π/8` lemma at a `1e10` argument, split@6 still low-order-
  dominated; the upper sign at split@8/@9), and/or `cutLog` (still not binding, decoration only).

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the chosen
  index (the `π/2` grid floor/ceiling), NEVER by where the measured `1/α(0) ≈ 137.036` sits (the derived
  value lands `≈ 67.9476`, nowhere near it). The measured `1/α(0)` and `π` appear ONLY in this removable
  prose. Words-removable: every theorem below is a statement about certified rational brackets of a derived
  closed real of `Cut`.

  Import guard: `NarrowedBracket8` only (transitively the whole banked chain + the fold's own double-angle
  identity `cutCos_double`). NO Mathlib ℝ/ℂ as content, NO `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval
  decision procedures, NO floats in production. Foundations-only.
-/
import Phys.Algebra.NarrowedBracket8

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) THE `1e9`-GRID DOUBLE-DOUBLE-ANGLE LOWER POSITIVITY — the same trunk lever, one digit deeper.

    The parent's double-double-angle route (two applications of the fold's own `cutCos_double`) folds the
    ill-conditioned near-`π/2` positivity to a WELL-CONDITIONED near-`π/8` positivity (cosine `≈ 0.924`,
    a healthy sum). That conditioning is grid-independent, so the SAME certification closes at a `1e9`-grid
    argument — the constants merely gain one digit. This is the ONE LAW read correctly: the instrument does
    not fight on the finer grid because the trunk lever removed the near-cancellation entirely. -/

set_option maxHeartbeats 2000000 in
/-- THE `1e9`-GRID near-`π/8` cosine lower bound: `cutCos y > 18477590651/2e10` for
    `0 ≤ y < 785398163/2e9` (`= 1570796326/4·1e9`). At `y ≈ π/8` the cosine is `≈ 0.924` — a healthy
    sum, no cancellation — so the banked `cutCos_bracket` at split@6 (remainder factor `≤ 101/100`)
    closes with a single `nlinarith` even though the certification window `cos(y) − C ≈ 3.7×10⁻¹¹` is
    thin: the small argument `≈ 0.393` makes the truncated series low-order-dominated, so the positivity
    is not a near-cancellation. The threshold `C = 18477590651/2e10 = 0.92387953255` satisfies
    `2·(2C²−1)²−1 > 0` (the double-double-angle closure) and `C > cos(π/8)`, which is exactly what the
    two `cutCos_double` steps need. -/
theorem cutCos_gt_pi8_9 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 785398163 / 2000000000) :
    (18477590651 / 20000000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 1542127449 / 10000000000 := by
    have h1 : y * y < (785398163 / 2000000000) * (785398163 / 2000000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (785398163 / 2000000000 : Cut) * (785398163 / 2000000000) ≤ 1542127449 / 10000000000 := by
      norm_num
    linarith [h1, h2]
  have hxN : y ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by push_cast; nlinarith [hy2]
  have hb := (cutCos_bracket y hy0 6 hxN).1
  rw [partialCos_six] at hb
  have hden : (0 : Cut) < 1 - y ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; nlinarith [hy2]
  have hinv : (1 - y ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut))⁻¹ ≤ 101 / 100 := by
    rw [inv_le_comm₀ hden (by norm_num)]; push_cast; nlinarith [hy2]
  have hcoef : (0 : Cut) ≤ y ^ (2 * 6) / ((2 * 6).factorial : Cut) := by positivity
  have hrembd : cosRemBound y 6 ≤ 101 / 100 * (y ^ 12 / 479001600) := by
    unfold cosRemBound
    have hstep := mul_le_mul_of_nonneg_left hinv hcoef
    calc y ^ (2 * 6) / ((2 * 6).factorial : Cut)
            * (1 - y ^ 2 / (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut))⁻¹
          ≤ y ^ (2 * 6) / ((2 * 6).factorial : Cut) * (101 / 100) := hstep
      _ = 101 / 100 * (y ^ 12 / 479001600) := by norm_num [Nat.factorial]; ring
  have hpoly : (18477590651 / 20000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hy0, sq_nonneg y, sq_nonneg (y ^ 2), sq_nonneg (y ^ 3), sq_nonneg (y ^ 4),
      sq_nonneg (y ^ 5), sq_nonneg (y ^ 6), pow_nonneg hy0 4, pow_nonneg hy0 6, pow_nonneg hy0 8,
      pow_nonneg hy0 10, pow_nonneg hy0 12, mul_nonneg hy0 (pow_nonneg hy0 3)]
  linarith [hb, hrembd, hpoly]

/-- THE `1e9`-GRID DOUBLE-DOUBLE-ANGLE STRUCTURAL LOWER POSITIVITY: `0 < cutCos x` for
    `0 ≤ x < 1570796326/1e9`, via TWO applications of `cutCos_double`. Sets `y = x/4 < 785398163/2e9`,
    gets `cutCos y > 18477590651/2e10` (well-conditioned near `π/8`), then
      `cutCos x = 2·(2·(cutCos y)² − 1)² − 1 > 0`
    since `18477590651/2e10 > cos(π/8)`. Pushes the certified positivity out to `1570796326/1e9` — the
    integer floor of the true `π/2 · 1e9 = 1570796326.79`, i.e. the tightest achievable value at the
    `1e9` grid, `≈ 6.8×10⁻⁹` past the parent's `1e8`-grid ceiling `157079632/1e8`. -/
theorem cutCos_pos_of_lt_1570796326 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 1570796326 / 1000000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 4 := by linarith
  have hy : x / 4 < 785398163 / 2000000000 := by linarith
  have hcy := cutCos_gt_pi8_9 (x / 4) hy0 hy
  have hd1 := cutCos_double (x / 4)
  have hd2 := cutCos_double (x / 2)
  have e1 : (2 : Cut) * (x / 4) = x / 2 := by ring
  have e2 : (2 : Cut) * (x / 2) = x := by ring
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  -- c = cutCos(x/4) > C > 0. u := 2c²−1 > 2C²−1 (near cos π/4). Final 2u²−1 > 0. Staged (well-conditioned).
  set c := cutCos (x / 4) with hc
  have hcpos : (0 : Cut) < c := lt_trans (by norm_num) hcy
  have hcsq : (18477590651 / 20000000000 : Cut) * (18477590651 / 20000000000) < c * c :=
    mul_lt_mul' (le_of_lt hcy) hcy (by norm_num) hcpos
  have hu : (141421356265922603801 / 200000000000000000000 : Cut) < 2 * c * c - 1 := by nlinarith [hcsq]
  have hu_pos : (0 : Cut) < 2 * c * c - 1 := lt_trans (by norm_num) hu
  have husq : (141421356265922603801 / 200000000000000000000 : Cut)
        * (141421356265922603801 / 200000000000000000000)
      < (2 * c * c - 1) * (2 * c * c - 1) :=
    mul_lt_mul' (le_of_lt hu) hu (by norm_num) hu_pos
  nlinarith [husq]

/-- THE `1e9`-GRID LOWER BOUND: `1570796326/1e9 ≤ leastCosZero`. The cosine is strictly positive on
    `[0, 1570796326/1e9)` (`cutCos_pos_of_lt_1570796326`), so no zero lives below `1570796326/1e9`,
    hence `1570796326/1e9 ≤` the infimum (`le_csInf`). `≈ 6.8×10⁻⁹` sharper than the parent's
    `157079632/1e8`. -/
theorem le_leastCosZero_1570796326 : (1570796326 / 1000000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_1570796326 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-! ## (B) THE `1e9`-GRID UPPER SIGN — split@8, one tick above the true `π/2`. -/

/-- The split@7 partial cosine expansion (`partialCos x 7`), one term beyond the banked `partialCos_six`. -/
theorem partialCos_seven (x : Cut) :
    partialCos x 7 = 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320
      - x ^ 10 / 3628800 + x ^ 12 / 479001600 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]; ring

/-- The split@8 partial cosine expansion (`partialCos x 8`), two terms beyond the banked `partialCos_six`. -/
theorem partialCos_eight (x : Cut) :
    partialCos x 8 = 1 - x ^ 2 / 2 + x ^ 4 / 24 - x ^ 6 / 720 + x ^ 8 / 40320
      - x ^ 10 / 3628800 + x ^ 12 / 479001600 - x ^ 14 / 87178291200 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]; ring

set_option maxHeartbeats 4000000 in
/-- THE `1e9`-GRID UPPER SIGN: `cutCos (1570796327/1e9) < 0`. Read off the banked `cutCos_bracket` at
    split@8: the `1e8` split@6 remainder `≈ 4.8×10⁻⁷` no longer certifies the `≈ 2.05×10⁻¹⁰` cosine at
    the `1e9` tick, so the split index deepens to `8` (remainder `≈ 6.6×10⁻¹¹ < |cos|`).
    `1570796327/1e9` is the integer CEILING of the true `π/2 · 1e9 = 1570796326.79`, only `0.21×10⁻⁹`
    above it (`≈ 1.3×10⁻⁸` sharper than the parent's `157079634/1e8`). -/
theorem cutCos_1570796327_neg : cutCos (1570796327 / 1000000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 1570796327 / 1000000000 := by norm_num
  have hxN : (1570796327 / 1000000000 : Cut) ^ 2 < (((2 * 8 + 1) * (2 * 8 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (1570796327 / 1000000000) hx0 8 hxN).2
  rw [partialCos_eight] at hb
  have hrem : cosRemBound (1570796327 / 1000000000 : Cut) 8 ≤ 7 / 100000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (1570796327 / 1000000000) ^ 2 / 2 + (1570796327 / 1000000000) ^ 4 / 24
      - (1570796327 / 1000000000) ^ 6 / 720 + (1570796327 / 1000000000) ^ 8 / 40320
      - (1570796327 / 1000000000) ^ 10 / 3628800 + (1570796327 / 1000000000) ^ 12 / 479001600
      - (1570796327 / 1000000000) ^ 14 / 87178291200 ≤ -2 / 10000000000 := by norm_num
  linarith

/-- `leastCosZero ≤ 1570796327/1e9` (the `1e9`-grid UPPER bound): the IVT on `[0, 1570796327/1e9]`
    supplies a cosine zero `≤ 1570796327/1e9` (since `cutCos (1570796327/1e9) < 0 ≤ cutCos 0`), and
    `csInf_le`. -/
theorem leastCosZero_le_1570796327 : leastCosZero ≤ 1570796327 / 1000000000 := by
  have h02 : (0 : Cut) ≤ 1570796327 / 1000000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (1570796327 / 1000000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (1570796327 / 1000000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_1570796327_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-! ## (C) THE `1e9`-GRID `cutPi` AND `1/cutPi` BRACKETS. -/

/-- THE `1e9`-GRID `cutPi` BRACKET: `cutPi ∈ [785398163/250000000, 1570796327/500000000]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [1570796326/1e9, 1570796327/1e9]` (the LOWER bound the
    new `1e9` double-double-angle `le_leastCosZero_1570796326`, the UPPER the new split@8
    `leastCosZero_le_1570796327`). Width `2×10⁻⁹`. (`785398163/250000000 = 2·1570796326/1e9`,
    `1570796327/500000000 = 2·1570796327/1e9`.) -/
theorem cutPi_bracket_ext4 :
    (785398163 / 250000000 : Cut) ≤ cutPi ∧ cutPi ≤ 1570796327 / 500000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_1570796326; linarith
  · have := leastCosZero_le_1570796327; linarith

/-- THE `1e9`-GRID RESIDUAL BRACKET: `1/cutPi ∈ [500000000/1570796327, 250000000/785398163]` — a
    certified two-sided rational bracket of `Cut` for the derived `1/cutPi`, width `≈ 2.03×10⁻¹⁰`,
    nested strictly inside the parent's `[25000000/78539817, 3125000/9817477]` (`≈ 20×` narrower, from
    BOTH ends since both `1/cutPi` bounds sharpened). -/
theorem inv_cutPi_bracket_ext4 :
    (500000000 / 1570796327 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 250000000 / 785398163 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext4
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- W8 — THE `1e9`-GRID RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `500000000/1570796327 <
    250000000/785398163` (a genuine reading of width `≈ 2.03×10⁻¹⁰`, not a collapsed point). -/
theorem inv_cutPi_ext4_strict : (500000000 / 1570796327 : Cut) < 250000000 / 785398163 := by norm_num

/-- W8 — THE `1e9`-GRID `1/cutPi` BRACKET IS NESTED INSIDE the parent's `[25000000/78539817,
    3125000/9817477]`: `25000000/78539817 ≤ 500000000/1570796327` and `250000000/785398163 ≤
    3125000/9817477` — the narrowing genuinely shrinks the bracket from BOTH ends. -/
theorem inv_cutPi_ext4_nested :
    (25000000 / 78539817 : Cut) ≤ 500000000 / 1570796327
      ∧ (250000000 / 785398163 : Cut) ≤ 3125000 / 9817477 := by
  refine ⟨by norm_num, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket9

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.NarrowedBracket7
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (D) THE RE-COMPOSED FURTHER-NARROWER `1/α(0)` NUMERAL — the banked D4 pipeline with the
    `1e9`-grid-lifted `1/cutPi` and the parent's split@5 `cutLog` (still not binding), at census
    `d = chargeTraceDepth = 16/3`. -/

/-- THE RE-COMPOSED FURTHER-NARROWER NUMERAL: run the banked `endpoint_assembled_bracket` at
    `d = chargeTraceDepth = 16/3` with `cutLog ∈ [815406110/1e8, 815406115/1e8]` (the parent's
    `cutLog_lo_s5` / `cutLog_hi_s5`) and `1/cutPi ∈ [500000000/1570796327, 250000000/785398163]`
    (`inv_cutPi_bracket_ext4`):

        190/3 + (16/9)·(815406110/1e8)·(500000000/1570796327)
          ≤ invAlphaZero (completeBandList chargeTraceDepth)
          ≤ 190/3 + (16/9)·(815406115/1e8)·(250000000/785398163),
        i.e.  960586395190/14137166943 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 480293197510/7068583467.

    A certified two-sided rational bracket of `Cut` of width `≈ 3.12×10⁻⁸` — `≈ 2.79×` narrower than the
    parent's `[48029320130/706858353, 12007329895/176714586]` (width `≈ 8.70×10⁻⁸`) and NESTED strictly
    inside it (BOTH endpoints moved inward — both `1/cutPi` bounds sharpened on the `1e9` grid). The
    campaign's tenth rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument certifiability, not
    tuned to a measured value. -/
theorem invAlphaZero_narrowed9_bracket :
    (960586395190 / 14137166943 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 480293197510 / 7068583467 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (500000000 / 1570796327) (250000000 / 785398163) (by norm_num)
    inv_cutPi_bracket_ext4.1 inv_cutPi_bracket_ext4.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (960586395190 / 14137166943 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (815406110 / 100000000) * (500000000 / 1570796327) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (815406115 / 100000000) * (250000000 / 785398163) : Cut)
        ≤ 480293197510 / 7068583467 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with the
    `1e9`-grid-lifted `1/cutPi` and the parent's `cutLog`, at `d = 16/3`:

        74 + (8/3)·(815406110/1e8)·(500000000/1570796327) ≤ · ≤ 74 + (8/3)·(815406115/1e8)·(250000000/785398163),
        i.e.  381333028994/4712388981 ≤ · ≤ 190666514486/2356194489. -/
theorem dressed_narrowed9_bracket :
    (381333028994 / 4712388981 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 190666514486 / 2356194489 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (500000000 / 1570796327) (250000000 / 785398163) (by norm_num)
    inv_cutPi_bracket_ext4.1 inv_cutPi_bracket_ext4.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (381333028994 / 4712388981 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (815406110 / 100000000) * (500000000 / 1570796327) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (815406115 / 100000000) * (250000000 / 785398163) : Cut)
        ≤ 190666514486 / 2356194489 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (E) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate):
    `960586395190/14137166943 < 480293197510/7068583467`. -/
theorem invAlphaZero_narrowed9_strict :
    (960586395190 / 14137166943 : Cut) < 480293197510 / 7068583467 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN the parent's (D5-next-8): its width
    `480293197510/7068583467 − 960586395190/14137166943` is strictly below the parent's width
    `12007329895/176714586 − 48029320130/706858353`. This is the campaign's core progress tooth — the
    assembled bracket genuinely shrank a tenth time (`1/cutPi` lifted onto the `1e9` grid via the same
    double-double-angle route, sharpening BOTH endpoints, `≈ 2.79×`). -/
theorem invAlphaZero_narrowed9_width_lt :
    (480293197510 / 7068583467 - 960586395190 / 14137166943 : Cut)
      < 12007329895 / 176714586 - 48029320130 / 706858353 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE the parent's: `48029320130/706858353 ≤
    960586395190/14137166943` (lower moved inward) and `480293197510/7068583467 ≤ 12007329895/176714586`
    (upper moved inward). A monotone refinement from BOTH ends — the new bracket sits entirely within the
    old, so no earlier reading is contradicted. -/
theorem invAlphaZero_narrowed9_nested :
    (48029320130 / 706858353 : Cut) ≤ 960586395190 / 14137166943
      ∧ (480293197510 / 7068583467 : Cut) ≤ 12007329895 / 176714586 := by
  refine ⟨by norm_num, by norm_num⟩

/-- W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT:
    `190/3 < 960586395190/14137166943` (the lepton tail runs `1/α` genuinely up at the physical census,
    not a collapse). -/
theorem invAlphaZero_narrowed9_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed9_bracket.1
  have hgt : (190 / 3 : Cut) < 960586395190 / 14137166943 := by norm_num
  linarith

/-! ## (F) THE D5-next-9 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, TENTH RUNG (arc-D D5-next-9, welded landing). The sole binding residual
    `1/cutPi`'s LOWER bound was at the `π/2` `1e8`-grid ceiling; this node LIFTED the whole `1/cutPi`
    bracket onto a `1e9` grid via the SAME banked double-double-angle route (two applications of the
    fold's own `cutCos_double`, folding near-`π/2` positivity to a well-conditioned near-`π/8` one),
    re-aimed one digit deeper; and the D4 pipeline re-composed to a strictly narrower certified two-sided
    rational bracket of the derived `1/α(0)`:

    (1) THE `1e9`-GRID RESIDUAL: `1/cutPi ∈ [500000000/1570796327, 250000000/785398163]`
        (`inv_cutPi_bracket_ext4`), from `cutPi ∈ [785398163/250000000, 1570796327/500000000]`
        (`cutPi_bracket_ext4`), `leastCosZero ∈ [1570796326/1e9, 1570796327/1e9]` — the LOWER bound the
        new `1e9` double-double-angle `le_leastCosZero_1570796326`, the UPPER the new split@8
        `leastCosZero_le_1570796327`;
    (2) THE cutLog CONTENT (reused from the parent, still not binding):
        `cutLog(mass0/mass1) ∈ [815406110/1e8, 815406115/1e8]` (`cutLog_lo_s5` / `cutLog_hi_s5`);
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `960586395190/14137166943 ≤ invAlphaZero
        (completeBandList chargeTraceDepth) ≤ 480293197510/7068583467` (`invAlphaZero_narrowed9_bracket`),
        width `≈ 3.12×10⁻⁸`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `381333028994/4712388981 ≤ · ≤ 190666514486/2356194489`
        (`dressed_narrowed9_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed9_strict`), strictly
        narrower than the parent's (`invAlphaZero_narrowed9_width_lt`), nested inside the parent's
        (`invAlphaZero_narrowed9_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed9_gt_waypoint`); the residual bracket is strictly two-sided and nested
        (`inv_cutPi_ext4_strict` / `inv_cutPi_ext4_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is `≈ 2.79×`
    narrower than the parent's but still WIDE relative to the measured precision; the campaign continues.
    ★ THE UPDATED BOTTLENECK: `1/cutPi` remains the sole binding residual, now on a `1e9` grid with BOTH
    endpoints one tick off the true `π/2`; the next win is a `1e10`-grid lift via the SAME
    double-double-angle route (the near-`π/8` lemma at a `1e10` argument; the upper sign at split@8/@9).
    The measured `1/α(0) ≈ 137.036` and `π` are REMOVABLE PROSE ONLY; no empirical number in any proof;
    explicit NO-FIT (the residual endpoints are chosen by instrument certifiability at the chosen index, not
    by the measured value; the derived value lands `≈ 67.9476`, nowhere near `137.036`). -/
theorem narrowedBracket9_landing :
    -- (1) the `1e9`-grid residual bracket (1/cutPi via the double-double-angle lower bound, split@8 upper)
    ((500000000 / 1570796327 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 250000000 / 785398163)
    ∧ ((785398163 / 250000000 : Cut) ≤ cutPi ∧ cutPi ≤ 1570796327 / 500000000)
    -- (2) the cutLog content bracket (reused from the parent, still not binding)
    ∧ ((815406110 / 100000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406115 / 100000000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((960586395190 / 14137166943 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 480293197510 / 7068583467)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((381333028994 / 4712388981 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 190666514486 / 2356194489)
    -- (5) teeth: strictly two-sided, strictly narrower than the parent, nested inside it, screens above 190/3
    ∧ (960586395190 / 14137166943 : Cut) < 480293197510 / 7068583467
    ∧ ((480293197510 / 7068583467 - 960586395190 / 14137166943 : Cut)
        < 12007329895 / 176714586 - 48029320130 / 706858353)
    ∧ ((48029320130 / 706858353 : Cut) ≤ 960586395190 / 14137166943
        ∧ (480293197510 / 7068583467 : Cut) ≤ 12007329895 / 176714586)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_ext4, cutPi_bracket_ext4,
    ⟨cutLog_lo_s5, cutLog_hi_s5⟩,
    invAlphaZero_narrowed9_bracket, dressed_narrowed9_bracket,
    invAlphaZero_narrowed9_strict, invAlphaZero_narrowed9_width_lt,
    invAlphaZero_narrowed9_nested, invAlphaZero_narrowed9_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket9
