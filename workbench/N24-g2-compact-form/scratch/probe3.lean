import Phys.Algebra.DerivationPerfect
import Mathlib.Algebra.Lie.TraceForm
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def gForm (v w : O ℚ) : ℚ := reQ (v * star w)

/-- reQ is star-invariant: reQ (star z) = reQ z. -/
theorem reQ_star (z : O ℚ) : reQ (star z) = reQ z := by
  simp [reQ, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']

/-- gForm symmetric. -/
theorem gForm_symm (v w : O ℚ) : gForm v w = gForm w v := by
  unfold gForm
  rw [← reQ_star (v * star w), star_mul, star_star]

/-- ABSTRACT SKEW-ADJOINTNESS (ℤ form): g(Dx,y)+g(x,Dy)=0. -/
theorem gForm_skew_Z (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x y : O ℚ) :
    gForm (D x) y + gForm x (D y) = 0 := by
  -- S = g(Dx,y)+g(x,Dy); show S = -S.
  have hpolar := deriv_skew_polar D hD x y
  -- g(x,Dy) = g(Dy,x) (symm) = reQ(Dy * star x)
  have e1 : gForm x (D y) = reQ (D y * star x) := by rw [gForm_symm]; rfl
  have e2 : gForm (D x) y = reQ (D x * star y) := rfl
  -- reQ of the polarized identity
  have hr := congrArg reQ hpolar
  simp only [reQ, CD.mul_re, CD.add_re] at hr ⊢
  -- now relate reQ(x * Dy) and reQ(y * Dx) back to S via deriv_maps_im
  have hmy : star (D y) = - D y := deriv_maps_im D hD y
  have hmx : star (D x) = - D x := deriv_maps_im D hD x
  -- reQ(x * Dy) = reQ(star(x*Dy)) = reQ(star(Dy)*star x) = -reQ(Dy*star x)
  have t1 : reQ (x * D y) = - reQ (D y * star x) := by
    rw [← reQ_star (x * D y), star_mul, hmy, neg_mul]; simp [reQ]
  have t2 : reQ (y * D x) = - reQ (D x * star y) := by
    rw [← reQ_star (y * D x), star_mul, hmx, neg_mul]; simp [reQ]
  -- assemble
  simp only [reQ] at e1 e2 t1 t2
  linear_combination (norm := ring_nf) hr + t1 + t2

end

end Phys.Algebra
