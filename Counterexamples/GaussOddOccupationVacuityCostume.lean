/-
  Counterexamples.GaussOddOccupationVacuityCostume — the odd occupation is
  GENUINE: it PRODUCES the real 3-power form of the real disc. C648.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the odd occupation. The content that must
  NOT be hollow: odd_tower_realized must PRODUCE a reduced form with a = 9 =
  3² at a REAL disc where 3 touches and 3² is deep. D = −59: 3 touches
  (P(0) = 15 = 3·5), 3 ∤ 59, and 4·81 = 324 > 59 — 9 NOT deep at 59. Honest
  instance: D = −2099 (2099 = 4·525 − 1, c₀ = 525 = 3·175: 3 touches at
  x = 0 (P(0) = 525 = 3·175); 3 | 525 but 3 ∤ 2099? 2099 = 3·699+2 ✓;
  4·81 = 324 ≤ 2099 ✓ (9 deep); 2099 prime? irrelevant — fundamental-ness
  not needed by the theorem). The theorem yields a reduced PosDef form of
  disc −2099 with a = 9. Independent: b odd in (−9, 9] with 36 | b²+2099:
  b = 5: 25+2099 = 2124 = 36·59 ✓ — the witness ⟨9, 5, 59⟩ (disc 25 − 4·9·59
  = 25 − 2124 = −2099 ✓, reduced −9 < 5 ≤ 9 ≤ 59 ✓).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 648 attestFlag = 1 (TRUE).
  BOGUS: min 648 attestFlag = 648 reduces to 1 = 648; BITES. (648, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussOddOccupation

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

def threeRe' : Re := Re.step (Re.step (Re.step Re.void))

theorem attestFlag_forced :
    ((∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = 1 - 4 * 525 ∧ f.a = zqpow 3 2)) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_three' : Z.ofRe threeRe' = (3 : Z) := by
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
theorem prime_three' : PrimeRe threeRe' := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step Re.void, ?_⟩
    show threeRe' = Re.step oneR + Re.step Re.void
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    have hz : Z.ofRe d * Z.ofRe c = (3 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_three']
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
      exact ofRe_three'.symm

/-- The odd occupation produces the 9-form of D = −2099. -/
theorem occupation_fires :
    ∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = 1 - 4 * 525 ∧ f.a = zqpow 3 2 := by
  refine odd_tower_realized (q := 3) (c₀ := 525) (A := 2099) (x := 0)
    (w := 175) (p := threeRe') (by norm_num) ofRe_three'.symm prime_three'
    (by norm_num) (by norm_num) ?_ 2 (by norm_num) ?_
  · -- 3 ∤ −2099
    intro ⟨c, hc⟩
    have h3 : 3 * (c + 700) = 1 := by linarith
    rcases lt_trichotomy (c + 700) 0 with hcc | hcc | hcc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(c+700) by linarith)]
    · rw [hcc] at h3; norm_num at h3
    · nlinarith [z_pos_ge_one hcc]
  · -- 4·(3²)² = 324 ≤ 2099
    show 4 * (zqpow 3 2 * zqpow 3 2) ≤ 2099
    norm_num [zqpow]

theorem cert_val_true : min 648 attestFlag = 1 := by
  have h := attestFlag_forced occupation_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 648 attestFlag = 648 := by
  rw [cert_val_true]

end Counterexamples
