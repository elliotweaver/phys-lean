/-
  # N339 — SEEDED ANALYTIC-COMPLETION D1 (the trig-evaluation REMAINDER): the NUMERAL of the derived
  cosine at the fold's total-loop holonomy, `cutCos (2/3 : Cut)`, bounded between explicit rationals
  over the DERIVED ℝ `ContinuumQ.Cut`.

  N323 (`ContinuumTrig`) banked the derived circular functions `cutCos`/`cutSin` with the Born-unit-circle
  Pythagorean identity; N324 (`ContinuumTrigAdd`) banked the addition formulas + boundedness; N325
  (`ContinuumTrigPi`) CONSTRUCTED the derived `cutPi` and the periodicity structure. Those DEFINED the
  circular functions and their group law. THIS file does the genuinely-remaining analytic work of the
  arc-D analytic-completion seed (SEED_ANALYTIC_COMPLETION §D1, ⚠ HIDDEN JOINT D2): it EVALUATES the
  already-banked series to a NUMBER — it proves `cutCos (2/3 : Cut)` lies between explicit rational
  bounds, EXTRACTING the numeral the arc-D lepton mass ratios (D2) consume, WITHOUT positing any
  decimal.

  ★ WHY THIS IS FORCED, NOT ASSERTED (STANDARD §1, seed G1/G4). The number `cutCos (2/3)` FALLS OUT of
  the BANKED alternating series `cutCos x = ∑' n, (-1)ⁿ x²ⁿ/(2n)!` (N323 `cutCos_hasSum`). We split it
  into a FINITE rational head `∑_{i<3} cosTermC (2/3) i = 191/243` (a pure ℚ computation, N323
  `cosTermC`) plus a tail, and BOUND the tail in magnitude by a proven geometric majorant
  `(4/32805)·(1/126)ⁿ` — EXACTLY the banked N325 `cos2_tail_termbound`/`cos2_geo_value` template
  (there for `cutCos 2 < 0`, here re-run at `x = 2/3`, split at index 3, ratio `≤ 1/126`). The geometric
  sum is `≤ 56/455625` by the banked telescope `cut_geom_telescope` + `cut_summable_geometric` (N39).
  No decimal is posited anywhere: the two-sided bound `191/243 ∓ 56/455625` is PROVED from the tail
  bound, and the clean 3-decimal bracket `785/1000 ≤ cutCos(2/3) ≤ 787/1000` is a `norm_num`
  consequence of it. The number is EARNED by evaluating a banked forced structure with the derived
  analytic function.

  ★ THE THEORY-NATIVE READING. `2/3 = T` is the TOTAL LOOP HOLONOMY = the fold's self-seen Born
  fraction (N308 `total_holonomy_closes`, `3·δ_B = 2/3`), the SINGLE phase that sets the entire forced
  generation spectrum through `e₃` (`OctonionJordanGenerationMassRatios.lean`, N309/T6: the mass cubic's
  phase enters ONLY as `cos(3δ_B) = cos(2/3 rad)`). So `cutCos (2/3)` is the ONE transcendental the
  forced lepton mass RATIOS reduce to; this file supplies its numeral over the derived ℝ. The Born
  self-overlap circle the orbit rides (N323) is evaluated at the holonomy angle.

  ★ THE ONE CAUSE (THE ONE LAW). The SAME C6 order/Cauchy-completeness that built the derived ℝ, made
  its alternating series converge, and let the N325 geometric majorant bound the `cutCos 2` tail now
  bounds the `cutCos (2/3)` tail — one engine, one more evaluation. The instrument is the banked
  geometric-tail pattern, reused verbatim; nothing new is posited.

  PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G5): there are NO load-bearing physics words. Delete
  "holonomy" / "mass" / "angle" and the file is the pure statement that over the completion-of-the-
  gather-of-closures of the derived rationals, the derived cosine `C` satisfies
  `191/243 − 56/455625 ≤ C(2/3) ≤ 191/243 + 56/455625`, hence `785/1000 ≤ C(2/3) ≤ 787/1000` and
  `0 < C(2/3)`. No name is load-bearing.

  Foundations-only (seed G6): no posited axiom, no sorry, no kernel-trust bypass, NO Mathlib
  number-system content import, NO ℝ-valued `Norm`, NO `Real.cos`/`Real.sin`/`Real.pi`. The ground field
  is the BANKED derived ℝ `Cut`; the only Mathlib used is the `tsum`/geometric-series MACHINERY on it.
