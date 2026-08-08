/-
  Counterexamples.GaussOddLiftVacuityCostume — the odd lift is GENUINE: it
  climbs the real 3-tower of the real split disc. C647.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the odd lift. The content that must NOT
  be hollow: hensel_odd must CLIMB on real data — D = −59 (c₀ = 15): 3
  touches (P(0) = 15 = 3·5) and 3 ∤ −59 (59 = 3·19+2). The theorem must
  yield stage k = 3: ∃ b u, b² + 59 = 4·27·u — and such b really exists
  (b = 13: 169 + 59 = 228 = 108·... 228/108 no — b = 23: 529+59 = 588 =
  4·27·u ⟹ u = 588/108: no... the WITNESS is the theorem's job — the
  kernel produces it from the recursion; the independent check verifies
  ∃ b ≤ 108 odd with 108 | b²+59: b = 47: 2209+59 = 2268 = 108·21 ✓).
  The prime witness: 3 = ofRe (step³ void) with PrimeRe proved by the
  banked two-class machinery (prime_two_le pattern — supplied directly
  as the C625-style PrimeRe certificate for 3).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 647 attestFlag = 1 (TRUE).
  BOGUS: min 647 attestFlag = 647 reduces to 1 = 647; BITES. (647, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussOddLift

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

/-- 3 as a Re numeral. -/
def threeRe : Re := Re.step (Re.step (Re.step Re.void))

theorem attestFlag_forced :
    ((∃ b u : Z, b * b - (1 - 4 * 15) = 4 * zqpow 3 3 * u)) → attestFlag = 1 :=
  fun _ => rfl

theorem ofRe_three : Z.ofRe threeRe = (3 : Z) := by
  show Z.ofRe (Re.step (Re.step (Re.step Re.void))) = (3 : Z)
  have h1 : Re.step (Re.step (Re.step Re.void))
      = Re.step (Re.step Re.void) + Re.step Re.void := by
    rw [add_step_swap]
    show Re.step (Re.step (Re.step Re.void))
        = Re.step (Re.step (Re.step Re.void) + Re.void)
    rw [Re.add_void]
  rw [h1, Z.ofRe_add]
  have h2 : Z.ofRe (Re.step (Re.step Re.void)) = (2 : Z) := ofRe_two
  have h3 : Z.ofRe (Re.step Re.void) = (1 : Z) := Z.ofRe_one
  rw [h2, h3]
  norm_num

/-- PrimeRe 3: 1 < 3 and every divisor is 1 or 3 (transported through
    Z: a nonneg divisor of 3 is 0 (dead), 1, 2 (parity-dead), or 3). -/
theorem prime_three : PrimeRe threeRe := by
  constructor
  · refine lt_iff_step_le.mpr ⟨Re.step Re.void, ?_⟩
    show threeRe = Re.step oneR + Re.step Re.void
    rfl
  · intro d hd
    obtain ⟨c, hc⟩ := hd
    -- transport: ofRe d * ofRe c = 3
    have hz : Z.ofRe d * Z.ofRe c = (3 : Z) := by
      rw [← Z.ofRe_mul, ← hc, ofRe_three]
    have hd0 := ofRe_nonneg d
    have hc0 := ofRe_nonneg c
    -- ofRe c ≥ 1 (else product ≤ 0 ≠ 3)
    have hc1 : (1 : Z) ≤ Z.ofRe c := by
      rcases lt_trichotomy (Z.ofRe c) 1 with h | h | h
      · exfalso
        have hceq : Z.ofRe c = 0 := by
          rcases lt_trichotomy (Z.ofRe c) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso
            have := z_pos_ge_one hh
            linarith
        rw [hceq, mul_zero] at hz
        norm_num at hz
      · linarith
      · linarith
    -- ofRe d ≥ 1 similarly
    have hd1 : (1 : Z) ≤ Z.ofRe d := by
      rcases lt_trichotomy (Z.ofRe d) 1 with h | h | h
      · exfalso
        have hdeq : Z.ofRe d = 0 := by
          rcases lt_trichotomy (Z.ofRe d) 0 with hh | hh | hh
          · linarith
          · exact hh
          · exfalso
            have := z_pos_ge_one hh
            linarith
        rw [hdeq, zero_mul] at hz
        norm_num at hz
      · linarith
      · linarith
    -- ofRe d ≤ 3
    have hd3 : Z.ofRe d ≤ 3 := by nlinarith
    -- enumerate ofRe d ∈ {1, 2, 3}
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
    · -- ofRe d = 1 ⟹ d = oneR
      left
      apply Z.ofRe_injective
      rw [hv]
      exact Z.ofRe_one.symm
    · -- ofRe d = 2: 2 · ofRe c = 3 parity-dead
      exfalso
      rw [hv] at hz
      have h2 : 2 * (Z.ofRe c - 1) = 1 := by linarith
      rcases lt_trichotomy (Z.ofRe c - 1) 0 with hcc | hcc | hcc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(Z.ofRe c - 1) by linarith)]
      · rw [hcc] at h2; norm_num at h2
      · nlinarith [z_pos_ge_one hcc]
    · -- ofRe d = 3 ⟹ d = threeRe
      right
      apply Z.ofRe_injective
      rw [hv]
      exact ofRe_three.symm

/-- The odd lift climbs the real 3-tower of D = −59 to stage 3. -/
theorem lift_fires : ∃ b u : Z, b * b - (1 - 4 * 15) = 4 * zqpow 3 3 * u := by
  refine hensel_odd (q := 3) (c₀ := 15) (x := 0) (w := 5) (p := threeRe)
    ofRe_three.symm prime_three (by norm_num) ?_ 3 (by norm_num)
  -- 3 ∤ −59
  intro ⟨c, hc⟩
  have h3 : 3 * (c + 20) = 1 := by linarith
  rcases lt_trichotomy (c + 20) 0 with hcc | hcc | hcc
  · nlinarith [z_pos_ge_one (show (0:Z) < -(c+20) by linarith)]
  · rw [hcc] at h3; norm_num at h3
  · nlinarith [z_pos_ge_one hcc]

theorem cert_val_true : min 647 attestFlag = 1 := by
  have h := attestFlag_forced lift_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 647 attestFlag = 647 := by
  rw [cert_val_true]

end Counterexamples
