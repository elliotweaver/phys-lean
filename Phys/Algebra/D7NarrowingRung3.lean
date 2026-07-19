/-
  # N583 — ARC-D (THE DIGITS): D7 ENDPOINT NARROWING RUNG 3 — κ = 1/cutPi lifted onto the 1e12 grid
  (ext7) + the split@7 `L_m01` wired in, re-assembling the freeze-out endpoint at ≈ 14 sig digits.

  Succeeds N582 (FrameAuditedCompositionReattestation): the owner FRAME AUDIT closed — the
  frame-audited `recomposedEndpointDressed = 2425/18 + (3/2)·kappaLeading·cInner` composition is
  COMPLETE (F1 architecture ARCH-B + F2 dressing scope SCOPE-(c) + D7 bare census-completeness + the
  bare↔dressed weld all assemble), so the residual endpoint precision is INSTRUMENT precision, not a
  frame defect, and the ≥15-sig-digit narrowing RESUMES.

  This node deepens the two dominant residuals feeding the banked endpoint normal forms
  (`D7DepthTwoComposed.recomposedEndpoint_cInner`, `recomposedEndpointDressed_normalform`), reading the
  SAME banked derived objects one grid deeper — NO fit, NO new axiom:

    recomposedEndpoint         = 2425/18 + κ·(2·L_m01 + (7/3)·L_mb + (11/3)·L_b0 − (5/3)·L_b2)
    recomposedEndpointDressed  = 2425/18 + κ·(3·L_m01 + (7/2)·L_mb + (11/2)·L_b0 − (5/2)·L_b2)

  ## (A) κ = 1/cutPi ext7 — LIFT `leastCosZero` onto the 1e12 grid (SAME double-double-angle lever)
  The dominant residual after N580 was κ = 1/cutPi (ext6, 1e11 grid). This node lifts it one grid deeper:
  - LOWER (positivity): `cutCos_gt_pi8_12` reads `cutCos` near π/8 at split@6 (remainder factor 101/100),
    then TWO applications of the fold's own `cutCos_double` fold near-π/2 positivity to the
    well-conditioned near-π/8 argument, giving `cutCos_pos_of_lt_1570796326794` ⇒
    `le_leastCosZero_1570796326794`: `1570796326794/1e12 ≤ leastCosZero`.
  - UPPER (negativity via DDA — the trunk-native mirror): `v = cutCos(314159265359/8e11) ∈ [9/10, R]`,
    `R = 923879532511277/1e15 ≤ cos(π/8)`; `closure(R) = 2(2R²−1)²−1 < 0` ⇒ `cutCos(1570796326795/1e12) < 0`
    ⇒ `leastCosZero ≤ 1570796326795/1e12` via IVT (`intermediate_value_Icc'`).
  Together `cutPi = 2·leastCosZero ∈ [785398163397/25e10, 314159265359/1e11]`, hence
  `1/cutPi ∈ [100000000000/314159265359, 250000000000/785398163397]` (width ≈ 2.03×10⁻¹³, ≈ 10× narrower
  than ext6, nested strictly inside), and `κ = kappaLeading = (1/cutPi)/3`.

  ## (B) split@7 `L_m01` — read the SAME derived cycle-phase cosine `cutCos(2/9)` one term deeper
  Everything is the banked amplitude chain (`GenerationMassRatios.pB/wB/rB/b0/b1/mass0/mass1`) re-run
  with `cutCos(2/9)` read at split@7 (`partialCos_two_ninths_seven`, remainder ≤ 9×10⁻²¹), giving
  `pB` width `2×10⁻¹⁸`; re-propagating through the banked Born-square amplitude chain gives
  `m01 = mass0/mass1 ∈ [347747283710459/1e11, 17387364185523/5e9]` (width `10⁻¹¹`), and reading the D1
  exp instrument at partial-sum index `38` gives
  `L_m01 = cutLog(mass0/mass1) ∈ [815406111272599/1e14, 815406111272603/1e14]` (width `4×10⁻¹⁴`,
  ≈ 250× narrower than the banked s6, NESTED inside it).

  ## (C) edge logs — reuse N580's deepened `cutLog_bMass0_deep`/`cutLog_bMass2_deep`/`cutLog_mb_deep`
  (width ≈ 10⁻¹³) VERBATIM.

  ## LANDING (verified exact arithmetic — the abstract cores keep transcendentals OUT)
  - BARE `recomposedEndpoint ∈ [1363071881405515/1e13, 1363071881405528/1e13]`
    (`136.3071881405515 … 136.3071881405528`, width `1.3×10⁻¹²`, ≈ 13–14 sig digits), nested STRICTLY
    inside the banked N580 `[136.3071881405, 136.3071881406]`, `< 137`.
  - DRESSED `recomposedEndpointDressed ∈ [1370996710997162/1e13, 1370996710997180/1e13]`
    (`137.0996710997162 … 137.0996710997180`), nested STRICTLY inside the banked N580
    `[137.0996710997, 137.0996710998]`, `> 137`.

  ⚠ HONEST GRADE: THEOREM-route, CERTIFIED (certified two-sided rational brackets of closed reals of the
  derived `Cut`, no error bar). ~12→~14 sig-digit advance. NOT 15: after ext7, κ = 1/cutPi is AGAIN the
  dominant residual (needs ext8, a 1e13 grid) — the ≥15-sig-digit floor is ROUTE-NOT-YET-FOUND (INSTRUMENT
  precision, deeper partial sums of the banked series), handed to ONE directed successor. Continue-the-hunt,
  NOT an arc exit.

  ⚠ NO-FIT: every endpoint is chosen by where the derived series' sign/bracket is CERTIFIABLE at the chosen
  index (the split index `7` / the π/2 grid `1e12` / the exp partial-sum index `38`), NEVER by where any
  measured value sits. No empirical number appears in any statement or proof; the measured `1/α(0) ≈ 137.036`
  and `π` are REMOVABLE ORIENTATION PROSE ONLY. Words-removable: every theorem below is a statement about
  certified rational brackets of a derived closed real of `Cut`.

  Imports: `D7NarrowingRung2` (the deepened edge logs `cutLog_bMass0_deep`/`cutLog_bMass2_deep`/`cutLog_mb_deep`
  + the cores pattern), `NarrowedBracket12` (the ext6 instrument + `cutCos_double`/`cutCos_bracket`/
  `partialCos_six`/`partialCos_seven`/`cosRemBound`/`leastCosZero`/`cutPi` + `NarrowedBracket11` s6
  transitively), `Mathlib.Tactic`. DERIVED `ℝ` `Cut` only; NO Mathlib ℝ/ℂ as content, NO `Real.pi`/
  `Real.cos`/`Real.exp`, NO kernel-eval decision procedures, NO floats in production. Foundations-only.
