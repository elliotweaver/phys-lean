import Phys.Algebra.DerivationPerfect
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def gForm (v w : O ℚ) : ℚ := reQ (v * star w)

theorem reQ_star (z : O ℚ) : reQ (star z) = reQ z := by
  simp [reQ, CD.star_re, Dbl.star_re']

theorem reQ_add (a b : O ℚ) : reQ (a + b) = reQ a + reQ b := by
  simp [reQ, CD.add_re, Dbl.add_re]

theorem reQ_neg (a : O ℚ) : reQ (-a) = - reQ a := by
  simp [reQ, CD.neg_re, Dbl.neg_re]

/-- ABSTRACT SKEW-ADJOINTNESS (ℤ): g(Dx,y)+g(x,Dy)=0. -/
theorem gForm_skew_Z (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x y : O ℚ) :
    gForm (D x) y + gForm x (D y) = 0 := by
  have hmx : star (D x) = - D x := deriv_maps_im D hD x
  have hmy : star (D y) = - D y := deriv_maps_im D hD y
  -- goal: reQ(Dx*star y) + reQ(x*star(Dy)) = 0
  unfold gForm
  rw [hmy, mul_neg, reQ_neg]
  -- now goal: reQ(Dx*star y) - reQ(x*Dy) = 0
  -- polar identity (reQ form):
  have hpolar := deriv_skew_polar D hD x y
  have hr : reQ (D x * star y) + reQ (D y * star x) = reQ (x * D y) + reQ (y * D x) := by
    have := congrArg reQ hpolar
    rwa [reQ_add, reQ_add] at this
  -- conjugate-reversal P1: reQ(Dx*star y) = -reQ(y*Dx)
  have hP1 : reQ (D x * star y) = - reQ (y * D x) := by
    rw [← reQ_star (D x * star y), star_mul, star_star, hmx, mul_neg, reQ_neg]
  -- P2: reQ(Dy*star x) = -reQ(x*Dy)
  have hP2 : reQ (D y * star x) = - reQ (x * D y) := by
    rw [← reQ_star (D y * star x), star_mul, star_star, hmy, mul_neg, reQ_neg]
  linarith [hr, hP1, hP2]

end

end Phys.Algebra
