import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- (1) MEASURE: imRep DK = qI Kmat via the DI/DJ methodology. Kmat = [Imat,Jmat]/2.
def Kmat : M7 :=
  ![![0, -2, 0, 0, 0, 0, 0],
     ![2, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, -2, 0],
     ![0, 0, 0, 0, 2, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0]]

-- hK = hI * hJ. Test whether the ext+simp+ring twin methodology closes it.
theorem imRep_DK_eq_qI : imRep DK = qI Kmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hK : H ℚ)) (x : O ℚ) = qZ Kmat (x : O ℚ)
  ext <;>
    simp only [innerDeriv, liftEnd_apply, adHom_apply, hK, hI, hJ, CD.iota, CD.e2, Dbl.J, qZ, Kmat,
      c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk, AddMonoidHom.coe_mk, ZeroHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

-- (2) MEASURE: the Casimir on the matrices is -8·id on the 6 charged coords, 0 on e4.
--     Cas := Imat² + Jmat² + Kmat² as integer matrices (decide-light).
example : mul7 Imat Imat = mul7 Imat Imat := rfl  -- placeholder

-- Casimir matrix value check via decide on M7 products:
theorem casimir_val : ∀ i j : Fin 7,
    (mul7 Imat Imat i j + mul7 Jmat Jmat i j + mul7 Kmat Kmat i j)
      = (![![(-8:ℤ),0,0,0,0,0,0],![0,-8,0,0,0,0,0],![0,0,-8,0,0,0,0],
          ![0,0,0,0,0,0,0],![0,0,0,0,-8,0,0],![0,0,0,0,0,-8,0],![0,0,0,0,0,0,-8]] i j) := by
  decide

end
end Phys.Algebra
