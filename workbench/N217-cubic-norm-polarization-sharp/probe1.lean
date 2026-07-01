import Phys.Algebra.OctonionJordanInvariantTower
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-- THE FIRST POLAR of the cubic norm: quadratic in the first Hermitian argument
    `(D0 D1 D2, A B C)`, linear in the second `(E0 E1 E2, P Q R)`. -/
noncomputable def jNpolar (D0 D1 D2 : ℚ) (A B C : O ℚ) (E0 E1 E2 : ℚ) (P Q R : O ℚ) : ℚ :=
  E0 * D1 * D2 + D0 * E1 * D2 + D0 * D1 * E2
    - E0 * gForm C C - 2 * D0 * gForm C R
    - E1 * gForm B B - 2 * D1 * gForm B Q
    - E2 * gForm A A - 2 * D2 * gForm A P
    + 2 * (reQ ((A * C) * star Q) + reQ ((A * R) * star B) + reQ ((P * C) * star B))

-- Check star of smul / add lemmas available
example (s : ℚ) (q : O ℚ) : star (s • q) = s • star q := by
  simp [star_smul]

/-- THE CUBIC POLARIZATION IDENTITY. -/
theorem jN_polarize (d0 d1 d2 s : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ) :
    jN (d0 + s * e0) (d1 + s * e1) (d2 + s * e2) (a + s • p) (b + s • q) (c + s • r)
      = jN d0 d1 d2 a b c
        + s * jNpolar d0 d1 d2 a b c e0 e1 e2 p q r
        + s ^ 2 * jNpolar e0 e1 e2 p q r d0 d1 d2 a b c
        + s ^ 3 * jN e0 e1 e2 p q r := by
  unfold jN jNpolar
  simp only [star_add, star_smul, mul_add, add_mul, smul_mul_assoc, mul_smul_comm,
    smul_smul, gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right,
    reQ_add, reQ_smul]
  ring

#print axioms jN_polarize

end Phys.Algebra.HJ
