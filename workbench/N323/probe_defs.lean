import Phys.Foundation.ContinuumExp
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring

/-! PROBE for N323: definitional layer for cutSin/cutCos over derived Cut. NOT production. -/

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

def cosTermC (x : Cut) (n : ℕ) : Cut := (-1)^n * x ^ (2*n) / ((2*n).factorial : Cut)
def sinTermC (x : Cut) (n : ℕ) : Cut := (-1)^n * x ^ (2*n+1) / ((2*n+1).factorial : Cut)

theorem cosTermC_abs_eq (x : Cut) (n : ℕ) :
    |cosTermC x n| = |x| ^ (2*n) / ((2*n).factorial : Cut) := by
  unfold cosTermC
  simp only [abs_div, abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul]
  rw [abs_of_nonneg (show (0:Cut) ≤ ((2*n).factorial:Cut) by positivity)]

theorem sinTermC_abs_eq (x : Cut) (n : ℕ) :
    |sinTermC x n| = |x| ^ (2*n+1) / ((2*n+1).factorial : Cut) := by
  unfold sinTermC
  simp only [abs_div, abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul]
  rw [abs_of_nonneg (show (0:Cut) ≤ ((2*n+1).factorial:Cut) by positivity)]

theorem inj_two_mul : Function.Injective (fun n : ℕ => 2*n) := by
  intro a b h; simpa using h
theorem inj_two_mul_add_one : Function.Injective (fun n : ℕ => 2*n+1) := by
  intro a b h; simp only at h; omega

theorem cosTermC_abs_summable (x : Cut) : Summable (fun n => |cosTermC x n|) := by
  have hmaj : Summable (fun m => |x| ^ m / (m.factorial : Cut)) :=
    cut_summable_pow_div_factorial (abs_nonneg x)
  have hcomp := hmaj.comp_injective inj_two_mul
  refine hcomp.congr ?_
  intro n; rw [cosTermC_abs_eq]; rfl

theorem sinTermC_abs_summable (x : Cut) : Summable (fun n => |sinTermC x n|) := by
  have hmaj : Summable (fun m => |x| ^ m / (m.factorial : Cut)) :=
    cut_summable_pow_div_factorial (abs_nonneg x)
  have hcomp := hmaj.comp_injective inj_two_mul_add_one
  refine hcomp.congr ?_
  intro n; rw [sinTermC_abs_eq]; rfl

theorem cosTermC_summable (x : Cut) : Summable (cosTermC x) :=
  cut_summable_of_abs (cosTermC_abs_summable x)
theorem sinTermC_summable (x : Cut) : Summable (sinTermC x) :=
  cut_summable_of_abs (sinTermC_abs_summable x)

def cutCos (x : Cut) : Cut := ∑' n, cosTermC x n
def cutSin (x : Cut) : Cut := ∑' n, sinTermC x n

theorem cutCos_hasSum (x : Cut) : HasSum (cosTermC x) (cutCos x) :=
  (cosTermC_summable x).hasSum
theorem cutSin_hasSum (x : Cut) : HasSum (sinTermC x) (cutSin x) :=
  (sinTermC_summable x).hasSum

theorem cutCos_zero : cutCos 0 = 1 := by
  unfold cutCos
  rw [tsum_eq_single 0]
  · unfold cosTermC; simp
  · intro n hn
    unfold cosTermC
    have : (0:Cut) ^ (2*n) = 0 := by rw [zero_pow]; omega
    rw [this]; ring

theorem cutSin_zero : cutSin 0 = 0 := by
  unfold cutSin
  have h : ∀ n, sinTermC (0:Cut) n = 0 := by
    intro n; unfold sinTermC
    have : (0:Cut) ^ (2*n+1) = 0 := by rw [zero_pow]; omega
    rw [this]; ring
  simp only [h]
  exact tsum_zero

theorem cutCos_neg (x : Cut) : cutCos (-x) = cutCos x := by
  unfold cutCos
  apply tsum_congr
  intro n
  unfold cosTermC
  have hev : (-x)^(2*n) = x^(2*n) := by rw [pow_mul, neg_sq, ← pow_mul]
  rw [hev]

theorem cutSin_neg (x : Cut) : cutSin (-x) = -cutSin x := by
  unfold cutSin
  rw [← tsum_neg]
  apply tsum_congr
  intro n
  unfold sinTermC
  have hod : (-x)^(2*n+1) = -(x^(2*n+1)) := by
    rw [pow_succ, pow_succ, pow_mul, pow_mul, neg_sq]; ring
  rw [hod]; ring

end
end ContinuumQ
end Phys.Foundation
