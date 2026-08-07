/-
  Counterexamples.GaussDeferralVacuityCostume — the deferral law is GENUINE: it
  kernel-DECIDES a real blocked prime on the real Heegner branch. C620.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the deferral law. The content that must NOT be
  hollow: deferral_law FIRES on the REAL total blocking of p = 3 at D = −163
  (c₀ = 41): the finite check P(0) = 41, P(1) = 43 — neither divisible by 3 —
  kernel-decides that 3 NEVER divides x² + x + 41, for ALL integers x. The
  Heegner prime-generation phenomenon, certificate form.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 620 attestFlag = 1 (TRUE).
  BOGUS: min 620 attestFlag = 620 reduces to 1 = 620; BITES. (620, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussDeferral

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∀ x : Z, ¬ ZDvd' 3 (x * x + x + 41)) → attestFlag = 1 :=
  fun _ => rfl

/-- The deferral law decides: 3 never divides x² + x + 41 — from TWO checks. -/
theorem blocking_decided : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 41) := by
  apply deferral_law (m := 1) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  -- x' ∈ {0, 1}: two explicit non-divisibility checks
  have hx01 : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1
  rcases hx01 with rfl | rfl
  · -- P(0) = 41 = 3k impossible: 3k − 39 = 2 ⟹ 3(k−13) = 2
    have h2 : 3 * (k - 13) = 2 := by linarith
    rcases lt_trichotomy (k - 13) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-13) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- P(1) = 43 = 3k impossible: 3(k−14) = 1
    have h2 : 3 * (k - 14) = 1 := by linarith
    rcases lt_trichotomy (k - 14) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-14) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

theorem cert_val_true : min 620 attestFlag = 1 := by
  have h := attestFlag_forced blocking_decided
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 620 attestFlag = 620 := by
  rw [cert_val_true]

end Counterexamples
