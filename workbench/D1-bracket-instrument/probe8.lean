import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

def expRemBound (q : Cut) (N : ℕ) : Cut :=
  (q ^ N / (N.factorial : Cut)) * (1 - q / (N + 1))⁻¹

-- probe: extract eventually < ε from tendsto to 0
example (q : Cut) (ε : Cut) (hε : 0 < ε) : ∀ᶠ N in atTop, expTermC q N < ε := by
  have ht : Tendsto (expTermC q) atTop (𝓝 0) := (expTermC_summable q).tendsto_atTop_zero
  exact ht.eventually_lt_const hε

-- probe: Archimedean nat > 2q
example (q : Cut) : ∃ n : ℕ, (2*q) < (n : Cut) := cut_exists_nat_gt (2*q)

-- probe: eventually N ≥ N₀
example (N₀ : ℕ) : ∀ᶠ N in atTop, N₀ ≤ N := eventually_ge_atTop N₀

-- THE ε-existence
theorem expRemBound_lt (q : Cut) (hq : 0 ≤ q) (ε : Cut) (hε : 0 < ε) :
    ∃ N, expRemBound q N < ε := by
  rcases eq_or_lt_of_le hq with hq0 | hqpos
  · -- q = 0
    refine ⟨1, ?_⟩
    unfold expRemBound
    rw [← hq0]
    simp
    positivity
  · -- q > 0
    obtain ⟨N₀, hN₀⟩ := cut_exists_nat_gt (2*q)
    have ht : Tendsto (expTermC q) atTop (𝓝 0) := (expTermC_summable q).tendsto_atTop_zero
    have hev1 : ∀ᶠ N in atTop, expTermC q N < ε/2 := ht.eventually_lt_const (by linarith)
    have hev2 : ∀ᶠ N in atTop, N₀ ≤ N := eventually_ge_atTop N₀
    obtain ⟨N, hNlt, hNge⟩ := (hev1.and hev2).exists
    refine ⟨N, ?_⟩
    -- for N ≥ N₀ ≥ 2q we have q/(N+1) ≤ 1/2, so factor ≤ 2
    have hNle : (N₀ : Cut) ≤ (N : Cut) := by exact_mod_cast hNge
    have hNbig : 2*q < ((N:Cut)+1) := by
      have : 2*q < (N:Cut) := lt_of_lt_of_le hN₀ hNle
      linarith
    have hden_pos : (0:Cut) < (N:Cut) + 1 := by positivity
    have hqfrac : q / ((N:Cut)+1) ≤ 1/2 := by
      rw [div_le_iff₀ hden_pos]; linarith
    have hfacpos : (0:Cut) < 1 - q/((N:Cut)+1) := by
      have : q/((N:Cut)+1) ≤ 1/2 := hqfrac; linarith
    have hfacle : (1 - q/((N:Cut)+1))⁻¹ ≤ 2 := by
      rw [inv_le_comm₀ hfacpos (by norm_num)]
      linarith
    have hterm_nonneg : (0:Cut) ≤ expTermC q N := by unfold expTermC; positivity
    calc expRemBound q N = expTermC q N * (1 - q/((N:Cut)+1))⁻¹ := by unfold expRemBound expTermC; ring_nf
      _ ≤ expTermC q N * 2 := by apply mul_le_mul_of_nonneg_left hfacle hterm_nonneg
      _ < (ε/2) * 2 := by apply mul_lt_mul_of_pos_right hNlt (by norm_num)
      _ = ε := by ring

end
end ContinuumQ
end Phys.Foundation
