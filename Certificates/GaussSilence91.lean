/-
  Certificates.GaussSilence91 — THE SILENCE of D = -91: every
  deep odd prime (3) is TOTALLY BLOCKED on the
  principal branch x² + x + 23 — deferral_law from the finite checks.
  A kernel-certified member of the total-deferral catalogue (E_1,
  honest 2-channel roster; catalogue ends at 403). AUTO-GENERATED.
-/
import Phys.Algebra.GaussDeferral
import Phys.Algebra.GaussCompose

namespace Certificates.Silence91
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

/-- 3 never divides x² + x + 23 — from 2 checks. -/
theorem blocked_3 : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 23) := by
  apply deferral_law (m := 1) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1
  rcases hx with rfl | rfl
  · -- P(0) = 23: 3 ∤ 23
    have h2 : 3 * (k - 7) = 2 := by linarith
    rcases lt_trichotomy (k - 7) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 7) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 25: 3 ∤ 25
    have h2 : 3 * (k - 8) = 1 := by linarith
    rcases lt_trichotomy (k - 8) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k - 8) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- THE SILENCE: every deep odd prime of D = -91 is blocked. -/
theorem silence : ∀ p : Z, (p = 3) →
    ∀ x : Z, ¬ ZDvd' p (x * x + x + 23) := by
  intro p hp x
  rcases hp with rfl
  · exact blocked_3 x

#print axioms silence

end Certificates.Silence91
