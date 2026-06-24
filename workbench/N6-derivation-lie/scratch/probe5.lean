import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

namespace ProbeN6b
section Carrier
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

-- the smul-mul interchange over a NonAssocRing with ℤ action
example (n : ℤ) (a b : CD (CD B)) : (n • a) * b = n • (a * b) := by
  exact?

end Carrier
end ProbeN6b
