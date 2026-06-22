/- PROBE (run 67, W9.2): abstract jdef E B = 0 for NUCLEAR E, via the directed associator
   route (NOT raw simp[LA,MA,RA] which loops on E*E — that killed probe66_bstruct).
   Strategy: jdef E B unfolds to brackets; keep E*E opaque via generalize, push nuclearity. -/
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe67NF
open Phys.Algebra Matrix

section Abstract
variable {S : Type*} [NonAssocRing S] {n : ℕ}

-- Candidate 1: jdef_master already gives jdef A E = E*G - G*E for nuclear E (2nd arg).
-- For jdef E B with E nuclear FIRST arg, try the generalize-square route directly.
set_option maxHeartbeats 800000 in
theorem jdef_nuc_first (E B : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jdef E B = 0 := by
  unfold jdef jb
  simp only [mul_add, add_mul, mul_sub, sub_mul, LA, MA, RA]
  abel

end Abstract
end Probe67NF
