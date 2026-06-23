/- PROBE (run 75): pc2_abstract with DIRECTED non-looping rewrite. The LA<->MA ping-pong is
   the loop. Try LA+RA only (both push E rightward/inward consistently), drop MA. Then abel.
   Variant A: simp only [..., LA, RA]; abel.  -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Probe75Dir
open Phys.Algebra Matrix
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 2000000 in
set_option maxRecDepth 100000 in
theorem pc2_A (E X Y : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jb (jb E Y) (jb E X) + jb (jb E Y) (jb X E) + jb (jb X Y) (jb E E)
      - jb E (jb Y (jb E X)) - jb E (jb Y (jb X E)) - jb X (jb Y (jb E E)) = 0 := by
  unfold jb
  simp only [Matrix.mul_add, Matrix.add_mul, LA, RA]
  abel

end Probe75Dir
