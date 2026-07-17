import Phys.Algebra.NarrowedBracket2

namespace Phys.Algebra.ProbeM01
open Phys.Algebra
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.AssembledBracket
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- ===== the DIRECT m01 bracket (tighter than the banked massRatio-detour m01_bracket_lo/hi) =====
-- from the banked Born-square mass brackets mass0_lo/hi, mass1_lo/hi (GenerationMassRatiosNumeric).
theorem m01_lo_sharp : (17374 / 5 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  have h1 : mass1 ≤ (40365 : Cut) / 1000000 * (40365 / 1000000) := mass1_hi
  have h2 : (237943 : Cut) / 100000 * (237943 / 100000) ≤ mass0 := mass0_lo
  nlinarith [h1, h2]

theorem m01_hi_sharp : mass0 / mass1 ≤ (17396 / 5 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  have h1 : (4034 : Cut) / 100000 * (4034 / 100000) ≤ mass1 := mass1_lo
  have h2 : mass0 ≤ (237944 : Cut) / 100000 * (237944 / 100000) := mass0_hi
  nlinarith [h1, h2]

-- ===== the sharpened cutLog content bracket, via cutLog_mono + certified exp indices =====
theorem cutLog_lo_sharp : (8153 / 1000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((17374 : Cut) / 5) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono (by norm_num) m01_lo_sharp
  have hge : (8153 / 1000 : Cut) ≤ cutLog ((17374 : Cut) / 5) := by
    apply cutLog_ge_certified ((17374 : Cut) / 5) (8153 / 1000) 17 (by norm_num) (by norm_num)
    show partialExp (8153 / 1000) 17 + expRemBound (8153 / 1000) 17 ≤ (17374 : Cut) / 5
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

theorem cutLog_hi_sharp : cutLog (mass0 / mass1) ≤ (8155 / 1000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 17374 / 5) m01_lo_sharp
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((17396 : Cut) / 5) :=
    cutLog_mono hpos m01_hi_sharp
  have hbnd : cutLog ((17396 : Cut) / 5) ≤ (8155 / 1000 : Cut) := by
    apply cutLog_le_certified ((17396 : Cut) / 5) (8155 / 1000) 20 (by norm_num) (by norm_num)
    show (17396 : Cut) / 5 ≤ partialExp (8155 / 1000) 20
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

end
end Phys.Algebra.ProbeM01
