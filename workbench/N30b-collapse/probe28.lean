import Phys.Algebra.DerivationSimpleCollapse
open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V)
    (hdS : Module.finrank ℚ S = 1) : Module.finrank ℚ (S.restrictScalars ℚ) = 1 := by
  rw [show (S.restrictScalars ℚ) = (S.restrictScalars ℚ) from rfl]
  exact hdS
end Phys.Algebra.Collapse
end
