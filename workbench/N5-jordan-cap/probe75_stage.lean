/- PROBE (run 75): STAGED diagnosis of the LA/MA/RA loop in pc2. Distribute fully first
   (mul_add/add_mul, NO reassoc), then trace_state. Tells us the post-distribution monomial
   shape so we can pick a loop-free directed reassociation. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Probe75Stage
open Phys.Algebra Matrix
variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 2000000 in
set_option maxRecDepth 100000 in
theorem pc2_stage (E X Y : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    jb (jb E Y) (jb E X) + jb (jb E Y) (jb X E) + jb (jb X Y) (jb E E)
      - jb E (jb Y (jb E X)) - jb E (jb Y (jb X E)) - jb X (jb Y (jb E E)) = 0 := by
  unfold jb
  simp only [Matrix.mul_add, Matrix.add_mul]
  trace_state
  sorry

end Probe75Stage
