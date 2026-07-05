import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open scoped BigOperators

namespace N317Probe3

open Phys.Algebra

/-- The colour exterior-ladder charge-squared trace at colour count `n`:
    both chiralities × Σ over subsets S ⊆ Fin n of (|S|/n)² (charge = occupation/n_colours). -/
noncomputable def ladderChargeTrace (n : ℕ) : ℚ :=
  2 * ∑ S : Finset (Fin n), ((S.card : ℚ) / (n : ℚ)) ^ 2

-- ℕ second moment of subset cardinality over Fin 3 = 24 (decide on ℕ)
theorem sum_card_sq_three : (∑ S : Finset (Fin 3), (S.card) ^ 2) = 24 := by decide

theorem ladderChargeTrace_three : ladderChargeTrace 3 = 16 / 3 := by
  unfold ladderChargeTrace
  have hcast : (∑ S : Finset (Fin 3), ((S.card : ℚ)) ^ 2) = 24 := by
    have h : (∑ S : Finset (Fin 3), (S.card) ^ 2) = 24 := sum_card_sq_three
    calc (∑ S : Finset (Fin 3), ((S.card : ℚ)) ^ 2)
        = ((∑ S : Finset (Fin 3), (S.card) ^ 2 : ℕ) : ℚ) := by push_cast; rfl
      _ = ((24 : ℕ) : ℚ) := by rw [h]
      _ = 24 := by norm_num
  have hstep : (∑ S : Finset (Fin 3), ((S.card : ℚ) / (3 : ℚ)) ^ 2)
      = (∑ S : Finset (Fin 3), ((S.card : ℚ)) ^ 2) / 9 := by
    rw [Finset.sum_div]; apply Finset.sum_congr rfl; intro S _; ring
  rw [show ((3 : ℕ) : ℚ) = (3 : ℚ) from by norm_num, hstep, hcast]; norm_num

-- THE HEADLINE with the rank grounded to the banked colour dimension
theorem generation_charge_trace : ladderChargeTrace (Module.finrank ℚ Uhol) = 16 / 3 := by
  rw [finrank_Uhol]; exact ladderChargeTrace_three

#print axioms generation_charge_trace

end N317Probe3
