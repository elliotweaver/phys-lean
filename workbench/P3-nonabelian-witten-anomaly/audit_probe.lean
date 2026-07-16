import Phys.Algebra.ChiralGenerationAnomalyCancellation
import Phys.Algebra.ChiralGenerationIsospinTrace
import Mathlib.Tactic

open scoped BigOperators
open Finset
namespace Phys.Algebra.Probe
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

theorem mixed_anomaly_zero (n : ℕ) (idx q : Finset (Fin n) → ℚ)
    (heven : ∀ S : Finset (Fin n), idx Sᶜ = idx S)
    (hodd : ∀ S : Finset (Fin n), q Sᶜ = - q S) :
    (∑ S : Finset (Fin n), idx S * q S) = 0 := by
  apply sum_zero_of_compl_odd n (fun S => idx S * q S)
  intro S; rw [heven S, hodd S]; ring

noncomputable def colourIndex (n : ℕ) (S : Finset (Fin n)) : ℚ :=
  if S.card = 0 ∨ S.card = n then 0 else 1/2

theorem colourIndex_compl_even (n : ℕ) (S : Finset (Fin n)) :
    colourIndex n Sᶜ = colourIndex n S := by
  have hle : S.card ≤ n := by simpa using Finset.card_le_univ S
  unfold colourIndex
  rw [Finset.card_compl, Fintype.card_fin]
  have hcond : (n - S.card = 0 ∨ n - S.card = n) ↔ (S.card = 0 ∨ S.card = n) := by omega
  exact if_congr hcond rfl rfl

theorem su3_mixed_anomaly_cancels :
    (∑ S : Finset (Fin (Module.finrank ℚ Uhol)),
      colourIndex (Module.finrank ℚ Uhol) S * blCharge (Module.finrank ℚ Uhol) S) = 0 :=
  mixed_anomaly_zero _ (colourIndex _) (blCharge _)
    (colourIndex_compl_even _) (blCharge_compl_odd _)

noncomputable def su2MixedCoeff (nc nl : ℕ) : ℚ :=
  (nc : ℚ) * (2 / (nc : ℚ) - 1/2) + (nl : ℚ) * (-1/2)

theorem su2_mixed_anomaly_cancels :
    su2MixedCoeff (Module.finrank ℚ Uhol) (Module.finrank ℚ singlet) = 0 := by
  rw [finrank_Uhol, finrank_singlet]; unfold su2MixedCoeff; norm_num

theorem witten_even : Even (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) := by
  rw [finrank_Uhol, finrank_singlet]; decide

#print axioms mixed_anomaly_zero
#print axioms colourIndex_compl_even
#print axioms su3_mixed_anomaly_cancels
#print axioms su2_mixed_anomaly_cancels
#print axioms witten_even

end Phys.Algebra.Probe
