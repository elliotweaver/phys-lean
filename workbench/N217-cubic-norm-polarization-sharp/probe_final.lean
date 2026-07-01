import Phys.Algebra.OctonionJordanInvariantTower
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem star_qsmul (c : ℚ) (w : O ℚ) : star (c • w) = c • star w := by
  rw [star_smul]; rfl

noncomputable def jNpolar (D0 D1 D2 : ℚ) (A B C : O ℚ) (E0 E1 E2 : ℚ) (P Q R : O ℚ) : ℚ :=
  E0 * D1 * D2 + D0 * E1 * D2 + D0 * D1 * E2
    - E0 * gForm C C - 2 * D0 * gForm C R
    - E1 * gForm B B - 2 * D1 * gForm B Q
    - E2 * gForm A A - 2 * D2 * gForm A P
    + 2 * (reQ ((A * C) * star Q) + reQ ((A * R) * star B) + reQ ((P * C) * star B))

theorem jN_polarize (d0 d1 d2 s : ℚ) (a b c : O ℚ) (e0 e1 e2 : ℚ) (p q r : O ℚ) :
    jN (d0 + s * e0) (d1 + s * e1) (d2 + s * e2) (a + s • p) (b + s • q) (c + s • r)
      = jN d0 d1 d2 a b c
        + s * jNpolar d0 d1 d2 a b c e0 e1 e2 p q r
        + s ^ 2 * jNpolar e0 e1 e2 p q r d0 d1 d2 a b c
        + s ^ 3 * jN e0 e1 e2 p q r := by
  unfold jN jNpolar
  simp only [star_add, star_qsmul, add_mul, mul_add, qsmul_mul_left, qsmul_mul_right,
    smul_smul, gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right,
    reQ_add, reQ_smul,
    show gForm p a = gForm a p from gForm_symm p a,
    show gForm q b = gForm b q from gForm_symm q b,
    show gForm r c = gForm c r from gForm_symm r c]
  ring

theorem jNpolar_one_dir (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jNpolar d0 d1 d2 a b c 1 1 1 0 0 0 = jS d0 d1 d2 a b c := by
  unfold jNpolar jS gForm reQ
  simp; ring

theorem jNpolar_diag (d0 d1 d2 e0 e1 e2 : ℚ) :
    jNpolar d0 d1 d2 0 0 0 e0 e1 e2 0 0 0
      = e0 * d1 * d2 + d0 * e1 * d2 + d0 * d1 * e2 := by
  unfold jNpolar gForm reQ; simp

theorem jNpolar_cross_witness : jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 = 6 := by
  unfold jNpolar gForm reQ; simp; norm_num

theorem jNpolar_cross_witness_ne : jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 ≠ 0 := by
  rw [jNpolar_cross_witness]; norm_num

#print axioms jN_polarize
#print axioms jNpolar_one_dir
#print axioms jNpolar_diag
#print axioms jNpolar_cross_witness
#print axioms jNpolar_cross_witness_ne

end Phys.Algebra.HJ
