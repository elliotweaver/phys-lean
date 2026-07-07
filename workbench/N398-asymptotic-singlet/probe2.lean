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
theorem star_u1' : star u1 = -u1 := rfl
theorem reQ_u1 : reQ u1 = 0 := by simp [reQ, u1]

/-- THE DRESSING MAP: read a singlet (a•1 + b•u1) as a Born-fibre state ((a:Cut),(b:Cut)). -/
noncomputable def dress (a b : ℚ) : StateFibre := ((a : Cut), (b : Cut))

/-- u1 acts on singlet coords as (a,b) ↦ (-b, a): singletElt-level multiplication by u1. -/
theorem u1_mul_singletElt (a b : ℚ) :
    u1 * singletElt a b = singletElt (-b) a := by
  unfold singletElt
  rw [mul_add, qsmul_mul_right, qsmul_mul_right, mul_one, complexUnit_sq]
  -- u1*(a•1) = a•u1 ; u1*(b•u1)=b•(u1*u1)=b•(-1)
  simp only [smul_neg]
  -- goal: a • u1 + b • (-1) = (-b) • 1 + a • u1
  abel_nf
  sorry

/-- THE INTERTWINING: dressing sends u1-multiplication to the Born complex unit foldComplex. -/
theorem dress_intertwines_J (a b : ℚ) :
    foldComplex (dress a b) = dress (-b) a := by
  apply Prod.ext
  · simp [foldComplex_apply, dress]
  · simp [foldComplex_apply, dress]

/-- THE BORN ISOMETRY: the fibre self-overlap of a dressed singlet equals its octonion norm. -/
theorem bornForm_dress (a b : ℚ) :
    bornForm (dress a b) (dress a b) = ((a^2 + b^2 : ℚ) : Cut) := by
  unfold bornForm dress
  push_cast; ring

end Phys.QFT
