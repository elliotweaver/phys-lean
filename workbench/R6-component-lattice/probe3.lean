import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Algebra.TowerGatherBarMonad
import Phys.Algebra.TowerGatherPhysicalState
import Mathlib.Tactic

open Phys.Cascade

theorem anchor_test : (1:ℕ) = 1 := by
  have _ := @Phys.Foundation.fold_self_blind ℚ _
  have _ := Phys.Cascade.J₂_self_blind
  have _ := Phys.Algebra.gather_bar_monad_structure
  have _ := Phys.Algebra.physical_state_talgebra_structure
  rfl

#print axioms anchor_test
