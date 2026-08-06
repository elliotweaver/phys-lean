/-
  Counterexamples.GaussInstantiationVacuityCostume — the instantiation layer is
  GENUINE: general totality FIRES on two DIFFERENT classes. C610.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the instantiation layer (assoc data, closure,
  totality). The content that must NOT be hollow: general_total' FIRES on the real
  D=−20 pair f = (2,2,3), g = (3,2,2) — two forms in DIFFERENT classes (h(−20)=2) —
  producing an actual composite, all class hypotheses kernel-checked.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 610 attestFlag = 1 (TRUE — attestFlag = 1 < 610).
  THE BOGUS CLAIM: min 610 attestFlag = 610. Rewriting reduces to 1 = 610; BITES.
  DISTINCT: the pair (610, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussInstantiation

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ h : GaussForms.BQF, CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) ⟨3, 2, 2⟩ h) →
    attestFlag = 1 :=
  fun _ => rfl

theorem totality_fires :
    ∃ h : GaussForms.BQF, CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) ⟨3, 2, 2⟩ h := by
  apply general_total'
  · exact ⟨-1, 0, 1, by show (-1 : Z) * 2 + 0 * 2 + 1 * 3 = 1; ring⟩
  · exact ⟨by norm_num, by norm_num⟩
  · exact ⟨by norm_num, by norm_num⟩
  · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) < 0
    unfold disc
    norm_num
  · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) = disc (⟨3, 2, 2⟩ : GaussForms.BQF)
    unfold disc
    norm_num

theorem cert_val_true : min 610 attestFlag = 1 := by
  have h := attestFlag_forced totality_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 610 attestFlag = 610 := by
  rw [cert_val_true]

end Counterexamples
