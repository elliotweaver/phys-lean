/- PROBE (run 66, W9.2): pieceB STRUCTURAL — jdef (E+X) Y = jdef X Y for ABSTRACT nuclear E.
   Abstract Python (pieceB_abstract.py): diff is a sum of associators that ALL contain E and
   vanish under full associativity ⇒ E-nuclearity ALONE may kill them. Test the jdef_master
   pattern: nuclearity rewrites + abel. RISK: E*E (in jb A A) ⇒ LA/RA loop. KILL 90s. -/
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe66BStruct
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

section Abstract
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 800000 in
theorem jdef_drop_first (E X Y : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jdef (E + X) Y = jdef X Y := by
  unfold jdef jb
  simp only [Matrix.mul_add, Matrix.add_mul, Matrix.mul_sub, Matrix.sub_mul, LA, MA, RA]
  abel

end Abstract
end Probe66BStruct
