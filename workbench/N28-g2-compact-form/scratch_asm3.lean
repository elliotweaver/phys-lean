import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- The orthogonal complement of W WITHIN ImO: W'' = gBil.orthogonal W ⊓ ImO.
-- Claim: IsCompl W W'' as submodules of O ℚ, given W ≤ ImO.
-- We have isCompl_gBil_orthogonal W : IsCompl W (gBil.orthogonal W) in all of O ℚ.
-- And ImO = W ⊔ (gBil.orthogonal W ⊓ ImO) by modularity since W ≤ ImO.

example (W : Submodule ℚ (O ℚ)) (hWle : W ≤ ImO) :
    W ⊔ (gBil.orthogonal W ⊓ ImO) = ImO := by
  have hC := isCompl_gBil_orthogonal W
  -- W ⊔ (gBil.orthogonal W ⊓ ImO) = (W ⊔ gBil.orthogonal W) ⊓ ImO  [modular, W ≤ ImO]
  rw [← sup_inf_assoc_of_le _ hWle, hC.sup_eq_top, top_inf_eq]

example (W : Submodule ℚ (O ℚ)) (hWle : W ≤ ImO) :
    Disjoint W (gBil.orthogonal W ⊓ ImO) := by
  have hC := isCompl_gBil_orthogonal W
  exact hC.disjoint.mono_right inf_le_left

end
end Phys.Algebra
