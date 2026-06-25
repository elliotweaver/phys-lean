import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- Does Module ℚ ↥S exist at all for S : Submodule A V ?
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) :
    Module ℚ S := by infer_instance

-- IsScalarTower ℚ A ↥S ?
example (A : Subalgebra ℚ (Module.End ℚ V)) (S : Submodule A V) :
    IsScalarTower ℚ A S := by infer_instance

end
