/- PROBE (run 66): the commutator-vanishing structural lemma.
   If a matrix M over O ℚ has zero off-diagonal (M i j = 0 for i ≠ j), then
   Dg e * M − M * Dg e = 0  (central diagonal commutes with a diagonal matrix; the
   diagonal entries commute by ocR_comm). Structural, ocR opaque. Should be cheap. -/
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe66C
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 400000 in
theorem diag_comm_offzero (e0 e1 e2 : ℚ) (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (hoff : ∀ i j, i ≠ j → M i j = 0) :
    Dg e0 e1 e2 * M - M * Dg e0 e1 e2 = 0 := by
  unfold Dg
  apply Matrix.ext; intro i j
  rw [Matrix.sub_apply, Matrix.diagonal_mul, Matrix.mul_diagonal, Matrix.zero_apply]
  rcases eq_or_ne i j with h | h
  · subst h; rw [ocR_comm]; abel
  · rw [hoff i j h]; simp [mul_zero, zero_mul]

end Probe66C
