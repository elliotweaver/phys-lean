/- PROBE (run 75, W9 MEASURE): abstract polarCross2 = 0 for a NUCLEAR matrix E (LA/MA/RA),
   ARBITRARY X,Y. Both knobs: maxRecDepth (simp plumbing) + run with --tstack (abel normalizer).
   If green -> clean abstract lemma, instantiate at E=Dg via Dg_assocL/M/R; ZERO coordinates. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace Probe75PC2
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
  simp only [Matrix.mul_add, Matrix.add_mul, LA, MA, RA]
  abel

end Probe75PC2
