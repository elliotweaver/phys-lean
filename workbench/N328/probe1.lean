import Phys.Foundation.ContinuumTrigPi

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-- The termwise integral of the sine series: `∫₀^x (-1)ᵐ t^(2m+1)/(2m+1)! dt = (-1)ᵐ x^(2m+2)/(2m+2)!`. -/
def sinAntiderivTerm (x : Cut) (m : ℕ) : Cut := (-1) ^ m * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

/-- Key term identity: `sinAntiderivTerm x m = - cosTermC x (m+1)`. -/
theorem sinAntiderivTerm_eq_neg_cosTermC (x : Cut) (m : ℕ) :
    sinAntiderivTerm x m = - cosTermC x (m + 1) := by
  unfold sinAntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]
  ring

/-- Summability of the antiderivative terms (shift of the cosine summability). -/
theorem sinAntiderivTerm_summable (x : Cut) : Summable (sinAntiderivTerm x) := by
  have h : Summable (fun m => - cosTermC x (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable x)).neg)
  refine h.congr ?_
  intro m; rw [sinAntiderivTerm_eq_neg_cosTermC]

/-- The accumulated meridian self-overlap: the termwise integral of `cutSin` from `0` to `x`. -/
def sinAntideriv (x : Cut) : Cut := ∑' m, sinAntiderivTerm x m

/-- ★ THE CLOSED FORM (the FTC antiderivative-difference form): `sinAntideriv x = 1 - cutCos x`. -/
theorem sinAntideriv_eq (x : Cut) : sinAntideriv x = 1 - cutCos x := by
  unfold sinAntideriv
  have hstep : (∑' m, sinAntiderivTerm x m) = ∑' m, - cosTermC x (m + 1) := by
    apply tsum_congr; intro m; rw [sinAntiderivTerm_eq_neg_cosTermC]
  rw [hstep, tsum_neg]
  have hz := (cosTermC_summable x).tsum_eq_zero_add
  have h0 : cosTermC x 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  -- hz : cutCos x = 1 + ∑' m, cosTermC x (m+1)   (cutCos x is the tsum)
  have hcut : cutCos x = ∑' n, cosTermC x n := rfl
  rw [← hcut] at hz
  linarith [hz]

/-- ★ THE FULL-MERIDIAN FLUX: `sinAntideriv cutPi = 2`, forced by the banked half-turn. -/
theorem sinAntideriv_cutPi : sinAntideriv cutPi = 2 := by
  rw [sinAntideriv_eq, cutCos_cutPi]; ring

end
end ContinuumQ
end Phys.Foundation
