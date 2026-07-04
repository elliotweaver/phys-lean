import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

/-  N286 bounded feasibility probe. Two risky pieces:
    (P1) the ABSTRACT free-ring identity  d + d = combo  via  simp[jb,jdef,distrib]; abel
    (P2) the Hermitian -> Hm reconstruction (self-adjoint diagonal = ocR (reQ ·)).  -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000

section Abstract
variable {S : Type*} [NonAssocRing S] {n : ℕ}

-- The derivation defect spelled purely in jb.
-- (P1) the integer free-ring identity: d + d = combo (14 jdef terms).
-- Measure abel cost here.
set_option maxHeartbeats 1000000 in
theorem inner_leibniz_two (A B X Y : Matrix (Fin n) (Fin n) S) :
    (jb A (jb B (jb X Y)) - jb B (jb A (jb X Y))
      - jb (jb A (jb B X) - jb B (jb A X)) Y
      - jb X (jb A (jb B Y) - jb B (jb A Y)))
    + (jb A (jb B (jb X Y)) - jb B (jb A (jb X Y))
      - jb (jb A (jb B X) - jb B (jb A X)) Y
      - jb X (jb A (jb B Y) - jb B (jb A Y)))
    =
    ( (jdef (B + X + Y) A - jdef (B + X) A - jdef (B + Y) A - jdef (X + Y) A
        + jdef B A + jdef X A + jdef Y A)
    - (jdef (A + X + Y) B - jdef (A + X) B - jdef (A + Y) B - jdef (X + Y) B
        + jdef A B + jdef X B + jdef Y B) ) := by
  simp only [jb, jdef, mul_add, add_mul, mul_sub, sub_mul]
  abel

end Abstract

end Phys.Algebra.HJ
