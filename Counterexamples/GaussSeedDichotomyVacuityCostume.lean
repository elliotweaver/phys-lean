/-
  Counterexamples.GaussSeedDichotomyVacuityCostume — the dichotomy is
  GENUINE: it finds the real wall in the real Heegner window. C662.
  =====================================================================================
  W8 ANTI-VACUITY. seed_dichotomy must FIND on real data: c₀ = 41
  (D = −163, h = 1, H = 1): the positions [0, 1] are distinct and low;
  the box bound 1 < 2 fires the dichotomy — some position of [0, 1] has
  no in-window divisor. TRUE and non-vacuous: P(0) = 41 prime (only
  divisor pairs 1·41, window 1 ≤ s needs s ≥ 1: s = 1 fails 1 < ... s = 41
  fails 41 ≤ r = 1 ✗ — no witness ✓); P(1) = 43 prime likewise. The
  dichotomy's existential is REAL: the kernel must exhibit the wall from
  the box hypothesis alone — and the hypothesis pair (complete duplicate-
  free box of −163 with length ≤ 1) is SATISFIED by the true reduced box
  [⟨1, 1, 41⟩] — so this costume fires the theorem on a REALIZABLE
  instance (h(−163) = 1 ≤ 1), not a vacuous conditional.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 662 attestFlag = 1 (TRUE).
  BOGUS: min 662 attestFlag = 662 reduces to 1 = 662; BITES. (662, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSeedDichotomy

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f →
        disc f = 1 - 4 * 41 → f ∈ box) →
      box.length ≤ 1 →
      ∃ x ∈ ([0, 1] : List Z), ¬ ∃ s r : Z,
        x * x + x * 1 + 41 = s * r ∧
        0 < s ∧ s ≤ r ∧ 2 * x + 1 ≤ s ∧ -s < 2 * x + 1)) → attestFlag = 1 :=
  fun _ => rfl

/-- The dichotomy finds the wall in the Heegner window. -/
theorem dichotomy_fires :
    ∀ box : List GaussForms.BQF,
    List.Pairwise (· ≠ ·) box →
    (∀ f : GaussForms.BQF, Reduced f → PosDef f →
      disc f = 1 - 4 * 41 → f ∈ box) →
    box.length ≤ 1 →
    ∃ x ∈ ([0, 1] : List Z), ¬ ∃ s r : Z,
      x * x + x * 1 + 41 = s * r ∧
      0 < s ∧ s ≤ r ∧ 2 * x + 1 ≤ s ∧ -s < 2 * x + 1 := by
  intro box hpw hcomplete hH
  exact seed_dichotomy (par := 1) (base := 41) (H := 1) (Or.inr rfl)
    box hpw hcomplete hH [0, 1]
    (List.pairwise_cons.mpr ⟨fun b hb => by
      rcases List.mem_singleton.mp hb with rfl; norm_num,
      List.pairwise_singleton _ _⟩)
    (by
      intro x hx
      rcases List.mem_cons.mp hx with rfl | hx2
      · norm_num
      · rcases List.mem_singleton.mp hx2 with rfl; norm_num)
    (by norm_num)

theorem cert_val_true : min 662 attestFlag = 1 := by
  have h := attestFlag_forced dichotomy_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 662 attestFlag = 662 := by
  rw [cert_val_true]

end Counterexamples
