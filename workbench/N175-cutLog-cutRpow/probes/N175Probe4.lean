import Phys.Foundation.ContinuumExp
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.Order.Group

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- probe the tendsto/continuity levers over Cut
example : Continuous (fun x : Cut => |x|) := by exact continuous_abs
example : Continuous (fun x : Cut => x) := continuous_id
example : ContinuousAt (fun x : Cut => x) (0:Cut) := continuousAt_id
example (a : Cut) : Tendsto (fun x : Cut => a * x) (𝓝 0) (𝓝 (a*0)) := by
  exact (continuous_const.mul continuous_id).tendsto 0
example (f g h : ℕ → Cut) (b : Filter ℕ) (a : Cut)
    (hg : Tendsto g b (𝓝 a)) (hh : Tendsto h b (𝓝 a))
    (hgf : ∀ n, g n ≤ f n) (hfh : ∀ n, f n ≤ h n) :
    Tendsto f b (𝓝 a) :=
  tendsto_of_tendsto_of_tendsto_of_le_of_le hg hh hgf hfh

-- continuous_of_continuousAt_zero (additive form) over Cut as add group
example (f : Cut → Cut) (hf : ContinuousAt f 0) (h0 : f 0 = 0)
    (hadd : ∀ x y, f (x+y) = f x + f y) : Continuous f := by
  sorry

end
end ContinuumQ
end Phys.Foundation
