import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000
set_option maxHeartbeats 1000000

noncomputable section

def Km : Fin 7 → M7 :=
  ![ ![![0,0,0,0,0,0,0],![0,0,-1,0,0,0,0],![0,1,0,0,0,0,0],![0,0,0,0,-1,0,0],![0,0,0,1,0,0,0],![0,0,0,0,0,0,1],![0,0,0,0,0,-1,0]],
     ![![0,0,1,0,0,0,0],![0,0,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,0,0,0,0,-1,0],![0,0,0,0,0,0,-1],![0,0,0,1,0,0,0],![0,0,0,0,1,0,0]],
     ![![0,-1,0,0,0,0,0],![1,0,0,0,0,0,0],![0,0,0,0,0,0,0],![0,0,0,0,0,0,-1],![0,0,0,0,0,1,0],![0,0,0,0,-1,0,0],![0,0,0,1,0,0,0]],
     ![![0,0,0,0,1,0,0],![0,0,0,0,0,1,0],![0,0,0,0,0,0,1],![0,0,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,-1,0,0,0,0,0],![0,0,-1,0,0,0,0]],
     ![![0,0,0,-1,0,0,0],![0,0,0,0,0,0,1],![0,0,0,0,0,-1,0],![1,0,0,0,0,0,0],![0,0,0,0,0,0,0],![0,0,1,0,0,0,0],![0,-1,0,0,0,0,0]],
     ![![0,0,0,0,0,0,-1],![0,0,0,-1,0,0,0],![0,0,0,0,1,0,0],![0,1,0,0,0,0,0],![0,0,-1,0,0,0,0],![0,0,0,0,0,0,0],![1,0,0,0,0,0,0]],
     ![![0,0,0,0,0,1,0],![0,0,0,0,-1,0,0],![0,0,0,-1,0,0,0],![0,0,1,0,0,0,0],![0,1,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,0,0,0,0,0,0]] ]

-- BRIDGE: crossOp (imBasis i) = qI (Km i)
theorem crossOp_imBasis_eq_qI (i : Fin 7) : crossOp (imBasis i) = qI (Km i) := by
  fin_cases i <;>
  · apply LinearMap.ext; intro x; apply Subtype.ext
    have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
    show (crossOpO _ (x : O ℚ)) = qZ _ (x : O ℚ)
    ext <;>
      simp only [crossOpO, octCross, qZ, Km, imBasis, u1, e2O, e3O, e4O, e5O, e6O, e7O,
        c0, c1, c2, c3, c4, c5, c6, c7, gForm, reQ, hx0, CD.iota, Dbl.J,
        sub_eq_add_neg, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, smul_eq_mul,
        CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
        Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
        CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
        CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
        CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
        LinearMap.coe_mk, AddHom.coe_mk,
        Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val, Matrix.head_cons] <;>
      ring

-- gForm orthonormality on imBasis
theorem gForm_imBasis (i j : Fin 7) :
    gForm (imBasis i) (imBasis j) = (if i = j then 1 else 0) := by
  fin_cases i <;> fin_cases j <;>
    simp only [imBasis, Matrix.cons_val_zero, Matrix.cons_val, Matrix.head_cons, gForm, reQ,
      u1, e2O, e3O, e4O, e5O, e6O, e7O, CD.iota, Dbl.J,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.star_re', Dbl.star_im', CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im] <;> norm_num

-- bundled bilinear forms
def traceBil : Module.End ℚ ImO →ₗ[ℚ] Module.End ℚ ImO →ₗ[ℚ] ℚ :=
  LinearMap.compr₂ (LinearMap.mul ℚ (Module.End ℚ ImO)) (LinearMap.trace ℚ ImO)

def lhsBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ :=
  (traceBil.comp crossEmb).compl₂ crossEmb

def rhsBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ := (-6 : ℚ) • (bornBil : ImO →ₗ[ℚ] ImO →ₗ[ℚ] ℚ)

-- bb i = bvec i and (bvec i : O ℚ) = imBasis i
theorem bb_coe (i : Fin 7) : ((bb i : ImO) : O ℚ) = imBasis i := by
  rw [Module.Basis.mk_apply]; rfl

-- THE REDUCTION
theorem lhsBil_eq_rhsBil : lhsBil = rhsBil := by
  apply Module.Basis.ext bb; intro i
  apply Module.Basis.ext bb; intro j
  show traceForm7 (crossEmb (bb i)) (crossEmb (bb j)) = (-6 : ℚ) • bornBil (bb i) (bb j)
  rw [crossEmb_apply, crossEmb_apply, bb_coe, bb_coe, bornBil_apply, bb_coe, bb_coe,
      crossOp_imBasis_eq_qI, crossOp_imBasis_eq_qI, traceForm7_qI, gForm_imBasis]
  fin_cases i <;> fin_cases j <;> simp <;> decide

-- THE HEADLINE
theorem gather_isometry (a b : ImO) :
    traceForm7 (crossOp (a : O ℚ)) (crossOp (b : O ℚ)) = -6 * gForm (a : O ℚ) (b : O ℚ) := by
  have h : lhsBil a b = rhsBil a b := by rw [lhsBil_eq_rhsBil]
  show traceForm7 (crossEmb a) (crossEmb b) = _
  rw [show traceForm7 (crossEmb a) (crossEmb b) = lhsBil a b from rfl, h]
  show (-6 : ℚ) • bornBil a b = _
  rw [bornBil_apply]; ring

end
end Phys.Algebra
