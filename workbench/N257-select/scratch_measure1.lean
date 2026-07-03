import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable section

def Km0 : M7 := ![![0,0,0,0,0,0,0],![0,0,-1,0,0,0,0],![0,1,0,0,0,0,0],![0,0,0,0,-1,0,0],![0,0,0,1,0,0,0],![0,0,0,0,0,0,1],![0,0,0,0,0,-1,0]]
def Km3 : M7 := ![![0,0,0,0,1,0,0],![0,0,0,0,0,1,0],![0,0,0,0,0,0,1],![0,0,0,0,0,0,0],![-1,0,0,0,0,0,0],![0,-1,0,0,0,0,0],![0,0,-1,0,0,0,0]]

-- single case bridge, measured standalone. imBasis 3 = e4O.
theorem br3 : crossOp (imBasis 3) = qI Km3 := by
  have himb : imBasis 3 = e4O := rfl
  rw [himb]
  apply LinearMap.ext; intro x; apply Subtype.ext
  have hx0 : ((x : O ℚ)).re.re.re = 0 := reQ_ImO_zero x.2
  show (crossOpO e4O (x : O ℚ)) = qZ Km3 (x : O ℚ)
  ext <;>
    simp only [crossOpO, octCross, qZ, Km3, e4O,
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

end
end Phys.Algebra
