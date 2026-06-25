import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- finrank of derivationLieQ as a submodule
example : Module.finrank ℚ derivationLieQ.toSubmodule = 14 := by
  rw [show derivationLieQ.toSubmodule = derivationQ from rfl]
  exact finrank_derivationQ_eq_14

-- the action ⁅D, x⁆ = (D:End) x
example (D : derivationLieQ) (x : O ℚ) : ⁅D, x⁆ = (D : Module.End ℚ (O ℚ)) x := rfl

-- a derivation preserves a Lie submodule's carrier
example (N : LieSubmodule ℚ derivationLieQ (O ℚ)) (D : derivationLieQ) (x : O ℚ)
    (hx : x ∈ N.toSubmodule) : (D : Module.End ℚ (O ℚ)) x ∈ N.toSubmodule :=
  N.lie_mem hx

-- restriction operator
def derivRestrict (N : LieSubmodule ℚ derivationLieQ (O ℚ)) (D : derivationLieQ) :
    Module.End ℚ N.toSubmodule :=
  (D : Module.End ℚ (O ℚ)).restrict (fun x hx => N.lie_mem hx)

-- skew-adjoint for the restricted form (P1)
theorem derivRestrict_skew (N : LieSubmodule ℚ derivationLieQ (O ℚ)) (D : derivationLieQ) :
    (gBil.restrict N.toSubmodule).IsSkewAdjoint (derivRestrict N D) := by
  intro x y
  show (gBil.restrict N.toSubmodule) (derivRestrict N D x) y
    = (gBil.restrict N.toSubmodule) x ((-(derivRestrict N D)) y)
  simp only [BilinForm.restrict_apply, LinearMap.neg_apply]
  show gForm ((D:Module.End ℚ (O ℚ)) (x:O ℚ)) (y:O ℚ)
    = gForm (x:O ℚ) (-(derivRestrict N D y : O ℚ))
  have hsk := gFormQ_skew (D:Module.End ℚ (O ℚ)) D.2 (x:O ℚ) (y:O ℚ)
  have hneg : gForm (x:O ℚ) (-((D:Module.End ℚ (O ℚ)) (y:O ℚ)))
      = - gForm (x:O ℚ) ((D:Module.End ℚ (O ℚ)) (y:O ℚ)) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  show gForm ((D:Module.End ℚ (O ℚ)) (x:O ℚ)) (y:O ℚ)
    = gForm (x:O ℚ) (-((D:Module.End ℚ (O ℚ)) (y:O ℚ)))
  rw [hneg]; linarith

end
end Phys.Algebra
