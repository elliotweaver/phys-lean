import Phys.Foundation.ContinuumCCLO
import Mathlib.Tactic

namespace R5Probe2

open Phys.Foundation Phys.Foundation.ContinuumQ Set
noncomputable section

def presentation (C : Set Cut) : Set Cut :=
  { p | ∃ T, T ⊆ C ∧ T.Nonempty ∧ BddAbove T ∧ p = sSup T }

theorem coverage_subset_presentation (C : Set Cut) : C ⊆ presentation C := by
  intro c hc
  refine ⟨{c}, ?_, ⟨c, rfl⟩, ⟨c, ?_⟩, (csSup_singleton c).symm⟩
  · intro x hx; rw [mem_singleton_iff] at hx; exact hx ▸ hc
  · intro x hx; rw [mem_singleton_iff] at hx; exact le_of_eq hx

theorem sSup_Iio_eq (a : Cut) : sSup (Iio a) = a := by
  have hbdd : BddAbove (Iio a) := ⟨a, fun x hx => le_of_lt hx⟩
  have hne : (Iio a).Nonempty := ⟨a - 1, sub_one_lt a⟩
  refine (isLUB_csSupCut (Iio a) hbdd hne).unique ?_
  refine ⟨fun x hx => le_of_lt hx, fun ub hub => ?_⟩
  by_contra hlt; push_neg at hlt
  obtain ⟨c, hubc, hca⟩ := exists_between hlt
  exact absurd (hub hca) (not_le.mpr hubc)

-- INTERIOR GAP: the punctured line {x ≠ a}. Iio a ⊆ it, sSup(Iio a)=a is the missing interior point.
theorem punctured_interior_excess (a : Cut) :
    a ∈ presentation {x : Cut | x ≠ a} ∧ a ∉ {x : Cut | x ≠ a} := by
  constructor
  · refine ⟨Iio a, ?_, ⟨a - 1, sub_one_lt a⟩, ⟨a, fun x hx => le_of_lt hx⟩, (sSup_Iio_eq a).symm⟩
    intro x hx; exact ne_of_lt hx
  · simp

end
end R5Probe2
