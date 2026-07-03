import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.OctonionJordanGenerationCoupling
import Phys.Algebra.OctonionJordanCubicNorm
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

noncomputable def framePerm (σ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.submatrix σ σ

-- the 3-cycle ρ = c[0->1->2->0].  In Lean, Equiv: use finRotate 3 or swap composition.
-- measure ρ on slots: try ρ = swap 0 1 * swap 0 2  (=(0 1 2)? measure)
example (a : O ℚ) : framePerm (Equiv.swap 0 1 * Equiv.swap 0 2) (slotA a) = slotB (star a) := by
  unfold framePerm slotA slotB
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def, Equiv.Perm.mul_apply]

-- jN S3-invariance: the cubic norm is symmetric under simultaneous permutation of (d0,d1,d2) and slots.
-- On the diagonal, jN d0 d1 d2 0 0 0 = d0*d1*d2 is symmetric. Check a transposition of diag+off:
-- jN under swap of positions 0,1: (d0,d1,d2,a,b,c) -> (d1,d0,d2, ?, ?, ?). The off-diag also permutes.
-- Simplest invariance to bank: jN is invariant under the pure 3-cycle of (d0,d1,d2) with matching slot cycle.
-- Test the diagonal symmetry (sufficient supporting fact):
example (d0 d1 d2 : ℚ) : jN d0 d1 d2 0 0 0 = jN d1 d2 d0 0 0 0 := by
  rw [jN_diag, jN_diag]; ring

-- The full jN permutation invariance for the general element under a matched (diag,slot) 3-cycle:
-- ρ sends (d0,d1,d2,a,b,c) to (d?, ..., with slots cycled). Measure the cyclic invariance directly:
-- Under the cycle 0->1->2->0: d0->d1->d2->d0 ; slot(0,1)a ->(1,2) etc. This gets intricate; bank the
-- clean statement: jN d0 d1 d2 a b c = jN d1 d2 d0 c a b  (cyclic relabel) -- MEASURE:
example (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jN d0 d1 d2 a b c = jN d1 d2 d0 c a b := by
  sorry

end Phys.Algebra.HJ
