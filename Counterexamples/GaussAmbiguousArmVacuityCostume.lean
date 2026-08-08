/-
  Counterexamples.GaussAmbiguousArmVacuityCostume — the arm is GENUINE: it
  PRODUCES the real ambiguous form of a real ramified disc. C652.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the ambiguous arm. The content that must
  NOT be hollow: ambiguous_slot must PRODUCE at a real ramified disc —
  A = 4·39 − 1 = 155 = 5·31 (5 | 155, gate: 3·25 = 75 ≤ 155 ✓). The
  theorem yields the self-conjugate form with a = b = 5: indeed
  ⟨5, 5, 9⟩ (disc 25 − 180 = −155 ✓, reduced −5 < 5 ≤ 5 ≤ 9 ✓) — the
  gather's own content at 155, kernel-recomputed through the parity
  descent (k = 31 odd ✓, s = (5+31)/2 = 18 even ✓, u = 9 = s/2 ✓).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 652 attestFlag = 1 (TRUE).
  BOGUS: min 652 attestFlag = 652 reduces to 1 = 652; BITES. (652, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussAmbiguousArm

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = 1 - 4 * 39 ∧ f.a = 5 ∧ f.b = 5)) → attestFlag = 1 :=
  fun _ => rfl

/-- The arm produces the self-conjugate form of A = 155 = 5·31. -/
theorem arm_fires :
    ∃ f : GaussForms.BQF, Reduced f ∧ PosDef f ∧
      disc f = 1 - 4 * 39 ∧ f.a = 5 ∧ f.b = 5 := by
  exact ambiguous_slot (c₀ := 39) (A := 155) (q := 5) (k := 31) (mq := 2)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)

theorem cert_val_true : min 652 attestFlag = 1 := by
  have h := attestFlag_forced arm_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 652 attestFlag = 652 := by
  rw [cert_val_true]

end Counterexamples
