import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade
open CD

-- CONCRETE anisotropy on S ℚ. Nrm z : O ℚ; scalar (Nrm z).re.re.re : ℚ = sum of 16 squares.
-- Test: Nrm z = 0 → z = 0, via scalar projection + nlinarith, ext peeling 4 levels.
set_option maxHeartbeats 4000000 in
theorem aniso_S (z : S ℚ) (h : Nrm z = 0) : z = 0 := by
  have hsq : (Nrm z).re.re.re =
      z.re.re.re.re^2 + z.re.re.re.im^2 + z.re.re.im.re^2 + z.re.re.im.im^2
      + z.re.im.re.re^2 + z.re.im.re.im^2 + z.re.im.im.re^2 + z.re.im.im.im^2
      + z.im.re.re.re^2 + z.im.re.re.im^2 + z.im.re.im.re^2 + z.im.re.im.im^2
      + z.im.im.re.re^2 + z.im.im.re.im^2 + z.im.im.im.re^2 + z.im.im.im.im^2 := by
    simp only [Nrm, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im]
    ring
  have h0 : (Nrm z).re.re.re = 0 := by rw [h]; rfl
  rw [hsq] at h0
  ext <;>
    simp only [CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] <;>
    nlinarith [h0, sq_nonneg z.re.re.re.re, sq_nonneg z.re.re.re.im, sq_nonneg z.re.re.im.re,
      sq_nonneg z.re.re.im.im, sq_nonneg z.re.im.re.re, sq_nonneg z.re.im.re.im,
      sq_nonneg z.re.im.im.re, sq_nonneg z.re.im.im.im, sq_nonneg z.im.re.re.re,
      sq_nonneg z.im.re.re.im, sq_nonneg z.im.re.im.re, sq_nonneg z.im.re.im.im,
      sq_nonneg z.im.im.re.re, sq_nonneg z.im.im.re.im, sq_nonneg z.im.im.im.re,
      sq_nonneg z.im.im.im.im]

#print axioms aniso_S
end Phys.Cascade