-/
import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-! ## The finite rational head of the `cutCos (2/3)` series. -/

/-- The finite head `∑_{i<3} cosTermC (2/3) i = 1 − 2/9 + 2/243 = 191/243` — a pure ℚ computation on the
    banked `cosTermC` (N323). No decimal posited; the exact rational. -/
theorem cutCos_two_thirds_head :
    (∑ i ∈ Finset.range 3, cosTermC (2 / 3 : Cut) i) = 191 / 243 := by
  rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
  unfold cosTermC
  norm_num [Nat.factorial]

/-! ## The geometric tail bound (the banked N325 `cos2_tail_termbound` template, re-run at `x = 2/3`). -/

/-- Termwise geometric majorant for the `n ≥ 3` cosine tail at `x = 2/3`:
    `|cosTermC (2/3) (n+3)| ≤ (4/32805)·(1/126)ⁿ`. The base term at `n=0` is `|cosTermC (2/3) 3|
    = (2/3)⁶/6! = 4/32805`; the ratio `(2/3)²/((2n+7)(2n+8)) = (4/9)/((2n+7)(2n+8)) ≤ (4/9)/56 = 1/126`
    for all `n`. Mirror of the banked `cos2_tail_termbound` (N325). -/
theorem cos_tt_tail_termbound (n : ℕ) :
    |cosTermC (2 / 3 : Cut) (n + 3)| ≤ (4 / 32805) * (1 / 126) ^ n := by
  rw [cosTermC_abs_eq]
  have habs : |(2 / 3 : Cut)| = 2 / 3 := by norm_num
  rw [habs]
  induction n with
  | zero => norm_num [Nat.factorial]
  | succ k ih =>
    have hfk : (0 : Cut) < ((2 * (k + 3)).factorial : Cut) := by positivity
    have hstep : (2 / 3 : Cut) ^ (2 * (k + 1 + 3)) / ((2 * (k + 1 + 3)).factorial : Cut)
        = ((2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut))
          * ((4 / 9) / (((2 * k + 7) * (2 * k + 8) : ℕ) : Cut)) := by
      have he : 2 * (k + 1 + 3) = 2 * (k + 3) + 2 := by ring
      have hfe : (2 * (k + 3) + 2).factorial
          = (2 * (k + 3)).factorial * ((2 * k + 7) * (2 * k + 8)) := by
        rw [Nat.factorial_succ, Nat.factorial_succ]; ring_nf
      rw [he, hfe]
      push_cast
      have hne : ((2 * (k + 3)).factorial : Cut) ≠ 0 := ne_of_gt hfk
      have hne2 : ((2 * k + 7 : ℕ) : Cut) ≠ 0 := by positivity
      have hne3 : ((2 * k + 8 : ℕ) : Cut) ≠ 0 := by positivity
      push_cast at hne2 hne3
      field_simp
      ring
    rw [hstep]
    have hratio : (4 / 9 : Cut) / (((2 * k + 7) * (2 * k + 8) : ℕ) : Cut) ≤ 1 / 126 := by
      rw [div_le_div_iff₀ (by positivity) (by norm_num)]
      have hge : ((2 * k + 7 : ℕ) : Cut) * ((2 * k + 8 : ℕ) : Cut) ≥ 7 * 8 := by
        have h7 : (7 : Cut) ≤ ((2 * k + 7 : ℕ) : Cut) := by push_cast; nlinarith [Nat.zero_le k]
        have h8 : (8 : Cut) ≤ ((2 * k + 8 : ℕ) : Cut) := by push_cast; nlinarith [Nat.zero_le k]
        nlinarith [h7, h8, (by positivity : (0 : Cut) ≤ ((2 * k + 7 : ℕ) : Cut))]
      push_cast at hge ⊢
      nlinarith [hge]
    have htermnn : (0 : Cut) ≤ (2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut) := by
      positivity
    calc ((2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut))
          * ((4 / 9) / (((2 * k + 7) * (2 * k + 8) : ℕ) : Cut))
        ≤ ((2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut)) * (1 / 126) :=
          mul_le_mul_of_nonneg_left hratio htermnn
      _ ≤ ((4 / 32805) * (1 / 126) ^ k) * (1 / 126) := by
          apply mul_le_mul_of_nonneg_right _ (by norm_num); exact ih
      _ = (4 / 32805) * (1 / 126) ^ (k + 1) := by rw [pow_succ]; ring

