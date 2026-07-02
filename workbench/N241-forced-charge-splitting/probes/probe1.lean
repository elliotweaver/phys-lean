import Phys.Algebra.TowerGatherForcedChargeDirection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- (1) gForm orthogonalities of u1 to the complement generators (u2 = e2O is banked gForm_u1_u2).
example : gForm u1 e3O = 0 := by
  show reQ (u1 * star e3O) = 0
  simp only [reQ, u1, e3O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

example : gForm u1 e4O = 0 := by
  show reQ (u1 * star e4O) = 0
  simp only [reQ, u1, e4O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

example : gForm u1 e5O = 0 := by
  show reQ (u1 * star e5O) = 0
  simp only [reQ, u1, e5O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

example : gForm u1 e6O = 0 := by
  show reQ (u1 * star e6O) = 0
  simp only [reQ, u1, e6O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

example : gForm u1 e7O = 0 := by
  show reQ (u1 * star e7O) = 0
  simp only [reQ, u1, e7O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
    Dbl.neg_re, Dbl.neg_im]
  norm_num

-- ★ THE CRUX: crossOpO u1 coincides with JO on the complement generators (correction vanishes).
-- octCross u1 y = u1*y + gForm u1 y • 1 ; on V, gForm u1 y = 0, and u1*y = JO y.
example : crossOpO u1 e2O = JO e2O := by
  show octCross u1 e2O = u1 * e2O
  unfold octCross
  have h : gForm u1 e2O = 0 := gForm_u1_u2
  rw [h, zero_smul, add_zero]

example : crossOpO u1 e3O = JO e3O := by
  show octCross u1 e3O = u1 * e3O
  unfold octCross
  have h : gForm u1 e3O = 0 := by
    show reQ (u1 * star e3O) = 0
    simp only [reQ, u1, e3O, CD.mul_re, CD.star_re, CD.star_im, CD.add_re,
      CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.add_re, Dbl.star_re', Dbl.star_im',
      Dbl.neg_re, Dbl.neg_im]
    norm_num
  rw [h, zero_smul, add_zero]

end

end Phys.Algebra
