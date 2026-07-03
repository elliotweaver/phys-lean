import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic
namespace Test
open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable section
example : ((framePerm (Equiv.swap 1 2) (jb (slotA (1:O ℚ)) (slotB u1))) 1 2).re.re.im = (-1 : ℚ) := by
  rw [framePerm_swap12_coupling, mul_one, slotC_entry]
  simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
-- confirm the value distinguishes: min 304 (-1) = -1, and bogus min 304 (-1) = 304 must fail (304 = -1 false)
example : min (304 : ℚ) ((framePerm (Equiv.swap 1 2) (jb (slotA (1:O ℚ)) (slotB u1))) 1 2).re.re.im = -1 := by
  have hv : ((framePerm (Equiv.swap 1 2) (jb (slotA (1:O ℚ)) (slotB u1))) 1 2).re.re.im = (-1 : ℚ) := by
    rw [framePerm_swap12_coupling, mul_one, slotC_entry]
    simp only [u1, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
  rw [hv]; norm_num
end
end Test
