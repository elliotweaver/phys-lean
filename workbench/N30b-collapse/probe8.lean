import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- S as ℚ-module: restrict scalars from A to ℚ; it's a subspace of V, hence finite-dim.
-- Probe: is ↥S a ℚ-module and FiniteDimensional automatically?
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) :
    FiniteDimensional ℚ S := by
  infer_instance

example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) :
    Module.Free ℚ S := by
  infer_instance

-- finrank of Fin n → ↥S over ℚ
example (A : Subalgebra ℚ (Module.End ℚ V)) (n : ℕ) (S : Submodule A V) :
    Module.finrank ℚ (Fin n → S) = n * Module.finrank ℚ S := by
  rw [Module.finrank_pi_fintype ℚ]
  simp

end
