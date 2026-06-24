import Phys.Algebra.Derivation
import Mathlib.Tactic

namespace Phys.Algebra.Scratch
open Phys.Cascade Phys.Cascade.CD

section Abstract
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

-- PROBE: is O ℚ / CD (CD B) a ℚ-vector space, and is a ℤ-linear endo ℚ-linear?
-- We need D (q • x) = q • D x for q : ℚ to kill the trace scalar.

-- Does Module ℚ resolve over the Dbl ℚ ground?
example : Module ℚ (CD (CD (Dbl ℚ))) := by infer_instance

end Abstract

end Phys.Algebra.Scratch
