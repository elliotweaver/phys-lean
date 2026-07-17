import Phys.Algebra.NarrowedBracket6

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
open Phys.Algebra
noncomputable section

-- UPPER sign push to 157079634/1e8 (exact rational norm_num; parent used 157079635)
theorem cutCos_157079634_neg_PROBE : cutCos (157079634 / 100000000 : Cut) < 0 := by
  have hx0 : (0 : Cut) ≤ 157079634 / 100000000 := by norm_num
  have hxN : (157079634 / 100000000 : Cut) ^ 2 < (((2 * 6 + 1) * (2 * 6 + 2) : ℕ) : Cut) := by
    push_cast; norm_num
  have hb := (cutCos_bracket (157079634 / 100000000) hx0 6 hxN).2
  rw [partialCos_six] at hb
  have hrem : cosRemBound (157079634 / 100000000 : Cut) 6 ≤ 47757 / 100000000000 := by
    unfold cosRemBound; norm_num [Nat.factorial]
  have hpc : (1 : Cut) - (157079634 / 100000000) ^ 2 / 2 + (157079634 / 100000000) ^ 4 / 24
      - (157079634 / 100000000) ^ 6 / 720 + (157079634 / 100000000) ^ 8 / 40320
      - (157079634 / 100000000) ^ 10 / 3628800 ≤ -4778 / 10000000000 := by norm_num
  linarith

end
end ContinuumQ
end Phys.Foundation
