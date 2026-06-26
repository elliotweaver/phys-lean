import Phys.Algebra.LorentzContinuumLieAlgebra

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

-- WRONG (costume C82): claiming the infinitesimal rotation generator `rotGenC a` (the space-block
-- left-multiplication `(t,x,v) ↦ (0,0,a·v)`) is FORM-SKEW (an infinitesimal isometry, `IsInfIsomC`)
-- WITHOUT the imaginary hypothesis `gFormC a 1 = 0`. The banked `rotGenC_inf` REQUIRES that
-- hypothesis — the skew identity `gFormC (a·v) w + gFormC v (a·w) = 2·gFormC a 1·gFormC v w` vanishes
-- ONLY when `a` is imaginary. At the NON-imaginary `a = 1` (`gFormC 1 1 = 1 ≠ 0`) the generator is
-- NOT form-skew: evaluating the skew condition at `p = q = (0,0,1)` gives
-- `BvC (rotGenC 1 (0,0,1)) (0,0,1) + BvC (0,0,1) (rotGenC 1 (0,0,1)) = -1 + -1 = -2 ≠ 0`. So the
-- unhypothesized claim is FALSE — it reduces to the false numeric `-2 = 0` (equivalently
-- `(2 : Cut) = 0`, impossible in the derived ℝ). Must FAIL to compile.
theorem rotGen_drops_imaginary_BOGUS :
    BvC (rotGenC (1 : O Cut) ((0 : Cut), (0 : Cut), (1 : O Cut))) ((0 : Cut), (0 : Cut), (1 : O Cut))
      + BvC ((0 : Cut), (0 : Cut), (1 : O Cut)) (rotGenC (1 : O Cut) ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = 0 := by
  have h1 : gFormC ((1 : O Cut)) ((1 : O Cut)) = 1 := by
    show reQC ((1 : O Cut) * star (1 : O Cut)) = 1
    rw [star_one, mul_one]; rfl
  show BvC ((0 : Cut), (0 : Cut), (1 : O Cut) * 1) ((0 : Cut), (0 : Cut), (1 : O Cut))
      + BvC ((0 : Cut), (0 : Cut), (1 : O Cut)) ((0 : Cut), (0 : Cut), (1 : O Cut) * 1) = 0
  show (0 * 0 - 0 * 0 - gFormC ((1 : O Cut) * 1) 1)
      + (0 * 0 - 0 * 0 - gFormC 1 ((1 : O Cut) * 1)) = 0
  rw [mul_one, h1]
  ring_nf

end Counterexamples
