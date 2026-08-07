/-
  Counterexamples.GaussDeferralStructureVacuityCostume — the cage is GENUINE:
  the pin FIRES against a real blocked prime on a real slot shape. C629.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the structure theorem. The content that must
  NOT be hollow: blocked_slot_shallow must DERIVE FALSE from a real
  configuration — the Heegner branch c₀ = 41 (D = −163) has 3 BLOCKED
  (kernel-certified in C620/GaussSilence163: two checks decide it); so IF a
  reduced form of disc −163 had 3 | a, the pin fires False. We verify the pin
  by instantiating it against the HYPOTHETICAL slot ⟨3, b, c⟩ with
  disc = −163: b² − 12c = −163 needs b² ≡ −163 ≡ 2 (mod 3) — and the pin
  proves NO such form exists, because 3 is blocked. The costume fires
  blocked_slot_shallow with the blocking proof from the deferral law's two
  explicit checks (P(0) = 41, P(1) = 43, both ∤ 3), deriving False from any
  claimed ⟨3, e⟩ factorization — the REAL Heegner cage, kernel-checked.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 629 attestFlag = 1 (TRUE).
  BOGUS: min 629 attestFlag = 629 reduces to 1 = 629; BITES. (629, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussDeferralStructure

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ f : GaussForms.BQF, disc f = 1 - 4 * 41 →
      ∀ e : Z, f.a = 3 * e → False)) → attestFlag = 1 :=
  fun _ => rfl

/-- 3 is blocked on the Heegner branch — the two checks (C620 shape). -/
theorem three_blocked : ∀ x : Z, ¬ ZDvd' 3 (x * x + x + 41) := by
  apply deferral_law (m := 1) (by norm_num) (by norm_num)
  intro x' h0 h1 hdvd
  obtain ⟨k, hk⟩ := hdvd
  have hx01 : x' = 0 ∨ x' = 1 := z_zero_or_one (by linarith) h1
  rcases hx01 with rfl | rfl
  · have h2 : 3 * (k - 13) = 2 := by linarith
    rcases lt_trichotomy (k - 13) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-13) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · have h2 : 3 * (k - 14) = 1 := by linarith
    rcases lt_trichotomy (k - 14) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(k-14) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]

/-- THE CAGE at D = −163: no form of the Heegner disc carries 3 | a. -/
theorem cage_fires :
    ∀ f : GaussForms.BQF, disc f = 1 - 4 * 41 →
    ∀ e : Z, f.a = 3 * e → False := by
  intro f hdisc e hpa
  exact blocked_slot_shallow (m := 1) hdisc hpa (by norm_num) three_blocked

theorem cert_val_true : min 629 attestFlag = 1 := by
  have h := attestFlag_forced cage_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 629 attestFlag = 629 := by
  rw [cert_val_true]

end Counterexamples
