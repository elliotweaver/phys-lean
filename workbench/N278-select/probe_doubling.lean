import Phys.Algebra.TowerGatherIsospinMultiplet
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

-- Probe the doubling intertwiner L_ℓ (ℓ = e4O = κO1) on TL={u1,e2O,e3O} → TR={e5O,e6O,e7O}.
-- Use the CD coordinate simp set (as in imRep_DK_eq_qI) then norm_num/ring on each of 8 coords.
set_option maxHeartbeats 1000000 in
example : (e4O * u1 : O ℚ) = e5O := by
  ext <;> simp only [e4O, u1, e5O, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im] <;> ring

set_option maxHeartbeats 1000000 in
example : (e4O * e2O : O ℚ) = e6O := by
  ext <;> simp only [e4O, e2O, e6O, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im] <;> ring

set_option maxHeartbeats 1000000 in
example : (e4O * e3O : O ℚ) = e7O := by
  ext <;> simp only [e4O, e3O, e7O, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im] <;> ring