-/
import Phys.Algebra.D7NarrowingRung2
import Phys.Algebra.NarrowedBracket12
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

/-! ## (A) THE 1e12-GRID `leastCosZero` INSTRUMENT (ext7) — the SAME double-double-angle lever as ext6,
    re-aimed one grid deeper. LOWER via near-π/8 positivity folded twice; UPPER via DDA negativity. -/

set_option maxHeartbeats 8000000 in
/-- THE split@6 near-π/8 POSITIVITY (remainder factor `≤ 101/100`): `9238795325113/1e13 < cutCos y` for
    `0 ≤ y < 785398163397/2e12` (`≈ π/8`, well-conditioned). Mirrors the ext6 `cutCos_gt_pi8_11`, re-aimed
    at the `1e12`-grid quarter-argument. -/
theorem cutCos_gt_pi8_12 (y : Cut) (hy0 : 0 ≤ y) (hy : y < 785398163397 / 2000000000000) :
    (9238795325113 / 10000000000000 : Cut) < cutCos y := by
  have hy2 : y ^ 2 < 616850275067380710579609 / 4000000000000000000000000 := by
    have h1 : y * y < (785398163397 / 2000000000000) * (785398163397 / 2000000000000) :=
      mul_lt_mul' (le_of_lt hy) hy hy0 (by norm_num)
    rw [pow_two]
    have h2 : (785398163397 / 2000000000000 : Cut) * (785398163397 / 2000000000000)
        = 616850275067380710579609 / 4000000000000000000000000 := by norm_num
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
  have hB : (0 : Cut) ≤ 616850275067380710579609 / 4000000000000000000000000 - y ^ 2 := by linarith [hy2]
  have hy2n : (0 : Cut) ≤ y ^ 2 := sq_nonneg y
  have hy4n : (0 : Cut) ≤ y ^ 4 := by positivity
  have hy6n : (0 : Cut) ≤ y ^ 6 := by positivity
  have hy8n : (0 : Cut) ≤ y ^ 8 := by positivity
  have hy10n : (0 : Cut) ≤ y ^ 10 := by positivity
  have hpoly : (9238795325113 / 10000000000000 : Cut)
      < 1 - y ^ 2 / 2 + y ^ 4 / 24 - y ^ 6 / 720 + y ^ 8 / 40320 - y ^ 10 / 3628800
        - 101 / 100 * (y ^ 12 / 479001600) := by
    nlinarith [hy2, hB, hy2n, hy4n, hy6n, hy8n, hy10n,
      mul_nonneg hB hy2n, mul_nonneg hB hy4n, mul_nonneg hB hy6n,
      mul_nonneg hB hy8n, mul_nonneg hB hy10n, mul_nonneg hB hB,
      mul_nonneg (mul_nonneg hB hB) hy2n]
  linarith [hb, hrembd, hpoly]

/-- THE 1e12-GRID LOWER POSITIVITY: `0 < cutCos x` for `0 ≤ x < 1570796326794/1e12`, via TWO applications
    of the fold's own `cutCos_double` (folding near-π/2 positivity to the well-conditioned near-π/8 read
    `cutCos_gt_pi8_12`). Sets `y = x/4`. -/
theorem cutCos_pos_of_lt_1570796326794 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 1570796326794 / 1000000000000) :
    0 < cutCos x := by
  have hy0 : (0 : Cut) ≤ x / 4 := by linarith
  have hy : x / 4 < 785398163397 / 2000000000000 := by linarith
  have hcy := cutCos_gt_pi8_12 (x / 4) hy0 hy
  have hd1 := cutCos_double (x / 4)
  have hd2 := cutCos_double (x / 2)
  have e1 : (2 : Cut) * (x / 4) = x / 2 := by ring
  have e2 : (2 : Cut) * (x / 2) = x := by ring
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  set c := cutCos (x / 4) with hc
  have hcpos : (0 : Cut) < c := lt_trans (by norm_num) hcy
  have hcsq : (9238795325113 / 10000000000000 : Cut) * (9238795325113 / 10000000000000) < c * c :=
    mul_lt_mul' (le_of_lt hcy) hcy (by norm_num) hcpos
  have hu : (35355339059329823368462769 / 50000000000000000000000000 : Cut) < 2 * c * c - 1 := by
    nlinarith [hcsq]
  have hu_pos : (0 : Cut) < 2 * c * c - 1 := lt_trans (by norm_num) hu
  have husq : (35355339059329823368462769 / 50000000000000000000000000 : Cut)
        * (35355339059329823368462769 / 50000000000000000000000000)
      < (2 * c * c - 1) * (2 * c * c - 1) :=
    mul_lt_mul' (le_of_lt hu) hu (by norm_num) hu_pos
  nlinarith [husq]

/-- THE 1e12-GRID LOWER BOUND: `1570796326794/1e12 ≤ leastCosZero` (the integer floor of `π/2·1e12`).
    The cosine is strictly positive below this argument, so no cosine zero sits below it. -/
theorem le_leastCosZero_1570796326794 : (1570796326794 / 1000000000000 : Cut) ≤ leastCosZero := by
  apply le_csInf cosZeroSet_nonempty
  intro b hb
  by_contra hlt
  rw [not_le] at hlt
  have hb0 : 0 ≤ b := hb.1.1
  have hpos := cutCos_pos_of_lt_1570796326794 b hb0 hlt
  rw [hb.2] at hpos
  exact lt_irrefl _ hpos

