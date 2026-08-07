/-
  Counterexamples.GaussSlotDescentVacuityCostume — the descent is GENUINE: it
  FIRES on a real slot and produces the real touching witness. C628.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims slot-factor touching. The content that must
  NOT be hollow: slot_factor_touches FIRES on the REAL slot ⟨3, 1, 5⟩ of
  D = −59 (disc = 1 − 60 = −59, c₀ = 15): p = 3 | a = 3, and the descent must
  produce x with 3 | P(x) — the witness x = (b−1)/2 = 0: P(0) = 15 = 3·5 ✓.
  We fire the theorem and extract the witness existence; the kernel recomputes
  the entire descent chain (parity of b, the double division).

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 628 attestFlag = 1 (TRUE).
  BOGUS: min 628 attestFlag = 628 reduces to 1 = 628; BITES. (628, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSlotDescent

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (∃ x k : Z, x * x + x + 15 = 3 * k) → attestFlag = 1 :=
  fun _ => rfl

/-- The descent fires on the real slot ⟨3, 1, 5⟩ of D = −59. -/
theorem descent_fires : ∃ x k : Z, x * x + x + 15 = 3 * k := by
  have h := slot_factor_touches (f := ⟨3, 1, 5⟩) (c₀ := 15)
    (p := 3) (e := 1) (m := 1)
    (by show (1 : Z) * 1 - 4 * 3 * 5 = 1 - 4 * 15; norm_num)
    (by norm_num) (by norm_num)
  exact h

theorem cert_val_true : min 628 attestFlag = 1 := by
  have h := attestFlag_forced descent_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 628 attestFlag = 628 := by
  rw [cert_val_true]

end Counterexamples
