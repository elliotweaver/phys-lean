import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000
set_option maxHeartbeats 1000000

noncomputable section

/-- The 7 integer structure matrices Km i = crossOp(imBasis i) in the qI convention. -/
def Km : Fin 7 → M7 :=
  ![ ![![0,0,0,0,0,0,0],![0,0,-1,0,0,0,0],![0,1,0,0,0,0,0],![0,0,0,0,-1,0,0],![0,0,0,1,0,0,0],![0,0,0,0,0,0,1],![0,0,0,0,0,-1,0]],
     ![![0,0,1,0,0,0,0],![0,0,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,0,0,0,0,-1,0],![0,0,0,0,0,0,-1],![0,0,0,1,0,0,0],![0,0,0,0,1,0,0]],
     ![![0,-1,0,0,0,0,0],![1,0,0,0,0,0,0],![0,0,0,0,0,0,0],![0,0,0,0,0,0,-1],![0,0,0,0,0,1,0],![0,0,0,0,-1,0,0],![0,0,0,1,0,0,0]],
     ![![0,0,0,0,1,0,0],![0,0,0,0,0,1,0],![0,0,0,0,0,0,1],![0,0,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,-1,0,0,0,0,0],![0,0,-1,0,0,0,0]],
     ![![0,0,0,-1,0,0,0],![0,0,0,0,0,0,1],![0,0,0,0,0,-1,0],![1,0,0,0,0,0,0],![0,0,0,0,0,0,0],![0,0,1,0,0,0,0],![0,-1,0,0,0,0,0]],
     ![![0,0,0,0,0,0,-1],![0,0,0,-1,0,0,0],![0,0,0,0,1,0,0],![0,1,0,0,0,0,0],![0,0,-1,0,0,0,0],![0,0,0,0,0,0,0],![1,0,0,0,0,0,0]],
     ![![0,0,0,0,0,1,0],![0,0,0,0,-1,0,0],![0,0,0,-1,0,0,0],![0,0,1,0,0,0,0],![0,1,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,0,0,0,0,0,0]] ]

-- TEST A: the integer Gram identity by decide (each i,j)
example : tr7 (mul7 (Km 0) (Km 0)) = -6 := by decide
example : tr7 (mul7 (Km 0) (Km 1)) = 0 := by decide
example : tr7 (mul7 (Km 3) (Km 3)) = -6 := by decide
example : tr7 (mul7 (Km 6) (Km 6)) = -6 := by decide
example : tr7 (mul7 (Km 2) (Km 5)) = 0 := by decide

-- TEST B: gForm orthonormality on imBasis (a few cases)
example : gForm (imBasis 0) (imBasis 0) = 1 := by
  simp only [imBasis, Matrix.cons_val_zero, gForm, reQ, u1, CD.iota]
  decide
example : gForm (imBasis 0) (imBasis 3) = 0 := by
  simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val, Matrix.head_cons, gForm, reQ]
  decide

end
end Phys.Algebra
