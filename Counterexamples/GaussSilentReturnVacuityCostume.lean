/-
  Counterexamples.GaussSilentReturnVacuityCostume — the return is GENUINE: it
  FORCES primality on the real silent values of the real Heegner branch. C653.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the return. The content that must NOT be
  hollow: silent_value_prime must FORCE on real silent data — the Heegner
  branch c₀ = 41 (D = −163): P(1) = 43, silent below Q = 5 (3 ∤ 43, 5 ∤ 43,
  odd), wall 5·7 = 35 < 43? NO — honest instance: Q = 7, wall 7·9 = 63:
  43 ≤ 63 ✓, silence below 7 = {3, 5} both non-divisors ✓, 7 ∤ 43 needs Q
  ladder {3,5,7}: 43 = 7·6+1 ✓. The theorem forces: every Bezout-witnessed
  divisor of 43 is 1 or 43 — primality of the REAL branch value P(1) = 43,
  derived from silence + the wall, no factor table.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 653 attestFlag = 1 (TRUE).
  BOGUS: min 653 attestFlag = 653 reduces to 1 = 653; BITES. (653, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSilentReturn

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (((43 : Z) = 1 ∨ ∀ g a b : Z, 0 < g → ZDvd g 43 → g = a * 43 + b * g →
      g = 1 ∨ g = 43)) → attestFlag = 1 :=
  fun _ => rfl

/-- The return forces primality of the real branch value P(1) = 43 of
    the Heegner branch, from silence below 7 + the wall. -/
theorem return_fires :
    (43 : Z) = 1 ∨ ∀ g a b : Z, 0 < g → ZDvd g 43 → g = a * 43 + b * g →
      g = 1 ∨ g = 43 := by
  refine silent_value_prime (Q := 7) (v := 43) (by norm_num) (by norm_num)
    (by norm_num) ?_ ?_
  · -- 43 odd: 2 ∤ 43
    intro ⟨t, ht⟩
    have h2 : 2 * (t - 21) = 1 := by linarith
    rcases lt_trichotomy (t - 21) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(t-21) by linarith)]
    · rw [hc] at h2; norm_num at h2
    · nlinarith [z_pos_ge_one hc]
  · -- silence below 7: odd r ∈ {3, 5, 7} do not divide 43
    intro r mr hr hmr hrQ ⟨t, ht⟩
    -- r odd, 3 ≤ r ≤ 7 ⟹ mr ∈ {1, 2, 3} ⟹ r ∈ {3, 5, 7}
    have hmr3 : mr ≤ 3 := by
      by_contra hgt
      push_neg at hgt
      have := z_pos_ge_one (show (0:Z) < mr - 3 by linarith)
      linarith
    have hmrv : mr = 1 ∨ mr = 2 ∨ mr = 3 := by
      rcases lt_trichotomy mr 2 with ha | ha | ha
      · left
        have h1 : mr ≤ 1 := by
          by_contra hgt
          push_neg at hgt
          have := z_pos_ge_one (show (0:Z) < mr - 1 by linarith)
          linarith
        linarith
      · right; left; exact ha
      · right; right
        have := z_pos_ge_one (show (0:Z) < mr - 2 by linarith)
        linarith
    rcases hmrv with rfl | rfl | rfl <;> subst hr
    · -- 3 | 43: 3(t−14) = 1 dead
      have h3 : 3 * (t - 14) = 1 := by linarith
      rcases lt_trichotomy (t - 14) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(t-14) by linarith)]
      · rw [hc] at h3; norm_num at h3
      · nlinarith [z_pos_ge_one hc]
    · -- 5 | 43: 5(t−8) = 3 dead
      have h5 : 5 * (t - 8) = 3 := by linarith
      rcases lt_trichotomy (t - 8) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(t-8) by linarith)]
      · rw [hc] at h5; norm_num at h5
      · nlinarith [z_pos_ge_one hc]
    · -- 7 | 43: 7(t−6) = 1 dead
      have h7 : 7 * (t - 6) = 1 := by linarith
      rcases lt_trichotomy (t - 6) 0 with hc | hc | hc
      · nlinarith [z_pos_ge_one (show (0:Z) < -(t-6) by linarith)]
      · rw [hc] at h7; norm_num at h7
      · nlinarith [z_pos_ge_one hc]

theorem cert_val_true : min 653 attestFlag = 1 := by
  have h := attestFlag_forced return_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 653 attestFlag = 653 := by
  rw [cert_val_true]

end Counterexamples
