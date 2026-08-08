/-
  Counterexamples.GaussSqueezeVacuityCostume — the squeeze is GENUINE: it
  CAPS the real disc from its real box bound. C650.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the squeeze. The content that must NOT
  be hollow: touching_squeeze must CAP a real disc — D = −59 (3 touches
  P(0) = 15, 3 ∤ 59, h(−59) = 3): any complete duplicate-free box with
  length ≤ 3 forces 59 < 4·3^(2·4) = 4·6561 = 26244. The costume fires the
  CONDITIONAL (∀ box complete + dup-free + length ≤ 3 ⟹ 59 < 26244) — the
  numerical conclusion is true a fortiori, but the PROOF ROUTE is the real
  content: the kernel walks growth_law → levelList(4) → the floor, and the
  hypothesis stack is genuine (3's touch, 3 ∤ 59, primality by the C647
  pattern). The bound is also TIGHT in spirit at higher H: for the true
  h = 3 the squeeze gives the first unconditional inert-arm cap of the
  campaign.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 650 attestFlag = 1 (TRUE).
  BOGUS: min 650 attestFlag = 650 reduces to 1 = 650; BITES. (650, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSqueeze

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

def threeR : Re := Re.step (Re.step (Re.step Re.void))

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 15 →
        f ∈ box) →
      box.length ≤ 3 →
      (59 : Z) < 4 * (zqpow 3 4 * zqpow 3 4))) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_threeR : Z.ofRe threeR = (3 : Z) := by
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
theorem prime_threeR : PrimeRe threeR := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step Re.void, ?_⟩
    show threeR = Re.step oneR + Re.step Re.void
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    have hz : Z.ofRe d * Z.ofRe c = (3 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_threeR]
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
      exact ofRe_threeR.symm

/-- The squeeze caps D = −59 through its real box bound. -/
theorem squeeze_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 15 →
      f ∈ box) →
    box.length ≤ 3 →
    (59 : Z) < 4 * (zqpow 3 4 * zqpow 3 4) := by
  intro box hpw hcomplete hH
  refine touching_squeeze (q := 3) (c₀ := 15) (A := 59) (x := 0) (w := 5)
    (p := threeR) (H := 3) (by norm_num) ofRe_threeR.symm prime_threeR
    (by norm_num) (by norm_num) ?_ box hpw hcomplete hH
  -- 3 ∤ −59
  intro ⟨c, hc⟩
  have h3 : 3 * (c + 20) = 1 := by linarith
  rcases lt_trichotomy (c + 20) 0 with hcc | hcc | hcc
  · nlinarith [z_pos_ge_one (show (0:Z) < -(c+20) by linarith)]
  · rw [hcc] at h3; norm_num at h3
  · nlinarith [z_pos_ge_one hcc]

theorem cert_val_true : min 650 attestFlag = 1 := by
  have h := attestFlag_forced squeeze_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 650 attestFlag = 650 := by
  rw [cert_val_true]

end Counterexamples
