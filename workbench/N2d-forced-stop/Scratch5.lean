import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {A : Type*}
def Nrm [Mul A] [Add A] [Neg A] [Star A] (z : CD A) : A := (z * star z).re
end CD

-- Nrm(zdX*zdY) = Nrm 0 = 0
theorem Nrm_zd_prod : CD.Nrm (zdX * zdY) = (0 : O ℚ) := by
  rw [zero_divisor_prod]
  show ((0 : S ℚ) * star 0).re = 0
  ext <;> simp [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

-- The product Nrm zdX * Nrm zdY is nonzero: its scalar projection is 4.
set_option maxHeartbeats 1000000 in
theorem Nrm_prod_proj : (CD.Nrm zdX * CD.Nrm zdY).re.re.re = (4 : ℚ) := by
  simp only [CD.Nrm]
  simp [zdX, zdY, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
  norm_num

theorem genNrm_not_mul_at_S :
    CD.Nrm (zdX * zdY) ≠ CD.Nrm zdX * CD.Nrm zdY := by
  intro h
  have hp := congrArg (fun w : O ℚ => w.re.re.re) h
  simp only [Nrm_zd_prod, Nrm_prod_proj] at hp
  norm_num at hp

end Phys.Cascade
