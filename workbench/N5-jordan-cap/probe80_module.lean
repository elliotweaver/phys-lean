/- PROBE 80: build a Module ℚ (O ℚ) action via ocR-left-multiplication, prove ocR_smul.
   O ℚ = CD (CD (Dbl ℚ)). Define r • x := ocR r * x and try to make it a Module ℚ instance
   using the banked ocR nuclearity (ocR_assocL) + ocR_comm + ocR_mul. MEASURE ONLY. KILL 90s. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.Reduction
import Mathlib.Tactic

namespace Probe80
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "ocrext" : tactic =>
  `(tactic| ext <;>
    simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg, add_mul, mul_add,
      zero_mul, mul_zero, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re,
      Dbl.zero_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im] <;> ring)

theorem ocR_mul (r s : ℚ) : ocR r * ocR s = ocR (r * s) := by ocrext
theorem ocR_add (r s : ℚ) : ocR r + ocR s = ocR (r + s) := by
  simp only [ocR]; ext <;> simp [Dbl.add_re, Dbl.add_im]
theorem ocR_zero : ocR (0 : ℚ) = 0 := by
  simp only [ocR]; ext <;> simp
theorem ocR_one_mul (x : O ℚ) : ocR 1 * x = x := by
  ocrext

-- Define the scalar action r • x := ocR r * x as a Module ℚ (O ℚ).
noncomputable def qsmul : SMul ℚ (O ℚ) := ⟨fun r x => ocR r * x⟩

attribute [local instance] qsmul

example (r : ℚ) (x : O ℚ) : r • x = ocR r * x := rfl

-- Test the module axioms one by one (the hard ones):
example (r : ℚ) (x y : O ℚ) : r • (x + y) = r • x + r • y := by
  show ocR r * (x + y) = ocR r * x + ocR r * y
  rw [mul_add]
example (r s : ℚ) (x : O ℚ) : (r + s) • x = r • x + s • x := by
  show ocR (r + s) * x = ocR r * x + ocR s * x
  rw [← ocR_add, add_mul]
example (r s : ℚ) (x : O ℚ) : (r * s) • x = r • (s • x) := by
  show ocR (r * s) * x = ocR r * (ocR s * x)
  rw [← ocR_mul, ocR_assocL]
example (x : O ℚ) : (1 : ℚ) • x = x := ocR_one_mul x
example (x : O ℚ) : (0 : ℚ) • x = 0 := by
  show ocR 0 * x = 0
  rw [ocR_zero, zero_mul]
example (r : ℚ) : r • (0 : O ℚ) = 0 := by
  show ocR r * 0 = 0
  rw [mul_zero]

end Probe80
