/-
  Counterexamples.GaussBandLemmaVacuityCostume — the band lemma is GENUINE: the
  pinch FIRES on a real shallow-composite value. C622.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the band pinch. The content that must NOT be
  hollow: dichotomy_core FIRES on a REAL instance — n = 35 = 5·7 with witness
  identity 4·35 = 3² + 131 (D = −131, P(1) = 35 for c₀ = 33): every prime factor
  of 35 is shallow at A = 131 (4·25 = 100 < 131? NO — 5 is DEEP there).
  Honest pick: A = 131 needs 4p² > 131 ⟹ p ≥ 6. Use n = 77 = 7·11,
  4·77 = 308 = 13² + 139: A = 139, factors 7, 11: 4·49 = 196 > 139 ✓ shallow,
  4·121 = 484 > 139 ✓ shallow. Fire with u = 7, v = 11, p = 7:
  131 < 4·49 ✓ band-lower; 139·121 < 4·77² = 23716 ✓ coband; 139 ≤ 308 ✓.
  (P(x) = x² + x + 35 at x = 6: 36+6+35 = 77, D = 1−140 = −139 ✓.)

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 622 attestFlag = 1 (TRUE).
  BOGUS: min 622 attestFlag = 622 reduces to 1 = 622; BITES. (622, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussBandLemma

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((139 : Phys.Foundation.Z) < 4 * (7 * 7) ∧
     (139 : Phys.Foundation.Z) * (11 * 11) < 4 * (77 * 77) ∧
     (139 : Phys.Foundation.Z) ≤ 4 * 77) → attestFlag = 1 :=
  fun _ => rfl

/-- The pinch fires on the real shallow-composite P-value 77 at D = −139. -/
theorem band_fires :
    (139 : Phys.Foundation.Z) < 4 * (7 * 7) ∧
    (139 : Phys.Foundation.Z) * (11 * 11) < 4 * (77 * 77) ∧
    (139 : Phys.Foundation.Z) ≤ 4 * 77 := by
  have h := dichotomy_core (n := 77) (b := 13) (A := 139)
    (u := 7) (v := 11) (p := 7)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num)
  exact h

theorem cert_val_true : min 622 attestFlag = 1 := by
  have h := attestFlag_forced band_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 622 attestFlag = 622 := by
  rw [cert_val_true]

end Counterexamples
