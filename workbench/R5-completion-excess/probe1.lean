import Phys.Foundation.ContinuumCCLO
import Mathlib.Tactic

namespace R5Probe

open Phys.Foundation Phys.Foundation.ContinuumQ Set

noncomputable section

/-- PRESENTATION: every point delivered by the banked completion of some nonempty bounded-above
    subfamily of `C`. -/
def presentation (C : Set Cut) : Set Cut :=
  { p | ∃ T, T ⊆ C ∧ T.Nonempty ∧ BddAbove T ∧ p = sSup T }

/-- GAP-FREE: closed under the banked completion. -/
def GapFree (C : Set Cut) : Prop :=
  ∀ T, T ⊆ C → T.Nonempty → BddAbove T → sSup T ∈ C

-- banked completeness re-cited
theorem presentation_isLUB {C T : Set Cut} (hne : T.Nonempty) (hbdd : BddAbove T) :
    IsLUB T (sSup T) := isLUB_csSupCut T hbdd hne

-- (1) coverage ⊆ presentation always
theorem coverage_subset_presentation (C : Set Cut) : C ⊆ presentation C := by
  intro c hc
  refine ⟨{c}, ?_, ⟨c, rfl⟩, ⟨c, ?_⟩, ?_⟩
  · intro x hx; rw [mem_singleton_iff] at hx; rw [hx]; exact hc
  · intro x hx; rw [mem_singleton_iff] at hx; rw [hx]
  · rw [csSup_singleton]

-- (2) THE DETECTOR — non-hollow marquee
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

-- (3) gap-free ⟹ coincide
theorem gapFree_presentation_eq (C : Set Cut) (h : GapFree C) : presentation C = C := by
  apply Set.Subset.antisymm
  · rintro p ⟨T, hT, hne, hbdd, rfl⟩
    exact h T hT hne hbdd
  · exact coverage_subset_presentation C

-- (4) strict excess for gapped coverage
theorem presentation_strict_of_gap {C T : Set Cut} (hT : T ⊆ C)
    (hne : T.Nonempty) (hbdd : BddAbove T) (hgap : sSup T ∉ C) :
    C ⊂ presentation C := by
  rw [Set.ssubset_iff_of_subset (coverage_subset_presentation C)]
  exact ⟨sSup T, ⟨T, hT, hne, hbdd, rfl⟩, hgap⟩

-- concrete gapped instance: Iio a
theorem iio_bddAbove (a : Cut) : BddAbove (Iio a) := ⟨a, fun x hx => le_of_lt hx⟩
theorem iio_nonempty (a : Cut) : (Iio a).Nonempty := ⟨a - 1, sub_one_lt a⟩

theorem isLUB_Iio (a : Cut) : IsLUB (Iio a) a := by
  constructor
  · intro x hx; exact le_of_lt hx
  · intro ub hub
    by_contra hlt
    push_neg at hlt
    obtain ⟨c, hubc, hca⟩ := exists_between hlt
    exact absurd (hub hca) (not_le.mpr hubc)

theorem sSup_Iio_eq (a : Cut) : sSup (Iio a) = a := by
  have hbanked : IsLUB (Iio a) (sSup (Iio a)) :=
    isLUB_csSupCut (Iio a) (iio_bddAbove a) (iio_nonempty a)
  exact hbanked.unique (isLUB_Iio a)

theorem gapped_excess_bites (a : Cut) :
    a ∈ presentation (Iio a) ∧ a ∉ Iio a ∧ (Iio a) ⊂ presentation (Iio a) := by
  have hmem : a ∈ presentation (Iio a) :=
    ⟨Iio a, subset_rfl, iio_nonempty a, iio_bddAbove a, (sSup_Iio_eq a).symm⟩
  have hnotin : a ∉ Iio a := by simp
  refine ⟨hmem, hnotin, ?_⟩
  exact presentation_strict_of_gap subset_rfl (iio_nonempty a) (iio_bddAbove a)
    (by rw [sSup_Iio_eq]; exact hnotin)

-- J-R5 TEETH: the FAILURE case — Iic a is gap-free, NO excess
theorem iic_gapFree (a : Cut) : GapFree (Iic a) := by
  intro T hT hne hbdd
  rw [mem_Iic]
  exact csSup_le hne (fun t ht => hT ht)

theorem gapfree_no_excess_bites (a : Cut) :
    presentation (Iic a) = Iic a ∧ ¬ (∃ p, p ∈ presentation (Iic a) ∧ p ∉ Iic a) := by
  refine ⟨gapFree_presentation_eq (Iic a) (iic_gapFree a), ?_⟩
  rw [excess_nonempty_iff_not_gapFree, not_not]
  exact iic_gapFree a

end
end R5Probe
