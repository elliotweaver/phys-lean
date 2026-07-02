import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- KILL-condition probe: do the Cauchy-product instances synthesize on Cut?
example : T3Space Cut := by infer_instance
example : IsTopologicalSemiring Cut := by infer_instance
example : CompleteSpace Cut := by infer_instance

-- the Cauchy product lemma type-checks on Cut?
example (f g : ℕ → Cut) (hf : Summable f) (hg : Summable g)
    (hfg : Summable (fun x : ℕ × ℕ => f x.1 * g x.2)) :
    (∑' n, f n) * (∑' n, g n)
      = ∑' n, ∑ kl ∈ Finset.antidiagonal n, f kl.1 * g kl.2 :=
  hf.tsum_mul_tsum_eq_tsum_sum_antidiagonal hg hfg

end
end ContinuumQ
end Phys.Foundation
