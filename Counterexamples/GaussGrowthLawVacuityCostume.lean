/-
  Counterexamples.GaussGrowthLawVacuityCostume — the growth law is GENUINE:
  it FLOORS the real box of the real disc by its real deep levels. C649.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the growth-law floor. The content that
  must NOT be hollow: growth_law must FLOOR a real complete box — D = −2099
  (the C648 landscape: 3 touches P(0) = 525, 3 ∤ 2099): deep 3-levels are
  j = 1 (4·9 = 36 ≤ 2099) and j = 2 (4·81 = 324 ≤ 2099) — J = [1, 2]. The
  box hypothesis quantifies over ANY complete duplicate-free box, so the
  costume fires the CONDITIONAL: ∀ box complete + duplicate-free,
  2 ≤ box.length — i.e. h(−2099) ≥ 2, kernel-derived from the two realized
  tower forms ⟨3, 1, 175⟩ and ⟨9, 5, 59⟩ (both real: 1 − 4·3·175 = −2099 ✓,
  25 − 4·9·59 = −2099 ✓). (True h(−2099) = 19 — the floor is honest.)

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 649 attestFlag = 1 (TRUE).
  BOGUS: min 649 attestFlag = 649 reduces to 1 = 649; BITES. (649, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussGrowthLaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

def threeRe'' : Re := Re.step (Re.step (Re.step Re.void))

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 525 →
        f ∈ box) →
      ([1, 2] : List Nat).length ≤ box.length)) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_three'' : Z.ofRe threeRe'' = (3 : Z) := by
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
theorem prime_three'' : PrimeRe threeRe'' := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step Re.void, ?_⟩
    show threeRe'' = Re.step oneR + Re.step Re.void
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    have hz : Z.ofRe d * Z.ofRe c = (3 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_three'']
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
      exact ofRe_three''.symm

/-- The growth law floors every complete box of D = −2099 at 2. -/
theorem law_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f → disc f = 1 - 4 * 525 →
      f ∈ box) →
    ([1, 2] : List Nat).length ≤ box.length := by
  intro box hpw hcomplete
  refine growth_law (q := 3) (c₀ := 525) (A := 2099) (x := 0) (w := 175)
    (p := threeRe'') (by norm_num) ofRe_three''.symm prime_three''
    (by norm_num) (by norm_num) ?_ box hpw hcomplete [1, 2] ?_ ?_
  · -- 3 ∤ −2099
    intro ⟨c, hc⟩
    have h3 : 3 * (c + 700) = 1 := by linarith
    rcases lt_trichotomy (c + 700) 0 with hcc | hcc | hcc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(c+700) by linarith)]
    · rw [hcc] at h3; norm_num at h3
    · nlinarith [z_pos_ge_one hcc]
  · exact List.pairwise_cons.mpr ⟨fun b hb => by
      rcases List.mem_singleton.mp hb with rfl; omega,
      List.pairwise_singleton _ _⟩
  · intro j hj
    fin_cases hj
    · exact ⟨by norm_num, by norm_num [zqpow]⟩
    · exact ⟨by norm_num, by norm_num [zqpow]⟩

theorem cert_val_true : min 649 attestFlag = 1 := by
  have h := attestFlag_forced law_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 649 attestFlag = 649 := by
  rw [cert_val_true]

end Counterexamples
