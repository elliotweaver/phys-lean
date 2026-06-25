import Phys.Algebra.DerivationSemisimpleModule
import Mathlib.RingTheory.SimpleModule.Isotypic
import Mathlib.RingTheory.SimpleModule.Rank

open LinearMap (BilinForm)

noncomputable section

variable {V : Type*} [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]

-- L1 COMMUTANT (generic). Given T : End ℚ V commuting with every generator in S,
-- T commutes with all of A = adjoin ℚ S, hence is A-linear ⟹ defines an element of End A V.
-- First: commuting with generators ⟹ commuting with adjoin.
example (S : Set (Module.End ℚ V)) (T : Module.End ℚ V)
    (hT : ∀ s ∈ S, Commute s T) (a : Module.End ℚ V) (ha : a ∈ Algebra.adjoin ℚ S) :
    Commute a T := by
  exact Algebra.commute_of_mem_adjoin_of_forall_mem_commute ha hT

-- Then: T A-linear means T (a • x) = a • T x for all a ∈ A. Build LinearMap A V →ₗ V (= End A V).
-- Define f : V →ₗ[A] V from T with the A-linearity coming from commuting.
example (S : Set (Module.End ℚ V)) (T : Module.End ℚ V)
    (hT : ∀ s ∈ S, Commute s T) :
    V →ₗ[Algebra.adjoin ℚ S] V where
  toFun := T
  map_add' := T.map_add
  map_smul' := by
    intro a x
    -- a • x = (a : End) x ; need T ((a:End) x) = (a:End) (T x), i.e. Commute (a:End) T applied
    have hc : Commute (a : Module.End ℚ V) T :=
      Algebra.commute_of_mem_adjoin_of_forall_mem_commute a.2 hT
    show T ((a : Module.End ℚ V) x) = (a : Module.End ℚ V) (T x)
    have := hc  -- Commute means a * T = T * a, i.e. (a∘T) = (T∘a)
    have h2 : (T * (a : Module.End ℚ V)) x = ((a : Module.End ℚ V) * T) x := by
      rw [hc.symm]
    simpa [Module.End.mul_apply] using h2

end
