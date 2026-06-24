import Phys.Algebra.DerivationSkew
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- ===== MEASURE route A: the direct lemma via ext + simp =====
-- (c • (1:O ℚ)) * x = c • x
example (c : ℚ) (x : O ℚ) : (c • (1 : O ℚ)) * x = c • x := by
  ext <;> simp [CD.mul_re, CD.mul_im, cd_qsmul_re, cd_qsmul_im]

end Phys.Algebra
