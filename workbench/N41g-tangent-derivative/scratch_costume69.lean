import Phys.Foundation.ContinuumScalarDeriv

namespace Counterexamples
open Phys.Foundation.ContinuumQ
open Filter
open scoped Topology
noncomputable section

-- BOGUS: limit point a 2 instead of a 1. Route through banked, leaves `a 2 = a 1` (false).
theorem scratch_BOGUS (a : ℕ → Cut) (hsum1 : Summable (fun n => |a n|)) :
    Tendsto (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) (𝓝[≠] (0 : Cut)) (𝓝 (a 2)) := by
  have h : Tendsto (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) (𝓝[≠] (0 : Cut)) (𝓝 (a 1)) :=
    cut_powerseries_deriv a hsum1
  convert h using 2

end
end Counterexamples
