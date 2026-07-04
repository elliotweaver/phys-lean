import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

set_option maxHeartbeats 2000000

-- same-slot product: jb (slotA 1)(slotA a) = Dg (2 reQ a) (2 reQ a) 0? Need a Dg form.
-- Actually let me test the structural route step by step for FC (slotA a).
-- FC (slotA a) = jb(slotA 1)(jb(slotB 1)(slotA a)) - jb(slotB 1)(jb(slotA 1)(slotA a))

-- term1: jb(slotB 1)(slotA a) = jb(slotA a)(slotB 1) = slotC(star a * 1) = slotC(star a)
example (a : O ℚ) : jb (slotB (1:O ℚ)) (slotA a) = slotC (star a) := by
  rw [jb_comm, jb_slotA_slotB, mul_one]

-- term1 full: jb(slotA 1)(slotC (star a)) = jb(slotC (star a))(slotA 1) = slotB (1 * star a)
example (a : O ℚ) : jb (slotA (1:O ℚ)) (slotC (star a)) = slotB (1 * star a) := by
  rw [jb_comm, jb_slotC_slotA]

-- term2: jb(slotA 1)(slotA a) is same-slot. Need this value. Let me test if it is a Dg.
-- From probe: (0,0)=(1,1)= -2*(2 reQ a)?? measured jb(slotA1)(slotA a) diag = -4 at a=... for reQ integer.
-- Actually jb A B = A*B+B*A. slotA 1 * slotA a: E01*E01-type. Let me just check via ext is slow.
-- Alternative: FC(slotA a) only needs term1 - term2. term2 = jb(slotB 1)(jb(slotA 1)(slotA a)).
-- jb(slotA 1)(slotA a) lands on DIAGONAL (measured), and jb(slotB 1)(diagonal) lands on slotB.
-- This requires a Dg-slot bracket lemma (jb_Dg_slotB banked). So need jb(slotA1)(slotA a)=Dg form.

end Phys.Algebra.HJ
