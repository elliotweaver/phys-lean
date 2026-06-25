import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)

noncomputable section
namespace Phys.Algebra.Collapse

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- TEST 1: is Module A ↥S available quickly?
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) : Module A S := by
  infer_instance

-- TEST 2: the A-module endo "act by a" on S, using DistribMulAction.toLinearMap
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) (a : A) : S →ₗ[ℚ] S := by
  exact (DistribMulAction.toLinearMap ℚ S a).restrictScalars ℚ

end Phys.Algebra.Collapse
end
