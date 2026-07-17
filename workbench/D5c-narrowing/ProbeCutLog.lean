import Phys.Algebra.NarrowedBracket4

/-! MEASURE front (2): sharpen cutLog via tighter m01 + deeper exp indices.
    m01 achievable [3477.4708, 3477.4760] -> rational bracket [3477470/1000, 3477477/1000].
    cutLog bracket [8.1540600, 8.1540625]: LOWER N=23, UPPER N=26. -/

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.NarrowedBracket4

noncomputable section

-- tighter m01 lower: 3477470/1000 <= mass0/mass1   (achievable 3477.4708)
theorem probe_m01_lo_tight : (3477470 / 1000 : Cut) ≤ mass0 / mass1 := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [le_div_iff₀ hm1]
  nlinarith [mass1_hi_sharp, mass0_lo_sharp]

-- tighter m01 upper: mass0/mass1 <= 3477477/1000  (achievable 3477.4760)
theorem probe_m01_hi_tight : mass0 / mass1 ≤ (3477477 / 1000 : Cut) := by
  have hm1 : (0 : Cut) < mass1 := mass1_pos
  rw [div_le_iff₀ hm1]
  nlinarith [mass1_lo_sharp, mass0_hi_sharp]

-- cutLog LOWER at N=23: partialExp(8.15406,23)+rem <= 3477.470
set_option maxHeartbeats 800000 in
theorem probe_cutLog_lo_tight : (81540600 / 10000000 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((3477470 : Cut) / 1000) ≤ cutLog (mass0 / mass1) :=
    Phys.Algebra.AssembledBracket.cutLog_mono (by norm_num) probe_m01_lo_tight
  have hge : (81540600 / 10000000 : Cut) ≤ cutLog ((3477470 : Cut) / 1000) := by
    apply cutLog_ge_certified ((3477470 : Cut) / 1000) (81540600 / 10000000) 23 (by norm_num) (by norm_num)
    show partialExp (81540600 / 10000000) 23 + expRemBound (81540600 / 10000000) 23 ≤ (3477470 : Cut) / 1000
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

-- cutLog UPPER at N=26: 3477.477 <= partialExp(8.1540630,26)
set_option maxHeartbeats 800000 in
theorem probe_cutLog_hi_tight : cutLog (mass0 / mass1) ≤ (81540630 / 10000000 : Cut) := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 3477470 / 1000) probe_m01_lo_tight
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((3477477 : Cut) / 1000) :=
    Phys.Algebra.AssembledBracket.cutLog_mono hpos probe_m01_hi_tight
  have hbnd : cutLog ((3477477 : Cut) / 1000) ≤ (81540630 / 10000000 : Cut) := by
    apply cutLog_le_certified ((3477477 : Cut) / 1000) (81540630 / 10000000) 26 (by norm_num) (by norm_num)
    show (3477477 : Cut) / 1000 ≤ partialExp (81540630 / 10000000) 26
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

end

end ContinuumQ
end Phys.Foundation
