import Phys.Algebra.DerivationStabilizerSplit

/- PROBE 2: per-product lemma pattern (the banked DerivationUpperBound style),
   plus a coherence value through two products. Timing test. -/

open Phys.Cascade Phys.Algebra

namespace MirrorProbe

-- name the units locally to match banked style
private def E : Fin 7 → O ℚ := imBasis

/-- one product lemma in the banked style -/
example : E 0 * E 1 = E 2 := by
  show u1 * e2O = e3O
  ext <;> simp [u1, e2O, e3O, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    imBasis]

/-- a full coherence check through TWO products, non-Fano triple (0,1,3):
    (u1*e2O)*e5O = -(u1*(e2O*e5O)) — antipodal. -/
example : (u1 * e2O) * e5O = -(u1 * (e2O * e5O)) := by
  ext <;> simp [u1, e2O, e5O, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]

end MirrorProbe