set_option maxHeartbeats 8000000 in
/-- `v = cutCos(314159265359/8e11)` UPPER bound at split@7 near π/8: `v ≤ 923879532511277/1e15` (`≤ cos π/8`). -/
theorem v_le_R_12 :
    cutCos (314159265359 / 800000000000 : Cut) ≤ 923879532511277 / 1000000000000000 := by
  have hx0 : (0 : Cut) ≤ 314159265359 / 800000000000 := by norm_num
  have hxN : (314159265359 / 800000000000 : Cut) ^ 2 < (((2 * 7 + 1) * (2 * 7 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (314159265359 / 800000000000) hx0 7 hxN).2
  rw [partialCos_seven] at hb
  have hrem : cosRemBound (314159265359 / 800000000000 : Cut) 7 ≤ 3 / 100000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (314159265359 / 800000000000) ^ 2 / 2 + (314159265359 / 800000000000) ^ 4 / 24
      - (314159265359 / 800000000000) ^ 6 / 720 + (314159265359 / 800000000000) ^ 8 / 40320
      - (314159265359 / 800000000000) ^ 10 / 3628800 + (314159265359 / 800000000000) ^ 12 / 479001600
      + 3 / 100000000000000000 ≤ 923879532511277 / 1000000000000000 := by norm_num
  linarith

set_option maxHeartbeats 8000000 in
/-- `v = cutCos(314159265359/8e11)` coarse LOWER bound: `9/10 ≤ v` (split@6, huge margin). -/
theorem v_ge_9_10_12 :
    (9 / 10 : Cut) ≤ cutCos (314159265359 / 800000000000 : Cut) := by
  have hx0 : (0 : Cut) ≤ 314159265359 / 800000000000 := by norm_num
  have hxN : (314159265359 / 800000000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (314159265359 / 800000000000) hx0 6 hxN).1
  rw [partialCos_six] at hb
  have hrem : cosRemBound (314159265359 / 800000000000 : Cut) 6 ≤ 3 / 100000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (9 / 10 : Cut)
      ≤ 1 - (314159265359 / 800000000000 : Cut) ^ 2 / 2 + (314159265359 / 800000000000) ^ 4 / 24
        - (314159265359 / 800000000000) ^ 6 / 720 + (314159265359 / 800000000000) ^ 8 / 40320
        - (314159265359 / 800000000000) ^ 10 / 3628800 - 3 / 100000000000000 := by norm_num
  linarith

set_option maxHeartbeats 4000000 in
/-- THE 1e12-GRID UPPER SIGN via DDA NEGATIVITY: `cutCos(1570796326795/1e12) < 0`, from
    `cutCos(1570796326795/1e12) = 2(2v²−1)²−1` with `v ∈ [9/10, 923879532511277/1e15]`. -/
theorem cutCos_1570796326795_neg :
    cutCos (1570796326795 / 1000000000000 : Cut) < 0 := by
  have hd1 := cutCos_double (314159265359 / 800000000000 : Cut)
  have hd2 := cutCos_double (314159265359 / 400000000000 : Cut)
  have e1 : (2 : Cut) * (314159265359 / 800000000000) = 314159265359 / 400000000000 := by norm_num
  have e2 : (2 : Cut) * (314159265359 / 400000000000) = 1570796326795 / 1000000000000 := by norm_num
  rw [e1] at hd1
  rw [e2] at hd2
  rw [hd2, hd1]
  set v := cutCos (314159265359 / 800000000000) with hv
  have hvR := v_le_R_12
  have hvLo := v_ge_9_10_12
  rw [← hv] at hvR hvLo
  have hu_pos : (0 : Cut) < 2 * v * v - 1 := by nlinarith [hvLo]
  have hu_le : 2 * v * v - 1 ≤ 353553390593255735226132170729 / 500000000000000000000000000000 := by
    nlinarith [hvR, hvLo]
  nlinarith [hu_pos, hu_le]

/-- THE 1e12-GRID UPPER BOUND: `leastCosZero ≤ 1570796326795/1e12` (the integer ceil of `π/2·1e12`),
    via the intermediate value theorem (`intermediate_value_Icc'`) on the sign change of `cutCos`. -/
theorem leastCosZero_le_1570796326795 : leastCosZero ≤ 1570796326795 / 1000000000000 := by
  have h02 : (0 : Cut) ≤ 1570796326795 / 1000000000000 := by norm_num
  have hcont : ContinuousOn cutCos (Icc (0 : Cut) (1570796326795 / 1000000000000)) :=
    cutCos_continuous.continuousOn
  have hmem : (0 : Cut) ∈ Icc (cutCos (1570796326795 / 1000000000000)) (cutCos 0) := by
    rw [cutCos_zero]; exact ⟨le_of_lt cutCos_1570796326795_neg, by norm_num⟩
  obtain ⟨c, hc, hcval⟩ := (intermediate_value_Icc' h02 hcont) hmem
  have hc2 : c ≤ 2 := le_trans hc.2 (by norm_num)
  have hcmem : c ∈ cosZeroSet := ⟨⟨hc.1, hc2⟩, hcval⟩
  exact le_trans (csInf_le cosZeroSet_bddBelow hcmem) hc.2

/-! ## (A′) THE 1e12-GRID `cutPi` AND `1/cutPi` BRACKETS (ext7). -/

/-- THE 1e12-GRID `cutPi` BRACKET: `cutPi ∈ [785398163397/25e10, 314159265359/1e11]`, from
    `cutPi = 2·leastCosZero` and `leastCosZero ∈ [1570796326794/1e12, 1570796326795/1e12]`. Width
    `≈ 2×10⁻¹²`. -/
theorem cutPi_bracket_ext7 :
    (785398163397 / 250000000000 : Cut) ≤ cutPi ∧ cutPi ≤ 314159265359 / 100000000000 := by
  unfold cutPi
  refine ⟨?_, ?_⟩
  · have := le_leastCosZero_1570796326794; linarith
  · have := leastCosZero_le_1570796326795; linarith

/-- THE 1e12-GRID RESIDUAL BRACKET: `1/cutPi ∈ [100000000000/314159265359, 250000000000/785398163397]` —
    a certified two-sided rational bracket of `Cut` for the derived `1/cutPi`, width `≈ 2.03×10⁻¹³`,
    nested strictly inside the banked ext6 `[1250000000/3926990817, 50000000000/157079632679]`
    (`≈ 10×` narrower). -/
theorem inv_cutPi_bracket_ext7 :
    (100000000000 / 314159265359 : Cut) ≤ 1 / cutPi
      ∧ 1 / cutPi ≤ 250000000000 / 785398163397 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext7
  have hpos : 0 < cutPi := cutPi_pos
  refine ⟨?_, ?_⟩
  · rw [le_div_iff₀ hpos]; nlinarith [hhi, hpos]
  · rw [div_le_iff₀ hpos]; nlinarith [hlo, hpos]

/-- W8 — THE 1e12-GRID RESIDUAL BRACKET IS STRICTLY TWO-SIDED: `100000000000/314159265359 <
    250000000000/785398163397` (a genuine reading of width `≈ 2.03×10⁻¹³`, not a collapsed point). -/
theorem inv_cutPi_ext7_strict :
    (100000000000 / 314159265359 : Cut) < 250000000000 / 785398163397 := by norm_num

/-- W8 — THE 1e12-GRID `1/cutPi` BRACKET IS NESTED INSIDE the banked ext6 `[1250000000/3926990817,
    50000000000/157079632679]`: lower moved inward and upper moved inward — the narrowing genuinely
    shrinks the bracket from both ends onto the `1e12` grid. -/
theorem inv_cutPi_ext7_nested :
    (1250000000 / 3926990817 : Cut) ≤ 100000000000 / 314159265359
      ∧ (250000000000 / 785398163397 : Cut) ≤ 50000000000 / 157079632679 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (B₀) THE split@7 read of the derived cycle-phase cosine `cutCos(2/9)` — one term deeper than the
    banked s6, crushing its width from `10⁻¹⁵` (s6) to `2×10⁻¹⁸`. -/

/-- split@7 partial cosine at the cycle phase `2/9`:
    `partialCos (2/9) 7 = 128864817323146777/132113476427399775` (a pure ℚ computation, one term
    beyond the banked `partialCos_two_ninths_six`). -/
theorem partialCos_two_ninths_seven :
    partialCos (2 / 9 : Cut) 7 = 128864817323146777 / 132113476427399775 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end

end ContinuumQ
end Phys.Foundation

namespace Phys.Algebra.D7NarrowingRung3

open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.AssembledBracket
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7CompositionAttestation
open Phys.Algebra.D7NarrowingRung1
open Phys.Algebra.D7NarrowingRung2
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (B) THE split@7 `L_m01` INSTRUMENT — the banked amplitude chain re-run with `cutCos(2/9)` at
    split@7, giving `L_m01 = cutLog(mass0/mass1) ∈ [815406111272599/1e14, 815406111272603/1e14]`
    (width `4×10⁻¹⁴`, ≈ 250× narrower than the banked s6, NESTED inside it). -/

/-- THE SHARPER `p = cutCos(2/9)` LOWER BRACKET at split@7: `487705042694723761/5e17 ≤ cutCos(2/9)`. -/
theorem pB_lo_s7 : (487705042694723761 / 500000000000000000 : Cut) ≤ pB := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 7 (by norm_num)).1
  rw [partialCos_two_ninths_seven] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 7 ≤ 9 / 1000000000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (487705042694723761 / 500000000000000000 : Cut)
      ≤ 128864817323146777 / 132113476427399775 - 9 / 1000000000000000000000 := by norm_num
  linarith

/-- THE SHARPER `p = cutCos(2/9)` UPPER BRACKET at split@7: `cutCos(2/9) ≤ 975410085389447523/1e18`.
    Width `2×10⁻¹⁸`. -/
theorem pB_hi_s7 : pB ≤ 975410085389447523 / 1000000000000000000 := by
  have hb := (cutCos_bracket (2 / 9) (by norm_num) 7 (by norm_num)).2
  rw [partialCos_two_ninths_seven] at hb
  have hrem : cosRemBound (2 / 9 : Cut) 7 ≤ 9 / 1000000000000000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  unfold pB
  have : (128864817323146777 / 132113476427399775 + 9 / 1000000000000000000000 : Cut)
      ≤ 975410085389447523 / 1000000000000000000 := by norm_num
  linarith

/-- THE SHARPER `w = √2` LOWER BRACKET: `176776695296636881/125e15 ≤ wB` (from `wB·wB = 2`, `wB ≥ 0`). -/
theorem wB_lo_s7 : (176776695296636881 / 125000000000000000 : Cut) ≤ wB := by
  nlinarith [wB_ww, wB_nonneg]
/-- THE SHARPER `w = √2` UPPER BRACKET: `wB ≤ 1414213562373095049/1e18` (from `wB·wB = 2`). -/
theorem wB_hi_s7 : wB ≤ 1414213562373095049 / 1000000000000000000 := by
  nlinarith [wB_ww, wB_nonneg]

/-- THE SHARPER CONIC ROOT LOWER BRACKET: `95435022384883709/25e16 ≤ r` (from `r·r = 3 − 3p²`, the
    sharper `p` upper bound, `r ≥ 0`). -/
theorem rB_lo_s7 : (95435022384883709 / 250000000000000000 : Cut) ≤ rB := by
  have hp2hi : pB * pB
      ≤ (975410085389447523 / 1000000000000000000 : Cut) * (975410085389447523 / 1000000000000000000) :=
    mul_le_mul pB_hi_s7 pB_hi_s7 (le_of_lt pB_pos) (by norm_num)
  nlinarith [rB_rr, rB_nonneg, hp2hi]
/-- THE SHARPER CONIC ROOT UPPER BRACKET: `r ≤ 190870044769767423/5e17` (from `r·r = 3 − 3p²`, the
    sharper `p` lower bound). Width `2×10⁻¹⁸`. -/
theorem rB_hi_s7 : rB ≤ 190870044769767423 / 500000000000000000 := by
  have hp2lo : (487705042694723761 / 500000000000000000 : Cut) * (487705042694723761 / 500000000000000000)
      ≤ pB * pB :=
    mul_le_mul pB_lo_s7 pB_lo_s7 (by norm_num) (le_of_lt (by linarith [pB_lo_s7]))
  nlinarith [rB_rr, rB_nonneg, hp2lo]

/-- The sharper product `w·p` lower bracket. -/
theorem wp_lo_s7 : (1379438171633255409 / 1000000000000000000 : Cut) ≤ wB * pB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo_s7 pB_lo_s7 (by norm_num) (le_of_lt (by linarith [wB_lo_s7])))
/-- The sharper product `w·p` upper bracket. -/
theorem wp_hi_s7 : wB * pB ≤ (1379438171633255413 / 1000000000000000000 : Cut) :=
  le_trans (mul_le_mul wB_hi_s7 pB_hi_s7 (le_of_lt pB_pos) (by norm_num)) (by norm_num)
/-- The sharper product `w·r` lower bracket. -/
theorem wr_lo_s7 : (539862011928329837 / 1000000000000000000 : Cut) ≤ wB * rB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo_s7 rB_lo_s7 (by norm_num) (le_of_lt (by linarith [wB_lo_s7])))
/-- The sharper product `w·r` upper bracket. -/
theorem wr_hi_s7 : wB * rB ≤ (134965502982082463 / 250000000000000000 : Cut) := by
  have hrpos : (0 : Cut) < rB := by linarith [rB_lo_s7]
  exact le_trans (mul_le_mul wB_hi_s7 rB_hi_s7 (le_of_lt hrpos) (by norm_num)) (by norm_num)

