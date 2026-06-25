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

-- ImO is finite-dimensional? (needed by the generic bridge)
example : FiniteDimensional ℚ ImO := by infer_instance

-- imRep D is skew-adjoint for gBil.restrict ImO (via banked restrictOp_skew + restrictOp = imRep rfl)
example (D : derivationLieQ) : (gBil.restrict ImO).IsSkewAdjoint (imRep D) := by
  have h := restrictOp_skew ImO (fun D x hx => derivLieQ_mapsTo D x hx) D
  -- restrictOp ImO _ D = imRep D by rfl
  exact h

-- the skew-adjoint hypothesis for S = range (imRep ∘ I.incl)
example (I : LieIdeal ℚ derivationLieQ) :
    ∀ T ∈ Set.range (fun x : I => imRep (I.incl x)),
      (gBil.restrict ImO).IsSkewAdjoint T := by
  rintro T ⟨x, rfl⟩
  exact restrictOp_skew ImO (fun D x hx => derivLieQ_mapsTo D x hx) (I.incl x)

end
end Phys.Algebra
