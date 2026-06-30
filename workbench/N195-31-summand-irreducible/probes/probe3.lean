import Phys.Algebra.DerivationRep7IrreducibleBimodule
import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationH

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

theorem double_bracket_id (w p : H ℚ) (hw : star w = -w) (hp : star p = -p) :
    ((4 * quatNorm w) : ℚ) • p
      = adHom w (adHom p w) - ((4 * (w * p).re.re) : ℚ) • w := by
  have hwre0 : w.re.re = 0 := by
    have h := congrArg (fun z : H ℚ => z.re.re) hw
    simp only [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h; linarith
  have hpre0 : p.re.re = 0 := by
    have h := congrArg (fun z : H ℚ => z.re.re) hp
    simp only [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h; linarith
  simp only [adHom_apply, mul_sub, sub_mul, sub_eq_add_neg]
  ext <;>
    simp [quatNorm, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im,
      CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im',
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
      CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, hwre0, hpre0] <;>
    ring

#print axioms double_bracket_id

end

end Phys.Algebra
