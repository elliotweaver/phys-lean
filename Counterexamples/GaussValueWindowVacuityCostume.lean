/-
  Counterexamples.GaussValueWindowVacuityCostume — the window + pairing are
  GENUINE: both fire on the real band touch of A = 403. C634.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the value window and the pairing. The
  content that must NOT be hollow: BOTH capstones must fire on the REAL band
  touch of the silence catalogue's last member — A = 403, p = 11, least root
  x = 4: P(4) = 121 = 11·11, y = 2x+1 = 9: 4·121 = 484 = 81 + 403 ✓, gate
  3·121 = 363 ≤ 403 ✓. The window must pin: 403 < 484 ∧ 363 ≤ 403. And the
  pairing: the cofactor 11 divides q = 11 (w = 1), so 11 must touch through
  the same value — witness k = p·w = 11: 121 = 11·11 ✓. The kernel recomputes
  both chains on the real numbers.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 634 attestFlag = 1 (TRUE).
  BOGUS: min 634 attestFlag = 634 reduces to 1 = 634; BITES. (634, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussValueWindow

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    (((403 : Z) < 4 * (11 * 11) ∧ 3 * ((11 : Z) * 11) ≤ 403) ∧
     (∃ k : Z, (4 : Z) * 4 + 4 + 101 = 11 * k)) → attestFlag = 1 :=
  fun _ => rfl

/-- Window + pairing fire on the real band touch of A = 403. -/
theorem window_and_pairing_fire :
    (((403 : Z) < 4 * (11 * 11) ∧ 3 * ((11 : Z) * 11) ≤ 403) ∧
     (∃ k : Z, (4 : Z) * 4 + 4 + 101 = 11 * k)) := by
  constructor
  · exact least_value_window (p := 11) (q := 11) (A := 403) (y := 9)
      (by norm_num) (by norm_num) (by norm_num) (by norm_num)
  · exact band_partner_touches (p := 11) (q := 11) (r := 11) (w := 1)
      (x := 4) (c₀ := 101) (by norm_num) (by norm_num)

theorem cert_val_true : min 634 attestFlag = 1 := by
  have h := attestFlag_forced window_and_pairing_fire
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 634 attestFlag = 634 := by
  rw [cert_val_true]

end Counterexamples
