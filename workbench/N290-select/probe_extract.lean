import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

/-
  N290 PROBE — the ⊆ crux entry-extraction. Confirm that from `famA M = 0` (i.e.
  `ocRM Ka * M - M * ocRM Ka = 0`) we can extract, at a chosen entry, a PURE-ℚ-linear
  relation among M's octonion entries with NO octonion coordinate bash.
  Ka = pB*pC - pC*pB. Test the (0,2) entry gives M 1 2 = 0, and (0,1) gives M 1 1 = M 0 0.
-/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1200000

-- famA = adE (ocRM Ka), Ka = pB*pC - pC*pB (from N289 famA_eq_adE)
-- Probe: from adE (ocRM K) M = 0 at entry (i,j), extract the linear relation.
-- We test with K := pB*pC - pC*pB directly.

example (M : Matrix (Fin 3) (Fin 3) (O ℚ))
    (h : adE (ocRM (pB * pC - pC * pB)) M = 0) :
    M 1 2 = 0 := by
  have h02 := congrArg (fun N => N 0 2) h
  simp only [adE_apply, Matrix.sub_apply, Matrix.zero_apply, Matrix.mul_apply,
    ocRM_apply, Fin.sum_univ_three, pB, pC] at h02
  -- ocR entries are 0/±1; central. Use ocR_comm to move, ocR_zero/one, then linear.
  simp only [Matrix.sub_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons, Matrix.of_apply, ocR_zero, ocR_one, ocR_neg,
    zero_mul, mul_zero, one_mul, mul_one, neg_mul, mul_neg,
    zero_add, add_zero, sub_zero, zero_sub, neg_neg] at h02
  -- see what h02 reduces to
  sorry

end Phys.Algebra.HJ
