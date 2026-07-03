import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.DerivationUpperBound
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
-- witnessDerivQ = innerDeriv (CD.e2 : H ℚ) = ad_{e2}. Scan its action on u2..u7 basis; find nonzero coord.
-- try: does it move e4O (=imBasis 3)? compute a specific deep coord and see.
example : (witnessDerivQ (imBasis 3)).re.re.re = 0 := by
  simp only [witnessDerivQ, toEndQ_apply, witnessDeriv, innerDeriv_apply, imBasis]
  norm_num [adHom_apply, e4O, CD.e2, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    CD.zero_re, CD.zero_im, CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im, Dbl.zero_re, Dbl.zero_im]
end Phys.Algebra.HJ
