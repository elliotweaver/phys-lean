import Phys.Algebra.DerivationRep7IrreducibleBimodule
import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationH

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

theorem master_id (w u : H ℚ) (hw : star w = -w) (hu : star u = -u) :
    ((2 * quatNorm w) : ℚ) • u
      = ((-2 * (w * u).re.re) : ℚ) • w
        + ( (w * u - ((w*u).re.re : ℚ) • (1 : H ℚ)) * w
            - w * (w * u - ((w*u).re.re : ℚ) • (1 : H ℚ)) ) := by
  have hwre0 : w.re.re = 0 := by
    have h := congrArg (fun z : H ℚ => z.re.re) hw
    simp only [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h
    linarith
  have hure0 : u.re.re = 0 := by
    have h := congrArg (fun z : H ℚ => z.re.re) hu
    simp only [CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h
    linarith
  ext <;>
    simp [quatNorm, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im, hwre0, hure0] <;>
    ring

#print axioms master_id

end

end Phys.Algebra
