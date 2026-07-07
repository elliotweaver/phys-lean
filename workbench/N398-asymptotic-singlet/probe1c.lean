import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.QFT
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD

noncomputable def singletElt (a b : ℚ) : O ℚ := a • (1 : O ℚ) + b • u1
theorem star_u1' : star u1 = -u1 := rfl

theorem gForm_singletElt (a b : ℚ) :
    gForm (singletElt a b) (singletElt a b) = a^2 + b^2 := by
  unfold gForm singletElt
  rw [star_add, star_smul_one]
  have hst : star (b • u1) = b • (-u1) := by rw [star_smul]; rw [star_u1']; rfl
  rw [hst]
  simp only [mul_add, add_mul, qsmul_mul_left, qsmul_mul_right, mul_one, one_mul,
    reQ_add, reQ_smul, reQ_neg, reQ_one]
  rw [_root_.mul_neg, complexUnit_sq]
  simp only [reQ_neg, reQ_one]
  ring
end Phys.QFT
