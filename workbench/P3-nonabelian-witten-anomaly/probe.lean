import Phys.Algebra.ChiralGenerationAnomalyCancellation
import Phys.Algebra.ChiralGenerationIsospinTrace
import Mathlib.Tactic

open scoped BigOperators
open Finset

namespace Phys.Algebra.Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

/-! Piece 1 — SU(3)²·U(1): complement-even index × complement-odd charge sums to zero. -/

-- generic mechanism
theorem mixed_anomaly_zero (n : ℕ) (idx q : Finset (Fin n) → ℚ)
    (heven : ∀ S : Finset (Fin n), idx Sᶜ = idx S)
    (hodd : ∀ S : Finset (Fin n), q Sᶜ = - q S) :
    (∑ S : Finset (Fin n), idx S * q S) = 0 := by
  apply sum_zero_of_compl_odd n (fun S => idx S * q S)
  intro S
  rw [heven S, hodd S]; ring

-- concrete colour index (at n=3: exactly the Λ^{|S|}(fund₃) Dynkin index)
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

/-! Piece 2 — SU(2)²·U(1): cancels iff derived colour count = 3. -/

noncomputable def su2MixedCoeff (nc nl : ℕ) : ℚ :=
  (nc : ℚ) * (2 / (nc : ℚ) - 1/2) + (nl : ℚ) * (-1/2)

theorem su2MixedCoeff_eq (nc : ℕ) (hnc : nc ≠ 0) :
    su2MixedCoeff nc 1 = (3 - (nc : ℚ)) / 2 := by
  unfold su2MixedCoeff
  have : (nc : ℚ) ≠ 0 := by exact_mod_cast hnc
  field_simp
  ring

theorem su2_mixed_anomaly_cancels :
    su2MixedCoeff (Module.finrank ℚ Uhol) (Module.finrank ℚ singlet) = 0 := by
  rw [finrank_Uhol, finrank_singlet]
  unfold su2MixedCoeff
  norm_num

theorem su2_mixed_anomaly_wrong_colour :
    su2MixedCoeff 2 (Module.finrank ℚ singlet) ≠ 0 := by
  rw [finrank_singlet]
  unfold su2MixedCoeff
  norm_num

/-! Piece 3 — Witten SU(2) global anomaly: the doublet count is EVEN. -/

theorem witten_even : Even (Module.finrank ℚ Uhol + Module.finrank ℚ singlet) := by
  rw [finrank_Uhol, finrank_singlet]; decide

theorem witten_without_lepton_odd : ¬ Even (Module.finrank ℚ Uhol) := by
  rw [finrank_Uhol]; decide

/-! W8 teeth: colour index genuinely takes value 1/2. -/

theorem colourIndex_triplet_val :
    colourIndex 3 {(0 : Fin 3)} = 1/2 := by
  unfold colourIndex
  simp

end Phys.Algebra.Probe
