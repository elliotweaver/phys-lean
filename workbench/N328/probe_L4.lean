import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

-- assume the L3 results (copy the minimal needed ones)
def sinPad (n : ℕ) : Cut :=
  if Even n then 0 else (-1) ^ (n / 2) / ((n.factorial : Cut))
theorem sinPad_even (h : Cut) (m : ℕ) : h ^ (2*m) * sinPad (2*m) = 0 := by
  simp only [sinPad]; rw [if_pos (by simp [Nat.even_mul] : Even (2*m))]; ring
theorem sinPad_odd (h : Cut) (m : ℕ) : h ^ (2*m+1) * sinPad (2*m+1) = sinTermC h m := by
  simp only [sinPad, sinTermC]
  rw [if_neg (by simp [Nat.even_mul] : ¬ Even (2 * m + 1))]
  rw [(by omega : (2 * m + 1) / 2 = m)]; ring
theorem sinPad_even_summable (h : Cut) : Summable (fun m => h ^ (2*m) * sinPad (2*m)) := by
  simp_rw [sinPad_even]; simp
theorem sinPad_odd_summable (h : Cut) : Summable (fun m => h ^ (2*m+1) * sinPad (2*m+1)) := by
  simp_rw [sinPad_odd]; exact sinTermC_summable h
theorem tsum_sinPad_even (h : Cut) : (∑' m, h ^ (2*m) * sinPad (2*m)) = 0 := by
  simp_rw [sinPad_even]; simp
theorem tsum_sinPad_odd (h : Cut) : (∑' m, h ^ (2*m+1) * sinPad (2*m+1)) = cutSin h := by
  simp_rw [sinPad_odd]; rfl
theorem tsum_sinPad (h : Cut) : (∑' n, h ^ n * sinPad n) = cutSin h := by
  have key := tsum_even_add_odd (f := fun n => h ^ n * sinPad n)
      (sinPad_even_summable h) (sinPad_odd_summable h)
  rw [tsum_sinPad_even, tsum_sinPad_odd, zero_add] at key
  exact key.symm
theorem sinPad_abs_summable_coeff : Summable (fun n => |sinPad n|) := by
  apply Summable.even_add_odd
  · have : (fun m => |sinPad (2*m)|) = (fun _ => (0:Cut)) := by
      funext m; simp only [sinPad]; rw [if_pos (by simp [Nat.even_mul] : Even (2*m))]; simp
    rw [this]; simp
  · have hcongr : (fun m => |sinPad (2*m+1)|) = (fun m => |sinTermC (1:Cut) m|) := by
      funext m; simp only [sinPad, sinTermC]
      rw [if_neg (by simp [Nat.even_mul] : ¬ Even (2 * m + 1))]
      rw [(by omega : (2 * m + 1) / 2 = m)]; simp
    rw [hcongr]; exact sinTermC_abs_summable 1
theorem sinPad_zero : sinPad 0 = 0 := by simp [sinPad]
theorem sinPad_one : sinPad 1 = 1 := by simp [sinPad]

-- ============ CRUX MEASURE: cutSin h / h → 1 at 0 ============
-- cut_powerseries_deriv gives:
--   Tendsto (fun t => t⁻¹ * ((∑' n, t^n * a n) - a 0)) (𝓝[≠] 0) (𝓝 (a 1))
-- with a = sinPad: a0=0, a1=1, ∑' = cutSin. So t⁻¹ * cutSin t → 1.
theorem cutSin_div_tendsto_one :
    Tendsto (fun t : Cut => t⁻¹ * cutSin t) (𝓝[≠] (0 : Cut)) (𝓝 1) := by
  have hd := cut_powerseries_deriv sinPad sinPad_abs_summable_coeff
  rw [sinPad_one] at hd
  -- rewrite the tsum and a0 inside
  have hcongr : (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * sinPad n) - sinPad 0))
      = (fun t : Cut => t⁻¹ * cutSin t) := by
    funext t; rw [tsum_sinPad, sinPad_zero, sub_zero]
  rw [hcongr] at hd
  exact hd

end
end ContinuumQ
end Phys.Foundation
