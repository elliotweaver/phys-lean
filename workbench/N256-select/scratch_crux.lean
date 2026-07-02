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
      Dbl.zero_re, Dbl.zero_im, Dbl.one_re, Dbl.one_im,
      LinearMap.coe_mk, AddHom.coe_mk, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.cons_val, Matrix.head_cons] <;>
    ring

def isospinInvariants : Submodule ℚ ImO :=
  LinearMap.ker (imRep DI) ⊓ LinearMap.ker (imRep DJ) ⊓ LinearMap.ker (imRep DK)

theorem imRep_DI_kap1' : imRep DI kap1' = 0 := by
  apply Subtype.ext; exact D_kappaO_one_zero hI DI.2
theorem imRep_DJ_kap1' : imRep DJ kap1' = 0 := by
  apply Subtype.ext; exact D_kappaO_one_zero hJ DJ.2
theorem imRep_DK_kap1' : imRep DK kap1' = 0 := by
  apply Subtype.ext; exact D_kappaO_one_zero hK DK.2

theorem kap1'_mem_isospinInvariants : kap1' ∈ isospinInvariants :=
  ⟨⟨LinearMap.mem_ker.mpr imRep_DI_kap1', LinearMap.mem_ker.mpr imRep_DJ_kap1'⟩,
    LinearMap.mem_ker.mpr imRep_DK_kap1'⟩

/-- ⊆ THE CRUX: any isospin-fixed vector lies in span{kap1'}. Uses only the PAIR {DI,DJ}:
    Imat forces c2=c3=c6=c7=0, Jmat forces c1=c5=0, reQ_ImO_zero forces c0=0; leaves c4 = the
    κO-1 axis. linarith on the banked integer rows — no coordinate bash of the O ℚ product. -/
theorem isospinInvariants_le_span_kap :
    isospinInvariants ≤ Submodule.span ℚ {kap1'} := by
  rintro x ⟨⟨hxI, hxJ⟩, _⟩
  rw [SetLike.mem_coe, LinearMap.mem_ker, imRep_DI_eq_qI] at hxI
  rw [SetLike.mem_coe, LinearMap.mem_ker, imRep_DJ_eq_qI] at hxJ
  have hI0 : qZ Imat (x : O ℚ) = 0 := by
    have := congrArg (fun z : ImO => (z : O ℚ)) hxI; simpa [qI_coe] using this
  have hJ0 : qZ Jmat (x : O ℚ) = 0 := by
    have := congrArg (fun z : ImO => (z : O ℚ)) hxJ; simpa [qI_coe] using this
  have hc0 : ((x : O ℚ)).re.re.re = 0 := by
    have := reQ_ImO_zero x.2; simpa [reQ] using this
  -- extract the six vanishing coordinates from Imat and Jmat
  have e2 : c2 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c2]
  have e3 : c3 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c3]
  have e6 : c6 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c6]
  have e7 : c7 (qZ Imat (x:O ℚ)) = 0 := by rw [hI0]; simp [c7]
  have f1 : c3 (qZ Jmat (x:O ℚ)) = 0 := by rw [hJ0]; simp [c3]
  have f5 : c7 (qZ Jmat (x:O ℚ)) = 0 := by rw [hJ0]; simp [c7]
  simp only [qZ, Imat, Jmat, c1, c2, c3, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons,
    Int.cast_zero, Int.cast_one, Int.cast_neg, Int.cast_ofNat, zero_mul, one_mul, neg_mul,
    zero_add, add_zero] at e2 e3 e6 e7 f1 f5
  rw [Submodule.mem_span_singleton]
  refine ⟨c4 (x : O ℚ), ?_⟩
  apply Subtype.ext
  show (c4 (x : O ℚ) • (kappaO 1 : O ℚ)) = (x : O ℚ)
  ext <;>
    simp only [kappaO_apply, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
      mul_zero, mul_one, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, c4] <;>
    linarith [e2, e3, e6, e7, f1, f5, hc0]

end
end Phys.Algebra
