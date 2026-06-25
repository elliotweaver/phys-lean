import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Tactic

open LinearMap (BilinForm)

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

-- L4a (generic): IsCompl transfers across restrictScalars (down). If the underlying K-submodules
-- are complementary, the A-submodules are complementary.
theorem isCompl_of_restrictScalars (A : Subalgebra K (Module.End K V))
    (P P' : Submodule A V)
    (h : IsCompl (P.restrictScalars K) (P'.restrictScalars K)) : IsCompl P P' := by
  have hinj := Submodule.restrictScalars_injective K A V
  constructor
  · rw [disjoint_iff]
    apply hinj
    rw [Submodule.restrictScalars_inf, Submodule.restrictScalars_bot]
    exact disjoint_iff.mp h.disjoint
  · rw [codisjoint_iff]
    apply hinj
    rw [Submodule.restrictScalars_sup, Submodule.restrictScalars_top]
    exact codisjoint_iff.mp h.codisjoint
