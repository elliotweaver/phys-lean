import Phys.Algebra.LorentzContinuum

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable def rotFunC (u : O Cut) : STVC → STVC := fun p => (p.1, p.2.1, u * p.2.2)

-- WRONG (costume C81): claiming the continuum rotation `v ↦ u·v` preserves the continuum Born form
-- `QvC` WITHOUT the Born-unit hypothesis `gFormC u u = 1`. The banked `rotC_isom` REQUIRES that
-- hypothesis (the rotation rescales the space block by `gFormC u u` via the Born composition law
-- `gFormC_comp`). At the NON-Born-unit `u = 0` (`gFormC 0 0 = 0 ≠ 1`) the rotation collapses the
-- space block: `QvC (rotFunC 0 (0,0,1)) = 0` but `QvC (0,0,1) = -1`. So the unhypothesized claim
-- is FALSE — it reduces to `(0 : Cut) = -1`. Must FAIL to compile.
theorem rot_drops_bornunit_BOGUS :
    QvC (rotFunC (0 : O Cut) ((0:Cut), (0:Cut), (1:O Cut)))
      = QvC ((0:Cut), (0:Cut), (1:O Cut)) := by
  have h0 : gFormC ((0:O Cut)) ((0:O Cut)) = 0 := by
    show reQC ((0:O Cut) * star (0:O Cut)) = 0
    rw [star_zero, mul_zero]; rfl
  have h1 : gFormC ((1:O Cut)) ((1:O Cut)) = 1 := by
    show reQC ((1:O Cut) * star (1:O Cut)) = 1
    rw [star_one, mul_one]; rfl
  show QformC 0 0 ((0:O Cut) * 1) = QformC 0 0 1
  unfold QformC
  rw [zero_mul, h0, h1]
  ring_nf

end Counterexamples
