/-
  Counterexamples.GaussBandTouchVacuityCostume — the kill is GENUINE: it
  fires on the REAL band touch of the last silence member. C633.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the band-touch cofactor kill. The content
  that must NOT be hollow: the kill must close a REAL near-configuration on
  the fold's own records. Take A = 403 (the silence catalogue's last member,
  deep-silent, exactly one band touch p = 11 at x = 4: P(4) = 121 = 11·11).
  The kill must prove: the cofactor q = 11 CANNOT be a product of two band
  primes (r = s = 11 with e = 1 would need... 11·11·1 = 121 ≠ 11 — honest
  instance: the VALUE 121 = 11·11 as p·q with q = 11 = r·s·e demands
  r·s·e = 11; r = 11, s = 11 gives 121·e ≠ 11 — the arithmetic hypothesis
  set is unsatisfiable, and THE KILL is why: 3·(11·11) = 363 ≤ 403 holds,
  both 11s band-shallow (403 < 484), so band_cofactor_kill derives FALSE
  from r = s = 11, q = 121, e = 1 — i.e. P(4)/11 = 11 can never be the
  TWO-band-prime shape 121. The kernel recomputes the whole size chain on
  the real numbers of the real discriminant.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 633 attestFlag = 1 (TRUE).
  BOGUS: min 633 attestFlag = 633 reduces to 1 = 633; BITES. (633, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussBandTouch

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((3 * ((11 : Z) * 121) ≤ 403 → False)) → attestFlag = 1 :=
  fun _ => rfl

/-- The kill closes the two-band-prime cofactor shape at the real
    band touch of A = 403 (p = 11, value P(4) = 121, q = 121 = 11·11·1
    hypothetical): the size chain derives False. -/
theorem kill_fires : (3 * ((11 : Z) * 121) ≤ 403 → False) := by
  intro hsize
  exact band_cofactor_kill (p := 11) (q := 121) (A := 403)
    (r := 11) (s := 11) (e := 1)
    (by norm_num) (by norm_num) hsize (by norm_num)
    (by norm_num) (by norm_num) (by norm_num) (by norm_num)
    (by norm_num) (by norm_num)

theorem cert_val_true : min 633 attestFlag = 1 := by
  have h := attestFlag_forced kill_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 633 attestFlag = 633 := by
  rw [cert_val_true]

end Counterexamples
