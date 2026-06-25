import Phys.Algebra.DerivationSimpleCollapse
open LinearMap (BilinForm)
noncomputable section
namespace Phys.Algebra.Collapse
variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
set_option synthInstance.maxHeartbeats 400000 in
set_option maxHeartbeats 800000 in
example (A : Subalgebra ℚ (Module.End ℚ V)) (n : ℕ) (S : Submodule A V)
    (e : V ≃ₗ[A] Fin n → S) (a : A) (c : ℚ) (v : V)
    (he : e (a • v) = a • (e v)) (hpi : a • (e v) = c • (e v)) :
    a • v = c • v := by
  have hec : e (c • v) = c • (e v) := (e.restrictScalars ℚ).map_smul c v
  exact e.injective (by rw [he, hpi, ← hec])
end Phys.Algebra.Collapse
end
