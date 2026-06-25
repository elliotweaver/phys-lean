import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

set_option maxHeartbeats 400000 in
theorem gBil_restrict_symm (W : Submodule ℚ (O ℚ)) : (gBil.restrict W).IsSymm := by
  rw [BilinForm.isSymm_def]; intro x y
  show gForm (x:O ℚ) (y:O ℚ) = gForm (y:O ℚ) (x:O ℚ)
  exact gForm_symm _ _

-- Does ImO have Module.Finite? It's a submodule of O ℚ (finite). Check.
example (W : Submodule ℚ (O ℚ)) : Module.Finite ℚ W := inferInstance
example (W : Submodule ℚ (O ℚ)) : Module.Finite ℚ (gBil.restrict W).skewAdjointSubmodule :=
  inferInstance

set_option maxHeartbeats 400000 in
theorem finrank_restrictSkew_le (W : Submodule ℚ (O ℚ)) :
    Module.finrank ℚ (gBil.restrict W).skewAdjointSubmodule ≤ (Module.finrank ℚ W).choose 2 :=
  finrank_skewAdjoint_le_choose (gBil.restrict W) (gBil_restrict_symm W)
    (gBil_restrict_nondegenerate W)

end
end Phys.Algebra
