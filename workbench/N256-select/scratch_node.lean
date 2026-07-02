import Phys.Algebra.TowerGatherForcedHyperchargeDirection

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000

noncomputable section

def Jmat : M7 :=
  ![![0, 0, 2, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![-2, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 2],
     ![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, -2, 0, 0]]

theorem imRep_DJ_eq_qI : imRep DJ = qI Jmat := by
  apply LinearMap.ext; intro x; apply Subtype.ext
  show (innerDeriv (hJ : H ℚ)) (x : O ℚ) = qZ Jmat (x : O ℚ)
  ext <;>
    simp only [innerDeriv, liftEnd_apply, adHom_apply, hJ, CD.e2, qZ, Jmat,
      c1, c2, c3, c4, c5, c6, c7, sub_eq_add_neg,
      CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk, AddMonoidHom.coe_mk, ZeroHom.coe_mk,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
    ring

def isospinInvariants : Submodule ℚ ImO :=
  LinearMap.ker (imRep DI) ⊓ LinearMap.ker (imRep DJ) ⊓ LinearMap.ker (imRep DK)

theorem imRep_DI_kap1' : imRep DI kap1' = 0 := by
  apply Subtype.ext
  show (DI : Module.End ℚ (O ℚ)) (kap1' : O ℚ) = (0 : O ℚ)
  exact D_kappaO_one_zero hI DI.2

theorem imRep_DJ_kap1' : imRep DJ kap1' = 0 := by
  apply Subtype.ext
  show (DJ : Module.End ℚ (O ℚ)) (kap1' : O ℚ) = (0 : O ℚ)
  exact D_kappaO_one_zero hJ DJ.2

theorem imRep_DK_kap1' : imRep DK kap1' = 0 := by
  apply Subtype.ext
  show (DK : Module.End ℚ (O ℚ)) (kap1' : O ℚ) = (0 : O ℚ)
  exact D_kappaO_one_zero hK DK.2

theorem kap1'_mem_isospinInvariants : kap1' ∈ isospinInvariants :=
  ⟨⟨LinearMap.mem_ker.mpr imRep_DI_kap1', LinearMap.mem_ker.mpr imRep_DJ_kap1'⟩,
    LinearMap.mem_ker.mpr imRep_DK_kap1'⟩

#check @kap1'_mem_isospinInvariants

end
end Phys.Algebra
