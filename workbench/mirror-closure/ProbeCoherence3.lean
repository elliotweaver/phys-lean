import Phys.Algebra.DerivationStabilizerSplit

/- PROBE 3: product-lemma architecture — prove single products as named lemmas,
   then coherence identities by rewriting (no deep simp). -/

open Phys.Cascade Phys.Algebra

namespace MirrorProbe

-- The simp set for ONE CD product (banked DerivationUpperBound style)
macro "cd_ext" : tactic =>
  `(tactic| (ext <;> simp [u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, CD.star_re, CD.star_im,
    Dbl.star_re', Dbl.star_im', CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im]))

-- single-product lemmas (each fast, ~2s)
private lemma m12 : u1 * e2O = e3O := by cd_ext
private lemma m15 : e2O * e5O = e7O := by cd_ext   -- guess: check sign
private lemma m17 : u1 * e7O = -e6O := by cd_ext   -- guess: check sign

end MirrorProbe