/-- The sharper amplitude `b0` lower bracket. -/
theorem b0_lo_s7 : (2379438171633255409 / 1000000000000000000 : Cut) ≤ b0 := by
  unfold b0; linarith [wp_lo_s7]
/-- The sharper amplitude `b0` upper bracket. -/
theorem b0_hi_s7 : b0 ≤ (2379438171633255413 / 1000000000000000000 : Cut) := by
  unfold b0; linarith [wp_hi_s7]
theorem b0_pos_s7 : (0 : Cut) < b0 := by have := b0_lo_s7; linarith
/-- The sharper amplitude `b1` lower bracket. -/
theorem b1_lo_s7 : (16139963287682947 / 400000000000000000 : Cut) ≤ b1 := by
  unfold b1
  have he : (1 : Cut) - wB * (pB + rB) / 2 = 1 - (wB * pB + wB * rB) / 2 := by ring
  rw [he]; linarith [wp_hi_s7, wr_hi_s7]
/-- The sharper amplitude `b1` upper bracket. -/
theorem b1_hi_s7 : b1 ≤ (40349908219207377 / 1000000000000000000 : Cut) := by
  unfold b1
  have he : (1 : Cut) - wB * (pB + rB) / 2 = 1 - (wB * pB + wB * rB) / 2 := by ring
  rw [he]; linarith [wp_lo_s7, wr_lo_s7]
