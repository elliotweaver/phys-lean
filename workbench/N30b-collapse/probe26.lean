import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- restrictScalars route: act by (a : End ℚ V) on S as a ℚ-linear endo of ↥S.
-- The map S → S, x ↦ (a:End) x, is well-defined since S is A-stable. NO ↥S SMul needed.
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) (a : A) :
    ↥S →ₗ[ℚ] ↥S := by
  refine LinearMap.restrict (a : Module.End ℚ V) ?_
  intro x hx
  -- (a : End ℚ V) x ∈ S because S is an A-submodule and (a:End) x = a • x
  have : (a : Module.End ℚ V) x = a • x := rfl
  rw [this]; exact S.smul_mem a hx

-- and dim_ℚ ↥S works as a ℚ-subspace? finrank ℚ ↥S
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V)
    (hdS : Module.finrank ℚ S = 1) : Module.finrank ℚ S = 1 := hdS

end Phys.Algebra.Collapse
end
