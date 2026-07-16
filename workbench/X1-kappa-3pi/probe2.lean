import Phys.Foundation.ContinuumSphereFlux

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

-- The termwise antiderivative of sinTermC(3x, m) w.r.t. x:
-- ∫₀^x (-1)^m (3t)^(2m+1)/(2m+1)! dt = (-1)^m 3^(2m+1) x^(2m+2)/(2m+2)!
def sin3AntiderivTerm (x : Cut) (m : ℕ) : Cut :=
  (-1) ^ m * (3:Cut) ^ (2 * m + 1) * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

-- KEY: sin3AntiderivTerm x m = -(1/3) * cosTermC (3*x) (m+1)
theorem sin3AntiderivTerm_eq (x : Cut) (m : ℕ) :
    sin3AntiderivTerm x m = -(1/3) * cosTermC (3 * x) (m + 1) := by
  unfold sin3AntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]
  have hpow : ((3:Cut) * x) ^ (2 * m + 2) = (3:Cut) ^ (2 * m + 2) * x ^ (2 * m + 2) := by
    rw [mul_pow]
  rw [hpow]
  have h3 : (3:Cut) ^ (2 * m + 2) = 3 * (3:Cut) ^ (2 * m + 1) := by
    rw [← pow_succ']
  rw [h3]
  ring

theorem sin3AntiderivTerm_summable (x : Cut) : Summable (sin3AntiderivTerm x) := by
  have h : Summable (fun m => -(1/3) * cosTermC (3 * x) (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable (3 * x))).mul_left _)
  refine h.congr ?_
  intro m; rw [sin3AntiderivTerm_eq]

def sin3Antideriv (x : Cut) : Cut := ∑' m, sin3AntiderivTerm x m

theorem sin3Antideriv_eq (x : Cut) : sin3Antideriv x = (1 - cutCos (3 * x)) / 3 := by
  unfold sin3Antideriv
  have hstep : (∑' m, sin3AntiderivTerm x m) = ∑' m, -(1/3) * cosTermC (3 * x) (m + 1) := by
    apply tsum_congr; intro m; rw [sin3AntiderivTerm_eq]
  rw [hstep]
  rw [tsum_mul_left]
  have hz := (cosTermC_summable (3 * x)).tsum_eq_zero_add
  have h0 : cosTermC (3 * x) 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos (3 * x) = ∑' n, cosTermC (3 * x) n := rfl
  rw [← hcut] at hz
  -- hz : cutCos (3*x) = 1 + ∑' n, cosTermC (3*x) (n+1)
  have : (∑' n, cosTermC (3 * x) (n + 1)) = cutCos (3 * x) - 1 := by linarith [hz]
  rw [this]; ring

end
end ContinuumQ
end Phys.Foundation
