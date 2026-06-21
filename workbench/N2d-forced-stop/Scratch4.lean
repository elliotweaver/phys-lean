import Phys.Cascade.Sedenion
import Mathlib.Tactic

namespace Phys.Cascade
namespace CD
variable {A : Type*}
def Nrm [Mul A] [Add A] [Neg A] [Star A] (z : CD A) : A := (z * star z).re
theorem Nrm_def [Ring A] [StarRing A] (z : CD A) :
    Nrm z = z.re * star z.re + star z.im * z.im := by
  simp [Nrm, mul_re, star_re, star_im, star_neg, neg_mul]
theorem selfMul [Ring A] [StarRing A] (z : CD A) :
    z * star z = iota (Nrm z) := by
  ext
  · simp [iota, Nrm, mul_re, star_re, star_im, star_neg, neg_mul]
  · simp [iota, mul_im, star_re, star_im, neg_mul]
end CD

-- SPECIALIZATION: the generic Nrm projects to N2c's concrete N on S ℚ.
-- N2c: N z = (z * star z).re.re.re.re ; generic: Nrm z = (z*star z).re ∈ O.
theorem N_eq_proj (z : S ℚ) : N z = (CD.Nrm z).re.re.re := by
  simp [N, CD.Nrm]

-- ANTI-VACUITY through the GENERIC norm: the generic Nrm is NOT multiplicative at
-- the first non-associative rung S, witnessed by N2c's zero divisors.
theorem genNrm_not_mul_at_S :
    CD.Nrm (zdX * zdY) ≠ CD.Nrm zdX * CD.Nrm zdY := by
  intro h
  -- project both sides through N2c's scalar N
  have hp := congrArg (fun w : O ℚ => w.re.re.re) h
  rw [zero_divisor_prod] at hp
  simp only [CD.Nrm] at hp
  -- LHS: (0 * star 0).re.re.re = 0 ; RHS: (Nrm zdX * Nrm zdY).re.re.re
  sorry

end Phys.Cascade
