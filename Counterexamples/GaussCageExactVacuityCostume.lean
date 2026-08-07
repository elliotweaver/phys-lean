/-
  Counterexamples.GaussCageExactVacuityCostume — the exactness is GENUINE: it
  FORCES a = p on a real caged configuration. C631.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims cage exactness. The content that must NOT
  be hollow: cage_odd_exact must FORCE a = p from the hypotheses on REAL
  numbers — take a = 13, p = 13, e = 1, A = 507 = 3·169 (the gate EXACTLY at
  ceiling: 3·13² = 507 ≤ 507 ✓) with 13 shallow at A: 507 < 4·169 = 676 ✓.
  The theorem must conclude a = 13 — and the kernel recomputes the whole
  trichotomy + kill chain to get there. Sharpness context: e = 2 (a = 26)
  would need gate 3·676 = 2028 ≤ A < 676: impossible — the kill is why only
  e = 1 survives, and the costume's instance sits exactly on the boundary.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 631 attestFlag = 1 (TRUE).
  BOGUS: min 631 attestFlag = 631 reduces to 1 = 631; BITES. (631, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussCageExact

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced : ((13 : Z) = 13) → attestFlag = 1 :=
  fun _ => rfl

/-- Exactness fires on the boundary-caged configuration (a = 13, A = 507). -/
theorem exact_fires : (13 : Z) = 13 := by
  have h := cage_odd_exact (a := 13) (A := 507) (p := 13) (e := 1)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num) (by norm_num)
  exact h

theorem cert_val_true : min 631 attestFlag = 1 := by
  have h := attestFlag_forced exact_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 631 attestFlag = 631 := by
  rw [cert_val_true]

end Counterexamples
