import Phys.Algebra.OctonionJordanGenerationEdgeBornSurvival
import Phys.Algebra.GenerationMassRatiosNumeric
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios

noncomputable section

-- Q1: does RatCast/cast of banked edgeSurvival to Cut land on 2/3 cleanly?
example : ((edgeSurvival : ℚ) : Cut) = 2 / 3 := by
  rw [edgeSurvival_val]; push_cast; ring

-- Q2: undressed amplitude ratio b2/b0 bracket over Cut
example : (24383 : Cut) / 100000 ≤ b2 / b0 := by
  rw [le_div_iff₀ b0_pos]; nlinarith [b0_hi, b2_lo, b0_pos]
example : b2 / b0 ≤ (24385 : Cut) / 100000 := by
  rw [div_le_iff₀ b0_pos]; nlinarith [b2_hi, b0_lo, b0_pos]

-- Q3: dressed = (2/3)*(b2/b0) bracket
example : (16255 : Cut) / 100000 ≤ (2/3 : Cut) * (b2 / b0) := by
  have hlo : (24383 : Cut) / 100000 ≤ b2 / b0 := by
    rw [le_div_iff₀ b0_pos]; nlinarith [b0_hi, b2_lo, b0_pos]
  nlinarith [hlo]
example : (2/3 : Cut) * (b2 / b0) ≤ (16257 : Cut) / 100000 := by
  have hhi : b2 / b0 ≤ (24385 : Cut) / 100000 := by
    rw [div_le_iff₀ b0_pos]; nlinarith [b2_hi, b0_lo, b0_pos]
  nlinarith [hhi]

-- Q4: the square bracket
example : (0 : Cut) < b2 / b0 := div_pos b2_pos b0_pos
example : (26422 : Cut) / 1000000 ≤ ((2/3 : Cut) * (b2 / b0)) ^ 2 := by
  have hlo : (16255 : Cut) / 100000 ≤ (2/3 : Cut) * (b2 / b0) := by
    have h : (24383 : Cut) / 100000 ≤ b2 / b0 := by
      rw [le_div_iff₀ b0_pos]; nlinarith [b0_hi, b2_lo, b0_pos]
    nlinarith [h]
  nlinarith [hlo]

end
end Phys.Algebra.HJ
