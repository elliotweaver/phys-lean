import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- Probe the uncertain Mathlib lemma names over Cut.

-- (1) split off partial sum
example (x : Cut) (N : ℕ) :
    (∑ i ∈ Finset.range N, expTermC x i) + ∑' i, expTermC x (i + N) = cutExp x := by
  have := sum_add_tsum_nat_add N (expTermC_summable x)
  simpa [cutExp] using this

-- (2) terms tend to zero
example (x : Cut) : Tendsto (fun n => expTermC x n) atTop (𝓝 0) :=
  (expTermC_summable x).tendsto_atTop_zero

-- (3) partial sums of a HasSum tend to the sum (nat range)
example (x : Cut) : Tendsto (fun n => ∑ i ∈ Finset.range n, expTermC x i) atTop (𝓝 (cutExp x)) :=
  (cutExp_hasSum x).tendsto_sum_nat

-- (4) tsum_mul_left
example (a : Cut) (f : ℕ → Cut) : ∑' n, a * f n = a * ∑' n, f n := tsum_mul_left

-- (5) Summable.tsum_le_tsum
example (f g : ℕ → Cut) (hf : Summable f) (hg : Summable g) (h : ∀ i, f i ≤ g i) :
    ∑' i, f i ≤ ∑' i, g i := hf.tsum_le_tsum h hg

-- (6) summable_nat_add_iff
example (x : Cut) (N : ℕ) : Summable (fun k => expTermC x (k + N)) :=
  (summable_nat_add_iff N).mpr (expTermC_summable x)

-- (7) inv order reversal
example (a b : Cut) (ha : 0 < a) (hab : a ≤ b) : b⁻¹ ≤ a⁻¹ := inv_le_inv_of_le ha hab

-- (8) div_le_div_of_nonneg_left
example (a b c : Cut) (ha : 0 ≤ a) (hb : 0 < b) (hbc : b ≤ c) : a / c ≤ a / b :=
  div_le_div_of_nonneg_left ha hb hbc

-- (9) le_of_tendsto
example (u : ℕ → Cut) (a c : Cut) (h : Tendsto u atTop (𝓝 a)) (hb : ∀ n, u n ≤ c) : a ≤ c :=
  le_of_tendsto h (eventually_of_forall hb)

end
end ContinuumQ
end Phys.Foundation
