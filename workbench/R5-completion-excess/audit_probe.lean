import Phys.Foundation.ContinuumCCLO
import Mathlib.Tactic

namespace R5AuditProbe

open Phys.Foundation Phys.Foundation.ContinuumQ Set
noncomputable section

def presentation (C : Set Cut) : Set Cut :=
  { p | ∃ T, T ⊆ C ∧ T.Nonempty ∧ BddAbove T ∧ p = sSup T }

def GapFree (C : Set Cut) : Prop :=
  ∀ T, T ⊆ C → T.Nonempty → BddAbove T → sSup T ∈ C

theorem coverage_subset_presentation (C : Set Cut) : C ⊆ presentation C := by
  intro c hc
  refine ⟨{c}, ?_, ⟨c, rfl⟩, ⟨c, ?_⟩, ?_⟩
  · intro x hx; rw [mem_singleton_iff] at hx; rw [hx]; exact hc
  · intro x hx; rw [mem_singleton_iff] at hx; rw [hx]
  · rw [csSup_singleton]

theorem excess_nonempty_iff_not_gapFree (C : Set Cut) :
    (∃ p, p ∈ presentation C ∧ p ∉ C) ↔ ¬ GapFree C := by
  constructor
  · rintro ⟨p, ⟨T, hT, hne, hbdd, rfl⟩, hpC⟩ hgf
    exact hpC (hgf T hT hne hbdd)
  · intro hngf
    rw [GapFree] at hngf; push_neg at hngf
    obtain ⟨T, hT, hne, hbdd, hnotin⟩ := hngf
    exact ⟨sSup T, ⟨T, hT, hne, hbdd, rfl⟩, hnotin⟩

theorem sSup_Iio_eq (a : Cut) : sSup (Iio a) = a := by
  have hbdd : BddAbove (Iio a) := ⟨a, fun x hx => le_of_lt hx⟩
  have hne : (Iio a).Nonempty := ⟨a - 1, sub_one_lt a⟩
  have hbanked : IsLUB (Iio a) (sSup (Iio a)) := isLUB_csSupCut (Iio a) hbdd hne
  refine hbanked.unique ?_
  constructor
  · intro x hx; exact le_of_lt hx
  · intro ub hub
    by_contra hlt; push_neg at hlt
    obtain ⟨c, hubc, hca⟩ := exists_between hlt
    exact absurd (hub hca) (not_le.mpr hubc)

end
end R5AuditProbe

#print axioms R5AuditProbe.coverage_subset_presentation
#print axioms R5AuditProbe.excess_nonempty_iff_not_gapFree
#print axioms R5AuditProbe.sSup_Iio_eq