theorem b1_pos_s7 : (0 : Cut) < b1 := by have := b1_lo_s7; linarith

/-- The sharper Born-square mass `mass0 = b0²` lower bracket. -/
theorem mass0_lo_s7 :
    (2379438171633255409 / 1000000000000000000 : Cut) * (2379438171633255409 / 1000000000000000000)
      ≤ mass0 := by
  have := mul_le_mul b0_lo_s7 b0_lo_s7 (by norm_num) (le_of_lt b0_pos_s7)
  unfold mass0; nlinarith [this]
/-- The sharper Born-square mass `mass0 = b0²` upper bracket. -/
theorem mass0_hi_s7 :
    mass0 ≤ (2379438171633255413 / 1000000000000000000 : Cut) * (2379438171633255413 / 1000000000000000000) := by
  have := mul_le_mul b0_hi_s7 b0_hi_s7 (le_of_lt b0_pos_s7) (by norm_num)
  unfold mass0; nlinarith [this]
/-- The sharper Born-square mass `mass1 = b1²` lower bracket. -/
theorem mass1_lo_s7 :
    (16139963287682947 / 400000000000000000 : Cut) * (16139963287682947 / 400000000000000000)
      ≤ mass1 := by
  have := mul_le_mul b1_lo_s7 b1_lo_s7 (by norm_num) (le_of_lt b1_pos_s7)
  unfold mass1; nlinarith [this]
/-- The sharper Born-square mass `mass1 = b1²` upper bracket. -/
theorem mass1_hi_s7 :
    mass1 ≤ (40349908219207377 / 1000000000000000000 : Cut) * (40349908219207377 / 1000000000000000000) := by
  have := mul_le_mul b1_hi_s7 b1_hi_s7 (le_of_lt b1_pos_s7) (by norm_num)
  unfold mass1; nlinarith [this]

/-- THE FURTHER-SHARPENED `m01` LOWER BRACKET: `347747283710459/1e11 ≤ mass0/mass1`. -/
theorem m01_lo_s7 : (347747283710459 / 100000000000 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_s7, mass0_lo_s7]
/-- THE FURTHER-SHARPENED `m01` UPPER BRACKET: `mass0/mass1 ≤ 17387364185523/5e9`. Width `10⁻¹¹`. -/
theorem m01_hi_s7 : mass0 / mass1 ≤ (17387364185523 / 5000000000 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_s7, mass0_hi_s7]

set_option maxHeartbeats 4000000 in
/-- THE SHARPENED `L_m01` LOWER BRACKET: `815406111272599/1e14 ≤ cutLog(mass0/mass1)`. Composes
    `m01_lo_s7` with `cutLog_ge_certified` at partial-sum index `38` through `cutLog_mono`. -/
