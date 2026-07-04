import Phys.Algebra.OctonionJordanColourCentralizerCosetClosure
import Mathlib.Tactic
namespace Counterexamples
open Phys.Algebra Phys.Algebra.HJ Phys.Cascade Phys.Cascade.CD Matrix
attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1600000

-- probe: what is ((famB (slotA 1)) 1 2).re.re.re ? famB=innerMul(slotC1)(slotA1).
-- Try direct via jb_slotC_slotA + jb_slotA1_slotA reductions.
example : ((innerMul (slotC (1:O ℚ)) (slotA 1) (slotA 1)) 1 2).re.re.re = 1 := by
  rw [innerMul_apply]
  -- jb (slotA 1)(slotA 1) = Dg 2 2 0 ; jb (slotC 1)(Dg 2 2 0) ; jb (slotC 1)(slotA 1)=slotB(1*1)
  rw [jb_slotA1_slotA]
  rw [jb_comm (slotC (1:O ℚ)) (Dg (2 * reQ (1:O ℚ)) (2 * reQ (1:O ℚ)) 0), jb_Dg_slotC]
  rw [jb_slotC_slotA]
  simp only [reQ, ocR, one_mul, mul_one, slotB, Xz, Dg, Matrix.sub_apply, Matrix.of_apply,
    Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.empty_val', u1]
  norm_num

end Counterexamples
