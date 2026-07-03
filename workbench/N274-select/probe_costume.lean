import Phys.Algebra.OctonionJordanInnerMultiplication
import Mathlib.Tactic

namespace Counterexamples
open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable section

theorem witness_true :
    ((innerMul (slotA (1 : O ℚ)) (slotB u1) (Dg 0 0 1)) 1 2).re.re.im = (1 : ℚ) := by
  rw [innerMul_slot_diag, slotC_entry]
  rw [star_one, one_mul, sub_zero, one_smul]
  simp only [u1]

theorem witness_scale_true :
    min (305 : ℚ) ((innerMul (slotA (1 : O ℚ)) (slotB u1) (Dg 0 0 1)) 1 2).re.re.im = 1 := by
  rw [witness_true]; norm_num

theorem witness_scale_wrong_BOGUS :
    min (305 : ℚ) ((innerMul (slotA (1 : O ℚ)) (slotB u1) (Dg 0 0 1)) 1 2).re.re.im = 305 := by
  rw [witness_scale_true]
  -- ⊢ (1 : ℚ) = 305   (FALSE — costume bites)

end
end Counterexamples
