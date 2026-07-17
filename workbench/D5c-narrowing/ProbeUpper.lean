import Phys.Algebra.NarrowedBracket4

/-! MEASURE how tight each leastCosZero endpoint can go.
    True pi/2 * 1e7 = 15707963.2679. Parent bracket [15707705, 15707970].
    LOWER via double-angle (well-conditioned near pi/4). UPPER via direct norm_num sign. -/

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators
open Phys.Algebra

noncomputable section

-- UPPER candidates: is partialCos(z,6) + cosRemBound(z,6) < 0 provable by norm_num?
-- (near-cancellation is exact for norm_num). cutCos z ≤ partialCos+rem.
-- z = 15707965/1e7 (above true zero by 1.7e-6)
theorem probe_upper_65 : cutCos (15707965 / 10000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 15707965 / 10000000 := by norm_num
  have hxN : (15707965 / 10000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (15707965 / 10000000) hx0 6 hxN).2
  rw [partialCos_six] at hb
  have hrem : cosRemBound (15707965 / 10000000 : Cut) 6 ≤ 478 / 1000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (15707965 / 10000000) ^ 2 / 2 + (15707965 / 10000000) ^ 4 / 24
      - (15707965 / 10000000) ^ 6 / 720 + (15707965 / 10000000) ^ 8 / 40320
      - (15707965 / 10000000) ^ 10 / 3628800 ≤ -600 / 1000000000 := by norm_num
  linarith

-- z = 15707964/1e7 (above true zero by 0.7e-6)
theorem probe_upper_64 : cutCos (15707964 / 10000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 15707964 / 10000000 := by norm_num
  have hxN : (15707964 / 10000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (15707964 / 10000000) hx0 6 hxN).2
  rw [partialCos_six] at hb
  have hrem : cosRemBound (15707964 / 10000000 : Cut) 6 ≤ 478 / 1000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (15707964 / 10000000) ^ 2 / 2 + (15707964 / 10000000) ^ 4 / 24
      - (15707964 / 10000000) ^ 6 / 720 + (15707964 / 10000000) ^ 8 / 40320
      - (15707964 / 10000000) ^ 10 / 3628800 ≤ -500 / 1000000000 := by norm_num
  linarith

end

end ContinuumQ
end Phys.Foundation
