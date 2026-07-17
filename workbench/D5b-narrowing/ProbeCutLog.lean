import Phys.Algebra.NarrowedBracket3

namespace Phys.Algebra.ProbeCutLog
open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- assume sharpened mass brackets (proved upstream); test the m01 + cutLog chain heaviness.
axiom mass0_lo_s : (237943816 / 100000000 : Cut) * (237943816 / 100000000) ≤ mass0
axiom mass0_hi_s : mass0 ≤ (237943819 / 100000000 : Cut) * (237943819 / 100000000)
axiom mass1_lo_s : (4034989 / 100000000 : Cut) * (4034989 / 100000000) ≤ mass1
axiom mass1_hi_s : mass1 ≤ (4034992 / 100000000 : Cut) * (4034992 / 100000000)

-- direct m01 bracket -> M01 window [3477.44, 3477.48]
theorem m01_lo_s : (347744 / 100 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_s, mass0_lo_s]
theorem m01_hi_s : mass0 / mass1 ≤ (86937 / 25 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_s, mass0_hi_s]

-- cutLog via cutLog_mono + certified exp index 21/22
theorem cutLog_lo_s : (815405 / 100000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((347744 : Cut) / 100) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono (by norm_num) m01_lo_s
  have hge : (815405 / 100000 : Cut) ≤ cutLog ((347744 : Cut) / 100) := by
    apply cutLog_ge_certified ((347744 : Cut) / 100) (815405 / 100000) 21 (by norm_num) (by norm_num)
    show partialExp (815405 / 100000) 21 + expRemBound (815405 / 100000) 21 ≤ (347744 : Cut) / 100
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

theorem cutLog_hi_s : cutLog (mass0 / mass1) ≤ (815411 / 100000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 347744 / 100) m01_lo_s
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((86937 : Cut) / 25) :=
    cutLog_mono hpos m01_hi_s
  have hbnd : cutLog ((86937 : Cut) / 25) ≤ (815411 / 100000 : Cut) := by
    apply cutLog_le_certified ((86937 : Cut) / 25) (815411 / 100000) 22 (by norm_num) (by norm_num)
    show (86937 : Cut) / 25 ≤ partialExp (815411 / 100000) 22
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

end
end Phys.Algebra.ProbeCutLog
