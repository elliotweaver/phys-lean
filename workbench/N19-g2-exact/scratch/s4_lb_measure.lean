import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra.ScratchLB
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- D13: e2->+e3, e3->-e2, e6->+e7, e7->-e6 (others -> 0).
-- Coordinate layout (model.py): index = oct_im*4 + h_im*2 + dbl_im.
-- O ℚ element z : re,im in H ℚ; H element : re,im in Dbl ℚ; Dbl : re,im in ℚ.
-- e0=(((1,0),(0,0)),...) etc. Build the linear map componentwise via the 8 coords.
-- coords:  e0=z.re.re.re e1=z.re.re.im e2=z.re.im.re e3=z.re.im.im
--          e4=z.im.re.re e5=z.im.re.im e6=z.im.im.re e7=z.im.im.im

-- helper coordinate accessors
def c0 (z : O ℚ) : ℚ := z.re.re.re
def c1 (z : O ℚ) : ℚ := z.re.re.im
def c2 (z : O ℚ) : ℚ := z.re.im.re
def c3 (z : O ℚ) : ℚ := z.re.im.im
def c4 (z : O ℚ) : ℚ := z.im.re.re
def c5 (z : O ℚ) : ℚ := z.im.re.im
def c6 (z : O ℚ) : ℚ := z.im.im.re
def c7 (z : O ℚ) : ℚ := z.im.im.im

-- D13 as a raw function: maps coord2->coord3(+), coord3->coord2(-), coord6->coord7(+), coord7->coord6(-)
-- output z' with: z'.re.im.re = -c3 z (e2 component gets -e3 input?) Let's define output coords:
-- out_e2 = -c3, out_e3 = +c2, out_e6 = -c7, out_e7 = +c6, rest 0.
def d13fun (z : O ℚ) : O ℚ :=
  ⟨⟨⟨0,0⟩, ⟨-c3 z, c2 z⟩⟩, ⟨⟨0,0⟩, ⟨-c7 z, c6 z⟩⟩⟩

-- Is this additive? (cheap check)
example (a b : O ℚ) : d13fun (a + b) = d13fun a + d13fun b := by
  ext <;> simp [d13fun, c2, c3, c6, c7, CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im] <;> ring

end Phys.Algebra.ScratchLB
