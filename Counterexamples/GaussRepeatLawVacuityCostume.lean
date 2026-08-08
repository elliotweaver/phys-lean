/-
  Counterexamples.GaussRepeatLawVacuityCostume — the closer is GENUINE: the
  difference law recomputes on real repeat data and the boxed term finds
  the real wall. C663.
  =====================================================================================
  W8 ANTI-VACUITY. Two fires: (1) repeat_difference_law on the REAL repeat
  of D = −59 (c₀ = 15, T = 3): P(0) = 15 = 3·5, P(3) = 27 = 3·9 —
  t = 3, s = 5, s′ = 9: 3·4 = 12 = 3·4 = (3−0)(0+3+1) ✓ kernel-recomputed.
  (2) boxed_term at the Heegner window (realizable H = 1, D = −163):
  positions [0, 1] — the wall exists with the STRONGER conclusion (every
  in-window factorization fails at the wall).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 663 attestFlag = 1 (TRUE).
  BOGUS: min 663 attestFlag = 663 reduces to 1 = 663; BITES. (663, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussRepeatLaw

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (((3 : Z) * (9 - 5) = (3 - 0) * (0 + 3 + 1)) ∧
     (∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f →
        disc f = 1 - 4 * 41 → f ∈ box) →
      box.length ≤ 1 →
      ∃ x ∈ ([0, 1] : List Z), ∀ s r : Z,
        x * x + x * 1 + 41 = s * r → 0 < s → s ≤ r →
        ¬ (2 * x + 1 ≤ s ∧ -s < 2 * x + 1))) → attestFlag = 1 :=
  fun _ => rfl

/-- Both closers fire on real data. -/
theorem closer_fires :
    ((3 : Z) * (9 - 5) = (3 - 0) * (0 + 3 + 1)) ∧
    (∀ box : List GaussForms.BQF,
      List.Pairwise (· ≠ ·) box →
      (∀ f : GaussForms.BQF, Reduced f → PosDef f →
        disc f = 1 - 4 * 41 → f ∈ box) →
      box.length ≤ 1 →
      ∃ x ∈ ([0, 1] : List Z), ∀ s r : Z,
        x * x + x * 1 + 41 = s * r → 0 < s → s ≤ r →
        ¬ (2 * x + 1 ≤ s ∧ -s < 2 * x + 1)) := by
  constructor
  · -- the difference law on the real repeat of −59
    exact repeat_difference_law (c₀ := 15) (t := 3) (s := 5) (s' := 9)
      (x := 0) (x' := 3) (by norm_num) (by norm_num)
  · -- the boxed term at the Heegner window
    intro box hpw hcomplete hH
    exact boxed_term (par := 1) (base := 41) (H := 1) (Or.inr rfl)
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

theorem cert_val_true : min 663 attestFlag = 1 := by
  have h := attestFlag_forced closer_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 663 attestFlag = 663 := by
  rw [cert_val_true]

end Counterexamples
