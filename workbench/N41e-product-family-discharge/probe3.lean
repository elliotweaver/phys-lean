import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- THE GATING BOUND: |e_m(u*v)| ≤ Su * Sv  where Su = ∑|e_i u|, Sv = ∑|e_j v|.
-- Try coordinate 0 first (the re.re.re component).
-- e0(u*v) = (u*v).re.re.re
-- (u*v).re = u.re*v.re + -(star v.im * u.im)   [CD.mul_re at O level: re : H Cut]
-- This is getting deep. Let me just expand fully and bound.

-- Measure: does the bound for ALL m close by a uniform tactic?
set_option maxHeartbeats 400000 in
example (u v : O Cut) (m : Fin 8) :
    |coordOCut (u * v) m| ≤ (∑ i, |coordOCut u i|) * (∑ j, |coordOCut v j|) := by
  rw [Fin.sum_univ_eight, Fin.sum_univ_eight]
  fin_cases m <;>
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im] <;>
    sorry

end
end Phys.Algebra
