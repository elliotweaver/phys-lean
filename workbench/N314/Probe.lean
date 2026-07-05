import Phys.Algebra.OctonionStructure3FormNorm
import Phys.Algebra.DerivationRep7FullBranching
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.N314Probe

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def imChannelCount (n : ℕ) : ℕ := (Finset.univ : Finset (Fin n)).offDiag.card

example (n : ℕ) : imChannelCount n = n * (n - 1) := by
  unfold imChannelCount
  rw [Finset.offDiag_card]
  simp [Finset.card_univ, Fintype.card_fin, Nat.mul_sub_one]

-- imaginary dims as full-rung finrank − 1
example : Module.finrank ℚ (Dbl ℚ) - 1 = 1 := by rw [finrank_dbl_eq_two]
example : Module.finrank ℚ (H ℚ) - 1 = 3 := by rw [finrank_H_eq_four]
example : Module.finrank ℚ (O ℚ) - 1 = 7 := by rw [finrank_O_eq_eight]
-- agreement with the banked imaginary submodule finranks
example : Module.finrank ℚ (H ℚ) - 1 = Module.finrank ℚ ImH := by
  rw [finrank_H_eq_four, finrank_ImH_eq_three]
example : Module.finrank ℚ (O ℚ) - 1 = Module.finrank ℚ ImO := by
  rw [finrank_O_eq_eight, finrank_ImO]

example : imChannelCount (Module.finrank ℚ (Dbl ℚ) - 1) = 0 := by
  rw [finrank_dbl_eq_two]; decide
example : imChannelCount (Module.finrank ℚ ImH) = 6 := by
  rw [finrank_ImH_eq_three]; decide
example : imChannelCount (Module.finrank ℚ ImO) = 42 := by
  rw [finrank_ImO]; decide

example : ((imChannelCount (Module.finrank ℚ ImO) : ℕ) : ℚ) = assoc3NormSq := by
  rw [finrank_ImO, assoc3NormSq_eq_42]; decide

example : (0 : ℕ) ≠ 6 ∧ (6:ℕ) ≠ 42 ∧ (0:ℕ) ≠ 42 := by decide
example : imChannelCount (Module.finrank ℚ ImO) ≠ 49 := by rw [finrank_ImO]; decide
example : imChannelCount (Module.finrank ℚ ImH) ≠ 9 := by rw [finrank_ImH_eq_three]; decide

end Phys.Algebra.N314Probe
