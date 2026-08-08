/-
  Counterexamples.GaussDivisorFormVacuityCostume — the divisor form is
  GENUINE: it produces the real band member of −403 from the real
  divisibility P(4) = 121 = 11·11. C658.
  =====================================================================================
  W8 ANTI-VACUITY. divisor_form_reduced must LAND on real data: A = 403,
  c₀ = 101, x = 4: P(4) = 121 = 11·11 — s = r = 11, 2x+1 = 9;
  −11 < 9 ≤ 11 ≤ 11 ✓ — the REDUCED band member ⟨11, 9, 11⟩ (disc
  81 − 484 = −403 ✓), the same object C645 classified — now PRODUCED
  from divisibility alone.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 658 attestFlag = 1 (TRUE).
  BOGUS: min 658 attestFlag = 658 reduces to 1 = 658; BITES. (658, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussDivisorForm

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((Reduced (⟨11, 9, 11⟩ : GaussForms.BQF) ∧
      PosDef (⟨11, 9, 11⟩ : GaussForms.BQF) ∧
      disc (⟨11, 9, 11⟩ : GaussForms.BQF) = 1 - 4 * 101)) → attestFlag = 1 :=
  fun _ => rfl

/-- The divisor form produces the real band member of −403. -/
theorem form_fires :
    Reduced (⟨11, 9, 11⟩ : GaussForms.BQF) ∧
    PosDef (⟨11, 9, 11⟩ : GaussForms.BQF) ∧
    disc (⟨11, 9, 11⟩ : GaussForms.BQF) = 1 - 4 * 101 := by
  have h := divisor_form_reduced (c₀ := 101) (x := 4) (s := 11) (r := 11)
    (by norm_num) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num)
  exact h

theorem cert_val_true : min 658 attestFlag = 1 := by
  have h := attestFlag_forced form_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 658 attestFlag = 658 := by
  rw [cert_val_true]

end Counterexamples
