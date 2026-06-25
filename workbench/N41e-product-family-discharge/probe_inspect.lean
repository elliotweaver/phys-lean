import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

set_option linter.unusedSimpArgs false in
-- inspect coord 0 fully reduced
example (u v : O Cut) : coordOCut (u * v) 0 = 0 := by
  simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero, e0,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  trace_state
  sorry

end
end Phys.Algebra
