-- MEASURE-FIRST probe for N376 (arc-G G4, the Landauer bound). Crux obligations only.
import Phys.Algebra.MaxEntArrowOfTime
import Phys.Algebra.SpacetimeBlackHoleEntropy
import Mathlib.Tactic

open Phys.Foundation.ContinuumQ
open Phys.Algebra.MaxEnt

noncomputable section

-- the maximally-uncertain bit = the uniform binary state
-- crux 1: its entropy H = −negEntropy = cutLog 2 (from banked negEntropy_uniform at n=2)
example : negEntropy (uniformState 2) = - cutLog 2 := by
  have h := negEntropy_uniform (n := 2)
  rw [h]
  norm_num

-- the erased (definite) state: a delta / point mass
def deltaState : Fin 2 → Cut := ![1, 0]

-- crux 2: the erased state has ZERO entropy (negEntropy = 0), via cutLog 1 = 0 and 0·anything = 0
example : negEntropy deltaState = 0 := by
  unfold negEntropy deltaState
  rw [Fin.sum_univ_two]
  simp [cutLog_one]

-- crux 3: the Landauer cost as the relInfo of the binary reset (delta ‖ uniform) = cutLog 2
example : relInfo deltaState (uniformState 2) = cutLog 2 := by
  unfold relInfo deltaState uniformState
  rw [Fin.sum_univ_two]
  have h2 : ((2:ℕ):Cut) = (2:Cut) := by norm_num
  rw [h2]
  have hinv : cutLog ((2:Cut)⁻¹) = - cutLog 2 := cutLog_inv (by norm_num)
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
  rw [cutLog_one, hinv]
  ring

-- crux 4: the ★ cross-tie to the banked black-hole cell entropy (N361)
example : Phys.Algebra.cellEntropy = cutLog 2 := rfl

-- crux 5: W8 binary load-bearing — reuse the banked ternary-difference
example : (cutLog 2 : Cut) ≠ cutLog 3 := by
  have := Phys.Algebra.cellEntropy_binary_ne_ternary
  unfold Phys.Algebra.cellEntropy at this
  exact this

-- crux 6: cutLog 2 > 0 (Born positivity of the cost) — reuse banked cellEntropy_pos
example : (0:Cut) < cutLog 2 := by
  have := Phys.Algebra.cellEntropy_pos
  unfold Phys.Algebra.cellEntropy at this
  exact this

end
