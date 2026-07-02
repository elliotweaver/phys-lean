import Phys.Algebra.TowerGatherForcedChargeSplitting
import Mathlib.FieldTheory.Minpoly.Field

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- the DERIVED complex unit J (Dbl ℚ) is a root of the charge polynomial X²+1: J²+1 = 0
theorem Dbl_J_root : (Dbl.J : Dbl ℚ)^2 + 1 = 0 := by
  rw [sq, Dbl.J_mul_J]; abel

-- and so is its NEGATIVE −J (the opposite root): (−J)²+1 = 0
theorem Dbl_negJ_root : (-Dbl.J : Dbl ℚ)^2 + 1 = 0 := by
  rw [neg_sq, sq, Dbl.J_mul_J]; abel

-- the two roots are opposite and distinct (J ≠ -J)
theorem Dbl_J_ne_negJ : (Dbl.J : Dbl ℚ) ≠ -Dbl.J := by
  intro h
  have := congrArg Dbl.im h
  simp only [Dbl.J, Dbl.neg_im] at this
  norm_num at this

end
end Phys.Algebra
