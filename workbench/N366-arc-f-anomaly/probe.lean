import Mathlib.Tactic

open scoped BigOperators
open Finset

-- Probe 1: card of complement in Finset (Fin 3)
example (S : Finset (Fin 3)) : Sᶜ.card = 3 - S.card := by
  rw [Finset.card_compl]
  simp

-- Probe 2: card S ≤ 3
example (S : Finset (Fin 3)) : S.card ≤ 3 := by
  have := Finset.card_le_univ S
  simpa using this

-- Probe 3: complement fixed-point-free (Sᶜ ≠ S)
example (S : Finset (Fin 3)) : Sᶜ ≠ S := by
  intro h
  have hc : Sᶜ.card = S.card := by rw [h]
  rw [Finset.card_compl] at hc
  simp only [Fintype.card_fin] at hc
  have hle : S.card ≤ 3 := by simpa using Finset.card_le_univ S
  omega

-- Probe 4: centered charge functional is complement-odd
noncomputable def qc (S : Finset (Fin 3)) : ℚ := (S.card : ℚ) / 3 - 1/2

example (S : Finset (Fin 3)) : qc Sᶜ = - qc S := by
  unfold qc
  rw [Finset.card_compl]
  simp only [Fintype.card_fin]
  have hle : S.card ≤ 3 := by simpa using Finset.card_le_univ S
  have : ((3 - S.card : ℕ) : ℚ) = 3 - (S.card : ℚ) := by
    rw [Nat.cast_sub hle]; norm_num
  rw [this]; ring

-- Probe 5: odd-moment vanishing via reindex by the compl bijection.
-- Σ qc(S)^3 = Σ qc(Sᶜ)^3 (reindex) = Σ (-qc S)^3 = -Σ qc(S)^3 ⟹ 2Σ=0 ⟹ Σ=0
def complEquiv : Equiv.Perm (Finset (Fin 3)) :=
  ⟨compl, compl, compl_compl, compl_compl⟩

example : (∑ S : Finset (Fin 3), (qc S)^3) = 0 := by
  have hodd : ∀ S : Finset (Fin 3), qc Sᶜ = - qc S := by
    intro S
    unfold qc
    rw [Finset.card_compl]
    simp only [Fintype.card_fin]
    have hle : S.card ≤ 3 := by simpa using Finset.card_le_univ S
    have : ((3 - S.card : ℕ) : ℚ) = 3 - (S.card : ℚ) := by
      rw [Nat.cast_sub hle]; norm_num
    rw [this]; ring
  -- reindex by compl (an involution on Finset (Fin 3))
  have hbij : (∑ S : Finset (Fin 3), (qc Sᶜ)^3) = (∑ S : Finset (Fin 3), (qc S)^3) :=
    Equiv.sum_comp complEquiv (fun S => (qc S)^3)
  have hneg : (∑ S : Finset (Fin 3), (qc Sᶜ)^3) = - (∑ S : Finset (Fin 3), (qc S)^3) := by
    rw [← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro S _
    rw [hodd S]; ring
  linarith [hbij, hneg]
