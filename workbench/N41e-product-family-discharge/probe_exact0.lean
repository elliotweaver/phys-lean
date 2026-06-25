import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- LEAF: product of two projection sequences summable over ℕ×ℕ.
theorem leaf (a b : ℕ → O Cut)
    (ha : ∀ i, Summable (fun k => |(coordOCut (a k)) i|))
    (hb : ∀ j, Summable (fun l => |(coordOCut (b l)) j|)) (i j : Fin 8) :
    Summable (fun kl : ℕ × ℕ => (coordOCut (a kl.1)) i * (coordOCut (b kl.2)) j) :=
  cut_summable_mul_of_abs (f := fun k => (coordOCut (a k)) i) (g := fun l => (coordOCut (b l)) j)
    (ha i) (hb j)

-- coordinate 0 of the product family is summable, via exact decomposition.
set_option linter.unusedSimpArgs false in
theorem coord0_summable (a b : ℕ → O Cut)
    (ha : ∀ i, Summable (fun k => |(coordOCut (a k)) i|))
    (hb : ∀ j, Summable (fun l => |(coordOCut (b l)) j|)) :
    Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 0) := by
  have hrw : (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2) 0)
      = (fun kl : ℕ × ℕ =>
          (coordOCut (a kl.1)) 0 * (coordOCut (b kl.2)) 0
          - (coordOCut (a kl.1)) 1 * (coordOCut (b kl.2)) 1
          - ((coordOCut (a kl.1)) 2 * (coordOCut (b kl.2)) 2
              + (coordOCut (a kl.1)) 3 * (coordOCut (b kl.2)) 3)
          - ((coordOCut (a kl.1)) 4 * (coordOCut (b kl.2)) 4
              + (coordOCut (a kl.1)) 5 * (coordOCut (b kl.2)) 5
              + ((coordOCut (a kl.1)) 6 * (coordOCut (b kl.2)) 6
                  + (coordOCut (a kl.1)) 7 * (coordOCut (b kl.2)) 7))) := by
    funext kl
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.add_re, CD.neg_re, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.add_re, Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
    ring
  rw [hrw]
  exact (((leaf a b ha hb 0 0).sub (leaf a b ha hb 1 1)).sub
    ((leaf a b ha hb 2 2).add (leaf a b ha hb 3 3))).sub
    (((leaf a b ha hb 4 4).add (leaf a b ha hb 5 5)).add
      ((leaf a b ha hb 6 6).add (leaf a b ha hb 7 7)))

end
end Phys.Algebra
