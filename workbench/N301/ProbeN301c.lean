import Phys.Algebra.OctonionJordanHermTraceCoefficient

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

-- isolate: does the bracket typecheck as a plain #check?
#check (⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆)

-- famC_Dg fix attempt
theorem famC_Dg (t0 t1 t2 : ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (1 : O ℚ)) := by
  rw [innerMul_slot_diag]
  congr 2
  rw [star_one, one_mul]

#print axioms famC_Dg

end Phys.Algebra.HJ
