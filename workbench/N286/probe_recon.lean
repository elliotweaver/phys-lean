import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.HermitianJordan.PieceBfinal
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
set_option synthInstance.maxSize 400000

-- (a) self-adjoint octonion is real: star z = z → z = ocR (reQ z).
-- Approach: use CD.ext / Dbl.ext repeatedly, extract coordinate equations via congrArg.
theorem self_adjoint_ocR (z : O ℚ) (hz : star z = z) : z = ocR (reQ z) := by
  -- z : CD (CD (Dbl ℚ)); star z = ⟨star z.re, -z.im⟩.
  -- From hz: z.re self-adjoint (star z.re = z.re) and z.im = -z.im ⟹ z.im = 0.
  apply CD.ext
  · -- re layer : CD (Dbl ℚ) = H ℚ, need z.re = (ocR (reQ z)).re = ⟨⟨reQ z,0⟩,⟨0,0⟩⟩
    have hre : star z.re = z.re := by
      have := congrArg CD.re hz; simpa using this
    apply CD.ext
    · apply Dbl.ext
      · -- z.re.re.re = reQ z  (trivially, reQ z := z.re.re.re)
        rfl
      · -- z.re.re.im = 0 : from star z.re = z.re at re.im layer
        have hrere : star z.re.re = z.re.re := by
          have := congrArg CD.re hre; simpa using this
        have := congrArg Dbl.im hrere
        simp only [Dbl.star_im'] at this
        have h2 : z.re.re.im + z.re.re.im = 0 := by linarith [this]
        linarith
    · -- z.re.im = 0 : from star z.re = z.re at im layer
      have := congrArg CD.im hre
      simp only [CD.star_im] at this
      -- this : -z.re.im = z.re.im
      have h2 : z.re.im + z.re.im = 0 := by
        have : z.re.im = -z.re.im := this.symm
        rw [this]; abel
      -- z.re.im : Dbl ℚ ; 2 • = 0 ⟹ = 0
      have : (2:ℚ) • z.re.im = 0 := by rw [two_smul]; exact h2
      rcases smul_eq_zero.mp this with h | h
      · norm_num at h
      · exact h
  · -- im layer : z.im = 0 = (ocR (reQ z)).im
    have := congrArg CD.im hz
    simp only [CD.star_im] at this
    have h2 : z.im + z.im = 0 := by
      have hh : z.im = -z.im := this.symm; rw [hh]; abel
    have : (2:ℚ) • z.im = 0 := by rw [two_smul]; exact h2
    rcases smul_eq_zero.mp this with h | h
    · norm_num at h
    · exact h

end Phys.Algebra.HJ