theorem cutLog_lo_s7 : (815406111272599 / 100000000000000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((347747283710459 : Cut) / 100000000000) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono (by norm_num) m01_lo_s7
  have hge : (815406111272599 / 100000000000000 : Cut)
      ≤ cutLog ((347747283710459 : Cut) / 100000000000) := by
    apply cutLog_ge_certified ((347747283710459 : Cut) / 100000000000)
      (815406111272599 / 100000000000000) 38 (by norm_num) (by norm_num)
    show partialExp (815406111272599 / 100000000000000) 38
      + expRemBound (815406111272599 / 100000000000000) 38
      ≤ (347747283710459 : Cut) / 100000000000
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

set_option maxHeartbeats 4000000 in
/-- THE SHARPENED `L_m01` UPPER BRACKET: `cutLog(mass0/mass1) ≤ 815406111272603/1e14`. Composes
    `m01_hi_s7` with `cutLog_le_certified` at partial-sum index `38` through `cutLog_mono`. Width
    `4×10⁻¹⁴` — ≈ 250× narrower than the banked s6, NESTED inside its `[815406111272/1e11,
    815406111273/1e11]`. -/
theorem cutLog_hi_s7 : cutLog (mass0 / mass1) ≤ (815406111272603 / 100000000000000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 347747283710459 / 100000000000) m01_lo_s7
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((17387364185523 : Cut) / 5000000000) :=
    cutLog_mono hpos m01_hi_s7
  have hbnd : cutLog ((17387364185523 : Cut) / 5000000000) ≤ (815406111272603 / 100000000000000 : Cut) := by
    apply cutLog_le_certified ((17387364185523 : Cut) / 5000000000)
      (815406111272603 / 100000000000000) 38 (by norm_num) (by norm_num)
    show (17387364185523 : Cut) / 5000000000 ≤ partialExp (815406111272603 / 100000000000000) 38
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

/-! ## (C) THE ext7 `κ = kappaLeading` BRACKET (from the 1e12-grid `1/cutPi`). -/

/-- THE ext7 `κ = kappaLeading` BRACKET: `(100000000000/314159265359)/3 ≤ kappaLeading ≤
    (250000000000/785398163397)/3` (`kappaLeading = (1/cutPi)/3`), from the `1e12`-grid
    `inv_cutPi_bracket_ext7`. -/
theorem kappa_bracket_ext7 :
    (100000000000 / 314159265359 : Cut) / 3 ≤ kappaLeading
      ∧ kappaLeading ≤ (250000000000 / 785398163397 : Cut) / 3 := by
  obtain ⟨hlo, hhi⟩ := inv_cutPi_bracket_ext7
  have hk : kappaLeading = (1 / cutPi) / 3 := by rw [kappaLeading_eq, div_div, mul_comm]
  rw [hk]; exact ⟨by linarith, by linarith⟩

/-! ## (D) THE ext7 ABSTRACT ARITHMETIC CORES (W9 — transcendentals OUT) + THE RE-ASSEMBLED
    RESTATEMENTS. -/

set_option maxHeartbeats 2000000 in
/-- THE ext7 BARE ARITHMETIC CORE (W9 — opaque `k, L, Lmb, Lb0, Lb2` with the ext7 bracket hypotheses):
    with `k` in the `1e12`-grid `κ` bracket, `L` in the split@7 `L_m01` window, and the three N580
    deepened edge logs in their windows, `2425/18 + k·(2L + (7/3)Lmb + (11/3)Lb0 − (5/3)Lb2) ∈
    [1363071881405515/1e13, 1363071881405528/1e13]`. The inner combination is in
    `[149379518556421/1e13, 149379518556434/1e13]`. -/
theorem endpoint_core_r3 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (100000000000 / 314159265359 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (250000000000 / 785398163397 : Cut) / 3)
    (hL : (815406111272599 : Cut) / 100000000000000 ≤ L ∧ L ≤ 815406111272603 / 100000000000000)
    (hLmb : (-40893066400068 / 10000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -40893066400067 / 10000000000000)
    (hLb0 : (17337287949546 : Cut) / 10000000000000 ≤ Lb0 ∧ Lb0 ≤ 17337287949547 / 10000000000000)
    (hLb2 : (-10887237252238 / 10000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -10887237252235 / 10000000000000) :
    (1363071881405515 / 10000000000000 : Cut)
        ≤ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
      ∧ 2425 / 18 + k * (2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2)
        ≤ 1363071881405528 / 10000000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (149379518556421 / 10000000000000 : Cut)
      ≤ 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 := by nlinarith
  have hcombo_hi : 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2
      ≤ 149379518556434 / 10000000000000 := by nlinarith
  set C := 2 * L + (7 / 3) * Lmb + (11 / 3) * Lb0 - (5 / 3) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((100000000000 / 314159265359 : Cut) / 3) * (149379518556421 / 10000000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((100000000000 / 314159265359 : Cut) / 3) * (149379518556421 / 10000000000000)
        ≥ 1363071881405515 / 10000000000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((250000000000 / 785398163397 : Cut) / 3) * (149379518556434 / 10000000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((250000000000 / 785398163397 : Cut) / 3) * (149379518556434 / 10000000000000)
        ≤ 1363071881405528 / 10000000000000 - 2425 / 18 := by norm_num
    linarith

set_option maxHeartbeats 2000000 in
/-- THE ext7 DRESSED ARITHMETIC CORE (W9 — the `(3/2)`-scaled coefficients): with the same ext7
    hypotheses, `2425/18 + k·(3L + (7/2)Lmb + (11/2)Lb0 − (5/2)Lb2) ∈ [1370996710997162/1e13,
    1370996710997180/1e13]`. The inner combination is in `[224069277834632/1e13, 224069277834650/1e13]`. -/
theorem dressed_core_r3 (k L Lmb Lb0 Lb2 : Cut)
    (hklo : (100000000000 / 314159265359 : Cut) / 3 ≤ k)
    (hkhi : k ≤ (250000000000 / 785398163397 : Cut) / 3)
    (hL : (815406111272599 : Cut) / 100000000000000 ≤ L ∧ L ≤ 815406111272603 / 100000000000000)
    (hLmb : (-40893066400068 / 10000000000000 : Cut) ≤ Lmb ∧ Lmb ≤ -40893066400067 / 10000000000000)
    (hLb0 : (17337287949546 : Cut) / 10000000000000 ≤ Lb0 ∧ Lb0 ≤ 17337287949547 / 10000000000000)
    (hLb2 : (-10887237252238 / 10000000000000 : Cut) ≤ Lb2 ∧ Lb2 ≤ -10887237252235 / 10000000000000) :
    (1370996710997162 / 10000000000000 : Cut)
        ≤ 2425 / 18 + k * (3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2)
      ∧ 2425 / 18 + k * (3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2)
        ≤ 1370996710997180 / 10000000000000 := by
  obtain ⟨hLlo, hLhi⟩ := hL
  obtain ⟨hmblo, hmbhi⟩ := hLmb
  obtain ⟨hb0lo, hb0hi⟩ := hLb0
  obtain ⟨hb2lo, hb2hi⟩ := hLb2
  have hkpos : 0 < k := lt_of_lt_of_le (by norm_num) hklo
  have hcombo_lo : (224069277834632 / 10000000000000 : Cut)
      ≤ 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2 := by nlinarith
  have hcombo_hi : 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2
      ≤ 224069277834650 / 10000000000000 := by nlinarith
  set C := 3 * L + (7 / 2) * Lmb + (11 / 2) * Lb0 - (5 / 2) * Lb2 with hC
  have hCpos : 0 < C := lt_of_lt_of_le (by norm_num) hcombo_lo
  refine ⟨?_, ?_⟩
  · have h1 : k * C ≥ ((100000000000 / 314159265359 : Cut) / 3) * (224069277834632 / 10000000000000) := by
      have := mul_le_mul hklo hcombo_lo (by norm_num) (le_of_lt hkpos); linarith [this]
    have h2 : ((100000000000 / 314159265359 : Cut) / 3) * (224069277834632 / 10000000000000)
        ≥ 1370996710997162 / 10000000000000 - 2425 / 18 := by norm_num
    linarith
  · have h1 : k * C ≤ ((250000000000 / 785398163397 : Cut) / 3) * (224069277834650 / 10000000000000) := by
      have := mul_le_mul hkhi hcombo_hi (le_of_lt hCpos) (by positivity); linarith [this]
    have h2 : ((250000000000 / 785398163397 : Cut) / 3) * (224069277834650 / 10000000000000)
        ≤ 1370996710997180 / 10000000000000 - 2425 / 18 := by norm_num
    linarith

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT OF THE BARE ENDPOINT AS `1/α(0)`: `recomposedEndpoint ∈
    [1363071881405515/1e13, 1363071881405528/1e13]` (`136.3071881405515 … 136.3071881405528`, width
    `1.3×10⁻¹²`, ≈ 13–14 significant digits). Assembled by `endpoint_core_r3` from the `1e12`-grid `κ`
    bracket (`kappa_bracket_ext7`), the wired-in split@7 `L_m01` (`⟨cutLog_lo_s7, cutLog_hi_s7⟩`), and
    the three N580 deepened edge logs (`cutLog_mb_deep`, `cutLog_bMass0_deep`, `cutLog_bMass2_deep`),
    through the banked bare normal form `recomposedEndpoint_cInner`. Nested STRICTLY inside the banked
    ≈12-digit N580 `[136.3071881405, 136.3071881406]`. -/
theorem recomposedEndpoint_restated_r3 :
    (1363071881405515 : Cut) / 10000000000000 ≤ recomposedEndpoint
      ∧ recomposedEndpoint ≤ 1363071881405528 / 10000000000000 := by
  rw [recomposedEndpoint_cInner]
  unfold cInner
  obtain ⟨hklo, hkhi⟩ := kappa_bracket_ext7
  exact endpoint_core_r3 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi ⟨cutLog_lo_s7, cutLog_hi_s7⟩ cutLog_mb_deep
    cutLog_bMass0_deep cutLog_bMass2_deep

/-- ★★★ THE RE-ASSEMBLED D7 RESTATEMENT OF THE DEPTH-2-DRESSED ENDPOINT AS `1/α(0)`:
    `recomposedEndpointDressed ∈ [1370996710997162/1e13, 1370996710997180/1e13]` (`137.0996710997162 …
    137.0996710997180`). Assembled by `dressed_core_r3` from the same banked/deepened inputs, through
    the banked dressed normal form `recomposedEndpointDressed_normalform`. Nested STRICTLY inside the
    banked N580 `[137.0996710997, 137.0996710998]`. -/
theorem recomposedEndpointDressed_restated_r3 :
    (1370996710997162 : Cut) / 10000000000000 ≤ recomposedEndpointDressed
      ∧ recomposedEndpointDressed ≤ 1370996710997180 / 10000000000000 := by
  rw [recomposedEndpointDressed_normalform]
  obtain ⟨hklo, hkhi⟩ := kappa_bracket_ext7
  exact dressed_core_r3 kappaLeading (cutLog (mass0 / mass1)) (cutLog mbRatioDerived)
    (cutLog (bMass 0)) (cutLog (bMass 2)) hklo hkhi ⟨cutLog_lo_s7, cutLog_hi_s7⟩ cutLog_mb_deep
    cutLog_bMass0_deep cutLog_bMass2_deep

/-! ## (E) THE SHARPER PREDICTIONS. -/

/-- ★★★ THE FOLD'S PREDICTION (bare, ext7): `recomposedEndpoint < 137`, re-certified from the ≈14-digit
    bracket. The certified endpoint lies STRICTLY BELOW the measured `1/α(0) ≈ 137.036` (REMOVABLE
    ORIENTATION PROSE, in no proof). -/
theorem bare_lt_137_r3 : recomposedEndpoint < 137 := by
  have h := recomposedEndpoint_restated_r3.2
  have : (1363071881405528 / 10000000000000 : Cut) < 137 := by norm_num
  linarith

/-- ★★★ THE FOLD'S PREDICTION (dressed, ext7): `137 < recomposedEndpointDressed`, re-certified from the
    ≈14-digit bracket. -/
theorem dressed_gt_137_r3 : 137 < recomposedEndpointDressed := by
  have h := recomposedEndpointDressed_restated_r3.1
  have : (137 : Cut) < 1370996710997162 / 10000000000000 := by norm_num
  linarith

/-! ## (F) W8 TEETH — the narrowing is genuine (strictly two-sided, strictly narrower, nested). -/

/-- W8 — THE BARE ext7 BRACKET IS GENUINELY TWO-SIDED: `1363071881405515/1e13 < 1363071881405528/1e13`
    (a real reading of width `1.3×10⁻¹²`, not a collapsed point). -/
theorem bare_r3_strict : (1363071881405515 / 10000000000000 : Cut) < 1363071881405528 / 10000000000000 := by
  norm_num

/-- W8 — THE DRESSED ext7 BRACKET IS GENUINELY TWO-SIDED: `1370996710997162/1e13 < 1370996710997180/1e13`. -/
theorem dressed_r3_strict : (1370996710997162 / 10000000000000 : Cut) < 1370996710997180 / 10000000000000 := by
  norm_num

/-- W8 — THE BARE ext7 BRACKET IS STRICTLY NARROWER THAN the banked N580 `[136.3071881405,
    136.3071881406]`: its width `1.3×10⁻¹²` is strictly below the N580 width `10⁻¹⁰`. -/
theorem bare_r3_width_lt :
    (1363071881405528 / 10000000000000 - 1363071881405515 / 10000000000000 : Cut)
      < 1363071881406 / 10000000000 - 1363071881405 / 10000000000 := by norm_num

/-- W8 — THE DRESSED ext7 BRACKET IS STRICTLY NARROWER THAN the banked N580 `[137.0996710997,
    137.0996710998]`: its width `1.8×10⁻¹²` is strictly below the N580 width `10⁻¹⁰`. -/
theorem dressed_r3_width_lt :
    (1370996710997180 / 10000000000000 - 1370996710997162 / 10000000000000 : Cut)
      < 1370996710998 / 10000000000 - 1370996710997 / 10000000000 := by norm_num

/-- W8 — THE BARE ext7 BRACKET IS NESTED INSIDE the banked N580 `[136.3071881405, 136.3071881406]`:
    `136.3071881405 ≤ 1363071881405515/1e13` (lower moved inward) and `1363071881405528/1e13 ≤
    136.3071881406` (upper moved inward). -/
theorem bare_r3_nested :
    (1363071881405 / 10000000000 : Cut) ≤ 1363071881405515 / 10000000000000
      ∧ (1363071881405528 / 10000000000000 : Cut) ≤ 1363071881406 / 10000000000 := by
  refine ⟨by norm_num, by norm_num⟩

/-- W8 — THE DRESSED ext7 BRACKET IS NESTED INSIDE the banked N580 `[137.0996710997, 137.0996710998]`. -/
theorem dressed_r3_nested :
    (1370996710997 / 10000000000 : Cut) ≤ 1370996710997162 / 10000000000000
      ∧ (1370996710997180 / 10000000000000 : Cut) ≤ 1370996710998 / 10000000000 := by
  refine ⟨by norm_num, by norm_num⟩

/-! ## (G) THE D7 RUNG-3 CAPSTONE — welded, non-hollow. -/

/-- THE NARROWING CAMPAIGN, D7 RUNG 3 (arc-D THE DIGITS, welded landing). Succeeds N582 (the closed owner
    FRAME AUDIT). The dominant residual after N580 was again `κ = 1/cutPi` (ext6, `1e11` grid); this node
    LIFTED the whole `1/cutPi` bracket onto a `1e12` grid via the SAME banked double-double-angle route
    (two applications of the fold's own `cutCos_double`, folding near-π/2 positivity to a well-conditioned
    near-π/8 one — LOWER by positivity `le_leastCosZero_1570796326794`, UPPER by DDA negativity
    `leastCosZero_le_1570796326795` via IVT), and wired in the split@7 `L_m01` (reading the SAME derived
    cycle-phase cosine `cutCos(2/9)` one term deeper, re-propagated through the banked Born-square amplitude
    chain and the D1 exp instrument at partial-sum index `38`), re-composing the D7 endpoint to a strictly
    narrower certified two-sided rational bracket of the derived `1/α(0)`:

    (1) THE `1e12`-GRID RESIDUAL (the binding win): `1/cutPi ∈ [100000000000/314159265359,
        250000000000/785398163397]` (`inv_cutPi_bracket_ext7`), width `≈ 2.03×10⁻¹³`;
    (2) THE split@7 `L_m01`: `cutLog(mass0/mass1) ∈ [815406111272599/1e14, 815406111272603/1e14]`
        (`cutLog_lo_s7` / `cutLog_hi_s7`), width `4×10⁻¹⁴`;
    (3) THE RE-COMPOSED BARE ENDPOINT: `recomposedEndpoint ∈ [1363071881405515/1e13, 1363071881405528/1e13]`
        (`recomposedEndpoint_restated_r3`), width `1.3×10⁻¹²`, ≈ 13–14 sig digits;
    (4) THE RE-COMPOSED DRESSED ENDPOINT: `recomposedEndpointDressed ∈ [1370996710997162/1e13,
        1370996710997180/1e13]` (`recomposedEndpointDressed_restated_r3`);
    (5) THE PREDICTIONS: `recomposedEndpoint < 137` (`bare_lt_137_r3`) and `137 < recomposedEndpointDressed`
        (`dressed_gt_137_r3`);
    (6) TEETH: both brackets are strictly two-sided (`bare_r3_strict` / `dressed_r3_strict`), strictly
        narrower than the banked N580 (`bare_r3_width_lt` / `dressed_r3_width_lt`), nested inside it
        (`bare_r3_nested` / `dressed_r3_nested`); the residual bracket is strictly two-sided and nested
        (`inv_cutPi_ext7_strict` / `inv_cutPi_ext7_nested`).

    Statable from no single conjunct alone (non-hollow). ⚠ HONEST GRADE: THEOREM-route, CERTIFIED
    (certified two-sided rational brackets of closed reals of `Cut`, no error bar). ~12→~14 sig-digit
    advance. NOT 15: after ext7, `κ = 1/cutPi` is AGAIN the dominant residual (needs ext8, a `1e13`
    grid) — the ≥15-sig-digit floor is ROUTE-NOT-YET-FOUND (INSTRUMENT precision, deeper partial sums
    of the banked series), handed to ONE directed successor. ⚠ NO-FIT: every endpoint chosen by
    instrument certifiability at the chosen index (the split `7` / the π/2 grid `1e12` / the exp index
    `38`), not tuned to any measured value; the measured `1/α(0) ≈ 137.036` and `π` are REMOVABLE
    ORIENTATION PROSE ONLY; no empirical number in any proof. -/
theorem d7NarrowingRung3_landing :
    -- (1) the `1e12`-grid residual bracket (1/cutPi via the double-double-angle lower + DDA upper)
    ((100000000000 / 314159265359 : Cut) ≤ 1 / cutPi ∧ 1 / cutPi ≤ 250000000000 / 785398163397)
    ∧ ((785398163397 / 250000000000 : Cut) ≤ cutPi ∧ cutPi ≤ 314159265359 / 100000000000)
    -- (2) the split@7 L_m01 content bracket
    ∧ ((815406111272599 / 100000000000000 : Cut) ≤ cutLog (mass0 / mass1)
        ∧ cutLog (mass0 / mass1) ≤ 815406111272603 / 100000000000000)
    -- (3) the re-composed bare endpoint
    ∧ ((1363071881405515 / 10000000000000 : Cut) ≤ recomposedEndpoint
        ∧ recomposedEndpoint ≤ 1363071881405528 / 10000000000000)
    -- (4) the re-composed dressed endpoint
    ∧ ((1370996710997162 / 10000000000000 : Cut) ≤ recomposedEndpointDressed
        ∧ recomposedEndpointDressed ≤ 1370996710997180 / 10000000000000)
    -- (5) the predictions
    ∧ recomposedEndpoint < 137
    ∧ 137 < recomposedEndpointDressed
    -- (6) teeth: strictly two-sided, strictly narrower than N580, nested inside it
    ∧ (1363071881405515 / 10000000000000 : Cut) < 1363071881405528 / 10000000000000
    ∧ (1370996710997162 / 10000000000000 : Cut) < 1370996710997180 / 10000000000000
    ∧ ((1363071881405528 / 10000000000000 - 1363071881405515 / 10000000000000 : Cut)
        < 1363071881406 / 10000000000 - 1363071881405 / 10000000000)
    ∧ ((100000000000 / 314159265359 : Cut) < 250000000000 / 785398163397) := by
  exact ⟨inv_cutPi_bracket_ext7, cutPi_bracket_ext7,
    ⟨cutLog_lo_s7, cutLog_hi_s7⟩,
    recomposedEndpoint_restated_r3, recomposedEndpointDressed_restated_r3,
    bare_lt_137_r3, dressed_gt_137_r3,
    bare_r3_strict, dressed_r3_strict, bare_r3_width_lt, inv_cutPi_ext7_strict⟩

end

end Phys.Algebra.D7NarrowingRung3
