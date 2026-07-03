import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- imRep DI kills e4O, e5O  (isospin-Cartan-inert)
example : qZ Imat (e4O : O ℚ) = 0 := by
  ext <;> simp [qZ, Imat, e4O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]
example : qZ Imat (e5O : O ℚ) = 0 := by
  ext <;> simp [qZ, Imat, e5O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

-- chargeOp on e4O = + e5O (a complex structure e4↔e5 up to sign)
example : (qZ Cmat (e4O : O ℚ)) = (e5O : O ℚ) := by
  ext <;> simp [qZ, Cmat, e4O, e5O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]
example : (qZ Cmat (e5O : O ℚ)) = (- e4O : O ℚ) := by
  ext <;> simp [qZ, Cmat, e4O, e5O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

-- chargeOp nonzero on e4O (Winert is CHARGED): e5O ≠ 0
example : (e5O : O ℚ) ≠ 0 := by
  intro h; have : c5 (e5O : O ℚ) = c5 (0 : O ℚ) := by rw [h]
  simp [e5O, c5] at this

end Phys.Algebra
