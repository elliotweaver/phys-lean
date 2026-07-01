import Phys.Algebra.OctonionJordanCubicNorm
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

/-- The quadratic spur (second elementary-symmetric invariant / trace of the adjugate). -/
noncomputable def jS (d0 d1 d2 : ℚ) (a b c : O ℚ) : ℚ :=
  (d0 * d1 + d0 * d2 + d1 * d2)
    - gForm a a - gForm b b - gForm c c

theorem jS_diag (d0 d1 d2 : ℚ) : jS d0 d1 d2 0 0 0 = d0 * d1 + d0 * d2 + d1 * d2 := by
  unfold jS gForm reQ; simp

theorem jS_one : jS 1 1 1 0 0 0 = 3 := by
  unfold jS gForm reQ; simp; norm_num

theorem jS_frame0 : jS 1 0 0 0 0 0 = 0 := by
  unfold jS gForm reQ; simp

/-- helper: the Born self-overlap form is invariant under negation of its (diagonal) argument. -/
theorem gForm_neg_neg (v : O ℚ) : gForm (-v) (-v) = gForm v v := by
  unfold gForm
  rw [star_neg, neg_mul_neg]

/-- helper: the trilinear cross-term flips sign when all three factors are negated. -/
theorem reQ_cross_neg (a b c : O ℚ) :
    reQ (((-a) * (-c)) * star (-b)) = - reQ ((a * c) * star b) := by
  rw [neg_mul_neg, star_neg, mul_neg, reQ_neg]

/-- ★★★ THE HEADLINE: the generic minimal-polynomial coefficient identity. Shifting the
    diagonal by `t·1` produces `t³ + e₁·t² + jS·t + jN` — the invariant tower as coefficients. -/
theorem jN_shift (d0 d1 d2 t : ℚ) (a b c : O ℚ) :
    jN (d0 + t) (d1 + t) (d2 + t) a b c
      = t^3 + (d0 + d1 + d2) * t^2 + jS d0 d1 d2 a b c * t + jN d0 d1 d2 a b c := by
  unfold jN jS
  ring

/-- ★★★ THE HEADLINE: the characteristic polynomial `det(lam·1 − A)` of the full Hermitian
    matrix — the three invariants are its coefficients, the eigenvalues its Cartan roots. -/
theorem jN_charpoly (d0 d1 d2 lam : ℚ) (a b c : O ℚ) :
    jN (lam - d0) (lam - d1) (lam - d2) (-a) (-b) (-c)
      = lam^3 - (d0 + d1 + d2) * lam^2 + jS d0 d1 d2 a b c * lam - jN d0 d1 d2 a b c := by
  unfold jN jS
  rw [gForm_neg_neg, gForm_neg_neg, gForm_neg_neg, reQ_cross_neg]
  ring

/-- W8 teeth: the off-diagonal genuinely lowers σ₂ from the diagonal `12` to `11`. -/
theorem jS_witness : jS 2 2 2 1 0 0 = 11 := by
  unfold jS gForm reQ; simp; norm_num

/-- W8 teeth: the char poly of `Hm 0 0 0 1 1 1` at `lam = 2` vanishes (eigenvalue 2). -/
theorem jN_charpoly_witness : jN 2 2 2 (-1) (-1) (-1) = 0 := by
  unfold jN gForm reQ; simp; norm_num

#print axioms jS_diag
#print axioms jS_one
#print axioms jS_frame0
#print axioms gForm_neg_neg
#print axioms reQ_cross_neg
#print axioms jN_shift
#print axioms jN_charpoly
#print axioms jN_charpoly
#print axioms jS_witness
#print axioms jN_charpoly_witness

end Phys.Algebra.HJ
