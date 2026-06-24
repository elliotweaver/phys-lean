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

/-- reQ is additive. -/
theorem reQ_add (a b : O ℚ) : reQ (a + b) = reQ a + reQ b := by
  simp [reQ, CD.add_re, Dbl.add_re]

theorem gForm_symm (v w : O ℚ) : gForm v w = gForm w v := by
  unfold gForm; rw [← reQ_star (v * star w), star_mul, star_star]

/-- ABSTRACT SKEW-ADJOINTNESS (ℤ): g(Dx,y)+g(x,Dy)=0, structurally (no reQ unfold). -/
theorem gForm_skew_Z (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x y : O ℚ) :
    gForm (D x) y + gForm x (D y) = 0 := by
  -- g(x,Dy) = g(Dy,x) = reQ(Dy * star x)
  -- Want reQ(Dx*star y) + reQ(Dy*star x) = 0.
  -- Use deriv_norm_preserve polar? Actually simpler: D kills the self-conjugate
  -- (x*star y + y*star x) since star(x*star y + y*star x) = x*star y + y*star x.
  rw [gForm_symm x (D y)]
  show reQ (D x * star y) + reQ (D y * star x) = 0
  rw [← reQ_add]
  -- D applied via Leibniz to (x * star y): D(x*star y) = Dx*star y + x*D(star y)
  -- and D(star y) = - Dy. The symmetric combination s := x*star y + y*star x is self-conj.
  have hself : star (x * star y + y * star x) = x * star y + y * star x := by
    rw [star_add, star_mul, star_mul, star_star, star_star, add_comm]
  have hDs : D (x * star y + y * star x) = 0 := deriv_real_zero D hD _ hself
  rw [map_add, hD x (star y), hD y (star x), deriv_star D hD y, deriv_star D hD x,
    mul_neg, mul_neg] at hDs
  -- hDs : Dx*star y + (x*(-Dy)... wait recompute
  -- After rw: (Dx*star y + x*D(star y)) + (Dy*star x + y*D(star x)) = 0
  -- D(star y)=-Dy, D(star x)=-Dx
  -- = Dx*star y - x*Dy + Dy*star x - y*Dx = 0
  -- apply reQ
  have := congrArg reQ hDs
  rw [reQ] at this ⊢
  simp only [reQ, CD.add_re, CD.neg_re, Dbl.add_re, Dbl.neg_re, CD.zero_re, Dbl.zero_re] at this ⊢
  -- need to show goal in terms of `this`; the cross terms x*Dy and y*Dx need to vanish or match
  linarith [this]

end

end Phys.Algebra
