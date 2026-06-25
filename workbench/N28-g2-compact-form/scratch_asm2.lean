import Phys.Algebra.DerivationIrreducibleFull
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- Generic helper: given W invariant under all derivations, the restriction-to-W map
-- lands in the skew-adjoint submodule of gBil.restrict W.
variable (W : Submodule ℚ (O ℚ))
  (hWinv : ∀ (D : derivationLieQ) (x : O ℚ), x ∈ W → (D : Module.End ℚ (O ℚ)) x ∈ W)

def restrictOp (D : derivationLieQ) : Module.End ℚ W :=
  (D : Module.End ℚ (O ℚ)).restrict (fun x hx => hWinv D x hx)

theorem restrictOp_skew (D : derivationLieQ) :
    (gBil.restrict W).IsSkewAdjoint (restrictOp W hWinv D) := by
  intro x y
  show (gBil.restrict W) (restrictOp W hWinv D x) y
    = (gBil.restrict W) x ((-(restrictOp W hWinv D)) y)
  simp only [BilinForm.restrict_apply, LinearMap.neg_apply]
  show gForm ((D:Module.End ℚ (O ℚ)) (x:O ℚ)) (y:O ℚ)
    = gForm (x:O ℚ) (-((D:Module.End ℚ (O ℚ)) (y:O ℚ)))
  have hsk := gFormQ_skew (D:Module.End ℚ (O ℚ)) D.2 (x:O ℚ) (y:O ℚ)
  have hneg : gForm (x:O ℚ) (-((D:Module.End ℚ (O ℚ)) (y:O ℚ)))
      = - gForm (x:O ℚ) ((D:Module.End ℚ (O ℚ)) (y:O ℚ)) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  rw [hneg]; linarith

def restrictToSkew : derivationLieQ →ₗ[ℚ] (gBil.restrict W).skewAdjointSubmodule where
  toFun D := ⟨restrictOp W hWinv D, (LinearMap.mem_skewAdjointSubmodule _).mpr
    (restrictOp_skew W hWinv D)⟩
  map_add' := by
    intro D E
    apply Subtype.ext
    apply LinearMap.ext; intro x
    apply Subtype.ext
    show ((D:Module.End ℚ (O ℚ)) + (E:Module.End ℚ (O ℚ))) (x:O ℚ)
      = (D:Module.End ℚ (O ℚ)) (x:O ℚ) + (E:Module.End ℚ (O ℚ)) (x:O ℚ)
    rfl
  map_smul' := by
    intro c D
    apply Subtype.ext
    apply LinearMap.ext; intro x
    apply Subtype.ext
    show (c • (D:Module.End ℚ (O ℚ))) (x:O ℚ) = c • (D:Module.End ℚ (O ℚ)) (x:O ℚ)
    rfl

#check @restrictToSkew

end
end Phys.Algebra
