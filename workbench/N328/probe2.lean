import Phys.Foundation.ContinuumTrigPi

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

def sinAntiderivTerm (x : Cut) (m : ℕ) : Cut := (-1) ^ m * x ^ (2 * m + 2) / ((2 * m + 2).factorial : Cut)

theorem sinAntiderivTerm_eq_neg_cosTermC (x : Cut) (m : ℕ) :
    sinAntiderivTerm x m = - cosTermC x (m + 1) := by
  unfold sinAntiderivTerm cosTermC
  have he : 2 * (m + 1) = 2 * m + 2 := by ring
  rw [he]
  have hsign : (-1 : Cut) ^ (m + 1) = -(-1) ^ m := by rw [pow_succ]; ring
  rw [hsign]; ring

theorem sinAntiderivTerm_summable (x : Cut) : Summable (sinAntiderivTerm x) := by
  have h : Summable (fun m => - cosTermC x (m + 1)) :=
    (((summable_nat_add_iff 1).mpr (cosTermC_summable x)).neg)
  refine h.congr ?_
  intro m; rw [sinAntiderivTerm_eq_neg_cosTermC]

def sinAntideriv (x : Cut) : Cut := ∑' m, sinAntiderivTerm x m

theorem sinAntideriv_eq (x : Cut) : sinAntideriv x = 1 - cutCos x := by
  unfold sinAntideriv
  have hstep : (∑' m, sinAntiderivTerm x m) = ∑' m, - cosTermC x (m + 1) := by
    apply tsum_congr; intro m; rw [sinAntiderivTerm_eq_neg_cosTermC]
  rw [hstep, tsum_neg]
  have hz := (cosTermC_summable x).tsum_eq_zero_add
  have h0 : cosTermC x 0 = 1 := by unfold cosTermC; simp
  rw [h0] at hz
  have hcut : cutCos x = ∑' n, cosTermC x n := rfl
  rw [← hcut] at hz
  linarith [hz]

theorem sinAntideriv_zero : sinAntideriv 0 = 0 := by rw [sinAntideriv_eq, cutCos_zero]; ring

theorem sinAntideriv_cutPi : sinAntideriv cutPi = 2 := by
  rw [sinAntideriv_eq, cutCos_cutPi]; ring

/-- The azimuthal full turn = the full period `2·cutPi`. -/
def azimuthalTurn : Cut := 2 * cutPi

/-- The 2-sphere solid angle = (azimuthal turn) × (meridian flux). -/
def gaussSphereSolidAngle : Cut := azimuthalTurn * sinAntideriv cutPi

theorem gaussSphereSolidAngle_eq : gaussSphereSolidAngle = 4 * cutPi := by
  unfold gaussSphereSolidAngle azimuthalTurn
  rw [sinAntideriv_cutPi]; ring

theorem gaussSphereSolidAngle_pos : 0 < gaussSphereSolidAngle := by
  rw [gaussSphereSolidAngle_eq]; have := cutPi_pos; linarith

theorem gaussSphereSolidAngle_ne_azimuthal : gaussSphereSolidAngle ≠ azimuthalTurn := by
  rw [gaussSphereSolidAngle_eq]; unfold azimuthalTurn
  have h := cutPi_pos; intro hcon; nlinarith [h]

end
end ContinuumQ
end Phys.Foundation
