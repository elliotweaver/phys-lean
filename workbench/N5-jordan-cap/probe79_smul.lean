/- PROBE 79: is the smul-route open? Does O ℚ have Module ℚ and ocR r * x = r • x? -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe79Smul
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

-- (1) Does r • x typecheck for r : ℚ, x : O ℚ ?
example (r : ℚ) (x : O ℚ) : O ℚ := r • x

-- (2) Is there a Module ℚ (O ℚ) instance?
example : Module ℚ (O ℚ) := inferInstance

-- (3) Does ocR r * x = r • x ?
local macro "ocrext" : tactic =>
  `(tactic| ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_neg, star_star, neg_mul, mul_neg, neg_neg, zero_mul, mul_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;> ring)

example (r : ℚ) (x : O ℚ) : ocR r * x = r • x := by
  sorry

end Probe79Smul
