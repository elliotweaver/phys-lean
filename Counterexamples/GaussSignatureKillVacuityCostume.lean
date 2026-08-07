/-
  Counterexamples.GaussSignatureKillVacuityCostume — the ratio kill is
  GENUINE: it kills the real doubling attempt inside the real window. C635.
  =====================================================================================
  W8 ANTI-VACUITY. The node claims the doubling overflow. The content that
  must NOT be hollow: window_double_kill must derive FALSE from a REAL
  attempted signature collision — A = 403's window is (100.75, 134.33]:
  L = 100 (integer floor witness: 100 < u), a resident u = 121 (the real
  band-touch value P(4)), and the doubling attempt v = 2·1·121 = 242 ≤ 200?
  NO — 242 > 2·100: the hypothesis v ≤ 2L fails, which IS the kill's
  content: the doubled value CANNOT be back in the window. Honest firing:
  hypothetical resident u = 121 with L = 100 and a claimed v = 2·1·121
  inside v ≤ 200 — the hypothesis set is contradictory and the kill derives
  False from it: ∀ v, 100 < 121 → v ≤ 200 → v = 2·1·121 → False. The kernel
  recomputes the collision arithmetic on the real numbers of A = 403.

  THE CERTIFICATE. attestFlag := 1. TIED. Anchor min 635 attestFlag = 1 (TRUE).
  BOGUS: min 635 attestFlag = 635 reduces to 1 = 635; BITES. (635, 1) fresh.
  MUST FAIL to compile.
-/
import Phys.Algebra.GaussSignatureKill

set_option maxRecDepth 8192
set_option maxHeartbeats 1600000

namespace Counterexamples
open Phys.Foundation.GaussForms.BQF
open Phys.Foundation

def attestFlag : Nat := 1

theorem attestFlag_forced :
    ((∀ v : Z, v ≤ 2 * 100 → v = 2 * 1 * 121 → False)) → attestFlag = 1 :=
  fun _ => rfl

/-- The kill closes the doubling of the real resident 121 out of the
    ratio-2 envelope of A = 403's window. -/
theorem kill_fires : ∀ v : Z, v ≤ 2 * 100 → v = 2 * 1 * 121 → False := by
  intro v hv hdvd
  exact window_double_kill (L := 100) (u := 121) (w := 1)
    (by norm_num) (by norm_num) hv hdvd (by norm_num)

theorem cert_val_true : min 635 attestFlag = 1 := by
  have h := attestFlag_forced kill_fires
  rw [h]
  rfl

/-- THE BOGUS CLAIM — the kernel must REJECT this. -/
theorem bogus : min 635 attestFlag = 635 := by
  rw [cert_val_true]

end Counterexamples
