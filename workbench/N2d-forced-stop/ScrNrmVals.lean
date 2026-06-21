import Phys.Cascade.ForcedStop
import Mathlib.Tactic
open Phys.Cascade

-- Nrm on O ℚ = CD (H ℚ) lands in H ℚ = CD (Dbl ℚ); project .re.re to reach ℚ.
example : (CD.Nrm ((CD.e2 : O ℚ) * CD.e2)).re.re = (1 : ℚ) := by
  simp only [CD.Nrm]
  simp [CD.e2, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

example : (CD.Nrm (CD.e2 : O ℚ)).re.re = (1 : ℚ) := by
  simp only [CD.Nrm]
  simp [CD.e2, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

-- The product (in H ℚ) projected:
example : (CD.Nrm (CD.e2 : O ℚ) * CD.Nrm (CD.e2 : O ℚ)).re.re = (1 : ℚ) := by
  simp only [CD.Nrm]
  simp [CD.e2, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']
