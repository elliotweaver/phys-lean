import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

set_option linter.unusedSimpArgs false in
example (u v : O Cut) : True := by
  have h0 : coordOCut (u * v) 0 =
      (coordOCut u) 0*(coordOCut v) 0 - (coordOCut u) 1*(coordOCut v) 1 - (coordOCut u) 2*(coordOCut v) 2 - (coordOCut u) 3*(coordOCut v) 3 - (coordOCut u) 4*(coordOCut v) 4 - (coordOCut u) 5*(coordOCut v) 5 - (coordOCut u) 6*(coordOCut v) 6 - (coordOCut u) 7*(coordOCut v) 7 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  have h1 : coordOCut (u * v) 1 =
      (coordOCut u) 0*(coordOCut v) 1 + (coordOCut u) 1*(coordOCut v) 0 + (coordOCut u) 2*(coordOCut v) 3 - (coordOCut u) 3*(coordOCut v) 2 + (coordOCut u) 4*(coordOCut v) 5 - (coordOCut u) 5*(coordOCut v) 4 - (coordOCut u) 6*(coordOCut v) 7 + (coordOCut u) 7*(coordOCut v) 6 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  have h2 : coordOCut (u * v) 2 =
      (coordOCut u) 0*(coordOCut v) 2 - (coordOCut u) 1*(coordOCut v) 3 + (coordOCut u) 2*(coordOCut v) 0 + (coordOCut u) 3*(coordOCut v) 1 + (coordOCut u) 4*(coordOCut v) 6 + (coordOCut u) 5*(coordOCut v) 7 - (coordOCut u) 6*(coordOCut v) 4 - (coordOCut u) 7*(coordOCut v) 5 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  have h3 : coordOCut (u * v) 3 =
      (coordOCut u) 0*(coordOCut v) 3 + (coordOCut u) 1*(coordOCut v) 2 - (coordOCut u) 2*(coordOCut v) 1 + (coordOCut u) 3*(coordOCut v) 0 + (coordOCut u) 4*(coordOCut v) 7 - (coordOCut u) 5*(coordOCut v) 6 + (coordOCut u) 6*(coordOCut v) 5 - (coordOCut u) 7*(coordOCut v) 4 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  have h4 : coordOCut (u * v) 4 =
      (coordOCut u) 0*(coordOCut v) 4 - (coordOCut u) 1*(coordOCut v) 5 - (coordOCut u) 2*(coordOCut v) 6 - (coordOCut u) 3*(coordOCut v) 7 + (coordOCut u) 4*(coordOCut v) 0 + (coordOCut u) 5*(coordOCut v) 1 + (coordOCut u) 6*(coordOCut v) 2 + (coordOCut u) 7*(coordOCut v) 3 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  have h5 : coordOCut (u * v) 5 =
      (coordOCut u) 0*(coordOCut v) 5 + (coordOCut u) 1*(coordOCut v) 4 - (coordOCut u) 2*(coordOCut v) 7 + (coordOCut u) 3*(coordOCut v) 6 - (coordOCut u) 4*(coordOCut v) 1 + (coordOCut u) 5*(coordOCut v) 0 - (coordOCut u) 6*(coordOCut v) 3 + (coordOCut u) 7*(coordOCut v) 2 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  have h6 : coordOCut (u * v) 6 =
      (coordOCut u) 0*(coordOCut v) 6 + (coordOCut u) 1*(coordOCut v) 7 + (coordOCut u) 2*(coordOCut v) 4 - (coordOCut u) 3*(coordOCut v) 5 - (coordOCut u) 4*(coordOCut v) 2 + (coordOCut u) 5*(coordOCut v) 3 + (coordOCut u) 6*(coordOCut v) 0 - (coordOCut u) 7*(coordOCut v) 1 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  have h7 : coordOCut (u * v) 7 =
      (coordOCut u) 0*(coordOCut v) 7 - (coordOCut u) 1*(coordOCut v) 6 + (coordOCut u) 2*(coordOCut v) 5 + (coordOCut u) 3*(coordOCut v) 4 - (coordOCut u) 4*(coordOCut v) 3 - (coordOCut u) 5*(coordOCut v) 2 + (coordOCut u) 6*(coordOCut v) 1 + (coordOCut u) 7*(coordOCut v) 0 := by
    simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
      Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7,
      CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']; ring
  trivial

end
end Phys.Algebra
