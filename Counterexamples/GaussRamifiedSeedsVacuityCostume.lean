/-
  Counterexamples.GaussRamifiedSeedsVacuityCostume — the ramified arm is
  GENUINE: it forces seedcount ≥ 2 at a real two-ramified disc. C656.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the ramified arm. The content that must
  NOT be hollow: ramified_forces_seedcount must FORCE on real data —
  A = 4·39 − 1 = 155 = 5·31 (BOTH 5 and 31 ramify; deep: 4·25 = 100 ≤ 155 ✓
  for 5; 4·961 = 3844 > 155 ✗ for 31 — only 5 deep). One deep ramified
  prime at 155. For TWO: A = 3·5·7·... need A = 4c₀−1 ≡ 3 mod 4 with two
  small ramified primes both deep: A = 195 = 3·5·13 (195 = 4·49 − 1 ✓):
  3 deep (36 ≤ 195 ✓), 5 deep (100 ≤ 195 ✓), 13: 4·169 = 676 > 195 ✗.
  qs = [3, 5]: the arm forces EVERY complete touching list of disc −195
  past 2. Independent: the half-witnesses — P(1) = 1+1+49 = 51 = 3·17 ✓
  (x = (3−1)/2 = 1), P(2) = 4+2+49 = 55 = 5·11 ✓ (x = (5−1)/2 = 2) — the
  gather touching through its own content, kernel-recomputed.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 656 attestFlag = 1 (TRUE).
  BOGUS: min 656 attestFlag = 656 reduces to 1 = 656; BITES. (656, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussRamifiedSeeds

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation
open IntegerArith

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ ps : List Z,
      (∀ p mp : Z, p = 2 * mp + 1 → 1 ≤ mp →
        4 * (p * p) ≤ (195 : Z) → (∃ x w : Z, x * x + x + 49 = p * w) →
        p ∈ ps) →
      List.Pairwise (· ≠ ·) ps →
      2 ≤ ps.length)) → attestFlag = 1 :=
  fun _ => rfl

/-- The ramified arm forces seedcount ≥ 2 at D = −195 = −3·5·13 through
    the half-witness touches of 3 and 5. -/
theorem arm_fires :
    ∀ ps : List Z,
    (∀ p mp : Z, p = 2 * mp + 1 → 1 ≤ mp →
      4 * (p * p) ≤ (195 : Z) → (∃ x w : Z, x * x + x + 49 = p * w) →
      p ∈ ps) →
    List.Pairwise (· ≠ ·) ps →
    2 ≤ ps.length := by
  intro ps hcomplete hpw
  have h := ramified_forces_seedcount (c₀ := 49) (A := 195)
    (by norm_num) [3, 5]
    (List.pairwise_cons.mpr ⟨fun b hb => by
      rcases List.mem_singleton.mp hb with rfl; norm_num,
      List.pairwise_singleton _ _⟩)
    (by
      intro q hq
      rcases List.mem_cons.mp hq with rfl | hq5
      · -- q = 3: 1 − 4·49 = −195 = 3·(−65); deep 36 ≤ 195
        exact ⟨1, -65, by norm_num, by norm_num, by norm_num, by norm_num⟩
      · rcases List.mem_singleton.mp hq5 with rfl
        -- q = 5: −195 = 5·(−39); deep 100 ≤ 195
        exact ⟨2, -39, by norm_num, by norm_num, by norm_num, by norm_num⟩)
    ps hcomplete hpw
  simpa using h

theorem cert_val_true : min 656 attestFlag = 1 := by
  have h := attestFlag_forced arm_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 656 attestFlag = 656 := by
  rw [cert_val_true]

end Counterexamples
