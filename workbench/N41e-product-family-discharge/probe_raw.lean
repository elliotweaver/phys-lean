import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

local notation "S" => fun (z : O Cut) =>
  (z.re.re.re, z.re.re.im, z.re.im.re, z.re.im.im, z.im.re.re, z.im.re.im, z.im.im.re, z.im.im.im)

-- raw expansion of each product coordinate (no ring_nf), with star reduced.
set_option linter.unusedSimpArgs false in
example (u v : O Cut) :
    ((u*v).re.re.re, (u*v).re.re.im, (u*v).re.im.re, (u*v).re.im.im,
     (u*v).im.re.re, (u*v).im.re.im, (u*v).im.im.re, (u*v).im.im.im) = (0,0,0,0,0,0,0,0) := by
  simp only [CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  trace_state
  sorry

end
end Phys.Algebra
