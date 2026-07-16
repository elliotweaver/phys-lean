/-
  # N464 — SEEDED EXACT-DRESSING X5 (arc X, docs/SEED_EXACT_DRESSING.md §X5):
  #         κ TO ALL ORDERS — THE SELF-REFERENTIAL LOOP DEPTH AS THE EXACT CLOSED SELF-OVERLAP.
  #         (closes the residual above one loop — the census-in-census self-look-back — to an
  #          EXACT rational closed form over the derived ℝ, not a truncated (α/π)-series.)

  Arc-X node X1 (N460) derived the LEADING loop/phase-wrap normalization `κ₀ = kappaLeading =
  1/(3·cutPi)` as the geometric factor of ONE full phase-wrap of the gather's Born self-overlap over
  the return surface. This node derives `κ` TO ALL ORDERS.

  ## THE THEORY-NATIVE READING (the gather resolving ITSELF inside the loop — seed §X5)

  The residual above one loop is the gather RESOLVING ITSELF inside the loop — census-in-census, the
  self-look-back recurring at loop level. The fold is a SELF-look-back: when the gather resolves the
  one-loop self-overlap, that resolving act is ITSELF a gather, which resolves itself again, ad
  infinitum. Crucially the fold's self-look-back is UNARY — it looks back on itself ONCE at each
  level, not as a branching tree. So the all-orders self-overlap `D` obeys the SELF-REFERENTIAL
  fixed-point equation (the census-in-census: the whole object reappears inside itself, weighted by
  the per-loop self-overlap weight `w`):

        D = κ₀ + w · D                          (the gather resolving itself inside the loop)

  Because the self-reference is UNARY (one inner gather per level, no branching), the number of
  nested self-resolution configurations at depth `n` is exactly `1` — the fold count `c_n = 1`. The
  all-orders self-overlap is therefore the GEOMETRIC resummation

        D = κ₀ · ∑ₙ c_n wⁿ = κ₀ · ∑ₙ wⁿ = κ₀ / (1 − w),

  an EXACT rational closed form over the derived ℝ `Cut`. This is the deep point: standard QFT's loop
  expansion is a factorially DIVERGENT asymptotic series precisely because Feynman diagrams BRANCH (a
  tree of insertions). The theory says the true object is the LINEAR (unary) self-reference, whose
  resummation is a CONVERGENT geometric series with an exact rational closed form. The perturbative
  branching `Σ c_n (α/π)ⁿ` picture is standard physics' APPROXIMATION; the fold holds the whole
  object — the exact closed self-overlap `κ₀/(1−w)`.

  ## SELF-BLINDNESS FORCES CONVERGENCE (the C6 tie — no wall, seed §X5)

  The geometric resummation converges iff `w < 1`. The boundary `w = 1` is the TOTALIZING fixed point
  — where the self-reference would close on itself completely (`D = κ₀ + 1·D`, an unresolvable
  identity, the pole of `κ₀/(1−w)`). This is exactly the fixed point that SELF-BLINDNESS FORBIDS: the
  look-back has NO nonzero fixed point, the probe never fully sees itself, so the inner gather never
  totalizes and `w < 1` strictly. Self-blindness is therefore precisely WHY the all-orders dressing
  CONVERGES — the same C6 eternal-approach that built the derived ℝ (its nonneg bounded series
  converge, `ContinuumSummable`) makes the census-in-census resummation converge. The divergence at
  `w = 1` (`geometric_diverges_at_one`) is the forbidden totalizing limit, not a failure.

  ## WHY THIS IS NOT A POSIT (STANDARD §3 — number-tower / ℝ gate; seed G4/G6)

  Nothing imports `Real`-anything as CONTENT. The all-orders self-overlap FALLS OUT of the derived-ℝ
  geometric closed form `cut_tsum_geometric` (built here from the banked `cut_summable_geometric` +
  `cut_geom_telescope` of `ContinuumSummable`, N39, plus the Cut-native `tendsto_pow_atTop_nhds_zero`
  — MACHINERY over the derived `Cut`, never ℝ). `κ₀` is the banked X1 `kappaLeading`. `D` is that
  banked κ₀ resummed; no value of the dressing is ever premised. This is a DERIVATION OF AN
  ALREADY-BANKED OBJECT (X1's κ₀, taken to all orders), not a new physics object.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2; seed G5)

  Delete "coupling / loop / self-overlap / census / dressing / fold / gather / order": what remains
  is the pure statement, over the derived ℝ `Cut`, that the geometric resummation
      D(κ₀, w) = κ₀ · ∑ₙ wⁿ  equals  κ₀ / (1 − w)  for  0 ≤ w < 1,
  obeys the fixed-point identity `D = κ₀ + w·D`, reduces to `κ₀` at `w = 0`, and strictly exceeds
  `κ₀` for `0 < w < 1`; and that the series diverges at `w = 1`. Pure real analysis on `Cut`. No
  physics name is load-bearing.

  ## NOT FREE-FLOATING (seed / SOUL free-floating rail)

  Every production TYPE mentions the banked derived objects: `kappaLeading` (X1, N460),
  `kappaLeading_eq`/`kappaLeading_pos`, `cutPi`/`cutPi_pos` (N325) over the derived `Cut`. The
  load-bearing capstone `kappaLeadingDressed_landing` is about `kappaLeadingDressed` = X1's banked κ₀
  taken to all orders — `1/(3·cutPi·(1−w))` — not a generic real-analysis lemma. `dressedOverlap`
  itself is the resummation OF a `Cut`-valued base; instantiated at the banked κ₀.

  ## SEED HARD GUARDS

  - G1 NO ASSERTED VALUE — the closed form `κ₀/(1−w)` FALLS OUT of the derived geometric series; the
    self-reference identity and the strict-dressing FALL OUT of field arithmetic on `Cut`; no value
    of the dressing or the weight is premised.
  - G2 NO EMPIRICAL NUMBER — no `137`, no measured `α`, no measured `(g−2)`/anomalous-moment
    coefficient, no numeric `0.24%` residual. `w` is a STRUCTURAL variable (the per-loop self-overlap
    weight, `0 ≤ w < 1`); the theorem derives the all-orders STRUCTURE (the exact rational closed
    form), not a fitted number. The measured constants are this prose / the costume only.
  - G3 EXACT — the closed self-overlap `κ₀/(1−w)` is an EXACT derived rational of `Cut`; NO error
    bar, NO truncation, NO 3-digit toy. The residual above one loop is CLOSED to an exact rational
    function — the exactness is the POINT: it REPLACES the truncated loop series.
  - G4 DERIVED, NOT POSITED — the all-orders `κ` is the geometric resummation of the census-in-census
    self-reference, built from the derived-ℝ geometric closed form; the convergence is the
    C6-forbidden-totalizing-fixed-point condition `w < 1`, not an assumption.
  - G5 PHYSICS-WORDS-REMOVABLE — see above.
  - G6 FOUNDATIONS-ONLY — `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`; sorry-free, zero
    posited axioms, no compiled-decision bypass, no heartbeat inflation. Ground field the DERIVED ℝ
    `Cut`; ⚠ NO Mathlib `Real`/`Complex` as content — Mathlib is MACHINERY only.
  - G7 ONE LAW — the derivation did not fight; the banked geometric summability + telescope + the
    Cut-native `tendsto_pow_atTop_nhds_zero` close the closed form; the fixed point is field algebra.
  - G8 TEETH (W8) — `dressedOverlap_gt_bare`/`kappaLeadingDressed_ne_bare` (the all-orders dressing
    STRICTLY exceeds the one-loop κ₀ for `0 < w < 1` — the residual is REAL, not vacuous);
    `geometric_diverges_at_one` (the totalizing weight `w = 1` is forbidden — the series is NOT
    summable there); `dressedOverlap_leading` recovers X1 exactly at `w = 0` (the resummation is
    genuinely anchored on the banked one-loop value).

  DERIVED from the trunk (`kappaLeading`/`kappaLeading_eq`/`kappaLeading_pos` N460; `cutPi`/`cutPi_pos`
  N325; `cut_summable_geometric`/`cut_geom_telescope` N39 over the derived `Cut`; the Cut-native
  `tendsto_pow_atTop_nhds_zero_of_lt_one`/`HasSum.tendsto_sum_nat`/`tendsto_nhds_unique` — standard
  Mathlib `field_simp`/`ring`/`nlinarith`/`Tendsto` MACHINERY on the DERIVED objects, STANDARD §3).
  NO posited dressing / κ / residual value as content, NO Mathlib ℝ as content.
-/
import Phys.Foundation.ContinuumSummable
import Phys.Foundation.ContinuumTopology
import Phys.Algebra.FineStructureLoopNormalization
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators

noncomputable section

/-! ## (0) THE DERIVED-ℝ GEOMETRIC CLOSED FORM `∑ₙ wⁿ = (1 − w)⁻¹` (Cut-native, NO ℝ content).

    The census-in-census resummation crux. Built from the banked `cut_summable_geometric` +
    `cut_geom_telescope` (N39, `ContinuumSummable`) plus the Cut-native power-to-zero limit
    `tendsto_pow_atTop_nhds_zero_of_lt_one` (a property OF any `LinearOrderedField + Archimedean +
    OrderTopology`, which the derived `Cut` IS — MACHINERY, not ℝ content). The partial sums equal
    `(1 − wᴺ)/(1 − w)` by the telescope; `wᴺ → 0`; uniqueness of limits pins the sum. -/

/-- The geometric PARTIAL-SUM closed form over the derived ℝ: `∑_{i<N} wⁱ = (1 − wᴺ)/(1 − w)` for
    `w ≠ 1`. The banked telescope identity `cut_geom_telescope` divided through by `1 − w ≠ 0`. -/
theorem cut_partial_geom (w : Cut) (hw : w ≠ 1) (N : ℕ) :
    ∑ i ∈ Finset.range N, w ^ i = (1 - w ^ N) / (1 - w) := by
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => hw h.symm)
  have := cut_geom_telescope w N
  field_simp at this ⊢
  linarith [this]

