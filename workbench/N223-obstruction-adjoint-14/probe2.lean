import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/- MEASURE: build crossOpO a : Module.End ℚ (O ℚ), y ↦ octCross a y = a*y + gForm a y • 1. -/
def crossOpO (a : O ℚ) : Module.End ℚ (O ℚ) where
  toFun y := octCross a y
  map_add' y₁ y₂ := by
    unfold octCross
    rw [mul_add, gForm_add_right, add_smul]
    abel
  map_smul' c y := by
    unfold octCross
    rw [mul_smul_comm, gForm_smul_right, RingHom.id_apply, smul_add, mul_smul]

@[simp] theorem crossOpO_apply (a y : O ℚ) : crossOpO a y = octCross a y := rfl

/-- crossOpO a maps ImO into ImO (octCross _ y ∈ ImO for y ∈ ImO). -/
theorem crossOpO_mapsTo (a : O ℚ) : ∀ y ∈ ImO, crossOpO a y ∈ ImO := by
  intro y hy
  simpa using octCross_mem_ImO (x := a) hy

/-- crossOp a : the cross-product operator on the fundamental 7-rep ImO. -/
def crossOp (a : O ℚ) : Module.End ℚ ImO :=
  (crossOpO a).restrict (crossOpO_mapsTo a)

@[simp] theorem crossOp_coe (a : O ℚ) (y : ImO) :
    ((crossOp a y : ImO) : O ℚ) = octCross a (y : O ℚ) := rfl

/-- ★★ THE g₂-INTERTWINER (operator level): ⁅imRep D, crossOp a⁆ = crossOp (D a)
    as operators on ImO. The map a ↦ crossOp a is a g₂-module homomorphism. -/
theorem crossOp_imRep_intertwine (D : derivationLieQ) (a : O ℚ) :
    ⁅imRep D, crossOp a⁆ = crossOp ((D : Module.End ℚ (O ℚ)) a) := by
  refine LinearMap.ext fun y => Subtype.ext ?_
  -- LHS coe = D(octCross a y) - octCross a (D y); RHS coe = octCross (D a) y
  show ((imRep D) (crossOp a y) : O ℚ) - ((crossOp a) (imRep D y) : O ℚ)
        = octCross ((D : Module.End ℚ (O ℚ)) a) (y : O ℚ)
  rw [imRep_coe, crossOp_coe, crossOp_coe, imRep_coe]
  rw [derivationLieQ_octCross_leibniz D a (y : O ℚ)]
  abel

end

end Phys.Algebra
