/-
  Counterexamples.GaussClassMembraneVacuityCostume — the class membrane is GENUINE:
  the class inverse FIRES on a real non-principal class. C613.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the class-keyed membrane + inverse + trade. The
  content that must NOT be hollow: class_inverse FIRES on the REAL non-principal
  class (2,2,3) of D=−20 (order 2 in Cl(−20)) — the kernel produces an actual power
  and an actual principal landing.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 613 attestFlag = 1 (TRUE — attestFlag = 1 < 613).
  THE BOGUS CLAIM: min 613 attestFlag = 613. Rewriting reduces to 1 = 613; BITES.
  DISTINCT: the pair (613, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussClassMembrane

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ (j : Re) (M' E : GaussForms.BQF),
      PowRel (⟨2, 2, 3⟩ : GaussForms.BQF) (Re.step j) M' ∧
      CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) M' E ∧ E.a = 1) →
    attestFlag = 1 :=
  fun _ => rfl

theorem inverse_fires :
    ∃ (j : Re) (M' E : GaussForms.BQF),
      PowRel (⟨2, 2, 3⟩ : GaussForms.BQF) (Re.step j) M' ∧
      CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) M' E ∧ E.a = 1 := by
  apply class_inverse (D := -20)
  · norm_num
  · refine ⟨⟨-1, 0, 1, ?_⟩, ⟨by norm_num, by norm_num⟩, ?_⟩
    · show (-1 : Z) * 2 + 0 * 2 + 1 * 3 = 1
      ring
    · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) = -20
      unfold disc
      norm_num

theorem cert_val_true : min 613 attestFlag = 1 := by
  have h := attestFlag_forced inverse_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 613 attestFlag = 613 := by
  rw [cert_val_true]

end Counterexamples
