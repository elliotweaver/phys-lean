import Phys.Algebra.DerivationRep7IrreducibleBimodule
import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationH

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- MEASURE 1: the triple-product identity for the i-coordinate.
-- For imaginary w, ad_w(ad_hI w) = 4 • (quatNorm w • hI - (w.re.im) • w).
-- (ad_w(u) = w*u - u*w ; adHom applied twice.)
theorem tp_hI (w : H ℚ) (hw : star w = -w) :
    adHom w (adHom hI w) = (4 : ℚ) • (quatNorm w • hI - (w.re.im) • w) := by
  -- imaginary ⟹ w.re.re = 0
  have hre0 : w.re.re = 0 := by
    have := congrArg (fun z : H ℚ => z.re.re) hw
    simp [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at this
    linarith
  ext <;>
    simp [adHom_apply, quatNorm, hI, CD.iota, Dbl.J, CD.mul_re, CD.mul_im,
      Dbl.mul_re, Dbl.mul_im, CD.smul_re, CD.smul_im, Dbl.smul_re, Dbl.smul_im,
      CD.sub_re, CD.sub_im, Dbl.sub_re, Dbl.sub_im, cd_qsmul_re, cd_qsmul_im, hre0] <;>
    ring

-- MEASURE 2: the span identity for ImH.
theorem span_ImH (x : H ℚ) (hx : star x = -x) :
    x = (x.re.im) • hI + (x.im.re) • hJ + (x.im.im) • hK := by
  have hre0 : x.re.re = 0 := by
    have := congrArg (fun z : H ℚ => z.re.re) hx
    simp [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at this
    linarith
  ext <;>
    simp [hI, hJ, hK, CD.iota, CD.e2, Dbl.J, hK_def, CD.add_re, CD.add_im,
      Dbl.add_re, Dbl.add_im, CD.smul_re, CD.smul_im, Dbl.smul_re, Dbl.smul_im,
      cd_qsmul_re, cd_qsmul_im, hre0] <;>
    ring

#print axioms tp_hI
#print axioms span_ImH

end

end Phys.Algebra
