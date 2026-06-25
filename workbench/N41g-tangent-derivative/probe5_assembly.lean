import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Order.Basic

namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- probe the small assembly pieces
example : Tendsto (fun t : Cut => |t|) (𝓝[≠] (0:Cut)) (𝓝 0) := by
  have h := (continuous_abs (G := Cut)).tendsto (0:Cut)
  rw [abs_zero] at h
  exact h.mono_left nhdsWithin_le_nhds

example (C : Cut) : Tendsto (fun t : Cut => C * |t|) (𝓝[≠] (0:Cut)) (𝓝 0) := by
  have h : Tendsto (fun t : Cut => |t|) (𝓝[≠] (0:Cut)) (𝓝 0) := by
    have h := (continuous_abs (G := Cut)).tendsto (0:Cut)
    rw [abs_zero] at h
    exact h.mono_left nhdsWithin_le_nhds
  have := h.const_mul C
  simpa using this

-- Icc_mem_nhds: {|t| ≤ 1} ∈ 𝓝 0
example : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), |t| ≤ 1 := by
  have hIcc : Set.Icc (-1 : Cut) 1 ∈ 𝓝 (0:Cut) :=
    Icc_mem_nhds (by norm_num) (by norm_num)
  have : ∀ᶠ t : Cut in 𝓝 (0:Cut), |t| ≤ 1 := by
    filter_upwards [hIcc] with t ht
    rw [abs_le]; exact ⟨ht.1, ht.2⟩
  exact this.filter_mono nhdsWithin_le_nhds

-- summable shift: Summable (n => |a (n+k)|) from hmaj 1
example (a : ℕ → Cut) (hmaj : ∀ ρ : Cut, 0 ≤ ρ → Summable (fun n => |a n| * ρ ^ n)) (k : ℕ) :
    Summable (fun n => |a (n+k)|) := by
  have h1 := hmaj 1 zero_le_one
  simp only [one_pow, mul_one] at h1
  exact (summable_nat_add_iff k).2 h1

end
end Phys.Foundation.ContinuumQ
