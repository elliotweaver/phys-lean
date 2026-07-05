import Phys.Algebra.OctonionJordanHermTraceCoefficient
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

-- bracket with explicit import of the equivariance file
#check (⁅innerMul (slotA (1:O ℚ)) (slotB 1), Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ))⁆)

-- famC_Dg: the RHS coefficient is (star 1 * 1); close with star_one then one_mul
theorem famC_Dg (t0 t1 t2 : ℚ) :
    innerMul (slotA (1:O ℚ)) (slotB 1) (Dg t0 t1 t2) = slotC ((t2 - t1) • (1 : O ℚ)) := by
  rw [innerMul_slot_diag, star_one, one_mul]

#print axioms famC_Dg

end Phys.Algebra.HJ
