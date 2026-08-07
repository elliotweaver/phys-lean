/-
  Certificates.GaussSilence187 — THE SILENCE of D = -187: every
  deep odd prime (3, 5) is TOTALLY BLOCKED on the
  principal branch x² + x + 47 — deferral_law from the finite checks.
  A kernel-certified member of the total-deferral catalogue (E_1,
  honest 2-channel roster; catalogue ends at 403). AUTO-GENERATED.
-/
import Phys.Algebra.GaussDeferral
import Phys.Algebra.GaussCompose

namespace Certificates.Silence187
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

theorem zcases2 (x : Z) (h0 : 0 ≤ x) (hm : x ≤ 2) : x = 0 ∨ x = 1 ∨ x = 2 := by
  rcases lt_trichotomy x 0 with ha0 | hb0 | hc0
  · linarith
  · exact (Or.inl hb0)
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

/-- 3 never divides x² + x + 47 — from 2 checks. -/
theorem blocked_3 : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 47) := by
  apply deferral_law (m := 1) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1
  rcases hx with rfl | rfl
  · -- P(0) = 47: 3 ∤ 47
    have h2 : 3 * (k - 15) = 2 := by linarith
    rcases lt_trichotomy (k - 15) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 15) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 49: 3 ∤ 49
    have h2 : 3 * (k - 16) = 1 := by linarith
    rcases lt_trichotomy (k - 16) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 16) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- 5 never divides x² + x + 47 — from 3 checks. -/
theorem blocked_5 : ∀ x : Z, ¬ ZDvd' 5 (x * x + x + 47) := by
  apply deferral_law (m := 2) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 ∨ x' = 2 := zcases2 x' h0 h1
  rcases hx with rfl | rfl | rfl
  · -- P(0) = 47: 5 ∤ 47
    have h2 : 5 * (k - 9) = 2 := by linarith
    rcases lt_trichotomy (k - 9) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 9) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 49: 5 ∤ 49
    have h2 : 5 * (k - 9) = 4 := by linarith
    rcases lt_trichotomy (k - 9) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 9) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(2) = 53: 5 ∤ 53
    have h2 : 5 * (k - 10) = 3 := by linarith
    rcases lt_trichotomy (k - 10) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 10) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- THE SILENCE: every deep odd prime of D = -187 is blocked. -/
theorem silence : ∀ p : Z, (p = 3 ∨ p = 5) →
    ∀ x : Z, ¬ ZDvd' p (x * x + x + 47) := by
  intro p hp x
  rcases hp with rfl | rfl
  · exact blocked_3 x
  · exact blocked_5 x

#print axioms silence

end Certificates.Silence187
