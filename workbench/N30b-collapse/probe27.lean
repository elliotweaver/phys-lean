import Phys.Algebra.DerivationSimpleCollapse

open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- Work with Sq := S.restrictScalars ℚ : Submodule ℚ V (a genuine ℚ-subspace).
-- act-by-a on Sq as a ℚ-linear endo, NO ↥S SMul.
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) (a : A) :
    ↥(S.restrictScalars ℚ) →ₗ[ℚ] ↥(S.restrictScalars ℚ) := by
  refine LinearMap.restrict (a : Module.End ℚ V) ?_
  intro x hx
  rw [Submodule.restrictScalars_mem] at hx ⊢
  have : (a : Module.End ℚ V) x = a • x := rfl
  rw [this]; exact S.smul_mem a hx

-- finrank of restrictScalars equals finrank of S (ℚ-dim)
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V)
    (hdS : Module.finrank ℚ S = 1) : Module.finrank ℚ (S.restrictScalars ℚ) = 1 := by
  rw [Submodule.finrank_restrictScalars]; exact hdS

end Phys.Algebra.Collapse
end
