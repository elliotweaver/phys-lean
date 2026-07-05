import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

-- COSINE padded coefficient sequence: a0=1, a1=0, a(2m)=(-1)^m/(2m)!, a(odd)=0
def cosPad (n : ℕ) : Cut :=
  if Even n then (-1) ^ (n / 2) / ((n.factorial : Cut)) else 0

theorem cosPad_even (h : Cut) (m : ℕ) : h ^ (2*m) * cosPad (2*m) = cosTermC h m := by
  simp only [cosPad, cosTermC]
  rw [if_pos (by simp [Nat.even_mul] : Even (2*m))]
  rw [(by omega : (2 * m) / 2 = m)]; ring
theorem cosPad_odd (h : Cut) (m : ℕ) : h ^ (2*m+1) * cosPad (2*m+1) = 0 := by
  simp only [cosPad]; rw [if_neg (by simp [Nat.even_mul] : ¬ Even (2*m+1))]; ring

theorem cosPad_even_summable (h : Cut) : Summable (fun m => h ^ (2*m) * cosPad (2*m)) := by
  simp_rw [cosPad_even]; exact cosTermC_summable h
theorem cosPad_odd_summable (h : Cut) : Summable (fun m => h ^ (2*m+1) * cosPad (2*m+1)) := by
  simp_rw [cosPad_odd]; simp
theorem tsum_cosPad_even (h : Cut) : (∑' m, h ^ (2*m) * cosPad (2*m)) = cutCos h := by
  simp_rw [cosPad_even]; rfl
theorem tsum_cosPad_odd (h : Cut) : (∑' m, h ^ (2*m+1) * cosPad (2*m+1)) = 0 := by
  simp_rw [cosPad_odd]; simp
theorem tsum_cosPad (h : Cut) : (∑' n, h ^ n * cosPad n) = cutCos h := by
  have key := tsum_even_add_odd (f := fun n => h ^ n * cosPad n)
      (cosPad_even_summable h) (cosPad_odd_summable h)
  rw [tsum_cosPad_even, tsum_cosPad_odd, add_zero] at key
  exact key.symm
theorem cosPad_abs_summable_coeff : Summable (fun n => |cosPad n|) := by
  apply Summable.even_add_odd
  · have hcongr : (fun m => |cosPad (2*m)|) = (fun m => |cosTermC (1:Cut) m|) := by
      funext m; simp only [cosPad, cosTermC]
      rw [if_pos (by simp [Nat.even_mul] : Even (2*m))]
      rw [(by omega : (2 * m) / 2 = m)]; simp
    rw [hcongr]; exact cosTermC_abs_summable 1
  · have : (fun m => |cosPad (2*m+1)|) = (fun _ => (0:Cut)) := by
      funext m; simp only [cosPad]; rw [if_neg (by simp [Nat.even_mul] : ¬ Even (2*m+1))]; simp
    rw [this]; simp
theorem cosPad_zero : cosPad 0 = 1 := by simp [cosPad]
theorem cosPad_one : cosPad 1 = 0 := by simp [cosPad]

-- CRUX 2: (cutCos h − 1)/h → 0 at 0
theorem cutCos_sub_one_div_tendsto_zero :
    Tendsto (fun t : Cut => t⁻¹ * (cutCos t - 1)) (𝓝[≠] (0 : Cut)) (𝓝 0) := by
  have hd := cut_powerseries_deriv cosPad cosPad_abs_summable_coeff
  rw [cosPad_one] at hd
  have hcongr : (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * cosPad n) - cosPad 0))
      = (fun t : Cut => t⁻¹ * (cutCos t - 1)) := by
    funext t; rw [tsum_cosPad, cosPad_zero]
  rw [hcongr] at hd
  exact hd

end
end ContinuumQ
end Phys.Foundation
