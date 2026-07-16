import Phys.Algebra.Alternative
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationSkew
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- octonion "real trace" and "norm" as RATIONAL scalars
noncomputable def trq (x : O ℚ) : ℚ := reQ x + reQ x          -- x + star x = 2 Re x
noncomputable def nq  (x : O ℚ) : ℚ := reQ (x * star x)         -- x * star x = N(x)·1

-- CRUX: the quadratic minimal relation on O ℚ:  x*x = trq x • x − nq x • 1
theorem probe_quadratic (x : O ℚ) : x * x = trq x • x - nq x • (1 : O ℚ) := by
  unfold trq nq reQ
  ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im, mul_re, mul_im, star_re, star_im,
      add_re, add_im, sub_eq_add_neg, neg_re, neg_im, one_re, one_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_mul, mul_zero, mul_one, one_mul] <;>
    ring

end Phys.Algebra

#print axioms Phys.Algebra.probe_quadratic
