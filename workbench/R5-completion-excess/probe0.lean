import Phys.Foundation.ContinuumCCLO
import Mathlib.Tactic

namespace R5Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Set

noncomputable section

-- Does Cut have DenselyOrdered as an instance?
example (a b : Cut) (h : a < b) : ∃ c, a < c ∧ c < b := exists_between h

-- csSup_singleton on Cut?
example (a : Cut) : sSup ({a} : Set Cut) = a := csSup_singleton a

-- csSup_le on Cut?
example (s : Set Cut) (a : Cut) (hne : s.Nonempty) (hub : ∀ b ∈ s, b ≤ a) :
    sSup s ≤ a := csSup_le hne hub

-- IsLUB.csSup_eq
example (s : Set Cut) (a : Cut) (H : IsLUB s a) (hs : s.Nonempty) : sSup s = a :=
  H.csSup_eq hs

-- sSup = csSupCut definitionally?
example (s : Set Cut) : sSup s = csSupCut s := rfl

-- Iio a nonempty (a-1 < a)
example (a : Cut) : (a - 1) ∈ Iio a := by
  simp only [mem_Iio]; exact sub_one_lt a

-- BddAbove (Iio a)
example (a : Cut) : BddAbove (Iio a) := by
  exact ⟨a, fun x hx => le_of_lt hx⟩

-- IsLUB (Iio a) a  (via density)
example (a : Cut) : IsLUB (Iio a) a := by
  constructor
  · intro x hx; exact le_of_lt hx
  · intro ub hub
    by_contra hlt
    push_neg at hlt
    obtain ⟨c, hubc, hca⟩ := exists_between hlt
    have : c ≤ ub := hub hca
    exact absurd this (not_le.mpr hubc)

-- IsLUB (Iic a) a
example (a : Cut) : IsLUB (Iic a) a := by
  constructor
  · intro x hx; exact hx
  · intro ub hub; exact hub (le_refl a)

-- a ∉ Iio a
example (a : Cut) : a ∉ Iio a := by simp

-- csSup_le_csSup (monotone) available?
example (s t : Set Cut) (hbdd : BddAbove t) (hne : s.Nonempty) (h : s ⊆ t) :
    sSup s ≤ sSup t := csSup_le_csSup hbdd hne h

end
end R5Probe
