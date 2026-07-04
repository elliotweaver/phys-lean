import Phys.Algebra.OctonionJordanGaugeFamilyCoupling
import Phys.Algebra.OctonionJordanFamilyRotationSo3Closure
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

/-- Base bracket: ⁅Lmul(slotA a), innerMul(slotB b)(slotC c)⁆. Via innerMul = ⁅Lmul,Lmul⁆ and
    lie_lie: = ⁅innerMul(slotA a)(slotB b), Lmul(slotC c)⁆ + ⁅Lmul(slotB b), innerMul(slotA a)(slotC c)⁆.
    innerMul(slotA a)(slotB b) = famC-type (jb_slotA_slotB gives slotC(star a*b) via Lmul).
    Hmm, this recurses. Let me instead just test the DIRECT ext of the closure to gauge cost. -/
set_option maxHeartbeats 4000000 in
theorem cosetAB_BC_closure_direct :
    ⁅innerMul (slotA u1) (slotB (1:O ℚ)), innerMul (slotB u1) (slotC (1:O ℚ))⁆
      = innerMul (slotC (1:O ℚ)) (slotA 1) := by
  ext X : 1
  simp only [Module.End.lie_apply, innerMul_apply]
  sorry

end Phys.Algebra.HJ
