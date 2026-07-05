import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.TowerGatherIsometry
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE 1: imParseval via full destructure of w first, then coordinate arithmetic
example (w : O ℚ) (hw : w ∈ ImO) :
    gForm w w = ∑ i : Fin 7, (gForm (imBasis i) w)^2 := by
  have hr : reQ w = 0 := reQ_ImO_zero hw
  rw [Fin.sum_univ_seven]
  obtain ⟨⟨⟨a, b⟩, ⟨c, d⟩⟩, ⟨⟨e, f⟩, ⟨g, h⟩⟩⟩ := w
  simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val, Matrix.head_fin_const,
    gForm, reQ, u1, e2O, e3O, e4O, e5O, e6O, e7O,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] at hr ⊢
  nlinarith [hr, sq_nonneg a]

end

end Phys.Algebra
