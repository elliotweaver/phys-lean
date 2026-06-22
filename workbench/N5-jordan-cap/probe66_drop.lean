/- PROBE (run 66, W9.2): G-DROP via the matrix ASSOCIATOR (loop-free, directed rewrites).
   assoc P Q R := P*(Q*R) − (P*Q)*R. Trilinear; vanishes when any slot is nuclear.
   Gmat A = assoc A A A + assoc A A A.  assoc(E+X,E+X,E+X)=assoc(X,X,X) by 3 directed steps.
   The LA↔RA simp loop (E squared) is avoided: each cancellation is ONE nuclearity rewrite. -/
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe66Drop
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

section Abstract
variable {S : Type*} [NonAssocRing S] {n : ℕ}

noncomputable def assoc (P Q R : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  P * (Q * R) - (P * Q) * R

noncomputable def Gmat (A : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  A * (jb A A) - (jb A A) * A

theorem gmat_eq_assoc (A : Matrix (Fin n) (Fin n) S) :
    Gmat A = assoc A A A + assoc A A A := by
  unfold Gmat assoc jb
  simp only [Matrix.mul_add, Matrix.add_mul]; abel

-- additivity in each slot (pure distributivity, no nuclearity)
theorem assoc_add1 (P P' Q R : Matrix (Fin n) (Fin n) S) :
    assoc (P + P') Q R = assoc P Q R + assoc P' Q R := by
  unfold assoc; simp only [Matrix.add_mul]; abel
theorem assoc_add2 (P Q Q' R : Matrix (Fin n) (Fin n) S) :
    assoc P (Q + Q') R = assoc P Q R + assoc P Q' R := by
  unfold assoc; simp only [Matrix.add_mul, Matrix.mul_add]; abel
theorem assoc_add3 (P Q R R' : Matrix (Fin n) (Fin n) S) :
    assoc P Q (R + R') = assoc P Q R + assoc P Q R' := by
  unfold assoc; simp only [Matrix.mul_add]; abel

-- the master drop, abstract nuclear E
set_option maxHeartbeats 400000 in
theorem gmat_drop_abstract (E X : Matrix (Fin n) (Fin n) S)
    (LA : ∀ P Q : Matrix (Fin n) (Fin n) S, E * (P * Q) = (E * P) * Q)
    (MA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * E) * Q = P * (E * Q))
    (RA : ∀ P Q : Matrix (Fin n) (Fin n) S, (P * Q) * E = P * (Q * E)) :
    Gmat (E + X) = Gmat X := by
  have hL : ∀ Q R, assoc E Q R = 0 := by intro Q R; unfold assoc; rw [LA]; abel
  have hM : ∀ P R, assoc P E R = 0 := by intro P R; unfold assoc; rw [MA]; abel
  have hR : ∀ P Q, assoc P Q E = 0 := by intro P Q; unfold assoc; rw [RA]; abel
  have key : assoc (E + X) (E + X) (E + X) = assoc X X X := by
    rw [assoc_add1, hL, zero_add, assoc_add2, hM, zero_add, assoc_add3, hR, zero_add]
  rw [gmat_eq_assoc, gmat_eq_assoc, key]

end Abstract
end Probe66Drop
