import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra.Scratch
open Phys.Cascade Phys.Cascade.CD

section Abstract
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

-- PROBE A: the trace form x + star x lands in the embedded base (im-component zero).
-- This is one level of "trace is central scalar". Clean ext+simp?
example (x : CD (CD B)) : (x + star x) = iota (x.re + star x.re) := by
  ext <;> simp [iota]

-- PROBE B: does D kill an integer scalar multiple of 1?  (n • 1 for n : ℤ)
example (D : Module.End ℤ (CD (CD B))) (hD : IsDeriv D) (n : ℤ) : D (n • (1 : CD (CD B))) = 0 := by
  rw [map_smul, deriv_one D hD, smul_zero]

end Abstract
end Phys.Algebra.Scratch
