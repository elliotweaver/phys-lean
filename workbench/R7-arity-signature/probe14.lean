import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- The quadratic minimal relation: on O ℚ, a*a lies in span{1,a}.
-- Concretely: a*a = (2 Re a) • a  − N(a) • 1,  where Re a = reQ a, N(a) = reQ(a * star a).
-- Let's find the RIGHT scalar identities by direct bash.

-- octonion conjugate trace: a + star a = (2 * reQ a) • 1  ?
theorem trace_id (a : O ℚ) : a + star a = (2 * reQ a) • (1 : O ℚ) := by
  unfold reQ
  ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im, add_re, add_im, star_re, star_im,
      one_re, one_im, star_neg, neg_re, neg_im] <;> ring

end Phys.Algebra

#print axioms Phys.Algebra.trace_id
