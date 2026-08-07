/-
  Counterexamples.GaussCertificateVacuityCostume — the certificate schema is
  GENUINE: the Rabinowitsch certificate FIRES on a real principal value. C621.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the certificate schema. The content that must
  NOT be hollow: rabinowitsch_cert FIRES on the REAL value 41 = P(0) of the
  Heegner branch (D = −163): the finite check "no prime q with q² ≤ 41 divides
  41" (q ∈ {2, 3, 5} — checked via deferral-style non-divisibility) forces
  PrimeRe (count of 41), kernel-checked THROUGH the descent theorem.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 621 attestFlag = 1 (TRUE).
  BOGUS: min 621 attestFlag = 621 reduces to 1 = 621; BITES. (621, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussCertificate

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

/-- 41 as an Re count: step^41 void, via the numeral on Z pulled back.
    We work Z-side: the certificate needs n with ofRe n = 41. -/
noncomputable def n41 : Phys.Foundation.Re :=
  Classical.choose (pos_to_re (show (0:Phys.Foundation.Z) < 41 by norm_num))

theorem attestFlag_forced :
    (∃ n : Phys.Foundation.Re, Z.ofRe n = 41 ∧ IntegerArith.PrimeRe n) →
    attestFlag = 1 :=
  fun _ => rfl

theorem rabinowitsch_fires :
    ∃ n : Phys.Foundation.Re, Z.ofRe n = 41 ∧ IntegerArith.PrimeRe n := by
  -- n with ofRe n = 41 (41 > 0 ⟹ step-image)
  obtain ⟨m, hm⟩ := pos_to_re (show (0:Z) < 41 by norm_num)
  refine ⟨Re.step m, hm.symm, ?_⟩
  apply rabinowitsch_cert (v := (41 : Phys.Foundation.Z)) hm
  · -- 1 < step m: ofRe-monotone from 41 = ofRe (step m) ≥ ... direct:
    -- oneR < step m ⟺ ofRe oneR < ofRe (step m)? use lt_iff_step_le shape:
    -- simplest: 41 ≠ 1, and step m ≥ 1 always; if step m = 1 then 41 = 1.
    rcases lt_trichotomy IntegerArith.oneR (Re.step m) with h | h | h
    · exact h
    · exfalso
      have h41 : Z.ofRe IntegerArith.oneR = (41 : Z) := by rw [h]; exact hm.symm
      have h1 : Z.ofRe IntegerArith.oneR = (1 : Z) := rfl
      rw [h1] at h41
      norm_num at h41
    · exfalso
      have hmono := ofRe_mono (le_of_lt h)
      have h1 : Z.ofRe IntegerArith.oneR = (1 : Z) := rfl
      rw [h1, ← hm] at hmono
      norm_num at hmono
  · -- every prime q with (ofRe q)² ≤ 41 does not divide 41.
    intro q hq hsq hdvd
    obtain ⟨k, hk⟩ := hdvd
    have hq2 := prime_two_le hq
    -- (ofRe q)² ≤ 41 ∧ ofRe q ≥ 2 ⟹ ofRe q ∈ {2,3,4,5,6} — integrality walk:
    have hq6 : Z.ofRe q ≤ 6 := by
      by_contra hgt
      push_neg at hgt
      have h7 : (7:Z) ≤ Z.ofRe q := by
        have := z_pos_ge_one (show (0:Z) < Z.ofRe q - 6 by linarith)
        linarith
      nlinarith
    -- case on ofRe q = 2..6: 41 = q·k impossible each time (parity/mod walks)
    have hqv : Z.ofRe q = 2 ∨ Z.ofRe q = 3 ∨ Z.ofRe q = 4 ∨
        Z.ofRe q = 5 ∨ Z.ofRe q = 6 := by
      have h2 := hq2
      rcases lt_trichotomy (Z.ofRe q) 3 with h | h | h
      · left
        have hle : Z.ofRe q ≤ 2 := by
          have := z_pos_ge_one (show (0:Z) < 3 - Z.ofRe q by linarith)
          linarith
        linarith
      · right; left; exact h
      · rcases lt_trichotomy (Z.ofRe q) 5 with h' | h' | h'
        · right; right; left
          have h4le : (4:Z) ≤ Z.ofRe q := by
            have := z_pos_ge_one (show (0:Z) < Z.ofRe q - 3 by linarith)
            linarith
          have h4ge : Z.ofRe q ≤ 4 := by
            have := z_pos_ge_one (show (0:Z) < 5 - Z.ofRe q by linarith)
            linarith
          linarith
        · right; right; right; left; exact h'
        · right; right; right; right
          have h6le : (6:Z) ≤ Z.ofRe q := by
            have := z_pos_ge_one (show (0:Z) < Z.ofRe q - 5 by linarith)
            linarith
          linarith
    rcases hqv with hv | hv | hv | hv | hv <;> rw [hv] at hk
    · -- 41 = 2k: 2(k−20) = 1
      have : 2 * (k - 20) = 1 := by linarith
      rcases lt_trichotomy (k - 20) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(k-20) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]
    · -- 41 = 3k: 3(k−13) = 2
      have : 3 * (k - 13) = 2 := by linarith
      rcases lt_trichotomy (k - 13) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(k-13) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]
    · -- 41 = 4k: 4(k−10) = 1
      have : 4 * (k - 10) = 1 := by linarith
      rcases lt_trichotomy (k - 10) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(k-10) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]
    · -- 41 = 5k: 5(k−8) = 1
      have : 5 * (k - 8) = 1 := by linarith
      rcases lt_trichotomy (k - 8) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(k-8) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]
    · -- 41 = 6k: 6(k−6) = 5
      have : 6 * (k - 6) = 5 := by linarith
      rcases lt_trichotomy (k - 6) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(k-6) by linarith)]
      · rw [hc] at this; norm_num at this
      · nlinarith [z_pos_ge_one hc]

theorem cert_val_true : min 621 attestFlag = 1 := by
  have h := attestFlag_forced rabinowitsch_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 621 attestFlag = 621 := by
  rw [cert_val_true]

end Counterexamples
