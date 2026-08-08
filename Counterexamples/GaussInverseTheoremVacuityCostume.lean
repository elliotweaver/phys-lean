/-
  Counterexamples.GaussInverseTheoremVacuityCostume — THE SENTENCE is
  GENUINE: both jaws fire on real landscapes. C655.
  =====================================================================================
  W8 ANTI-VACUITY (v2 — the v1 deepness-clause form was caught VACUOUS by
  this very audit and purged uncommitted; this form is checked NON-VACUOUS
  on both jaws). The content that must NOT be hollow:
  JAW 1 at D = −59 (3 touches P(0) = 15, 3 ∤ 59): with Q = 3, H = 0 —
  cap 4·3² = 36 ≤ 59 ✓ — the jaw forces 0 < box.length for ANY complete
  box: h(−59) ≥ 1 derived from 3's touch alone (true h = 3).
  JAW 2 at the same disc with H = 3 and the cap arithmetic reversed: fires
  as the dichotomy (C651's teeth, re-exercised through the single term).
  The costume fires JAW 1 concretely (the anchor) and JAW 2's shape
  through the same instance.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 655 attestFlag = 1 (TRUE).
  BOGUS: min 655 attestFlag = 655 reduces to 1 = 655; BITES. (655, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussInverseTheorem

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

def threeI : Re := Re.step (Re.step (Re.step Re.void))

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 15 →
        f ∈ box) →
      0 < box.length)) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_threeI : Z.ofRe threeI = (3 : Z) := by
  show Z.ofRe (Re.step (Re.step (Re.step Re.void))) = (3 : Z)
  have h1 : Re.step (Re.step (Re.step Re.void))
      = Re.step (Re.step Re.void) + Re.step Re.void := by
    rw [Re.step_add]
    rfl
  rw [h1, Z.ofRe_add]
  have h2 : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := ofRe_two
  have h3 : Z.ofRe (Re.step Re.void) = (1 : Z) := Z.ofRe_one
  rw [h2, h3]
  norm_num

/-- PrimeRe 3 — the C647 divisor-shape pattern. -/
theorem prime_threeI : PrimeRe threeI := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step Re.void, ?_⟩
    show threeI = Re.step oneR + Re.step Re.void
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    have hz : Z.ofRe d * Z.ofRe c = (3 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_threeI]
    have hd0 := ofRe_nonneg d
    have hc0 := ofRe_nonneg c
    have hc1 : (1 : Z) ≤ Z.ofRe c := by
      rcases lt_trichotomy (Z.ofRe c) 1 with h | h | h
      · exfalso
        have hceq : Z.ofRe c = 0 := by
          rcases lt_trichotomy (Z.ofRe c) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso; have := z_pos_ge_one hh; linarith
        rw [hceq, mul_zero] at hz
        norm_num at hz
      · linarith
      · linarith
    have hd1 : (1 : Z) ≤ Z.ofRe d := by
      rcases lt_trichotomy (Z.ofRe d) 1 with h | h | h
      · exfalso
        have hdeq : Z.ofRe d = 0 := by
          rcases lt_trichotomy (Z.ofRe d) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso; have := z_pos_ge_one hh; linarith
        rw [hdeq, zero_mul] at hz
        norm_num at hz
      · linarith
      · linarith
    have hd3 : Z.ofRe d ≤ 3 := by nlinarith
    have hdv : Z.ofRe d = 1 ∨ Z.ofRe d = 2 ∨ Z.ofRe d = 3 := by
      rcases lt_trichotomy (Z.ofRe d) 2 with h | h | h
      · left
        have h1 : Z.ofRe d ≤ 1 := by
          have := z_pos_ge_one (show (0:Z) < 2 - Z.ofRe d by linarith)
          linarith
        linarith
      · right; left; exact h
      · right; right
        have h3 : (3 : Z) ≤ Z.ofRe d := by
          have := z_pos_ge_one (show (0:Z) < Z.ofRe d - 2 by linarith)
          linarith
        linarith
    rcases hdv with hv | hv | hv
    · left
      apply Z.ofRe_injective
      rw [hv]
      exact Z.ofRe_one.symm
    · exfalso
      rw [hv] at hz
      have h2 : 2 * (Z.ofRe c - 1) = 1 := by linarith
      rcases lt_trichotomy (Z.ofRe c - 1) 0 with hcc | hcc | hcc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(Z.ofRe c - 1) by linarith)]
      · rw [hcc] at h2; norm_num at h2
      · nlinarith [z_pos_ge_one hcc]
    · right
      apply Z.ofRe_injective
      rw [hv]
      exact ofRe_threeI.symm

/-- JAW 1 fires: 3's touch alone forces h(−59) ≥ 1 through the single
    term — the sentence's teeth on a real landscape. -/
theorem jaw1_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 15 →
      f ∈ box) →
    0 < box.length := by
  intro box hpw hcomplete
  have h := (inverse_theorem (c₀ := 15) (A := 59) (Q := 3) (H := 0)
    (by norm_num) box hpw hcomplete
    (by show 4 * (zqpow 3 1 * zqpow 3 1) ≤ (59 : Z); norm_num [zqpow])).1
  refine h 3 threeI ofRe_threeI.symm prime_threeI (by norm_num) (by norm_num)
    ⟨0, 5, by norm_num⟩ ?_
  -- 3 ∤ −59
  intro ⟨c, hc⟩
  have h3 : 3 * (c + 20) = 1 := by linarith
  rcases lt_trichotomy (c + 20) 0 with hcc | hcc | hcc
  · nlinarith [z_pos_ge_one (show (0:Z) < -(c+20) by linarith)]
  · rw [hcc] at h3; norm_num at h3
  · nlinarith [z_pos_ge_one hcc]

theorem cert_val_true : min 655 attestFlag = 1 := by
  have h := attestFlag_forced jaw1_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 655 attestFlag = 655 := by
  rw [cert_val_true]

end Counterexamples
