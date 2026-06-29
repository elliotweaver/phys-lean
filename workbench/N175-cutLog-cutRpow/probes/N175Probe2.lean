import Phys.Foundation.ContinuumExp

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- probe lever names over Cut
example (f : ℕ → Cut) (hf : Summable f) : ∑' n, f n = f 0 + ∑' n, f (n+1) :=
  tsum_eq_zero_add hf
example (f g : ℕ → Cut) (hf : Summable f) (hg : Summable g) (h : ∀ n, f n ≤ g n) :
    ∑' n, f n ≤ ∑' n, g n := tsum_le_tsum h hf hg
example (a : Cut) (f : ℕ → Cut) (hf : Summable f) : ∑' n, a * f n = a * ∑' n, f n :=
  hf.tsum_mul_left a

end
end ContinuumQ
end Phys.Foundation
