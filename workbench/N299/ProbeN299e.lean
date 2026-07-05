import Phys.Algebra.OctonionJordanTraceFormInvariance
import Phys.Algebra.OctonionJordanSpectrumMovingSectorEquivariance
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- test: for f g : Module.End ℚ M, is ⁅f,g⁆ = f*g - g*f by rfl? and applied form?
example (M : Type) [AddCommGroup M] [Module ℚ M] (f g : Module.End ℚ M) :
    ⁅f, g⁆ = f * g - g * f := by exact?

end Phys.Algebra.HJ
