import Phys.Algebra.DerivationIrreducible
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- P1 MEASURE: D restricted to an invariant submodule N is skew-adjoint for gBil.restrict N.
-- We want: for D ∈ derivationLieQ, N invariant, the restricted operator is skew for gBil.restrict N.
-- gBil.restrict N is a BilinForm ℚ N. The restricted operator is D.restrict hN : End ℚ N.
example (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (N : Submodule ℚ (O ℚ))
    (hN : ∀ x ∈ N, D x ∈ N) :
    (gBil.restrict N).IsSkewAdjoint (D.restrict hN) := by
  intro x y
  show (gBil.restrict N) (D.restrict hN x) y = (gBil.restrict N) x ((-(D.restrict hN)) y)
  simp only [BilinForm.restrict_apply, LinearMap.restrict_apply, LinearMap.neg_apply]
  -- goal: gBil (D x) y = gBil x (-(D y))   (with x,y : N coerced)
  have hsk := gFormQ_skew D hD (x : O ℚ) (y : O ℚ)
  show gForm (D (x:O ℚ)) (y:O ℚ) = gForm (x:O ℚ) (-(D (y:O ℚ)))
  have hneg : gForm (x:O ℚ) (-(D (y:O ℚ))) = - gForm (x:O ℚ) (D (y:O ℚ)) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  rw [hneg]; linarith

end
end Phys.Algebra
