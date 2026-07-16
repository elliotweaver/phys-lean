import Phys.Algebra.BandEdgeList
import Phys.Algebra.GenerationMassRatiosNumeric
import Mathlib.Tactic

namespace Z6Probe3

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.AbsMass
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- The forced flavor ratio mass0/mass1 as a DERIVED rational bracket (the ℝ-descent's derived input).
-- From massRatio_1_2 (m1 ∈ [483/1e5·m2, 485/1e5·m2]) and massRatio_2_0 (m2 ∈ [594/1e4·m0, 595/1e4·m0]).
-- Lower: m1 ≥ 483/1e5·594/1e4·m0  ⟹  m0/m1 ≤ 1e9/(483·594)
-- Upper: m1 ≤ 485/1e5·595/1e4·m0  ⟹  m0/m1 ≥ 1e9/(485·595)
theorem m01_bracket_lo :
    (1000000000 : Cut) / 288575 ≤ mass0 / mass1 := by
  -- 485·595 = 288575
  have h1 : mass1 ≤ (485 : Cut) / 100000 * mass2 := massRatio_1_2.2
  have h2 : mass2 ≤ (595 : Cut) / 10000 * mass0 := massRatio_2_0.2
  have hm1 : (0:Cut) < mass1 := mass1_pos
  have hm0 : (0:Cut) < mass0 := mass0_pos
  rw [le_div_iff₀ hm1]
  nlinarith [h1, h2, mass2_pos, mass0_pos]

theorem m01_bracket_hi :
    mass0 / mass1 ≤ (1000000000 : Cut) / 286902 := by
  -- 483·594 = 286902
  have h1 : (483 : Cut) / 100000 * mass2 ≤ mass1 := massRatio_1_2.1
  have h2 : (594 : Cut) / 10000 * mass0 ≤ mass2 := massRatio_2_0.1
  have hm1 : (0:Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [h1, h2, mass0_pos, mass2_pos]

-- wrong-sense flip tooth: the gather's negative census flips the lepton-tail band DOWN
theorem leptonBand_sense_negative :
    bandScreen (-chargeTraceDepth) (mass0 / mass1) < 0 := by
  rw [bandScreen_neg_depth]
  have : 0 < bandScreen chargeTraceDepth (mass0 / mass1) := by
    apply bandScreen_pos chargeTraceDepth_pos
    rw [one_lt_div mass1_pos]; exact lt_trans mass_distinct_1_2 mass_distinct_2_0
  linarith

end
end Z6Probe3
