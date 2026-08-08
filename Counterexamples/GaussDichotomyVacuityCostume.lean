/-
  Counterexamples.GaussDichotomyVacuityCostume — the dichotomy is GENUINE:
  it FORCES the divide conclusion against a real touching prime. C651.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the dichotomy. The content that must NOT
  be hollow: small_h_dichotomy must FORCE — at D = −59 (3 touches, 3 ∤ 59,
  h = 3): IF a complete duplicate-free box had length ≤ 3 AND 59 were ≥
  4·3^8 = 26244, THEN 3 | −59 — which is FALSE, so the hypothesis pair is
  impossible: the costume derives the CONTRAPOSITIVE — no complete box of
  −59 with length ≤ 3 coexists with 59 ≥ 26244 (trivially, 59 < 26244 —
  but the KERNEL ROUTE walks the full dichotomy: squeeze → base-mono →
  the forced divide, and the conclusion 3 | −59 is REFUTED by explicit
  arithmetic, closing the loop as designed-to-fire-and-bite).
  Honest firing shape: derive (59 ≥ 26244 → False) THROUGH the dichotomy
  (given h ≤ 3): dichotomy gives 3 | −59; the parity kill refutes; hence
  the big-disc hypothesis dies — the theorem's teeth on real numbers.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 651 attestFlag = 1 (TRUE).
  BOGUS: min 651 attestFlag = 651 reduces to 1 = 651; BITES. (651, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussDichotomy

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

def threeD : Re := Re.step (Re.step (Re.step Re.void))

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 15 →
        f ∈ box) →
      box.length ≤ 3 →
      4 * (zqpow 3 4 * zqpow 3 4) ≤ (59 : Z) → False)) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_threeD : Z.ofRe threeD = (3 : Z) := by
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
theorem prime_threeD : PrimeRe threeD := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step Re.void, ?_⟩
    show threeD = Re.step oneR + Re.step Re.void
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    have hz : Z.ofRe d * Z.ofRe c = (3 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_threeD]
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
      exact ofRe_threeD.symm

/-- The dichotomy's teeth: at D = −59, small box + big disc is dead —
    because the forced conclusion 3 | −59 is refuted. -/
theorem dichotomy_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 15 →
      f ∈ box) →
    box.length ≤ 3 →
    4 * (zqpow 3 4 * zqpow 3 4) ≤ (59 : Z) → False := by
  intro box hpw hcomplete hH hbig
  have hdvd := small_h_dichotomy (c₀ := 15) (A := 59) (Q := 3) (H := 3)
    (by norm_num) box hpw hcomplete hH hbig
    3 threeD ofRe_threeD.symm prime_threeD (by norm_num) (by norm_num)
    0 5 (by norm_num)
  -- 3 | −59 refuted
  obtain ⟨c, hc⟩ := hdvd
  have h3 : 3 * (c + 20) = 1 := by linarith
  rcases lt_trichotomy (c + 20) 0 with hcc | hcc | hcc
  · nlinarith [z_pos_ge_one (show (0:Z) < -(c+20) by linarith)]
  · rw [hcc] at h3; norm_num at h3
  · nlinarith [z_pos_ge_one hcc]

theorem cert_val_true : min 651 attestFlag = 1 := by
  have h := attestFlag_forced dichotomy_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 651 attestFlag = 651 := by
  rw [cert_val_true]

end Counterexamples
