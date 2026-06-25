import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- With IsSimpleModule A S in scope, are SMul/the action fast?
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) [IsSimpleModule A S]
    (a : A) (s : S) : S := a • s

-- restrictScalars route: act by (a : End ℚ V) on S.restrictScalars ℚ (pure ℚ-linear)
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) [IsSimpleModule A S]
    (a : A) : (S.restrictScalars ℚ) →ₗ[ℚ] (S.restrictScalars ℚ) := by
  refine LinearMap.restrict (a : Module.End ℚ V) ?_
  intro x hx
  -- a maps S into S since S is an A-submodule
  exact S.smul_mem a hx

end Phys.Algebra.Collapse
end
