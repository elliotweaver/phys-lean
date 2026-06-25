import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- L1 COMMUTANT (generic). T commutes with each generator (T-first orientation) ⟹ A-linear.
example (S : Set (Module.End ℚ V)) (T : Module.End ℚ V)
    (hT : ∀ s ∈ S, Commute T s) :
    V →ₗ[Algebra.adjoin ℚ S] V where
  toFun := T
  map_add' := T.map_add
  map_smul' := by
    intro a x
    have hc : Commute T (a : Module.End ℚ V) :=
      Algebra.commute_of_mem_adjoin_of_forall_mem_commute a.2 hT
    show T ((a : Module.End ℚ V) x) = (a : Module.End ℚ V) (T x)
    have h2 : (T * (a : Module.End ℚ V)) x = ((a : Module.End ℚ V) * T) x := by rw [hc]
    simpa [Module.End.mul_apply] using h2

end
