import Phys.Algebra.NarrowedBracket3
namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- Test the hx2 derivation in isolation (the whnf timeout suspect)
theorem probe_hx2 (x : Cut) (hx0 : 0 ≤ x) (hx : x < 15707705 / 10000000) :
    x ^ 2 < 246732 / 100000 := by
  have h1 : x * x < (15707705 / 10000000) * (15707705 / 10000000) :=
    mul_lt_mul' (le_of_lt hx) hx hx0 (by norm_num)
  have h2 : (15707705 / 10000000 : Cut) * (15707705 / 10000000) ≤ 246732 / 100000 := by norm_num
  nlinarith [h1, h2]

end
end ContinuumQ
end Phys.Foundation
