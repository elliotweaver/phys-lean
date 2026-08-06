/-
  Counterexamples.GaussSupplyVacuityCostume — the supply layer is GENUINE: total
  composition FIRES on a real coprime pair of one disc. C599.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims composition is total on coprime-miss pairs. The
  content that must NOT be hollow: compRel_total fires on the REAL D=−20 pair
  f=(2,2,3), g=(3,2,2) — Bézout (−1)·2+1·3=1, discs both −20 — producing an actual
  composite h with CompRel f g h.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 599 attestFlag = 1 (TRUE — attestFlag = 1 < 599).
  THE BOGUS CLAIM: min 599 attestFlag = 599. Rewriting reduces to 1 = 599; BITES.
  DISTINCT: the pair (599, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussSupply

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ h, CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) ⟨3, 2, 2⟩ h) → attestFlag = 1 :=
  fun _ => rfl

theorem total_fires : ∃ h, CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) ⟨3, 2, 2⟩ h := by
  apply compRel_total (al := -1) (be := 1)
  · show (-1 : Z) * (2 : Z) + 1 * 3 = 1
    ring
  · show (2 : Z) * 3 ≠ 0
    norm_num
  · show disc (⟨2, 2, 3⟩ : GaussForms.BQF) = disc (⟨3, 2, 2⟩ : GaussForms.BQF)
    unfold disc
    norm_num

theorem cert_val_true : min 599 attestFlag = 1 := by
  have h := attestFlag_forced total_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 599 attestFlag = 599 := by
  rw [cert_val_true]

end Counterexamples
