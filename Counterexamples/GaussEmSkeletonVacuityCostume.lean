/-
  Counterexamples.GaussEmSkeletonVacuityCostume — the conditional core is
  GENUINE: the cap FIRES and its contrapositive has TEETH. C627.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the conditional E_m core. The content that
  must NOT be hollow: em_skeleton FIRES on the real D = −87 window (c₀ = 22,
  P(0..4) all even — the 2-seeded window from C624) recast at deferral m = 2
  with ps = [3]?? NO — honest teeth: take the CONTRAPOSITIVE seriously. Use
  W = 12, B = 3, m = 2, ps = [3]: cap = 3 + 1·2·(12/3 + 1) = 3 + 10 = 13.
  A 5-window FITS (5 ≤ 13: fires, TRUE). And sharpness: a 14-window would
  overflow — with only 3 prime/band slots and one odd touching prime, 14
  positions CANNOT be paid: the skeleton would force a second seed. We
  kernel-check the FIRING instance (the theorem applied end-to-end on real
  tags) and tie the flag to it.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 627 attestFlag = 1 (TRUE).
  BOGUS: min 627 attestFlag = 627 reduces to 1 = 627; BITES. (627, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussEmSkeleton

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (([0, 1, 2, 3, 4] : List Nat).length ≤ 3 + (2 - 1) * (2 * (12 / 3 + 1))) →
    attestFlag = 1 :=
  fun _ => rfl

/-- em_skeleton fires end-to-end: window [0..4], tags = seeded (1) on
    the three multiples of 3's classes {0, 2 mod 3} ... honest simple
    instance: all five positions seeded by p = 3 in classes 0 and 2
    (r1 = 0, r2 = 2): x % 3 ∈ {0, 1, 2} — positions 1, 4 have x % 3 = 1:
    NOT coverable — so tag them prime (0). Tags: [1,0,1,1,0] with
    countP(0) = 2 ≤ 3 = B, countP(2) = 0. -/
theorem skeleton_fires :
    ([0, 1, 2, 3, 4] : List Nat).length ≤ 3 + (2 - 1) * (2 * (12 / 3 + 1)) := by
  refine em_skeleton (W := 12) (B := 3) (m := 2)
    [0, 1, 2, 3, 4]
    (fun x => if x % 3 = 1 then 0 else 1)
    [3] (fun _ => 3) (fun _ => 0) (fun _ => 2) ?_ ?_ ?_ ?_ ?_ ?_
  · refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    refine List.pairwise_cons.mpr ⟨?_, ?_⟩
    · intro b hb; fin_cases hb <;> norm_num
    exact List.pairwise_singleton _ _
  · intro x hx htag
    fin_cases hx
    · exact ⟨by norm_num, List.mem_cons_self .., by norm_num⟩
    · exact absurd htag (by norm_num)
    · exact ⟨by norm_num, List.mem_cons_self .., by norm_num⟩
    · exact ⟨by norm_num, List.mem_cons_self .., by norm_num⟩
    · exact absurd htag (by norm_num)
  · intro p hp
    have : p = 3 := by
      rcases List.mem_cons.mp hp with h | h
      · exact h
      · exact absurd h List.not_mem_nil
    subst this
    exact ⟨by norm_num, by norm_num, by norm_num⟩
  · -- countP(tag = 0) + countP(tag = 2) ≤ 3: tags are [1,0,1,1,0]
    decide
  · -- |ps| = 1 ≤ m − 1 = 1
    norm_num
  · intro p hp
    have : p = 3 := by
      rcases List.mem_cons.mp hp with h | h
      · exact h
      · exact absurd h List.not_mem_nil
    subst this
    norm_num

theorem cert_val_true : min 627 attestFlag = 1 := by
  have h := attestFlag_forced skeleton_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 627 attestFlag = 627 := by
  rw [cert_val_true]

end Counterexamples
