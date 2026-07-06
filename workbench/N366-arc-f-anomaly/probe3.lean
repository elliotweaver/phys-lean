import Phys.Algebra.ChiralGenerationChargeTrace
import Mathlib.Tactic

open scoped BigOperators
open Finset
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

-- GROUNDING PROBE: express the anomaly functional over the ladder indexed by the BANKED colour dim.
-- N317 precedent: generation_charge_trace : ladderChargeTrace (Module.finrank ℚ Uhol) = 16/3,
-- with ladderChargeTrace n := 2 * ∑ S : Finset (Fin n), ((S.card:ℚ)/n)^2.
-- So the pattern is: define a generic `anomalyLinear (n : ℕ)` and state the headline at
-- `Module.finrank ℚ Uhol`, then discharge via finrank_Uhol.

-- generic B-L functional at colour count n: blfN n S = (2|S| - n)/n
noncomputable def blfN (n : ℕ) (S : Finset (Fin n)) : ℚ := (2 * (S.card : ℚ) - (n:ℚ)) / (n:ℚ)

-- generic linear anomaly at colour count n
noncomputable def anomalyLinearN (n : ℕ) : ℚ := ∑ S : Finset (Fin n), blfN n S

def complEquiv (n : ℕ) : Equiv.Perm (Finset (Fin n)) := ⟨compl, compl, compl_compl, compl_compl⟩

-- blfN is complement-odd at any n
theorem blfN_compl_odd (n : ℕ) (S : Finset (Fin n)) : blfN n Sᶜ = - blfN n S := by
  unfold blfN
  rw [Finset.card_compl]
  simp only [Fintype.card_fin]
  have hle : S.card ≤ n := by simpa using Finset.card_le_univ S
  have : ((n - S.card : ℕ) : ℚ) = (n:ℚ) - (S.card : ℚ) := by rw [Nat.cast_sub hle]
  rw [this]; ring

-- The linear anomaly vanishes at ANY n (Hodge involution) — no oddness of n needed for the sum-flip,
-- but the FREENESS (used for teeth) needs n odd. The vanishing itself is pure involution.
theorem anomalyLinearN_zero (n : ℕ) : anomalyLinearN n = 0 := by
  have hbij : (∑ S : Finset (Fin n), blfN n Sᶜ) = (∑ S : Finset (Fin n), blfN n S) :=
    Equiv.sum_comp (complEquiv n) (fun S => blfN n S)
  have hneg : (∑ S : Finset (Fin n), blfN n Sᶜ) = - (∑ S : Finset (Fin n), blfN n S) := by
    rw [← Finset.sum_neg_distrib]; exact Finset.sum_congr rfl (fun S _ => blfN_compl_odd n S)
  unfold anomalyLinearN; linarith [hbij, hneg]

-- Headline grounded on the banked finrank
theorem generation_anomaly_linear_grounded :
    anomalyLinearN (Module.finrank ℚ Uhol) = 0 :=
  anomalyLinearN_zero _

#check @generation_anomaly_linear_grounded

end Phys.Algebra
