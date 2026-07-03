/-
  PROBE (N270 SELECT, candidate A): THE OBSERVABLE ARENA IS FORMALLY REAL.
-/
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.DerivationCompact
import Phys.Algebra.OctonionAssociative3Form
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def jQ (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (Matrix.trace (A * A))

theorem gForm_star_star (w : O ℚ) : gForm (star w) (star w) = gForm w w := by
  unfold gForm
  rw [star_star, reQ_mul_comm]

theorem reQ_mul_star_self (x : O ℚ) : reQ (x * star x) = gForm x x := rfl

/-- Look at the goal after the trace/matrix-entry expansion. -/
theorem jQ_Hm (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jQ (Hm d0 d1 d2 a b c)
      = d0 * d0 + d1 * d1 + d2 * d2
        + 2 * (gForm a a + gForm b b + gForm c c) := by
  unfold jQ Hm
  rw [Matrix.trace]
  simp only [Matrix.diag_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons, Matrix.empty_val',
    Matrix.cons_val_fin_one, Matrix.head_fin_const]
  -- Now a sum of reQ over 9 octonion products; push reQ through all adds
  simp only [reQ_add]
  -- diagonal squares reQ(ocR d * ocR d) = d*d ; off-diag reQ(x*star x)=gForm x x and its comm twin
  have hcomm : ∀ x : O ℚ, reQ (star x * x) = gForm x x := by
    intro x; unfold gForm; rw [reQ_mul_comm]
  have hself : ∀ x : O ℚ, reQ (x * star x) = gForm x x := fun x => rfl
  have hocR : ∀ d : ℚ, reQ (ocR d * ocR d) = d * d := by
    intro d; simp [reQ, ocR, Phys.Cascade.CD.mul_re]
  rw [hocR, hself, hself, hcomm, hocR, hself, hcomm, hcomm, hocR]
  ring

/-- POSITIVE SEMIDEFINITE: the trace-square form is ≥ 0 (fold Born positivity lifted). -/
theorem jQ_Hm_nonneg (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    0 ≤ jQ (Hm d0 d1 d2 a b c) := by
  rw [jQ_Hm]
  have := gForm_self_nonneg a
  have := gForm_self_nonneg b
  have := gForm_self_nonneg c
  nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]

/-- POSITIVE DEFINITE (FORMAL REALITY): the trace-square vanishes iff the element is 0.
    THE HEADLINE crux — the arena is a formally-real (Euclidean) Jordan algebra. -/
theorem jQ_Hm_eq_zero_iff (d0 d1 d2 : ℚ) (a b c : O ℚ) :
    jQ (Hm d0 d1 d2 a b c) = 0 ↔ (d0 = 0 ∧ d1 = 0 ∧ d2 = 0 ∧ a = 0 ∧ b = 0 ∧ c = 0) := by
  rw [jQ_Hm]
  constructor
  · intro h
    have ha := gForm_self_nonneg a
    have hb := gForm_self_nonneg b
    have hc := gForm_self_nonneg c
    have hd0 : d0 = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hd1 : d1 = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hd2 : d2 = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hga : gForm a a = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hgb : gForm b b = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    have hgc : gForm c c = 0 := by nlinarith [sq_nonneg d0, sq_nonneg d1, sq_nonneg d2]
    exact ⟨hd0, hd1, hd2, gForm_self_eq_zero.mp hga, gForm_self_eq_zero.mp hgb,
      gForm_self_eq_zero.mp hgc⟩
  · rintro ⟨hd0, hd1, hd2, ha, hb, hc⟩
    subst hd0; subst hd1; subst hd2; subst ha; subst hb; subst hc
    simp [gForm, reQ]

end Phys.Algebra.HJ

section AxCheck
open Phys.Algebra.HJ
#print axioms jQ_Hm
#print axioms jQ_Hm_nonneg
#print axioms jQ_Hm_eq_zero_iff
end AxCheck
