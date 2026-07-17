import Phys.Algebra.Alternative
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

-- CORE 1: the banked generation Fano triple is an associative quaternion subalgebra:
--   the ALGEBRA associator VANISHES on (u2, u1, octCross u1 u2).
theorem gen_triple_assoc_zero :
    Phys.Algebra.assoc u2 u1 (octCross u1 u2) = 0 := by
  have hc : octCross u1 u2 = u1 * u2 := by
    unfold octCross; rw [gForm_u1_u2, zero_smul, add_zero]
  rw [hc]
  unfold Phys.Algebra.assoc
  ext <;>
    simp only [sub_eq_add_neg, u1, u2, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
      CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.add_re, Dbl.add_im,
      Dbl.neg_re, Dbl.neg_im, Dbl.zero_re, Dbl.zero_im,
      CD.one_re, CD.zero_re, CD.zero_im, star_zero, star_one,
      mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg] <;> ring

-- CONTRAST: genuine algebra non-associativity DOES exist on O Q, just OFF the triple
-- (banked assoc_nonvanishing). So the vanishing above is a genuine property of THIS triple,
-- not a triviality of the whole algebra.
example : Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 :=
  Phys.Algebra.assoc_nonvanishing

-- CORE 2: the calibration 3-form is NONZERO on the SAME triple (banked). So the two
-- invariants split: assoc = 0 (algebra, the mass-phase-relevant one) but assoc3 ≠ 0
-- (the volume/CP form). This is exactly N310's separation, read at the phase level.
example : assoc3 u2 u1 (octCross u1 u2) = -1 := assoc3_witness

-- CORE 3: the turning eigenvalue that fixes the phase is the banked -1, LINE-INDEPENDENT
-- (see_Poth is on the Q-permutation seeMat). Hence delta = 2/9 for the generation cycle
-- WHATEVER octonion line the amplitudes sit on, PROVIDED the line associates (CORE 1).
example : seeMat * Poth = (-1 : ℚ) • Poth := see_Poth
example : (Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) = 2 / 9 := cyclephase_delta_B

end Phys.Algebra.HJ
