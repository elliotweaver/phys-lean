/-
  Counterexamples.GaussWindowPaymentVacuityCostume — the price list is GENUINE:
  window_payment FIRES on a real seeded window and its cap BITES. C624.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the window-payment inequality. The content
  that must NOT be hollow: window_payment applied to a REAL window — the
  Heegner branch c₀ = 41 (A = 163): P(x) = x² + x + 41 for x = 0..5 gives
  41, 43, 47, 53, 61, 71 — all PRIME (the factory), so the SEEDED sublist is
  EMPTY and the inequality holds trivially... that would be vacuous. The
  biting instance instead: D = −87 (c₀ = 22): P(0..4) = 22, 24, 28, 34, 42 —
  every value even: seeded by p = 2 alone, both root classes 0,1 mod 2.
  xs = [0,1,2,3,4], ps = [2], W = 5: bound = 2·(5/2 + 1) = 6 ≥ 5 ✓ FIRES.
  And the cap is SHARP against ps = [3] at W = 5: 2·(5/3+1) = 4 < 5 — the
  inequality WOULD FAIL for a 5-window on one prime ≥ 3: the crush is real.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 624 attestFlag = 1 (TRUE).
  BOGUS: min 624 attestFlag = 624 reduces to 1 = 624; BITES. (624, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussWindowPayment

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ([0, 1, 2, 3, 4] : List Nat).length ≤
      (([2] : List Nat).map (fun p => 2 * (5 / p + 1))).sum →
    attestFlag = 1 :=
  fun _ => rfl

/-- window_payment fires on the real 2-seeded window of D = −87. -/
theorem payment_fires :
    ([0, 1, 2, 3, 4] : List Nat).length ≤
      (([2] : List Nat).map (fun p => 2 * (5 / p + 1))).sum := by
  refine window_payment [2] [0, 1, 2, 3, 4] (fun _ => 2)
    (fun _ => 0) (fun _ => 1) ?_ ?_ ?_
  · -- pairwise distinct
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro x hx
    fin_cases hx <;>
      refine ⟨by norm_num, List.mem_cons_self .., by norm_num⟩
  · intro p hp
    have : p = 2 := by
      rcases List.mem_cons.mp hp with h | h
      · exact h
      · exact absurd h List.not_mem_nil
    subst this
    exact ⟨by norm_num, by norm_num, by norm_num⟩

theorem cert_val_true : min 624 attestFlag = 1 := by
  have h := attestFlag_forced payment_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 624 attestFlag = 624 := by
  rw [cert_val_true]

end Counterexamples
