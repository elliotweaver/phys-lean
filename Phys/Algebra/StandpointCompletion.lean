/-
  Phys.Algebra.StandpointCompletion — N### (arc-R R5): THE COMPLETION EXCESS
  (the closure presents strictly more than its coverage).
  ============================================================================================
  ARC R — THE STANDPOINT (the inside read of the banked gather). R1 (N445) banked the EXISTENCE of a
  local closure (the standpoint stratum). R2 (N446) banked the ineliminable self-miss (the residual
  vanishes only at the void). R3 (N447) banked the CHANNEL QUOTIENT (no vantage recovers the discarded
  fibre coordinate; the blindness CONSERVED under carrier enlargement). R4 (N448) banked THE TOWER
  TERMINATION (the inward self-representation regress cannot COMPLETE, yet closes by a COVER — the
  banked `J`, `J² = look` yet fixed-point-free). R5 reads the OUTWARD face: what a local closure
  DELIVERS. Dual to R2's inward asymmetry (a live state misses itself), R5 is the outward asymmetry —
  the closure PRESENTS points its coverage never reached.

  ★ THE CROSS-TIE. The completion operator here IS the banked Dedekind completeness of the derived ℝ
  `Cut` — `isLUB_csSupCut` / `csSupCut` (N33), the standard-idiom re-expression of the banked
  `completion_coherence_closed` (N7–N14) that CLOSED the continuum as the completion of the
  gather-of-closures of the derived rationals. The SAME object that built the continuum globally is
  the one that OVER-completes a LOCAL view: one operator, two roles. No fresh completion apparatus is
  posited — the excess is powered by the object the chain already banked.

  On the banked derived ℝ `Cut` (never Mathlib-ℝ as content):

    COVERAGE vs PRESENTATION.
      A `C : Set Cut` is the COVERAGE — the index subset a family of local sections actually reaches.
      `presentation C` is the closure's PRESENTATION — every point delivered by the banked completion
      `sSup` (= `csSupCut`, load-bearing via `isLUB_csSupCut`) of SOME nonempty bounded-above
      subfamily of `C`. The completion fills interior gaps.
      `GapFree C` — `C` is already closed under the banked completion (every subfamily's `sSup`
      lands back in `C`).

    (1) coverage_subset_presentation  — coverage ⊆ presentation ALWAYS (a singleton's `sSup` is
        itself: `csSup_singleton`).

    (★) excess_nonempty_iff_not_gapFree  — THE DETECTOR (non-hollow iff): a presented point escapes
        coverage IFF the coverage is not gap-free. The excess is a genuine detector of closure —
        not a one-way "the completion is bigger", but an exact equivalence.

    (2) gapFree_presentation_eq  — gap-free coverage COINCIDES with its presentation
        (presentation C = C).

    (3) presentation_strict_of_gap  — any nonempty bounded-above subfamily whose banked `sSup`
        escapes the coverage forces STRICT excess `C ⊂ presentation C`.

    (4) sSup_Iio_eq  — LOAD-BEARING non-vacuity powered by the banked completeness: the banked
        `isLUB_csSupCut` welded to the derived ℝ's density (`exists_between`) gives
        `sSup (Iio a) = a`. The completion genuinely produces the missing interior point.

    (W8, interior) interior_gap_excess_bites  — the punctured line `{x | x ≠ a}` has an INTERIOR gap:
        `Iio a ⊆ {x ≠ a}` is nonempty & bounded above, its banked `sSup` is `a`, and `a ∉ {x ≠ a}`.
        So `a` is a presented point escaping the coverage, and `{x ≠ a} ⊂ presentation {x ≠ a}`. The
        excess is REALIZED on a concrete interior-gapped coverage, not vacuously.

    (★ J-R5 TEETH — the failure case, banked in the statement) iic_gapFree + gapfree_no_excess  —
        `Iic a` is gap-free (`csSup_le`: a subfamily bounded by `a` has `sSup ≤ a`), hence
        `presentation (Iic a) = Iic a` and NO presented point escapes it. The inequality CAN fail,
        and does — W8 is part of the R5 statement, not an afterthought.

    completion_excess  — ★★★ THE CAPSTONE (arc-R R5), bundling the detector, the coincidence, the
        interior-gap strict excess, and the gap-free failure.

  ⚠ GRADE / FIREWALL (G7 — THE IDENTIFICATION FIREWALL). THEOREM-route, pure structure. NO
  identification anywhere (deferred to R8). No theorem here mentions or depends on any identification.
  MIND-WORDS-REMOVABLE (G4): delete "standpoint / closure / coverage / presentation / inside / view"
  → pure mathematics: for a set `C` of cuts, the set of least-upper-bounds of its nonempty
  bounded-above subsets contains `C`, strictly exceeds it iff `C` is not closed under those
  least-upper-bounds, coincides with `C` when it is, and does strictly exceed the punctured line but
  not a closed ray. Every TYPE is over `Set Cut` (the banked derived ℝ); the load-bearing non-vacuity
  invokes the ACTUAL banked completeness `isLUB_csSupCut`, never generic over an arbitrary complete
  order. G2: no empirical number (arc R has none).

  Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`. No posited axiom, no
  proof-hole, no kernel-trust bypass, no bridge, NO Mathlib number-system content import. `Cut`, its
  order, and its completeness (`isLUB_csSupCut`, `csSup_singleton`, `csSup_le`, `exists_between`) are
  the banked DERIVED ℝ; Mathlib's `Set`/`IsLUB`/order lemmas are standard MACHINERY on that derived
  object.
-/
import Phys.Foundation.ContinuumCCLO
import Mathlib.Tactic

namespace Phys.Algebra.StandpointCompletion

open Phys.Foundation Phys.Foundation.ContinuumQ Set

noncomputable section

/-! ## COVERAGE vs PRESENTATION — the banked completion of local subfamilies. -/

/-- THE PRESENTATION of a coverage `C`: every point delivered by the banked completion `sSup`
    (= `csSupCut`, N33) of SOME nonempty bounded-above subfamily of `C`. The completion — the banked
    Dedekind completeness of the derived ℝ — fills interior gaps of the coverage. Words-removable:
    the set of least-upper-bounds of the nonempty bounded-above subsets of `C`. -/
def presentation (C : Set Cut) : Set Cut :=
  { p | ∃ T, T ⊆ C ∧ T.Nonempty ∧ BddAbove T ∧ p = sSup T }

/-- GAP-FREE: the coverage is already closed under the banked completion — every nonempty
    bounded-above subfamily's `sSup` lands back in `C`. Words-removable: `C` is closed under the
    least-upper-bounds of its nonempty bounded-above subsets. -/
def GapFree (C : Set Cut) : Prop :=
  ∀ T, T ⊆ C → T.Nonempty → BddAbove T → sSup T ∈ C

/-! ## The completion operator IS the banked Dedekind completeness. -/

/-- ★ THE CROSS-TIE. The completion operator producing the presentation IS the banked Dedekind
    completeness of the derived ℝ: for a nonempty bounded-above subfamily, its presented point
    `sSup T` is the LEAST UPPER BOUND `isLUB_csSupCut` (N33 = the banked `completion_coherence_closed`
    of N7–N14). The same object that closed the continuum. Words-removable: `sSup T` is the
    least upper bound of `T`. -/
theorem presentation_isLUB {T : Set Cut} (hne : T.Nonempty) (hbdd : BddAbove T) :
    IsLUB T (sSup T) := isLUB_csSupCut T hbdd hne

/-! ## (1) Coverage is contained in its presentation, always. -/

/-- (1) COVERAGE ⊆ PRESENTATION, always: a singleton `{c}` is a nonempty bounded-above subfamily
    whose banked completion is `c` itself (`csSup_singleton`). Words-removable: every point of `C` is
    the least upper bound of a nonempty bounded-above subset of `C` (its own singleton). -/
theorem coverage_subset_presentation (C : Set Cut) : C ⊆ presentation C := by
  intro c hc
  refine ⟨{c}, ?_, ⟨c, rfl⟩, ⟨c, ?_⟩, (csSup_singleton c).symm⟩
  · intro x hx; rw [mem_singleton_iff] at hx; exact hx ▸ hc
  · intro x hx; rw [mem_singleton_iff] at hx; exact le_of_eq hx

/-! ## (★) THE DETECTOR — excess exists IFF the coverage is not gap-free. -/

/-- (★) THE DETECTOR (non-hollow iff — the marquee). A presented point ESCAPES the coverage IFF the
    coverage is NOT gap-free. Not a one-way "the completion is bigger": an EXACT equivalence, making
    the completion excess a genuine detector of whether the coverage is already closed. Words-
    removable: `∃` a least-upper-bound of a nonempty bounded-above subset of `C` lying outside `C`
    ↔ `C` is not closed under such least-upper-bounds. -/
theorem excess_nonempty_iff_not_gapFree (C : Set Cut) :
    (∃ p, p ∈ presentation C ∧ p ∉ C) ↔ ¬ GapFree C := by
  constructor
  · rintro ⟨p, ⟨T, hT, hne, hbdd, rfl⟩, hpC⟩ hgf
    exact hpC (hgf T hT hne hbdd)
  · intro hngf
    rw [GapFree] at hngf
    push_neg at hngf
    obtain ⟨T, hT, hne, hbdd, hnotin⟩ := hngf
    exact ⟨sSup T, ⟨T, hT, hne, hbdd, rfl⟩, hnotin⟩

/-! ## (2) Gap-free coverage coincides with its presentation. -/

/-- (2) COINCIDENCE. A gap-free coverage EQUALS its presentation: the completion adds nothing.
    Words-removable: a set closed under the least-upper-bounds of its nonempty bounded-above subsets
    equals the set of those least-upper-bounds. -/
theorem gapFree_presentation_eq (C : Set Cut) (h : GapFree C) : presentation C = C := by
  apply Set.Subset.antisymm
  · rintro p ⟨T, hT, hne, hbdd, rfl⟩
    exact h T hT hne hbdd
  · exact coverage_subset_presentation C

/-! ## (3) A gap forces strict excess. -/

/-- (3) STRICT EXCESS FROM A GAP. If some nonempty bounded-above subfamily's banked completion `sSup`
    escapes the coverage, the presentation STRICTLY exceeds the coverage. Words-removable: if a
    least-upper-bound of a nonempty bounded-above subset lies outside `C`, then `C` is a proper
    subset of the set of such least-upper-bounds. -/
theorem presentation_strict_of_gap {C T : Set Cut} (hT : T ⊆ C)
    (hne : T.Nonempty) (hbdd : BddAbove T) (hgap : sSup T ∉ C) :
    C ⊂ presentation C := by
  rw [Set.ssubset_iff_of_subset (coverage_subset_presentation C)]
  exact ⟨sSup T, ⟨T, hT, hne, hbdd, rfl⟩, hgap⟩

/-! ## (4) The banked completeness produces the missing interior point. -/

/-- `Iio a` is bounded above (by `a`). -/
theorem iio_bddAbove (a : Cut) : BddAbove (Iio a) := ⟨a, fun _ hx => le_of_lt hx⟩

/-- `Iio a` is nonempty (`a - 1 < a` on the derived ℝ). -/
theorem iio_nonempty (a : Cut) : (Iio a).Nonempty := ⟨a - 1, sub_one_lt a⟩

/-- (4) THE BANKED COMPLETENESS FILLS THE GAP: `sSup (Iio a) = a`. The banked Dedekind completeness
    `isLUB_csSupCut` (which delivers `sSup (Iio a)` as the least upper bound of `Iio a`) welded to the
    derived ℝ's DENSITY (`exists_between`, which shows `a` is that least upper bound): the completion
    genuinely produces the missing interior point `a`. Load-bearing non-vacuity — the excess is
    powered by the ACTUAL banked completeness of the derived ℝ, not asserted. Words-removable: the
    least upper bound of the open lower ray below `a` is `a`. -/
theorem sSup_Iio_eq (a : Cut) : sSup (Iio a) = a := by
  refine (isLUB_csSupCut (Iio a) (iio_bddAbove a) (iio_nonempty a)).unique ?_
  refine ⟨fun x hx => le_of_lt hx, fun ub hub => ?_⟩
  by_contra hlt
  push_neg at hlt
  obtain ⟨c, hubc, hca⟩ := exists_between hlt
  exact absurd (hub hca) (not_le.mpr hubc)

/-- [W8, INTERIOR] THE EXCESS IS REALIZED ON AN INTERIOR-GAPPED COVERAGE. The punctured line
    `{x | x ≠ a}` has an INTERIOR gap at `a`: the open lower ray `Iio a` is a nonempty bounded-above
    subfamily of it, whose banked completion `sSup (Iio a) = a` lies OUTSIDE the coverage. So `a` is a
    presented point escaping the coverage, and the presentation STRICTLY exceeds it. Non-vacuous, on a
    concrete interior-gapped coverage. Words-removable: the least upper bound `a` of the open lower ray
    is a completion point of the punctured line not in the punctured line, so the punctured line is a
    proper subset of its presentation. -/
theorem interior_gap_excess_bites (a : Cut) :
    a ∈ presentation {x : Cut | x ≠ a} ∧ a ∉ {x : Cut | x ≠ a}
    ∧ {x : Cut | x ≠ a} ⊂ presentation {x : Cut | x ≠ a} := by
  have hsub : Iio a ⊆ {x : Cut | x ≠ a} := fun x hx => ne_of_lt hx
  have hmem : a ∈ presentation {x : Cut | x ≠ a} :=
    ⟨Iio a, hsub, iio_nonempty a, iio_bddAbove a, (sSup_Iio_eq a).symm⟩
  have hnotin : a ∉ {x : Cut | x ≠ a} := by simp
  refine ⟨hmem, hnotin, ?_⟩
  exact presentation_strict_of_gap hsub (iio_nonempty a) (iio_bddAbove a)
    (by rw [sSup_Iio_eq]; exact hnotin)

/-! ## (★ J-R5 TEETH) THE FAILURE CASE — gap-free coverage has NO excess. -/

/-- `Iic a` is GAP-FREE: any nonempty subfamily bounded above by `a` has its banked completion
    `sSup ≤ a` (`csSup_le`), so it lands back in `Iic a`. Words-removable: a closed lower ray is
    closed under the least-upper-bounds of its nonempty bounded-above subsets. -/
theorem iic_gapFree (a : Cut) : GapFree (Iic a) := by
  intro T hT hne _
  rw [mem_Iic]
  exact csSup_le hne (fun t ht => mem_Iic.mp (hT ht))

/-- ★ J-R5 THE TEETH (the failure case, banked alongside the excess). On the GAP-FREE coverage
    `Iic a`, the completion excess VANISHES: the presentation coincides with the coverage AND no
    presented point escapes it. The excess inequality CAN fail, and does — W8 is part of the R5
    statement, not an afterthought. Words-removable: for a closed lower ray, the set of
    least-upper-bounds of its nonempty bounded-above subsets equals the ray and none lies outside. -/
theorem gapfree_no_excess (a : Cut) :
    presentation (Iic a) = Iic a ∧ ¬ (∃ p, p ∈ presentation (Iic a) ∧ p ∉ Iic a) := by
  refine ⟨gapFree_presentation_eq (Iic a) (iic_gapFree a), ?_⟩
  rw [excess_nonempty_iff_not_gapFree, not_not]
  exact iic_gapFree a

/-! ## THE CAPSTONE — the completion excess as a detector of genuine closure. -/

/-- ★★★ THE COMPLETION EXCESS (arc-R R5), bundled. On the banked derived ℝ `Cut` with its banked
    Dedekind completeness (`isLUB_csSupCut`, N33 = N7–N14 `completion_coherence_closed`):
      (1) the presentation always CONTAINS the coverage (`coverage_subset_presentation`);
      (★) a presented point escapes the coverage IFF the coverage is NOT gap-free — THE DETECTOR
          (`excess_nonempty_iff_not_gapFree`);
      (2) gap-free coverage COINCIDES with its presentation (`gapFree_presentation_eq`);
      (W8) the excess is REALIZED on the interior-gapped punctured line `{x ≠ a}` — a strict excess
          produced by the banked completion `sSup (Iio a) = a` (`interior_gap_excess_bites`); yet
      (★ teeth) it VANISHES on the gap-free closed ray `Iic a` (`gapfree_no_excess`).
    The completion operator IS the banked Dedekind completeness that closed the continuum; applied to
    a local coverage it over-completes it exactly when — and only when — the coverage has a gap it does
    not already close. DERIVED from the banked completeness; no completion apparatus posited, no
    identification (deferred to R8). -/
theorem completion_excess (a : Cut) :
    (∀ C : Set Cut, C ⊆ presentation C)
    ∧ (∀ C : Set Cut, (∃ p, p ∈ presentation C ∧ p ∉ C) ↔ ¬ GapFree C)
    ∧ (∀ C : Set Cut, GapFree C → presentation C = C)
    ∧ ({x : Cut | x ≠ a} ⊂ presentation {x : Cut | x ≠ a})
    ∧ (presentation (Iic a) = Iic a ∧ ¬ (∃ p, p ∈ presentation (Iic a) ∧ p ∉ Iic a)) :=
  ⟨coverage_subset_presentation,
   excess_nonempty_iff_not_gapFree,
   fun C h => gapFree_presentation_eq C h,
   (interior_gap_excess_bites a).2.2,
   gapfree_no_excess a⟩

end

end Phys.Algebra.StandpointCompletion
