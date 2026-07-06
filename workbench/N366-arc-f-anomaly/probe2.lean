import Phys.Algebra.ChiralGenerationChargeTrace
import Mathlib.Tactic

open scoped BigOperators
open Finset
open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

-- Probe A: the functional grounded to the banked finrank ℚ Uhol.
-- We want the SUM over Finset (Fin (finrank ℚ Uhol)); via finrank_Uhol = 3 it becomes Fin 3.
-- Test that we can rewrite the index type. Approach: state at Fin 3, cite generation_charge_trace's ground.

-- B-L functional on the ladder: leptons |S|∈{0,3} carry ∓1, quarks |S|∈{1,2} carry ±1/3.
-- Realize as bl(S) = (if S.card is 0 then -1 ; 3 then 1 ; 1 then 1/3 ; 2 then -1/3).
-- Cleaner algebraic form: bl(S) = (2*|S| - 3)/3  gives: |S|=0→-1, 1→-1/3, 2→1/3, 3→1.
-- Check: that's the "quark/antiquark" convention; matches Hodge-odd. Use it.
noncomputable def blf (S : Finset (Fin 3)) : ℚ := (2 * (S.card : ℚ) - 3) / 3

example : blf ∅ = -1 := by unfold blf; simp
example : blf (Finset.univ) = 1 := by unfold blf; simp; norm_num
example (S : Finset (Fin 3)) : blf Sᶜ = - blf S := by
  unfold blf
  rw [Finset.card_compl]
  simp only [Fintype.card_fin]
  have hle : S.card ≤ 3 := by simpa using Finset.card_le_univ S
  have : ((3 - S.card : ℕ) : ℚ) = 3 - (S.card : ℚ) := by
    rw [Nat.cast_sub hle]; norm_num
  rw [this]; ring

def complEquiv : Equiv.Perm (Finset (Fin 3)) := ⟨compl, compl, compl_compl, compl_compl⟩

-- linear (grav^2.U(1)) anomaly vanishes
example : (∑ S : Finset (Fin 3), blf S) = 0 := by
  have hodd : ∀ S : Finset (Fin 3), blf Sᶜ = - blf S := by
    intro S; unfold blf
    rw [Finset.card_compl]; simp only [Fintype.card_fin]
    have hle : S.card ≤ 3 := by simpa using Finset.card_le_univ S
    have : ((3 - S.card : ℕ) : ℚ) = 3 - (S.card : ℚ) := by rw [Nat.cast_sub hle]; norm_num
    rw [this]; ring
  have hbij : (∑ S : Finset (Fin 3), blf Sᶜ) = (∑ S : Finset (Fin 3), blf S) :=
    Equiv.sum_comp complEquiv (fun S => blf S)
  have hneg : (∑ S : Finset (Fin 3), blf Sᶜ) = - (∑ S : Finset (Fin 3), blf S) := by
    rw [← Finset.sum_neg_distrib]; exact Finset.sum_congr rfl (fun S _ => hodd S)
  linarith [hbij, hneg]

-- cubic (U(1)^3) anomaly vanishes
example : (∑ S : Finset (Fin 3), (blf S)^3) = 0 := by
  have hodd : ∀ S : Finset (Fin 3), blf Sᶜ = - blf S := by
    intro S; unfold blf
    rw [Finset.card_compl]; simp only [Fintype.card_fin]
    have hle : S.card ≤ 3 := by simpa using Finset.card_le_univ S
    have : ((3 - S.card : ℕ) : ℚ) = 3 - (S.card : ℚ) := by rw [Nat.cast_sub hle]; norm_num
    rw [this]; ring
  have hbij : (∑ S : Finset (Fin 3), (blf Sᶜ)^3) = (∑ S : Finset (Fin 3), (blf S)^3) :=
    Equiv.sum_comp complEquiv (fun S => (blf S)^3)
  have hneg : (∑ S : Finset (Fin 3), (blf Sᶜ)^3) = - (∑ S : Finset (Fin 3), (blf S)^3) := by
    rw [← Finset.sum_neg_distrib]; apply Finset.sum_congr rfl; intro S _; rw [hodd S]; ring
  linarith [hbij, hneg]

-- TEETH: removing the nu_R (the ∅ = colour+isospin singlet self-direction, |S|=0) breaks it.
-- Σ_{S ≠ ∅} blf S = (Σ_all) - blf ∅ = 0 - (-1) = 1 ≠ 0.
example : (∑ S ∈ (Finset.univ.erase (∅ : Finset (Fin 3))), blf S) = 1 := by
  have hmem : (∅ : Finset (Fin 3)) ∈ (Finset.univ : Finset (Finset (Fin 3))) := Finset.mem_univ _
  have hsum : (∑ S : Finset (Fin 3), blf S) = 0 := by
    have hodd : ∀ S : Finset (Fin 3), blf Sᶜ = - blf S := by
      intro S; unfold blf
      rw [Finset.card_compl]; simp only [Fintype.card_fin]
      have hle : S.card ≤ 3 := by simpa using Finset.card_le_univ S
      have : ((3 - S.card : ℕ) : ℚ) = 3 - (S.card : ℚ) := by rw [Nat.cast_sub hle]; norm_num
      rw [this]; ring
    have hbij : (∑ S : Finset (Fin 3), blf Sᶜ) = (∑ S : Finset (Fin 3), blf S) :=
      Equiv.sum_comp complEquiv (fun S => blf S)
    have hneg : (∑ S : Finset (Fin 3), blf Sᶜ) = - (∑ S : Finset (Fin 3), blf S) := by
      rw [← Finset.sum_neg_distrib]; exact Finset.sum_congr rfl (fun S _ => hodd S)
    linarith [hbij, hneg]
  have := Finset.sum_erase_add (Finset.univ) blf hmem
  -- this : (∑ S ∈ univ.erase ∅, blf S) + blf ∅ = ∑ S ∈ univ, blf S
  have hbl0 : blf (∅ : Finset (Fin 3)) = -1 := by unfold blf; simp
  rw [hbl0] at this
  linarith [this, hsum]

end Phys.Algebra
