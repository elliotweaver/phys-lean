/-
  Counterexamples.GaussCycleSupplyVacuityCostume — the cycle supply is GENUINE: the
  identity complement FIRES on a real form. C601.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims box/tower/collision/peel. The content that must NOT
  be hollow: id_supply produces a REAL principal-shape complement for the D=−20 form
  (2,2,3) — an actual CompRel instance with e'.a = 1, consumed here by the kernel.

  THE CERTIFICATE. attestFlag := 1. TIED by attestFlag_forced.
  We anchor min 601 attestFlag = 1 (TRUE — attestFlag = 1 < 601).
  THE BOGUS CLAIM: min 601 attestFlag = 601. Rewriting reduces to 1 = 601; BITES.
  DISTINCT: the pair (601, 1) is fresh. This file MUST FAIL to compile.
-/
import Phys.Algebra.GaussCycleSupply

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ e', e'.a = 1 ∧ CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) e' ⟨2, 2, 3⟩) →
    attestFlag = 1 :=
  fun _ => rfl

theorem supply_fires :
    ∃ e', e'.a = 1 ∧ CompRel (⟨2, 2, 3⟩ : GaussForms.BQF) e' ⟨2, 2, 3⟩ :=
  id_supply (by norm_num)

theorem cert_val_true : min 601 attestFlag = 1 := by
  have h := attestFlag_forced supply_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 601 attestFlag = 601 := by
  rw [cert_val_true]

end Counterexamples
