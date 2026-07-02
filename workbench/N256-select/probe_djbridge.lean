import Phys.Algebra.TowerGatherChargeIsospinRatio
import Phys.Algebra.TowerGatherForcedSecondNeutral

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

/-- twin of banked Imat: the integer 7×7 matrix of imRep DJ (innerDeriv hJ) on ImO. -/
def Jmat : M7 :=
  ![![0, 0, 2, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![-2, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 2],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -2, 0, 0]]

/-- MEASURE: the DJ bridge (twin of banked imRep_DI_eq_qI). -/
theorem imRep_DJ_eq_qI : imRep DJ = qI Jmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hJ : H ℚ)) (x : O ℚ) = qZ Jmat (x : O ℚ)
  ext <;>
    simp only [innerDeriv, liftEnd_apply, adHom_apply, hJ, CD.e2, qZ, Jmat,
      c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk, AddMonoidHom.coe_mk, ZeroHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

#print axioms imRep_DJ_eq_qI

end
end Phys.Algebra
