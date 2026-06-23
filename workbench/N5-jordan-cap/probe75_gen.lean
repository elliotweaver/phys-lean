/- PROBE (run 75): pc2_abstract via the jdef_nuc_first trick — GENERALIZE the square E*E=P
   to break the LA/MA/RA ping-pong loop ((E*E)*Q <-> E*(E*Q)). Then simp distributes the
   single-E rewrites (terminating) and abel closes. Flex fact E*(E*E)=(E*E)*E supplied. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Probe75Gen
open Phys.Algebra Matrix
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 2000000 in
set_option maxRecDepth 100000 in
theorem pc2_abstract (E X Y : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jb (jb E Y) (jb E X) + jb (jb E Y) (jb X E) + jb (jb X Y) (jb E E)
      - jb E (jb Y (jb E X)) - jb E (jb Y (jb X E)) - jb X (jb Y (jb E E)) = 0 := by
  unfold jb
  have hflex : E * (E * E) = (E * E) * E := LA E E
  generalize hP : E * E = P at hflex ⊢
  simp only [mul_add, add_mul, LA, MA, RA]
  abel

end Probe75Gen
