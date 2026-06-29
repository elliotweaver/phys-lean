import Phys.Algebra.DerivationOTangent

namespace Phys.Algebra

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- Commute (s • M) (t • M) since both are scalar multiples of the same matrix over commutative Cut. -/
theorem commute_derivMatrix_smul (s t : Cut) (D' : Module.End Cut (O Cut)) :
    Commute (s • derivMatrix D') (t • derivMatrix D') := by
  unfold Commute SemiconjBy
  rw [smul_mul_smul_comm, smul_mul_smul_comm, mul_comm s t]

/-- ★ THE ONE-PARAMETER FLOW LAW (pointwise): expOLin (s•D') (expOLin (t•D') x) = expOLin ((s+t)•D') x. -/
theorem expOLin_flow_apply (s t : Cut) (D' : Module.End Cut (O Cut)) (x : O Cut) :
    expOLin (s • D') (expOLin (t • D') x) = expOLin ((s + t) • D') x := by
  unfold expOLin
  simp only [LinearMap.comp_apply, LinearEquiv.coe_coe, LinearEquiv.apply_symm_apply]
  rw [show Matrix.mulVecLin (expMap (derivMatrix (t • D'))) (coordOCut x)
        = expMap (derivMatrix (t • D')) *ᵥ coordOCut x from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix (s • D')))
          (expMap (derivMatrix (t • D')) *ᵥ coordOCut x)
        = expMap (derivMatrix (s • D')) *ᵥ (expMap (derivMatrix (t • D')) *ᵥ coordOCut x) from rfl,
    show Matrix.mulVecLin (expMap (derivMatrix ((s + t) • D'))) (coordOCut x)
        = expMap (derivMatrix ((s + t) • D')) *ᵥ coordOCut x from rfl,
    Matrix.mulVec_mulVec, derivMatrix_smul, derivMatrix_smul, derivMatrix_smul,
    expMap_mul_of_commute (s • derivMatrix D') (t • derivMatrix D')
      (commute_derivMatrix_smul s t D'),
    ← add_smul]

#print axioms commute_derivMatrix_smul
#print axioms expOLin_flow_apply

end
end Phys.Algebra