/-- The geometric majorant value bound: `∑' n, (4/32805)·(1/126)ⁿ ≤ 56/455625`. The geometric sum
    telescopes to `(4/32805)·(126/125) = 56/455625`; mirror of the banked `cos2_geo_value` (N325). -/
theorem cos_tt_geo_value : (∑' n, (4 / 32805 : Cut) * (1 / 126) ^ n) ≤ 56 / 455625 := by
  have hgeo : Summable (fun n => (1 / 126 : Cut) ^ n) :=
    cut_summable_geometric (by norm_num) (by norm_num)
  rw [hgeo.tsum_mul_left]
  have hgv : (∑' n, (1 / 126 : Cut) ^ n) ≤ 126 / 125 := by
    apply hgeo.tsum_le_of_sum_le
    intro s
    obtain ⟨N, hN⟩ : ∃ N, s ⊆ Finset.range N :=
      ⟨(s.sup id) + 1, fun a ha => Finset.mem_range.2 (Nat.lt_succ_of_le (Finset.le_sup (f := id) ha))⟩
    have hmono : ∑ i ∈ s, (1 / 126 : Cut) ^ i ≤ ∑ i ∈ range N, (1 / 126 : Cut) ^ i :=
      Finset.sum_le_sum_of_subset_of_nonneg hN (fun i _ _ => by positivity)
    have htel := cut_geom_telescope (1 / 126 : Cut) N
    have hpow : (0 : Cut) ≤ (1 / 126 : Cut) ^ N := by positivity
    have hle1 : (1 - 1 / 126) * ∑ i ∈ range N, (1 / 126 : Cut) ^ i ≤ 1 := by
      rw [htel]; nlinarith [hpow]
    nlinarith [hmono, hle1]
  nlinarith [hgv]

/-! ## The head/tail split and the two-sided tail bounds. -/

/-- The head/tail split of the banked series: `cutCos (2/3) = 191/243 + ∑' n, cosTermC (2/3) (n+3)`. -/
theorem cutCos_two_thirds_split :
    cutCos (2 / 3 : Cut) = 191 / 243 + ∑' n, cosTermC (2 / 3 : Cut) (n + 3) := by
  have hsum : cutCos (2 / 3 : Cut)
      = (∑ i ∈ Finset.range 3, cosTermC (2 / 3 : Cut) i)
        + ∑' n, cosTermC (2 / 3 : Cut) (n + 3) := by
    unfold cutCos
    exact ((cosTermC_summable (2 / 3)).sum_add_tsum_nat_add 3).symm
  rw [hsum, cutCos_two_thirds_head]

/-- The tail is bounded ABOVE by the geometric-majorant value `56/455625`. -/
theorem cos_tt_tail_upper :
    (∑' n, cosTermC (2 / 3 : Cut) (n + 3)) ≤ 56 / 455625 := by
  have hshiftsumm : Summable (fun n => cosTermC (2 / 3 : Cut) (n + 3)) :=
    (summable_nat_add_iff 3).mpr (cosTermC_summable (2 / 3))
  have habssumm : Summable (fun n => |cosTermC (2 / 3 : Cut) (n + 3)|) :=
    (summable_nat_add_iff 3).mpr (cosTermC_abs_summable (2 / 3))
  have hgeomaj : Summable (fun n => (4 / 32805 : Cut) * (1 / 126) ^ n) :=
    (cut_summable_geometric (by norm_num) (by norm_num)).mul_left _
  calc ∑' n, cosTermC (2 / 3 : Cut) (n + 3)
      ≤ ∑' n, |cosTermC (2 / 3 : Cut) (n + 3)| :=
        hshiftsumm.tsum_le_tsum (fun n => le_abs_self _) habssumm
    _ ≤ ∑' n, (4 / 32805 : Cut) * (1 / 126) ^ n := habssumm.tsum_le_tsum cos_tt_tail_termbound hgeomaj
    _ ≤ 56 / 455625 := cos_tt_geo_value

/-- The tail is bounded BELOW by `−56/455625` (the same magnitude bound applied to the negation). -/
theorem cos_tt_tail_lower :
    -(56 / 455625 : Cut) ≤ ∑' n, cosTermC (2 / 3 : Cut) (n + 3) := by
  have hshiftsumm : Summable (fun n => cosTermC (2 / 3 : Cut) (n + 3)) :=
    (summable_nat_add_iff 3).mpr (cosTermC_summable (2 / 3))
  have habssumm : Summable (fun n => |cosTermC (2 / 3 : Cut) (n + 3)|) :=
    (summable_nat_add_iff 3).mpr (cosTermC_abs_summable (2 / 3))
  have hgeomaj : Summable (fun n => (4 / 32805 : Cut) * (1 / 126) ^ n) :=
    (cut_summable_geometric (by norm_num) (by norm_num)).mul_left _
  have hneg : -(∑' n, cosTermC (2 / 3 : Cut) (n + 3)) ≤ 56 / 455625 := by
    calc -(∑' n, cosTermC (2 / 3 : Cut) (n + 3))
        = ∑' n, -(cosTermC (2 / 3 : Cut) (n + 3)) := by rw [tsum_neg]
      _ ≤ ∑' n, |cosTermC (2 / 3 : Cut) (n + 3)| :=
          (hshiftsumm.neg).tsum_le_tsum (fun n => neg_le_abs _) habssumm
      _ ≤ ∑' n, (4 / 32805 : Cut) * (1 / 126) ^ n := habssumm.tsum_le_tsum cos_tt_tail_termbound hgeomaj
      _ ≤ 56 / 455625 := cos_tt_geo_value
  linarith

/-! ## THE NUMERAL: `cutCos (2/3)` between explicit rationals. -/

/-- ★★ THE FORCED NUMERAL over the derived ℝ: the derived cosine at the fold's total-loop holonomy `2/3`
    satisfies the EXPLICIT two-sided rational bound `191/243 − 56/455625 ≤ cutCos (2/3) ≤ 191/243 +
    56/455625`. The value is EXTRACTED from the banked alternating series (finite rational head +
    proven geometric tail bound) — no decimal is posited (seed G1). This is the analytic input the
    forced lepton mass RATIOS (D2) evaluate. -/
theorem cutCos_two_thirds_bounds :
    191 / 243 - 56 / 455625 ≤ cutCos (2 / 3 : Cut)
      ∧ cutCos (2 / 3 : Cut) ≤ 191 / 243 + 56 / 455625 := by
  rw [cutCos_two_thirds_split]
  exact ⟨by linarith [cos_tt_tail_lower], by linarith [cos_tt_tail_upper]⟩

/-- ★ THE CLEAN NUMERAL D2 CONSUMES: `785/1000 ≤ cutCos (2/3) ≤ 787/1000` — the derived cosine at the
    holonomy angle pinned to three decimals (`0.785 ≤ cutCos(2/3) ≤ 0.787`), a `norm_num` consequence
    of the explicit rational bounds. NOT an asserted decimal: it is IMPLIED by the proven two-sided
    bound. -/
theorem cutCos_two_thirds_bracket :
    (785 / 1000 : Cut) ≤ cutCos (2 / 3 : Cut) ∧ cutCos (2 / 3 : Cut) ≤ 787 / 1000 := by
  obtain ⟨hlo, hhi⟩ := cutCos_two_thirds_bounds
  refine ⟨?_, ?_⟩
  · have : (785 / 1000 : Cut) ≤ 191 / 243 - 56 / 455625 := by norm_num
    linarith
  · have : (191 / 243 + 56 / 455625 : Cut) ≤ 787 / 1000 := by norm_num
    linarith

/-! ## NON-VACUITY (W8): the value is a genuine positive number, not `0`/`±1`. -/

/-- NON-VACUITY: `0 < cutCos (2/3)` — the derived cosine at the holonomy angle is a GENUINE positive
    number strictly between `0` and `1` (not the degenerate `cutCos 0 = 1` or a sign-changed value like
    `cutCos 2 < 0`), witnessing the numeral bound is non-vacuous. -/
theorem cutCos_two_thirds_pos : 0 < cutCos (2 / 3 : Cut) := by
  have h := cutCos_two_thirds_bracket.1
  have h0 : (0 : Cut) < 785 / 1000 := by norm_num
  linarith

end

end ContinuumQ
end Phys.Foundation
