import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- MEASURE the submultiplicative bound gridSum(u*v) ≤ gridSum u * gridSum v at the L1 level.
-- gridSum u = ∑|coord u i|. Expand both sides; try gcongr/nlinarith.
set_option linter.unusedSimpArgs false in
set_option maxHeartbeats 1000000 in
example (u v : O Cut) :
    (∑ m, |coordOCut (u * v) m|) ≤ (∑ i, |coordOCut u i|) * (∑ j, |coordOCut v j|) := by
  rw [Fin.sum_univ_eight, Fin.sum_univ_eight, Fin.sum_univ_eight]
  simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val, Matrix.cons_val_fin_one,
    e0, e1, e2, e3, e4, e5, e6, e7,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  -- Each |poly_m| ≤ sum of its 8 |u_i||v_j| terms; grid expands to all 64. Try:
  have key : ∀ a b : Cut, |a * b| = |a| * |b| := fun a b => abs_mul a b
  -- bound each abs by triangle, then nonneg-drop into the grid.
  ring_nf
  sorry

end
end Phys.Algebra
