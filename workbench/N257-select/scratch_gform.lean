import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000
set_option maxHeartbeats 1000000

noncomputable section

-- gForm orthonormality on imBasis via the CD/Dbl simp set (bridge-tactic pattern) + norm_num
example : gForm (imBasis 0) (imBasis 0) = 1 := by
  show gForm (imBasis 0) (imBasis 0) = 1
  simp only [imBasis, Matrix.cons_val_zero, gForm, reQ, u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.iota, Dbl.J,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
    Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im]
  norm_num

example : gForm (imBasis 0) (imBasis 3) = 0 := by
  simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val, Matrix.head_cons, gForm, reQ,
    u1, e2O, e3O, e4O, e5O, e6O, e7O, CD.iota, Dbl.J,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
    Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im]
  norm_num

-- try the fully generic gForm_imBasis via fin_cases
example (i j : Fin 7) : gForm (imBasis i) (imBasis j) = (if i = j then 1 else 0) := by
  fin_cases i <;> fin_cases j <;>
    simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val, Matrix.head_cons, gForm, reQ,
      u1, e2O, e3O, e4O, e5O, e6O, e7O, CD.iota, Dbl.J,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im] <;> norm_num

end
end Phys.Algebra
