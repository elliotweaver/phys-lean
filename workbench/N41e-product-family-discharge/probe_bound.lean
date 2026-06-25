import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

set_option linter.unusedSimpArgs false in
-- MEASURE: coordinate-0 bound |e0(u*v)| ≤ Su * Sv
example (u v : O Cut) :
    |coordOCut (u * v) 0| ≤ (∑ i, |coordOCut u i|) * (∑ j, |coordOCut v j|) := by
  rw [Fin.sum_univ_eight, Fin.sum_univ_eight]
  simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val, Matrix.cons_val_fin_one,
    e0, e1, e2, e3, e4, e5, e6, e7,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  -- Now: |8 signed products| ≤ (8-term Su)*(8-term Sv)
  nlinarith [abs_nonneg u.re.re.re, abs_nonneg u.re.re.im, abs_nonneg u.re.im.re,
    abs_nonneg u.re.im.im, abs_nonneg u.im.re.re, abs_nonneg u.im.re.im,
    abs_nonneg u.im.im.re, abs_nonneg u.im.im.im,
    abs_nonneg v.re.re.re, abs_nonneg v.re.re.im, abs_nonneg v.re.im.re,
    abs_nonneg v.re.im.im, abs_nonneg v.im.re.re, abs_nonneg v.im.re.im,
    abs_nonneg v.im.im.re, abs_nonneg v.im.im.im]

end
end Phys.Algebra
