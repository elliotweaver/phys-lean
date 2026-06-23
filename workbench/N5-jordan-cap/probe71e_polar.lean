/- PROBE 71e (W9.7 EXECUTE, R1 abstract): the polarization identity for jdef in the FIRST
   arg, D nuclear. Model-verified (pieceB_polar_verify.py: D-nuclear residual 0). If this
   compiles at the MATRIX level (abel over matrix atoms), R1 is viable: ocR never enters
   coordinates here; the only octonion work is the small P1=0 entrywise close. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Probe71e
open Phys.Algebra Matrix

variable {S : Type*} [NonAssocRing S] {n : ℕ}

set_option maxHeartbeats 1600000 in
set_option maxRecDepth 100000 in
theorem jdef_polar (D X Y : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, D * (P * Q) = (D * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * D) * Q = P * (D * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * D = P * (Q * D)) :
    jdef (D + X) Y
      = jdef X Y + jdef D Y
        + ( jb (jb D Y) (jb X X)
            + (jb (jb X Y) (D * X + X * D) + jb (jb X Y) (D * X + X * D))
            - jb D (jb Y (jb X X))
            - (jb X (jb Y (D * X + X * D)) + jb X (jb Y (D * X + X * D))) ) := by
  unfold jdef jb
  simp (config := { maxSteps := 4000000 }) only
    [Matrix.mul_add, Matrix.add_mul, Matrix.mul_sub, Matrix.sub_mul, LA, MA, RA]
  abel

end Probe71e
