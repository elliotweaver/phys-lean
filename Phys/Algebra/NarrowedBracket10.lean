/-
  # N### — ARC-D (THE DIGITS): THE NARROWING CAMPAIGN, NODE 11 (D5-next-10)

  Directed successor of D5-next-9 (`Phys/Algebra/NarrowedBracket9.lean`). The eleventh narrowing rung.

  ## The bottleneck this node acts on (the anti-drift crux — the ONE LAW, read correctly)

  After D5-next-9 the `1/cutPi` residual was the SOLE binding contribution, but both endpoints of its
  `leastCosZero` bracket had hit the `1e9` grid: `leastCosZero ∈ [1570796326/1e9, 1570796327/1e9]`, the
  integer floor/ceiling of the true `π/2 · 1e9 = 1570796326.79`. So the whole `1e9`-grid bracket was
  exhausted.

  ## The structural win: LIFT THE WHOLE `1/cutPi` BRACKET ONTO A `1e10`-GRID.

  The escape is NOT a finer coordinate grind but the SAME banked double-double-angle positivity route
  (two applications of the fold's own `cutCos_double`), re-aimed at a `1e10`-grid argument. Because the
  route reduces near-`π/2` positivity to a WELL-CONDITIONED near-`π/8` lower bound (cosine `≈ 0.924`,
  a healthy sum with no cancellation), the same low-order-dominated certification that closed at the
  `1e9` grid closes just as robustly at the `1e10` grid — only the constants get one digit longer:

    LOWER: `cutCos y > 184775906503/2e11` for `0 ≤ y < 15707963267/4e10`, split@6, near-`π/8`; then
           `cutCos x = 2·(2·(cutCos(x/4))²−1)²−1 > 0` for `0 ≤ x < 15707963267/1e10`, since
           `184775906503/2e11 > cos(π/8)` (the double-double-angle closure `2·(2C²−1)²−1 > 0`, value
           `≈ 3.88×10⁻¹¹`). This pushes `leastCosZero`'s certified LOWER bound to `15707963267/1e10` —
           the integer FLOOR of the true `π/2 · 1e10 = 15707963267.95`, only `0.95×10⁻¹⁰` below.
           The `nlinarith` certificate at this thinner window (`≈ 5.3×10⁻¹²`) is supplied by the exact
           tight square bound `y² < (15707963267/4e10)²` together with the monotonicity products
           `(B − y²)·y^(2k) ≥ 0` — the polynomial factorization the ill-conditioned degree-12 goal needs.

    UPPER: `cutCos (15707963268/1e10) < 0` read off the banked `cutCos_bracket` at split@8 (the same
           split index as the parent; the `≈ −5.1×10⁻¹²` cosine at the `1e10` tick is certified by
           `partialCos_eight ≈ −7.02×10⁻¹¹` and remainder `≈ 6.62×10⁻¹¹`, sum `≈ −4.04×10⁻¹² < 0`).
           `15707963268/1e10` is the integer CEILING of the true half-period, only `0.05×10⁻¹⁰` above.

  Together: `leastCosZero ∈ [15707963267/1e10, 15707963268/1e10]`, width `1×10⁻¹⁰` — a `10×` tighter
  bracket than the parent's `1×10⁻⁹`, entirely on the `1e10` grid.

  ## The re-composed numeral

  `cutPi = 2·leastCosZero ∈ [15707963267/5000000000, 3926990817/1250000000]` (width `2×10⁻¹⁰`), hence
  `1/cutPi ∈ [1250000000/3926990817, 5000000000/15707963267]` (width `≈ 2.03×10⁻¹¹`, `≈ 10×` narrower
  than the parent's `≈ 2.03×10⁻¹⁰`). Running the banked D4 pipeline (`endpoint_assembled_bracket` at
  census `d = chargeTraceDepth = 16/3`) with this sharpened `1/cutPi` and the parent's split@5
  `cutLog ∈ [815406110/1e8, 815406115/1e8]`:

    2401465987690/35342917353 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 9605863954190/141371669403

  a certified two-sided rational bracket of `Cut` of width `≈ 2.86×10⁻⁸` — narrower than the parent's
  `≈ 3.12×10⁻⁸` and NESTED strictly inside it (BOTH endpoints moved inward, since both `1/cutPi` bounds
  sharpened). The campaign's eleventh rung.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`). Still WIDE relative to measured precision (`≈ 2.86×10⁻⁸` vs the target `~2×10⁻¹⁰`
  relative); the campaign continues.

  ★ THE UPDATED BOTTLENECK — A SHIFT: with `1/cutPi` now on a `1e10` grid its contribution to the
  assembled width has collapsed to `≈ 2.9×10⁻¹⁰`, and the split@5 `cutLog ∈ [815406110/1e8, 815406115/1e8]`
  (contribution `≈ 2.83×10⁻⁸`, `≈ 100×` larger) is NOW the sole binding residual. This is why the
  assembled bracket only narrowed `≈ 1.09×` this rung (all of `1/cutPi`'s win is now below the `cutLog`
  floor). The NEXT rung's win is a SHARPER `cutLog` — a deeper Born-square amplitude bracket for `m01`
  and/or a deeper exp index in the banked `D1` instrument — not a further `1/cutPi` grid lift. The
  successor is directed at `cutLog` accordingly.

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the
  chosen index (the `π/2` grid floor/ceiling), NEVER by where the measured `1/α(0) ≈ 137.036` sits (the
  derived value lands `≈ 67.9476`, nowhere near it). The measured `1/α(0)` and `π` appear ONLY in this
  removable prose. Words-removable: every theorem below is a statement about certified rational brackets
  of a derived closed real of `Cut`.

  Import guard: `NarrowedBracket9` only (transitively the whole banked chain + the fold's own double-angle
  identity `cutCos_double`). NO Mathlib ℝ/ℂ as content, NO `Real.pi`/`Real.cos`/`Real.exp`, NO kernel-eval
  decision procedures, NO floats in production. Foundations-only.
