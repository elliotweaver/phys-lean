/- PROBE (run 68, W9.2): jdef E B = 0 for NUCLEAR E (1st arg), loop-free + flex-closed.
   After generalize E*E=P, residual needs E*P=P*E (=LA E E, flexibility) and one MA. -/
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe68NF
open Phys.Algebra Matrix
section Abstract
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 800000 in
theorem jdef_nuc_first (E B : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jdef E B = 0 := by
  unfold jdef jb
  have hflex : E * (E * E) = (E * E) * E := LA E E
  generalize hP : E * E = P at hflex ⊢
  simp only [mul_add, add_mul, mul_sub, sub_mul, LA, MA, RA]
  rw [hflex, MA]
  abel

end Abstract
end Probe68NF
