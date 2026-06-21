import Phys.Cascade.ForcedStop
import Mathlib.Tactic
-- pull in the core block by re-stating its public results via the same defs.
-- For the scratch test, re-import the core lemmas by recompiling them inline is heavy;
-- instead test ONLY the concrete assembly assuming base_assoc_of_H exists with this sig.
namespace Phys.Cascade
open CD

-- Concrete anisotropy on S ℚ in the 2-torsion form:
set_option maxHeartbeats 4000000 in
theorem aniso_S2 (z : S ℚ) (h : Nrm z + Nrm z = 0) : z = 0 := by
  have hsq : (Nrm z + Nrm z).re.re.re = 2 * (
      z.re.re.re.re^2 + z.re.re.re.im^2 + z.re.re.im.re^2 + z.re.re.im.im^2
      + z.re.im.re.re^2 + z.re.im.re.im^2 + z.re.im.im.re^2 + z.re.im.im.im^2
      + z.im.re.re.re^2 + z.im.re.re.im^2 + z.im.re.im.re^2 + z.im.re.im.im^2
      + z.im.im.re.re^2 + z.im.im.re.im^2 + z.im.im.im.re^2 + z.im.im.im.im^2) := by
    simp only [Nrm, CD.add_re, CD.add_im, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      CD.neg_re, CD.neg_im, Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
    ring
  have h0 : (Nrm z + Nrm z).re.re.re = 0 := by rw [h]; rfl
  rw [hsq] at h0
  ext <;>
    simp only [CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] <;>
    nlinarith [h0, sq_nonneg z.re.re.re.re, sq_nonneg z.re.re.re.im, sq_nonneg z.re.re.im.re,
      sq_nonneg z.re.re.im.im, sq_nonneg z.re.im.re.re, sq_nonneg z.re.im.re.im,
      sq_nonneg z.re.im.im.re, sq_nonneg z.re.im.im.im, sq_nonneg z.im.re.re.re,
      sq_nonneg z.im.re.re.im, sq_nonneg z.im.re.im.re, sq_nonneg z.im.re.im.im,
      sq_nonneg z.im.im.re.re, sq_nonneg z.im.im.re.im, sq_nonneg z.im.im.im.re,
      sq_nonneg z.im.im.im.im]

#print axioms aniso_S2
end Phys.Cascade
