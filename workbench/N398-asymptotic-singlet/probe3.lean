import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.DerivationCompact
import Phys.Quantum.Unitarity
import Mathlib.Tactic

namespace Phys.QFT
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open Phys.Quantum
open Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD

noncomputable def singletElt (a b : ℚ) : O ℚ := a • (1 : O ℚ) + b • u1
noncomputable def dress (a b : ℚ) : StateFibre := ((a : Cut), (b : Cut))
theorem reQ_u1 : reQ u1 = 0 := by simp [reQ, u1]
theorem star_u1' : star u1 = -u1 := rfl

theorem gForm_singletElt (a b : ℚ) :
    gForm (singletElt a b) (singletElt a b) = a^2 + b^2 := by
  unfold gForm singletElt
  rw [star_add, star_smul_one]
  have hst : star (b • u1) = b • (-u1) := by rw [star_smul]; rw [star_u1']; rfl
  rw [hst]
  simp only [mul_add, add_mul, qsmul_mul_left, qsmul_mul_right, mul_one, one_mul,
    reQ_add, reQ_smul, reQ_neg, reQ_one]
  have huu : reQ (u1 * -u1) = 1 := by rw [_root_.mul_neg, complexUnit_sq]; simp
  rw [reQ_u1, huu]; ring

theorem bornForm_dress (a b : ℚ) :
    bornForm (dress a b) (dress a b) = ((a^2 + b^2 : ℚ) : Cut) := by
  unfold bornForm dress; push_cast; ring

/-- ★ ASYMPTOTIC COMPLETENESS: the octonion norm of a singlet SPLITS into the Born outcome
    weights of its dressed state — wIn + wOut = ratCast(gForm(singlet)). -/
theorem dress_completeness (a b : ℚ) :
    wIn (dress a b) + wOut (dress a b) = ((gForm (singletElt a b) (singletElt a b) : ℚ) : Cut) := by
  rw [outcome_weights_sum, bornForm_dress, gForm_singletElt]

/-- ★★ CLOSURE: the fold-phase transport (K1's unitary generator Dbl.J) maps a dressed singlet
    to another dressed singlet — matching u1-multiplication on the octonion line (u1·singlet stays
    in span{1,u1}). The asymptotic sector is closed under the fold's own phase transport. -/
theorem evolve_J_dress (a b : ℚ) :
    evolve Dbl.J (dress a b) = dress (-b) a := by
  unfold evolve dress
  apply Prod.ext <;>
    simp [fromDbl, toDbl, Dbl.J, Dbl.mul_re, Dbl.mul_im] <;> push_cast <;> ring

end Phys.QFT
