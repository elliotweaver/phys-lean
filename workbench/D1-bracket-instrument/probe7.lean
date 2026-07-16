import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

def partialExp (q : Cut) (N : ℕ) : Cut := ∑ i ∈ Finset.range N, expTermC q i
def expRemBound (q : Cut) (N : ℕ) : Cut :=
  (q ^ N / (N.factorial : Cut)) * (1 - q / (N + 1))⁻¹

-- probe: split identity direction
example (q : Cut) (N : ℕ) :
    partialExp q N + ∑' m, expTermC q (m + N) = cutExp q := by
  have h := (expTermC_summable q).sum_add_tsum_nat_add N
  simpa [partialExp, cutExp] using h

-- probe: tail nonneg
example (q : Cut) (hq : 0 ≤ q) (N : ℕ) : 0 ≤ ∑' m, expTermC q (m + N) := by
  apply tsum_nonneg; intro m; unfold expTermC; positivity

-- probe: EVALUATE partialExp 1 4 = 8/3
example : partialExp 1 4 = (8:Cut)/3 := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num

-- probe: EVALUATE expRemBound 1 4 = 5/96
example : expRemBound (1:Cut) 4 = 5/96 := by
  unfold expRemBound
  norm_num [Nat.factorial]

-- probe: cutLog transfer directions
-- cutExp a ≤ y → a ≤ cutLog y  (0 < y)
example (a y : Cut) (hy : 0 < y) (h : cutExp a ≤ y) : a ≤ cutLog y := by
  have := cutExp_cutLog hy
  have hmono := cutExp_strictMono.le_iff_le (a := a) (b := cutLog y)
  rw [this] at hmono
  exact hmono.mp h

-- y ≤ cutExp b → cutLog y ≤ b  (0 < y)
example (b y : Cut) (hy : 0 < y) (h : y ≤ cutExp b) : cutLog y ≤ b := by
  have := cutExp_cutLog hy
  have hmono := cutExp_strictMono.le_iff_le (a := cutLog y) (b := b)
  rw [this] at hmono
  exact hmono.mp h

end
end ContinuumQ
end Phys.Foundation
