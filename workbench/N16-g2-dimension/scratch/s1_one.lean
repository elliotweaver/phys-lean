import Phys.Algebra.Derivation
import Mathlib.Tactic

namespace Phys.Algebra.Scratch
open Phys.Cascade Phys.Cascade.CD

section Abstract
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

/-- THE UNIT-ANNIHILATION: every Leibniz-derivation kills the unit. `D 1 = D(1·1) =
    D1·1 + 1·D1 = 2·D1`, so `D 1 = 0`. Theory-native, no associativity, no coords. -/
theorem deriv_one (D : Module.End ℤ (CD (CD B))) (hD : IsDeriv D) : D 1 = 0 := by
  have h := hD 1 1
  rw [one_mul, mul_one, one_mul] at h
  -- h : D 1 = D 1 + D 1
  have : D 1 + D 1 = D 1 + 0 := by rw [add_zero]; exact h.symm
  exact add_left_cancel this

end Abstract

end Phys.Algebra.Scratch
