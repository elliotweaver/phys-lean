/-
  Certificates.GaussSilence403 — THE SILENCE of D = -403: every
  deep odd prime (3, 5, 7) is TOTALLY BLOCKED on the
  principal branch x² + x + 101 — deferral_law from the finite checks.
  A kernel-certified member of the total-deferral catalogue (E_1,
  honest 2-channel roster; catalogue ends at 403). AUTO-GENERATED.
-/
import Phys.Algebra.GaussDeferral
import Phys.Algebra.GaussCompose

namespace Certificates.Silence403
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

theorem zcases2 (x : Z) (h0 : 0 ≤ x) (hm : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2 := by
  rcases lt_trichotomy x 0 with ha0 | hb0 | hc0
  · linarith
  · exact Or.inl hb0
  · have hge1 : (1 : Z) ≤ x := by
      have := z_pos_ge_one (show (0:Z) < x - 0 by linarith)
      linarith
    rcases lt_trichotomy x 1 with ha1 | hb1 | hc1
    · linarith
    · exact Or.inr (Or.inl hb1)
    · have hge2 : (2 : Z) ≤ x := by
        have := z_pos_ge_one (show (0:Z) < x - 1 by linarith)
        linarith
      exact Or.inr (Or.inr ((by linarith : x = 2)))

theorem zcases3 (x : Z) (h0 : 0 ≤ x) (hm : x ≤ 3) : x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 := by
  rcases lt_trichotomy x 0 with ha0 | hb0 | hc0
  · linarith
  · exact Or.inl hb0
  · have hge1 : (1 : Z) ≤ x := by
      have := z_pos_ge_one (show (0:Z) < x - 0 by linarith)
      linarith
    rcases lt_trichotomy x 1 with ha1 | hb1 | hc1
    · linarith
    · exact Or.inr (Or.inl hb1)
    · have hge2 : (2 : Z) ≤ x := by
        have := z_pos_ge_one (show (0:Z) < x - 1 by linarith)
        linarith
      rcases lt_trichotomy x 2 with ha2 | hb2 | hc2
      · linarith
      · exact Or.inr (Or.inr (Or.inl hb2))
      · have hge3 : (3 : Z) ≤ x := by
          have := z_pos_ge_one (show (0:Z) < x - 2 by linarith)
          linarith
        exact Or.inr (Or.inr (Or.inr ((by linarith : x = 3))))

/-- 3 never divides x² + x + 101 — from 2 checks. -/
theorem blocked_3 : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 101) := by
  apply deferral_law (m := 1) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1
  rcases hx with rfl | rfl
  · -- P(0) = 101: 3 ∤ 101
    have h2 : 3 * (k - 33) = 2 := by linarith
    rcases lt_trichotomy (k - 33) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 33) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 103: 3 ∤ 103
    have h2 : 3 * (k - 34) = 1 := by linarith
    rcases lt_trichotomy (k - 34) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 34) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- 5 never divides x² + x + 101 — from 3 checks. -/
theorem blocked_5 : ∀ x : Z, ¬ ZDvd' 5 (x * x + x + 101) := by
  apply deferral_law (m := 2) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 ∨ x' = 2 := zcases2 x' h0 h1
  rcases hx with rfl | rfl | rfl
  · -- P(0) = 101: 5 ∤ 101
    have h2 : 5 * (k - 20) = 1 := by linarith
    rcases lt_trichotomy (k - 20) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 20) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 103: 5 ∤ 103
    have h2 : 5 * (k - 20) = 3 := by linarith
    rcases lt_trichotomy (k - 20) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 20) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(2) = 107: 5 ∤ 107
    have h2 : 5 * (k - 21) = 2 := by linarith
    rcases lt_trichotomy (k - 21) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 21) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- 7 never divides x² + x + 101 — from 4 checks. -/
theorem blocked_7 : ∀ x : Z, ¬ ZDvd' 7 (x * x + x + 101) := by
  apply deferral_law (m := 3) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 ∨ x' = 2 ∨ x' = 3 := zcases3 x' h0 h1
  rcases hx with rfl | rfl | rfl | rfl
  · -- P(0) = 101: 7 ∤ 101
    have h2 : 7 * (k - 14) = 3 := by linarith
    rcases lt_trichotomy (k - 14) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 14) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 103: 7 ∤ 103
    have h2 : 7 * (k - 14) = 5 := by linarith
    rcases lt_trichotomy (k - 14) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 14) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(2) = 107: 7 ∤ 107
    have h2 : 7 * (k - 15) = 2 := by linarith
    rcases lt_trichotomy (k - 15) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 15) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(3) = 113: 7 ∤ 113
    have h2 : 7 * (k - 16) = 1 := by linarith
    rcases lt_trichotomy (k - 16) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 16) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- THE SILENCE: every deep odd prime of D = -403 is blocked. -/
theorem silence : ∀ p : Z, (p = 3 ∨ p = 5 ∨ p = 7) →
    ∀ x : Z, ¬ ZDvd' p (x * x + x + 101) := by
  intro p hp x
  rcases hp with rfl | rfl | rfl
  · exact blocked_3 x
  · exact blocked_5 x
  · exact blocked_7 x

#print axioms silence

end Certificates.Silence403
