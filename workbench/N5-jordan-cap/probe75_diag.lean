/- PROBE (run 75): diagnose pc2_abstract simp recursion. Stage 1: distribute only.
   Stage 2: distribute + reassoc. Measure where the recursion wall is. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Probe75Diag
open Phys.Algebra Matrix
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 4000000 in
set_option maxRecDepth 1000000 in
theorem pc2_abstract (E X Y : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jb (jb E Y) (jb E X) + jb (jb E Y) (jb X E) + jb (jb X Y) (jb E E)
      - jb E (jb Y (jb E X)) - jb E (jb Y (jb X E)) - jb X (jb Y (jb E E)) = 0 := by
  unfold jb
  simp only [Matrix.mul_add, Matrix.add_mul, LA, MA, RA]
  abel

end Probe75Diag
