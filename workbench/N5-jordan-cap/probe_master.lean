/- PROBE (run 65, W9.2): master identity with A*A GENERALIZED to opaque Q → confluent. -/
import Phys.Algebra.JordanTower
import Mathlib.Tactic

namespace ProbeMaster
open Phys.Algebra
open Matrix

variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 800000 in
theorem master_Q (A E : Matrix (Fin n) (Fin n) S)
    (LA : ∀ X Y : Matrix (Fin n) (Fin n) S, E * (X * Y) = (E * X) * Y)
    (MA : ∀ X Y : Matrix (Fin n) (Fin n) S, (X * E) * Y = X * (E * Y))
    (RA : ∀ X Y : Matrix (Fin n) (Fin n) S, (X * Y) * E = X * (Y * E)) :
    jdef A E = E * (A * (jb A A) - (jb A A) * A) - (A * (jb A A) - (jb A A) * A) * E := by
  unfold jdef jb
  generalize A * A = Q
  simp only [mul_add, add_mul, mul_sub, sub_mul, LA, MA, RA]
  abel

end ProbeMaster
