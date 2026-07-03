import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Phys.Algebra.DerivationColourIsospinMeet
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

theorem u1_memI : u1 ∈ ImO := u1_mem_ImO
theorem e6O_memI : e6O ∈ ImO := by have := imBasis_mem_ImO 5; simpa [imBasis] using this
theorem e7O_memI : e7O ∈ ImO := by have := imBasis_mem_ImO 6; simpa [imBasis] using this
def u1I : ImO := ⟨u1, u1_memI⟩
def e6I : ImO := ⟨e6O, e6O_memI⟩
def e7I : ImO := ⟨e7O, e7O_memI⟩

def Kmat : M7 :=
  ![![0, -2, 0, 0, 0, 0, 0],![2, 0, 0, 0, 0, 0, 0],![0, 0, 0, 0, 0, 0, 0],
     ![0, 0, 0, 0, 0, 0, 0],![0, 0, 0, 0, 0, -2, 0],![0, 0, 0, 0, 2, 0, 0],![0, 0, 0, 0, 0, 0, 0]]

-- Full DI simp set (mirror of imRep_DI_eq_qI) for the DK bridge.
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

-- Action lemma: use c0..c7 with the qZ simp (matching N276's chargeOp/imRep_DI lemmas which use c1..c7).
-- The output is in ImO so its c0=0 automatically; we need ext over all 8 octonion coords though.
-- N276's chargeOp_e4I uses: ext <;> simp [qZ, Cmat, ...]. Let me mirror exactly (no c0 needed since qZ output re.re.re=0).
theorem imRep_DJ_u1I : imRep DJ u1I = (-2 : ℚ) • e3I := by
  apply Subtype.ext; rw [imRep_DJ_eq_qI, qI_coe]
  show qZ Jmat (u1 : O ℚ) = ((-2 : ℚ) • e3I : ImO)
  show qZ Jmat (u1 : O ℚ) = (-2 : ℚ) • e3O
  ext <;> simp [qZ, Jmat, u1, e3O, c1, c2, c3, c4, c5, c6, c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

end
end Phys.Algebra