-/
import Phys.Algebra.NarrowedBracket9

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) THE `1e10`-GRID DOUBLE-DOUBLE-ANGLE LOWER POSITIVITY — the same trunk lever, one digit deeper.

    The parent's double-double-angle route (two applications of the fold's own `cutCos_double`) folds the
    ill-conditioned near-`π/2` positivity to a WELL-CONDITIONED near-`π/8` positivity (cosine `≈ 0.924`,
    a healthy sum). That conditioning is grid-independent, so the SAME certification closes at a `1e10`-grid
    argument — the constants merely gain one digit. This is the ONE LAW read correctly: the instrument does
    not fight on the finer grid because the trunk lever removed the near-cancellation entirely. -/

set_option maxHeartbeats 8000000 in
/-- THE `1e10`-GRID near-`π/8` cosine lower bound: `cutCos y > 184775906503/2e11` for
    `0 ≤ y < 15707963267/4e10`. At `y ≈ π/8` the cosine is `≈ 0.924` — a healthy sum, no cancellation —
    so the banked `cutCos_bracket` at split@6 (remainder factor `≤ 101/100`) closes with a single
    `nlinarith` even though the certification window `cos(y) − C ≈ 5.3×10⁻¹²` is thin (`≈ 7×` thinner than
    the parent's `1e9` window): the small argument `≈ 0.393` makes the truncated series low-order-dominated,
    so the positivity is not a near-cancellation. The certificate uses the EXACT tight square bound
    `y² < (15707963267/4e10)²` (no rounding slack) together with the monotonicity products `(B − y²)·y^(2k) ≥ 0`,
    which supply the polynomial factorization the thin-margin degree-12 goal needs. The threshold
    `C = 184775906503/2e11 = 0.923879532515` satisfies `2·(2C²−1)²−1 > 0` (the double-double-angle closure,
    value `≈ 3.88×10⁻¹¹`) and `C > cos(π/8)`, exactly what the two `cutCos_double` steps need. -/
theorem cutCos_gt_pi8_10 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 15707963267 / 40000000000) :
    (184775906503 / 200000000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 246740109997421313289 / 1600000000000000000000 := by
    have h1 : y * y < (15707963267 / 40000000000) * (15707963267 / 40000000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (15707963267 / 40000000000 : Cut) * (15707963267 / 40000000000)
        = 246740109997421313289 / 1600000000000000000000 := by norm_num
    linarith [h1, h2.le]
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
  -- the exact tight square bound gives `B − y² ≥ 0`; the products `(B − y²)·y^(2k) ≥ 0` supply the
  -- monotonicity factorization terms the thin-margin degree-12 positivity certificate needs.
  have hB : (0 : Cut) ≤ 246740109997421313289 / 1600000000000000000000 - y ^ 2 := by linarith [hy2]
  have hy2n : (0 : Cut) ≤ y ^ 2 := sq_nonneg y
  have hy4n : (0 : Cut) ≤ y ^ 4 := by positivity
  have hy6n : (0 : Cut) ≤ y ^ 6 := by positivity
  have hy8n : (0 : Cut) ≤ y ^ 8 := by positivity
  have hy10n : (0 : Cut) ≤ y ^ 10 := by positivity
  have hpoly : (184775906503 / 200000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hB, hy2n, hy4n, hy6n, hy8n, hy10n,
      mul_nonneg hB hy2n, mul_nonneg hB hy4n, mul_nonneg hB hy6n,
      mul_nonneg hB hy8n, mul_nonneg hB hy10n, mul_nonneg hB hB,
      mul_nonneg (mul_nonneg hB hB) hy2n]
  linarith [hb, hrembd, hpoly]

/-- THE `1e10`-GRID DOUBLE-DOUBLE-ANGLE STRUCTURAL LOWER POSITIVITY: `0 < cutCos x` for
    `0 ≤ x < 15707963267/1e10`, via TWO applications of `cutCos_double`. Sets `y = x/4 < 15707963267/4e10`,
    gets `cutCos y > 184775906503/2e11` (well-conditioned near `π/8`), then
      `cutCos x = 2·(2·(cutCos y)² − 1)² − 1 > 0`
    since `184775906503/2e11 > cos(π/8)`. Pushes the certified positivity out to `15707963267/1e10` — the
    integer floor of the true `π/2 · 1e10 = 15707963267.95`, i.e. the tightest achievable value at the
    `1e10` grid, `≈ 6.7×10⁻¹⁰` past the parent's `1e9`-grid ceiling `1570796326/1e9`. -/
theorem cutCos_pos_of_lt_15707963267 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707963267 / 10000000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 4 := by linarith
  have hy : x / 4 < 15707963267 / 40000000000 := by linarith
  have hcy := cutCos_gt_pi8_10 (x / 4) hy0 hy
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
  have hcsq : (184775906503 / 200000000000 : Cut) * (184775906503 / 200000000000) < c * c :=
    mul_lt_mul' (le_of_lt hcy) hcy (by norm_num) hcpos
  have hu : (14142135624005397689009 / 20000000000000000000000 : Cut) < 2 * c * c - 1 := by nlinarith [hcsq]
  have hu_pos : (0 : Cut) < 2 * c * c - 1 := lt_trans (by norm_num) hu
  have husq : (14142135624005397689009 / 20000000000000000000000 : Cut)
        * (14142135624005397689009 / 20000000000000000000000)
      < (2 * c * c - 1) * (2 * c * c - 1) :=
    mul_lt_mul' (le_of_lt hu) hu (by norm_num) hu_pos
  nlinarith [husq]

/-- THE `1e10`-GRID LOWER BOUND: `15707963267/1e10 ≤ leastCosZero`. The cosine is strictly positive on
    `[0, 15707963267/1e10)` (`cutCos_pos_of_lt_15707963267`), so no zero lives below `15707963267/1e10`,
    hence `15707963267/1e10 ≤` the infimum (`le_csInf`). `≈ 6.7×10⁻¹⁰` sharper than the parent's
    `1570796326/1e9`. -/
theorem le_leastCosZero_15707963267 : (15707963267 / 10000000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_15707963267 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

/-! ## (B) THE `1e10`-GRID UPPER SIGN — split@8, one tick above the true `π/2`. -/

set_option maxHeartbeats 4000000 in
/-- THE `1e10`-GRID UPPER SIGN: `cutCos (15707963268/1e10) < 0`. Read off the banked `cutCos_bracket` at
    split@8 (the same split index as the parent): the `≈ −5.1×10⁻¹²` cosine at the `1e10` tick is certified
    by `partialCos_eight ≈ −7.02×10⁻¹¹` and remainder `≈ 6.62×10⁻¹¹`, sum `≈ −4.04×10⁻¹² < 0`.
    `15707963268/1e10` is the integer CEILING of the true `π/2 · 1e10 = 15707963267.95`, only `0.05×10⁻¹⁰`
    above it. -/
theorem cutCos_15707963268_neg : cutCos (15707963268 / 10000000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 15707963268 / 10000000000 := by norm_num
  have hxN : (15707963268 / 10000000000 : Cut) ^ 2 < (((2 * 8 + 1) * (2 * 8 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (15707963268 / 10000000000) hx0 8 hxN).2
  rw [partialCos_eight] at hb
  have hrem : cosRemBound (15707963268 / 10000000000 : Cut) 8 ≤ 662 / 10000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (15707963268 / 10000000000) ^ 2 / 2 + (15707963268 / 10000000000) ^ 4 / 24
      - (15707963268 / 10000000000) ^ 6 / 720 + (15707963268 / 10000000000) ^ 8 / 40320
      - (15707963268 / 10000000000) ^ 10 / 3628800 + (15707963268 / 10000000000) ^ 12 / 479001600
      - (15707963268 / 10000000000) ^ 14 / 87178291200 ≤ -702 / 10000000000000 := by norm_num
  linarith

/-- `leastCosZero ≤ 15707963268/1e10` (the `1e10`-grid UPPER bound): the IVT on `[0, 15707963268/1e10]`
    supplies a cosine zero `≤ 15707963268/1e10` (since `cutCos (15707963268/1e10) < 0 ≤ cutCos 0`), and
    `csInf_le`. -/
theorem leastCosZero_le_15707963268 : leastCosZero ≤ 15707963268 / 10000000000 := by
  have h02 : (0 : Cut) ≤ 15707963268 / 10000000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (15707963268 / 10000000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (15707963268 / 10000000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_15707963268_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-! ## (C) THE `1e10`-GRID `cutPi` AND `1/cutPi` BRACKETS. -/

/-- THE `1e10`-GRID `cutPi` BRACKET: `cutPi ∈ [15707963267/5000000000, 3926990817/1250000000]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [15707963267/1e10, 15707963268/1e10]` (the LOWER bound the
    new `1e10` double-double-angle `le_leastCosZero_15707963267`, the UPPER the split@8
    `leastCosZero_le_15707963268`). Width `2×10⁻¹⁰`. (`15707963267/5000000000 = 2·15707963267/1e10`,
    `3926990817/1250000000 = 2·15707963268/1e10`.) -/
theorem cutPi_bracket_ext5 :
    (15707963267 / 5000000000 : Cut) ≤ cutPi ∧ cutPi ≤ 3926990817 / 1250000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_15707963267; linarith
  · have := leastCosZero_le_15707963268; linarith

/-- THE `1e10`-GRID RESIDUAL BRACKET: `1/cutPi ∈ [1250000000/3926990817, 5000000000/15707963267]` — a
    certified two-sided rational bracket of `Cut` for the derived `1/cutPi`, width `≈ 2.03×10⁻¹¹`,
    nested strictly inside the parent's `[500000000/1570796327, 250000000/785398163]` (`≈ 10×` narrower,
    from BOTH ends since both `1/cutPi` bounds sharpened). -/
theorem inv_cutPi_bracket_ext5 :
    (1250000000 / 3926990817 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 5000000000 / 15707963267 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext5
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- W8 — THE `1e10`-GRID RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `1250000000/3926990817 <
    5000000000/15707963267` (a genuine reading of width `≈ 2.03×10⁻¹¹`, not a collapsed point). -/
theorem inv_cutPi_ext5_strict : (1250000000 / 3926990817 : Cut) < 5000000000 / 15707963267 := by norm_num

/-- W8 — THE `1e10`-GRID `1/cutPi` BRACKET IS NESTED INSIDE the parent's `[500000000/1570796327,
    250000000/785398163]`: `500000000/1570796327 ≤ 1250000000/3926990817` and `5000000000/15707963267 ≤
    250000000/785398163` — the narrowing genuinely shrinks the bracket from BOTH ends. -/
theorem inv_cutPi_ext5_nested :
    (500000000 / 1570796327 : Cut) ≤ 1250000000 / 3926990817
      ∧ (5000000000 / 15707963267 : Cut) ≤ 250000000 / 785398163 := by
  refine ⟨by norm_num, by norm_num⟩

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.NarrowedBracket10

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
    `1e10`-grid-lifted `1/cutPi` and the parent's split@5 `cutLog` (now the binding residual), at census
    `d = chargeTraceDepth = 16/3`. -/

/-- THE RE-COMPOSED FURTHER-NARROWER NUMERAL: run the banked `endpoint_assembled_bracket` at
    `d = chargeTraceDepth = 16/3` with `cutLog ∈ [815406110/1e8, 815406115/1e8]` (the parent's
    `cutLog_lo_s5` / `cutLog_hi_s5`) and `1/cutPi ∈ [1250000000/3926990817, 5000000000/15707963267]`
    (`inv_cutPi_bracket_ext5`):

        190/3 + (16/9)·(815406110/1e8)·(1250000000/3926990817)
          ≤ invAlphaZero (completeBandList chargeTraceDepth)
          ≤ 190/3 + (16/9)·(815406115/1e8)·(5000000000/15707963267),
        i.e.  2401465987690/35342917353 ≤ invAlphaZero (completeBandList chargeTraceDepth) ≤ 9605863954190/141371669403.

    A certified two-sided rational bracket of `Cut` of width `≈ 2.86×10⁻⁸` — narrower than the parent's
    `[960586395190/14137166943, 480293197510/7068583467]` (width `≈ 3.12×10⁻⁸`) and NESTED strictly inside
    it (BOTH endpoints moved inward — both `1/cutPi` bounds sharpened on the `1e10` grid). The campaign's
    eleventh rung. ⚠ NO-FIT: the residual endpoints are chosen by instrument certifiability, not tuned to
    a measured value. ★ The narrowing is only `≈ 1.09×` this rung because `1/cutPi`'s contribution has now
    dropped below the split@5 `cutLog` floor (`≈ 2.83×10⁻⁸`) — `cutLog` is now the binding residual. -/
theorem invAlphaZero_narrowed10_bracket :
    (2401465987690 / 35342917353 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
      ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 9605863954190 / 141371669403 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (1250000000 / 3926990817) (5000000000 / 15707963267) (by norm_num)
    inv_cutPi_bracket_ext5.1 inv_cutPi_bracket_ext5.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (2401465987690 / 35342917353 : Cut)
        ≤ 190 / 3 + chargeTraceDepth / 3 * (815406110 / 100000000) * (1250000000 / 3926990817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (190 / 3 + chargeTraceDepth / 3 * (815406115 / 100000000) * (5000000000 / 15707963267) : Cut)
        ≤ 9605863954190 / 141371669403 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-- THE FURTHER-NARROWED DRESSED BRACKET at the derived weight `w = 1/3`: the running-of-the-running
    endpoint `dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)` pinned with the
    `1e10`-grid-lifted `1/cutPi` and the parent's `cutLog`, at `d = 16/3`:

        74 + (8/3)·(815406110/1e8)·(1250000000/3926990817) ≤ · ≤ 74 + (8/3)·(815406115/1e8)·(5000000000/15707963267),
        i.e.  953332572374/11780972451 ≤ · ≤ 3813330291274/47123889801. -/
theorem dressed_narrowed10_bracket :
    (953332572374 / 11780972451 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
      ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 3813330291274 / 47123889801 := by
  have hd : 0 ≤ chargeTraceDepth := le_of_lt chargeTraceDepth_pos
  have hb := dressed_endpoint_assembled_bracket chargeTraceDepth hd
    (815406110 / 100000000) (815406115 / 100000000) (by norm_num) cutLog_lo_s5 cutLog_hi_s5
    (1250000000 / 3926990817) (5000000000 / 15707963267) (by norm_num)
    inv_cutPi_bracket_ext5.1 inv_cutPi_bracket_ext5.2
  obtain ⟨hlo, hhi⟩ := hb
  constructor
  · have harith : (953332572374 / 11780972451 : Cut)
        ≤ 74 + chargeTraceDepth / 2 * (815406110 / 100000000) * (1250000000 / 3926990817) := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans harith hlo
  · have harith : (74 + chargeTraceDepth / 2 * (815406115 / 100000000) * (5000000000 / 15707963267) : Cut)
        ≤ 3813330291274 / 47123889801 := by
      rw [chargeTraceDepth_eq]; norm_num
    exact le_trans hhi harith

/-! ## (E) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY TWO-SIDED (non-degenerate):
    `2401465987690/35342917353 < 9605863954190/141371669403`. -/
theorem invAlphaZero_narrowed10_strict :
    (2401465987690 / 35342917353 : Cut) < 9605863954190 / 141371669403 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS STRICTLY NARROWER THAN the parent's (D5-next-9): its width
    `9605863954190/141371669403 − 2401465987690/35342917353` is strictly below the parent's width
    `480293197510/7068583467 − 960586395190/14137166943`. This is the campaign's core progress tooth — the
    assembled bracket genuinely shrank an eleventh time (`1/cutPi` lifted onto the `1e10` grid via the same
    double-double-angle route, sharpening BOTH endpoints). -/
theorem invAlphaZero_narrowed10_width_lt :
    (9605863954190 / 141371669403 - 2401465987690 / 35342917353 : Cut)
      < 480293197510 / 7068583467 - 960586395190 / 14137166943 := by norm_num

/-- W8 — THE FURTHER-NARROWED BRACKET IS NESTED INSIDE the parent's: `960586395190/14137166943 ≤
    2401465987690/35342917353` (lower moved inward) and `9605863954190/141371669403 ≤ 480293197510/7068583467`
    (upper moved inward). A monotone refinement from BOTH ends — the new bracket sits entirely within the
    old, so no earlier reading is contradicted. -/
theorem invAlphaZero_narrowed10_nested :
    (960586395190 / 14137166943 : Cut) ≤ 2401465987690 / 35342917353
      ∧ (9605863954190 / 141371669403 : Cut) ≤ 480293197510 / 7068583467 := by
  refine ⟨by norm_num, by norm_num⟩

/-- W8 — THE FURTHER-NARROWED ENDPOINT GENUINELY SCREENS ABOVE THE HIGH-BAND WAY-POINT:
    `190/3 < 2401465987690/35342917353` (the lepton tail runs `1/α` genuinely up at the physical census,
    not a collapse). -/
theorem invAlphaZero_narrowed10_gt_waypoint :
    (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  have h := invAlphaZero_narrowed10_bracket.1
  have hgt : (190 / 3 : Cut) < 2401465987690 / 35342917353 := by norm_num
  linarith

/-! ## (F) THE D5-next-10 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, ELEVENTH RUNG (arc-D D5-next-10, welded landing). The sole binding residual
    `1/cutPi`'s bracket was at the `π/2` `1e9`-grid floor/ceiling; this node LIFTED the whole `1/cutPi`
    bracket onto a `1e10` grid via the SAME banked double-double-angle route (two applications of the
    fold's own `cutCos_double`, folding near-`π/2` positivity to a well-conditioned near-`π/8` one),
    re-aimed one digit deeper; and the D4 pipeline re-composed to a strictly narrower certified two-sided
    rational bracket of the derived `1/α(0)`:

    (1) THE `1e10`-GRID RESIDUAL: `1/cutPi ∈ [1250000000/3926990817, 5000000000/15707963267]`
        (`inv_cutPi_bracket_ext5`), from `cutPi ∈ [15707963267/5000000000, 3926990817/1250000000]`
        (`cutPi_bracket_ext5`), `leastCosZero ∈ [15707963267/1e10, 15707963268/1e10]` — the LOWER bound the
        new `1e10` double-double-angle `le_leastCosZero_15707963267`, the UPPER the split@8
        `leastCosZero_le_15707963268`;
    (2) THE cutLog CONTENT (reused from the parent, now the binding residual):
        `cutLog(mass0/mass1) ∈ [815406110/1e8, 815406115/1e8]` (`cutLog_lo_s5` / `cutLog_hi_s5`);
    (3) THE RE-COMPOSED FURTHER-NARROWER NUMERAL: `2401465987690/35342917353 ≤ invAlphaZero
        (completeBandList chargeTraceDepth) ≤ 9605863954190/141371669403` (`invAlphaZero_narrowed10_bracket`),
        width `≈ 2.86×10⁻⁸`;
    (4) THE DRESSED FURTHER-NARROWER BRACKET: `953332572374/11780972451 ≤ · ≤ 3813330291274/47123889801`
        (`dressed_narrowed10_bracket`);
    (5) TEETH: the narrowed bracket is strictly two-sided (`invAlphaZero_narrowed10_strict`), strictly
        narrower than the parent's (`invAlphaZero_narrowed10_width_lt`), nested inside the parent's
        (`invAlphaZero_narrowed10_nested`), and screens above `190/3`
        (`invAlphaZero_narrowed10_gt_waypoint`); the residual bracket is strictly two-sided and nested
        (`inv_cutPi_ext5_strict` / `inv_cutPi_ext5_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). The bracket is narrower
    than the parent's but still WIDE relative to the measured precision; the campaign continues.
    ★ THE UPDATED BOTTLENECK — A SHIFT: `1/cutPi` is now on a `1e10` grid, its contribution to the
    assembled width collapsed to `≈ 2.9×10⁻¹⁰`; the split@5 `cutLog` (contribution `≈ 2.83×10⁻⁸`, `≈ 100×`
    larger) is NOW the sole binding residual. The next win is a SHARPER `cutLog` (a deeper Born-square
    `m01` bracket and/or a deeper exp index in the banked D1 instrument), NOT a further `1/cutPi` grid lift.
    The measured `1/α(0) ≈ 137.036` and `π` are REMOVABLE PROSE ONLY; no empirical number in any proof;
    explicit NO-FIT (the residual endpoints are chosen by instrument certifiability at the chosen index, not
    by the measured value; the derived value lands `≈ 67.9476`, nowhere near `137.036`). -/
theorem narrowedBracket10_landing :
    -- (1) the `1e10`-grid residual bracket (1/cutPi via the double-double-angle lower bound, split@8 upper)
    ((1250000000 / 3926990817 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 5000000000 / 15707963267)
    ∧ ((15707963267 / 5000000000 : Cut) ≤ cutPi ∧ cutPi ≤ 3926990817 / 1250000000)
    -- (2) the cutLog content bracket (reused from the parent, now the binding residual)
    ∧ ((815406110 / 100000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406115 / 100000000)
    -- (3) the re-composed further-narrower numeral
    ∧ ((2401465987690 / 35342917353 : Cut) ≤ invAlphaZero (completeBandList chargeTraceDepth)
        ∧ invAlphaZero (completeBandList chargeTraceDepth) ≤ 9605863954190 / 141371669403)
    -- (4) the dressed further-narrower bracket at the derived weight
    ∧ ((953332572374 / 11780972451 : Cut) ≤ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth)
        ∧ dressedInvAlphaZero depthWeight (completeBandList chargeTraceDepth) ≤ 3813330291274 / 47123889801)
    -- (5) teeth: strictly two-sided, strictly narrower than the parent, nested inside it, screens above 190/3
    ∧ (2401465987690 / 35342917353 : Cut) < 9605863954190 / 141371669403
    ∧ ((9605863954190 / 141371669403 - 2401465987690 / 35342917353 : Cut)
        < 480293197510 / 7068583467 - 960586395190 / 14137166943)
    ∧ ((960586395190 / 14137166943 : Cut) ≤ 2401465987690 / 35342917353
        ∧ (9605863954190 / 141371669403 : Cut) ≤ 480293197510 / 7068583467)
    ∧ (190 / 3 : Cut) < invAlphaZero (completeBandList chargeTraceDepth) := by
  exact ⟨inv_cutPi_bracket_ext5, cutPi_bracket_ext5,
    ⟨cutLog_lo_s5, cutLog_hi_s5⟩,
    invAlphaZero_narrowed10_bracket, dressed_narrowed10_bracket,
    invAlphaZero_narrowed10_strict, invAlphaZero_narrowed10_width_lt,
    invAlphaZero_narrowed10_nested, invAlphaZero_narrowed10_gt_waypoint⟩

end

end Phys.Algebra.NarrowedBracket10
