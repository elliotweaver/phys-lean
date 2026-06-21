import Phys.Cascade.ForcedStop
import Mathlib.Tactic
open Phys.Cascade

-- CANDIDATE B: try to APPLY the new forward law at the sedenion rung S = CD(O).
-- To match CD (CD B) we'd need O = CD B with CommRing B, i.e. B = H, which is NOT
-- commutative. Must FAIL: the forward law cannot reach past the associativity boundary.
example (x y : S ℚ) : CD.Nrm (x * y) = CD.Nrm x * CD.Nrm y :=
  CD.Nrm_mul_of_doubled_base x y