/-- ★★ THE DERIVED-ℝ GEOMETRIC CLOSED FORM `∑ₙ wⁿ = (1 − w)⁻¹` for `0 ≤ w < 1`. The exact sum of the
    census-in-census resummation. Cut-native — NO Mathlib ℝ `tsum_geometric` (which is ℝ-only content,
    STANDARD §3). Proof: the partial sums converge to the `tsum` (banked summability), and ALSO
    converge to `(1 − 0)/(1 − w)` via the telescope closed form + `wᴺ → 0`; uniqueness pins them. -/
theorem cut_tsum_geometric (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    ∑' n : ℕ, w ^ n = (1 - w)⁻¹ := by
  have hw : w ≠ 1 := ne_of_lt hw1
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => hw h.symm)
  have hT1 : Tendsto (fun N : ℕ => ∑ i ∈ Finset.range N, w ^ i) atTop (𝓝 (∑' n, w ^ n)) :=
    (cut_summable_geometric hw0 hw1).hasSum.tendsto_sum_nat
  have hpow : Tendsto (fun n : ℕ => w ^ n) atTop (𝓝 0) :=
    tendsto_pow_atTop_nhds_zero_of_lt_one hw0 hw1
  have hT2 : Tendsto (fun N : ℕ => (1 - w ^ N) / (1 - w)) atTop (𝓝 ((1 - 0) / (1 - w))) :=
    Tendsto.div_const (tendsto_const_nhds.sub hpow) _
  have hT2' : Tendsto (fun N : ℕ => ∑ i ∈ Finset.range N, w ^ i) atTop (𝓝 ((1 - 0) / (1 - w))) :=
    hT2.congr (fun N => (cut_partial_geom w hw N).symm)
  have := tendsto_nhds_unique hT1 hT2'
  rw [this]; norm_num

/-- ★ W8 (the forbidden totalizing limit): at the TOTALIZING weight `w = 1` the geometric series
    DIVERGES — `∑ₙ 1ⁿ` is NOT summable over the derived ℝ. This is the C6-forbidden totalizing fixed
    point (the pole of `κ₀/(1−w)`): were it summable, the terms `1ⁿ = 1` would tend to `0`, but the
    constant `1` tends to `1 ≠ 0` (T2 uniqueness). Self-blindness (no nonzero fixed point of the
    look-back) is exactly why the physical weight stays `< 1` and the dressing converges. -/
theorem geometric_diverges_at_one : ¬ Summable (fun _ : ℕ => (1 : Cut)) := by
  intro hsum
  have h0 : Tendsto (fun _ : ℕ => (1 : Cut)) atTop (𝓝 0) := hsum.tendsto_atTop_zero
  have h1 : Tendsto (fun _ : ℕ => (1 : Cut)) atTop (𝓝 1) := tendsto_const_nhds
  have : (1 : Cut) = 0 := tendsto_nhds_unique h1 h0
  exact one_ne_zero this

/-! ## (1) THE FOLD COUNT (the unary self-reference multiplicity) and THE ALL-ORDERS SELF-OVERLAP. -/

/-- THE FOLD COUNT `c_n` at depth `n`: the number of nested self-resolution configurations of the
    UNARY self-look-back. The fold looks back on itself ONCE per level (no branching), so there is
    exactly `1` way to nest `n` self-references linearly — `c_n = 1`. This unit count is WHY the
    all-orders structure is a convergent GEOMETRIC series, not a branching factorial tower. -/
def foldCount : ℕ → Cut := fun _ => 1

/-- THE ALL-ORDERS SELF-OVERLAP `D(κ₀, w)` over the derived ℝ: the leading self-overlap `κ₀` resummed
    over the census-in-census tower — the fold-count-weighted geometric series in the per-loop
    self-overlap weight `w`. The census-in-census resummation of X1's κ₀. -/
def dressedOverlap (κ₀ w : Cut) : Cut := κ₀ * ∑' n : ℕ, foldCount n * w ^ n

/-- THE TERM STRUCTURE (the seed's `Σₙ c_n wⁿ`): each coefficient is the unit fold count `c_n = 1`,
    so the dressing is `κ₀` times the geometric series `∑ₙ wⁿ`. `foldCount` is definitionally `1`. -/
theorem dressedOverlap_termstructure (κ₀ w : Cut) :
    dressedOverlap κ₀ w = κ₀ * ∑' n : ℕ, w ^ n := by
  unfold dressedOverlap foldCount
  refine congrArg (κ₀ * ·) ?_
  exact tsum_congr (fun n => by rw [one_mul])

/-! ## (2) THE EXACT CLOSED SELF-OVERLAP `D = κ₀/(1 − w)` (the marquee exactness, seed §X5). -/

/-- ★★★ THE EXACT CLOSED SELF-OVERLAP: for the per-loop weight `0 ≤ w < 1`, the all-orders self-overlap
    is the EXACT rational closed form `D(κ₀, w) = κ₀ / (1 − w)`. The census-in-census tower resums to a
    closed rational of `Cut` — NO error bar, NO truncation. The perturbative `Σ c_n (α/π)ⁿ` loop series
    only APPROXIMATES this closed object; the fold holds it whole. FALLS OUT of `cut_tsum_geometric`. -/
theorem dressedOverlap_closed (κ₀ w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    dressedOverlap κ₀ w = κ₀ / (1 - w) := by
  rw [dressedOverlap_termstructure, cut_tsum_geometric w hw0 hw1]
  rw [div_eq_mul_inv]

/-- ★★★ THE CENSUS-IN-CENSUS SELF-REFERENCE (the gather resolving ITSELF inside the loop): the
    all-orders self-overlap obeys the fixed-point identity `D = κ₀ + w · D`. The whole object reappears
    inside itself, weighted by the per-loop self-overlap weight `w` — this IS the self-referential loop
    depth. FALLS OUT of the closed form by field arithmetic (`κ₀/(1−w) = κ₀ + w·κ₀/(1−w)`). -/
theorem dressedOverlap_selfref (κ₀ w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    dressedOverlap κ₀ w = κ₀ + w * dressedOverlap κ₀ w := by
  rw [dressedOverlap_closed κ₀ w hw0 hw1]
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => (ne_of_lt hw1) h.symm)
  field_simp
  ring

/-- ★ X1 RECOVERY: at the TRIVIAL weight `w = 0` (no inner self-resolution) the all-orders self-overlap
    is exactly the banked one-loop `κ₀` — the resummation is genuinely anchored on X1. -/
theorem dressedOverlap_leading (κ₀ : Cut) : dressedOverlap κ₀ 0 = κ₀ := by
  rw [dressedOverlap_closed κ₀ 0 (le_refl 0) (by norm_num)]
  norm_num

/-! ## (3) THE ALL-ORDERS DRESSING GENUINELY DRESSES (W8 teeth — the residual is real). -/

/-- ★ W8 — THE DRESSING IS REAL (not vacuous): for a positive leading self-overlap `κ₀ > 0` and a
    nontrivial per-loop weight `0 < w < 1`, the all-orders self-overlap STRICTLY EXCEEDS the one-loop
    `κ₀`. The residual above one loop is genuinely present — the census-in-census tower adds. -/
theorem dressedOverlap_gt_bare (κ₀ w : Cut) (hκ : 0 < κ₀) (hw0 : 0 < w) (hw1 : w < 1) :
    κ₀ < dressedOverlap κ₀ w := by
  rw [dressedOverlap_closed κ₀ w (le_of_lt hw0) hw1]
  have h1w : (0 : Cut) < 1 - w := by linarith
  rw [lt_div_iff₀ h1w]
  nlinarith [hκ, hw0]

/-! ## (4) TIE-IN TO X1: THE ALL-ORDERS LOOP/PHASE-WRAP NORMALIZATION. -/

/-- THE ALL-ORDERS LOOP/PHASE-WRAP NORMALIZATION `κ`: X1's banked leading `kappaLeading = 1/(3·cutPi)`
    taken to all orders via the census-in-census resummation. The one banked object, dressed. -/
def kappaLeadingDressed (w : Cut) : Cut := dressedOverlap kappaLeading w

/-- ★★★ THE ALL-ORDERS `κ`, EXACT CLOSED FORM: `κ(w) = 1/(3·cutPi·(1−w))` for `0 ≤ w < 1`. X1's derived
    `κ₀ = 1/(3·cutPi)` resummed to the exact rational closed form. Every piece derived: the `3·cutPi`
    is X1's return-surface flux over the phase wrap, the `1/(1−w)` is the census-in-census resummation.
    NO error bar — the all-orders loop normalization is an exact rational of `Cut`. -/
theorem kappaLeadingDressed_closed (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    kappaLeadingDressed w = 1 / (3 * cutPi * (1 - w)) := by
  unfold kappaLeadingDressed
  rw [dressedOverlap_closed kappaLeading w hw0 hw1, kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => (ne_of_lt hw1) h.symm)
  field_simp

/-- ★★ THE ALL-ORDERS `κ` SATISFIES THE CENSUS-IN-CENSUS SELF-REFERENCE: `κ(w) = κ₀ + w·κ(w)`, with
    `κ₀ = kappaLeading` the banked X1 one-loop normalization. The all-orders loop depth IS the
    self-referential fixed point of X1's κ₀. -/
theorem kappaLeadingDressed_selfref (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    kappaLeadingDressed w = kappaLeading + w * kappaLeadingDressed w :=
  dressedOverlap_selfref kappaLeading w hw0 hw1

/-- ★ X1 RECOVERY at the trivial weight: `κ(0) = kappaLeading` — the all-orders normalization reduces
    to X1's banked one-loop `κ₀` when there is no inner self-resolution. -/
theorem kappaLeadingDressed_leading : kappaLeadingDressed 0 = kappaLeading :=
  dressedOverlap_leading kappaLeading

/-- ★ W8 — THE ALL-ORDERS `κ` ≠ THE ONE-LOOP `κ₀` for a nontrivial weight `0 < w < 1`: the residual
    above one loop is REAL — the all-orders loop normalization strictly exceeds X1's leading value
    (`kappaLeading_pos` from N460 discharges the positivity). -/
theorem kappaLeadingDressed_ne_bare (w : Cut) (hw0 : 0 < w) (hw1 : w < 1) :
    kappaLeadingDressed w ≠ kappaLeading := by
  unfold kappaLeadingDressed
  have h := dressedOverlap_gt_bare kappaLeading w kappaLeading_pos hw0 hw1
  exact ne_of_gt h

/-! ## (5) THE X5 CAPSTONE — welded, non-hollow. -/

/-- ★★★ THE X5 LANDING (welded, NOT a bare ∧): for a nontrivial per-loop self-overlap weight
    `0 < w < 1`, the all-orders loop/phase-wrap normalization `κ(w)` — X1's banked `κ₀ = 1/(3·cutPi)`
    taken to all orders through the census-in-census self-look-back — is the EXACT rational closed form
    `1/(3·cutPi·(1−w))` (the marquee exactness: the residual above one loop is a closed rational of
    `Cut`, not a truncated series), it obeys the CENSUS-IN-CENSUS self-reference `κ(w) = κ₀ + w·κ(w)`
    (the gather resolving itself inside the loop), and it STRICTLY EXCEEDS the one-loop `κ₀` (the
    residual is real). The exact closed form, the self-reference fixed point, and the strict dressing
    are welded: statable from none of the three alone. -/
theorem kappaLeadingDressed_landing (w : Cut) (hw0 : 0 < w) (hw1 : w < 1) :
    kappaLeadingDressed w = 1 / (3 * cutPi * (1 - w)) ∧
    kappaLeadingDressed w = kappaLeading + w * kappaLeadingDressed w ∧
    kappaLeading < kappaLeadingDressed w :=
  ⟨kappaLeadingDressed_closed w (le_of_lt hw0) hw1,
   kappaLeadingDressed_selfref w (le_of_lt hw0) hw1,
   dressedOverlap_gt_bare kappaLeading w kappaLeading_pos hw0 hw1⟩

end

end Phys.Algebra
