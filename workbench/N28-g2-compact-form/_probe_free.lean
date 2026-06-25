import Mathlib.LinearAlgebra.Dimension.Free
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
open LinearMap (BilinForm)
-- signature of the finrank inequality lemma
#check @LinearMap.finrank_le_finrank_of_injective
-- freeness over a field/division ring
example (V : Type) [AddCommGroup V] [Module ℚ V] : Module.Free ℚ V := by exact?
