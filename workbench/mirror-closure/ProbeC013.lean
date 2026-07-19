import Phys.Algebra.DerivationStabilizerSplit
open Phys.Cascade Phys.Algebra
local macro "cd_prod" : tactic =>
  `(tactic| (ext <;> simp [u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]))
lemma m01 : u1 * e2O = e3O := by cd_prod
lemma m13 : e2O * e4O = e6O := by cd_prod
lemma m23 : e3O * e4O = e7O := by cd_prod
lemma m05 : u1 * e6O = -e7O := by cd_prod
example : (u1 * e2O) * e4O = -(u1 * (e2O * e4O)) := by
  rw [m01, m13, m23, m05, neg_neg]
