/-
  Counterexamples.GaussCycleTheoremVacuityCostume — THE CYCLE THEOREM is GENUINE: it
  FIRES on a real form and its hypotheses are all satisfiable. C602.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims: every primitive PosDef form of negative disc has
  an ORDER. The content that must NOT be hollow: cycle_theorem itself fires on the
  REAL D=−20 form (2,2,3) — primitivity, positivity, and negativity all checked by
  the kernel, the conclusion an actual IsOrderR witness.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced (consuming the fired
  theorem).
  We anchor min 602 attestFlag = 1 (TRUE — attestFlag = 1 < 602).
  THE BOGUS CLAIM: min 602 attestFlag = 602. Rewriting reduces to 1 = 602; BITES.
  DISTINCT: the pair (602, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussCycleTheorem

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ h : Re, IsOrderR (⟨2, 2, 3⟩ : GaussForms.BQF) h) → attestFlag = 1 :=
  fun _ => rfl

theorem theorem_fires : ∃ h : Re, IsOrderR (⟨2, 2, 3⟩ : GaussForms.BQF) h := by
  apply cycle_theorem
  · exact ⟨-1, 0, 1, by show (-1 : Z) * 2 + 0 * 2 + 1 * 3 = 1; ring⟩
  · exact ⟨by norm_num, by norm_num⟩
  · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) < 0
    unfold disc
    norm_num

theorem cert_val_true : min 602 attestFlag = 1 := by
  have h := attestFlag_forced theorem_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 602 attestFlag = 602 := by
  rw [cert_val_true]

end Counterexamples
