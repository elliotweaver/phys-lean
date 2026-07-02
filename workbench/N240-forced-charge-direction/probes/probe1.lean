import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationColourCentralizer
import Phys.Algebra.DerivationStabilizerSplit

/-!  N240 measure-first probe — the FORCED CHARGE OPERATOR crossOp u1 and its covariance.  -/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def chargeOp : Module.End ℚ ImO := crossOp u1

theorem chargeOp_mem_so7 : chargeOp ∈ skewAdjointLieSubalgebra bornBil :=
  crossOp_mem_so7 u1 u1_mem_ImO

theorem chargeOp_ne_zero : chargeOp ≠ 0 := crossOp_ne_zero

theorem chargeOp_kills_singlet : chargeOp ⟨u1, u1_mem_ImO⟩ = 0 := by
  apply Subtype.ext
  show octCross u1 u1 = 0
  exact octCross_self u1_mem_ImO

theorem chargeOp_sq_coe (y : ImO) :
    ((chargeOp (chargeOp y) : ImO) : O ℚ)
      = gForm u1 (y : O ℚ) • u1 - (y : O ℚ) := by
  show octCross u1 (octCross u1 (y : O ℚ)) = gForm u1 (y : O ℚ) • u1 - (y : O ℚ)
  rw [octCross_contraction u1_mem_ImO y.2, gForm_u1, one_smul]

/-- crossOp 0 = 0 (helper for the reverse direction). -/
theorem crossOp_zero : crossOp (0 : O ℚ) = 0 := by
  have h : crossOp (((0 : ImO) : O ℚ)) = crossEmb (0 : ImO) := (crossEmb_apply 0).symm
  rw [Submodule.coe_zero] at h
  rw [h, map_zero]

theorem chargeOp_stabilizer_iff (D : derivationLieQ) :
    ⁅imRep D, chargeOp⁆ = 0 ↔ D ∈ colourCentralizer := by
  rw [chargeOp, crossOp_imRep_intertwine D u1, mem_colourCentralizer,
      commutes_JO_iff (isDerivQ_of_mem D)]
  -- goal: crossOp ((D:End) u1) = 0 ↔ (D:End) u1 = 0
  constructor
  · intro h
    have hmem : (D : Module.End ℚ (O ℚ)) u1 ∈ ImO := derivLieQ_mapsTo D u1 u1_mem_ImO
    exact crossOp_inj_on_ImO hmem h
  · intro h
    rw [h, crossOp_zero]

end

end Phys.Algebra
