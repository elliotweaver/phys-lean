import Phys.Algebra.DerivationSkew
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- MEASURE: do the scalar-tower instances synthesize on the componentwise Module ℚ (O ℚ)?
example : IsScalarTower ℚ (O ℚ) (O ℚ) := by infer_instance
example : SMulCommClass ℚ (O ℚ) (O ℚ) := by infer_instance

end Phys.Algebra
