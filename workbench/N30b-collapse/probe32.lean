import Phys.Algebra.DerivationSimpleCollapse
open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
set_option synthInstance.maxHeartbeats 200000 in
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) : Module A S := by
  infer_instance
end Phys.Algebra.Collapse
end
