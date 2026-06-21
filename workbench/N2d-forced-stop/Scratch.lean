import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD

variable {A : Type*}

/-- THE GENERIC SELF-OVERLAP NORM: the base component of `z · star z`. Derived
    forward from the banked `CD` product + `star`. -/
def Nrm [Mul A] [Add A] [Neg A] [Star A] (z : CD A) : A := (z * star z).re

theorem Nrm_def [Ring A] [StarRing A] (z : CD A) :
    Nrm z = z.re * star z.re + star z.im * z.im := by
  simp [Nrm, mul_re, star_re, star_im, star_neg, neg_mul]

/-- ★ THE BORN SELF-OVERLAP IS "REAL": generically (any `*`-ring base) the new-
    dimension component of `z · star z` vanishes, so `z · star z = ι (Nrm z)`. This
    is the trunk's positivity made structural: self-overlap lands in the base. -/
theorem selfMul [Ring A] [StarRing A] (z : CD A) :
    z * star z = iota (Nrm z) := by
  ext
  · simp [iota, Nrm, mul_re, star_re, star_im, star_neg, neg_mul]
  · simp [iota, mul_im, star_re, star_im, neg_mul]

end CD
end Phys.Cascade
