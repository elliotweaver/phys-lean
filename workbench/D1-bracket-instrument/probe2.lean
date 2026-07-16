import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- (1a) split off partial sum — try the right name
example (x : Cut) (N : ℕ) :
    (∑ i ∈ Finset.range N, expTermC x i) + ∑' i, expTermC x (i + N) = cutExp x := by
  have := (expTermC_summable x).sum_add_tsum_nat_add N
  simpa [cutExp] using this

-- (7a) inv order reversal — alternatives
example (a b : Cut) (ha : 0 < a) (hab : a ≤ b) : b⁻¹ ≤ a⁻¹ := by
  apply one_div_le_one_div_of_le ha hab |>.trans_eq ?_ <;> rw [one_div]

-- (7b)
example (a b : Cut) (ha : 0 < a) (hab : a ≤ b) : b⁻¹ ≤ a⁻¹ := inv_anti₀ ha hab

-- (9a) eventually_of_forall alt
example (u : ℕ → Cut) (a c : Cut) (h : Tendsto u atTop (𝓝 a)) (hb : ∀ n, u n ≤ c) : a ≤ c :=
  le_of_tendsto h (Filter.Eventually.of_forall hb)

-- tsum ≤ c from all finite partial sums ≤ c
example (f : ℕ → Cut) (hf : Summable f) (c : Cut) (h : ∀ s : Finset ℕ, ∑ i ∈ s, f i ≤ c) :
    ∑' i, f i ≤ c := tsum_le_of_sum_le hf h

-- geometric partial sum ≤ 1/(1-r)
example (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) (M : ℕ) :
    ∑ i ∈ Finset.range M, r ^ i ≤ (1 - r)⁻¹ := by
  have h1r : (0:Cut) < 1 - r := by linarith
  have := cut_geom_telescope r M
  rw [le_inv_comm₀ h1r] at *
  sorry

end
end ContinuumQ
end Phys.Foundation
