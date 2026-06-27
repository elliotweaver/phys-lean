import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- Is biMulFun e₂ ιe₂ a full involution? test square = id pointwise via decide-ish on the octonion.
-- (biMulFun e₂ ιe₂)²(0,0,v) space = e₂·((e₂·(v·ιe₂))·ιe₂). Claim = v for all v?
theorem probe_invol_full (v : O Cut) :
    (CD.e2 : O Cut) * (((CD.e2 : O Cut) * (v * (je2:O Cut))) * (je2:O Cut)) = v := by
  ext <;> simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, Dbl.mul_re, Dbl.mul_im] <;> ring

end

end Phys.Algebra
