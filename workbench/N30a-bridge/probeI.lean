import Phys.Algebra.DerivationSimpleStructure
import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple
noncomputable section

-- inline the generic bridge result as an axiom-free hypothesis to isolate the instantiation cost
-- (generic theorem proven in probeG; here only the INSTANTIATION at ↥ImO is measured).
axiom isSemisimpleModule_adjoin_GENERIC
    {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]
    (B : BilinForm K V) (hsymm : B.IsSymm) (hrefl : B.IsRefl)
    (hnd : ∀ W : Submodule K V, (B.restrict W).Nondegenerate)
    (S : Set (Module.End K V)) (hS : ∀ T ∈ S, B.IsSkewAdjoint T) :
    IsSemisimpleModule (Algebra.adjoin K S) V

-- the nondegeneracy-on-every-W hypothesis for gBil.restrict ImO
theorem gImO_nd_all (W : Submodule ℚ ImO) : ((gBil.restrict ImO).restrict W).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm ((x : ImO) : O ℚ) ((x : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hx x
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))
  · intro y hy
    have h0 : gForm ((y : ImO) : O ℚ) ((y : ImO) : O ℚ) = 0 := by
      simpa [BilinForm.restrict, gBil_apply] using hy y
    exact Subtype.ext (Subtype.ext (gForm_self_eq_zero.mp h0))

-- THE INSTANTIATION at ↥ImO with A_I = adjoin of the ideal action. MEASURE the cost.
theorem bridge_ImO (I : LieIdeal ℚ derivationLieQ) :
    IsSemisimpleModule
      (Algebra.adjoin ℚ (Set.range (fun x : I => imRep (I.incl x)))) ImO :=
  isSemisimpleModule_adjoin_GENERIC (gBil.restrict ImO) (gBil_restrict_symm ImO)
    ((gBil_restrict_symm ImO).isRefl) gImO_nd_all
    (Set.range (fun x : I => imRep (I.incl x)))
    (by rintro T ⟨x, rfl⟩
        exact restrictOp_skew ImO (fun D x hx => derivLieQ_mapsTo D x hx) (I.incl x))

end
end Phys.Algebra
