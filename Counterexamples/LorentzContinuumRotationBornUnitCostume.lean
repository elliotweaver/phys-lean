import Phys.Algebra.LorentzContinuumRotation

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

-- WRONG (costume C81): claiming the banked continuum rotation `rotFunC u` (the Born-unit space
-- rotation `v ↦ u·v` over the DERIVED ℝ `Cut`) preserves the continuum Born form `QvC` WITHOUT the
-- Born-unit hypothesis `gFormC u u = 1`. The banked `rotC_isom` REQUIRES that hypothesis — the
-- rotation rescales the space block by `gFormC u u` via the Born composition law `gFormC_comp`
-- (`gFormC (u·v)(u·v) = gFormC u u · gFormC v v`). At the NON-Born-unit `u = 0`
-- (`gFormC 0 0 = 0 ≠ 1`) the rotation COLLAPSES the space block: `rotFunC 0 (0,0,1) = (0,0,0)` with
-- `QvC = 0`, while `QvC (0,0,1) = -1`. So the unhypothesized claim is FALSE — it reduces to the
-- false numeric `(0 : Cut) = -1`. Must FAIL to compile.
theorem rot_drops_bornunit_BOGUS :
    QvC (rotFunC (0 : O Cut) ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = QvC ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  have h0 : gFormC ((0 : O Cut)) ((0 : O Cut)) = 0 := by
    show reQC ((0 : O Cut) * star (0 : O Cut)) = 0
    rw [star_zero, mul_zero]; rfl
  have h1 : gFormC ((1 : O Cut)) ((1 : O Cut)) = 1 := by
    show reQC ((1 : O Cut) * star (1 : O Cut)) = 1
    rw [star_one, mul_one]; rfl
  show QformC 0 0 ((0 : O Cut) * 1) = QformC 0 0 1
  unfold QformC
  rw [zero_mul, h0, h1]
  ring_nf

end Counterexamples
