import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationLowerBound
import Mathlib.Algebra.Lie.Subalgebra

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42Probe

-- The evaluation-at-u1 map on the derivation Lie algebra.
noncomputable def evalU1 : derivationLieQ →ₗ[ℚ] O ℚ where
  toFun D := (D : Module.End ℚ (O ℚ)) u1
  map_add' D E := rfl
  map_smul' c D := rfl

-- The stabilizer as a Lie subalgebra of derivationLieQ.
def stabLieQ : LieSubalgebra ℚ derivationLieQ where
  carrier := { D | (D : Module.End ℚ (O ℚ)) u1 = 0 }
  add_mem' := by
    intro D E hD hE
    simp only [Set.mem_setOf_eq] at *
    show ((D + E : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    rw [AddSubmonoid.coe_add, LinearMap.add_apply, hD, hE, add_zero]
  zero_mem' := by
    show ((0 : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    simp
  smul_mem' := by
    intro c D hD
    simp only [Set.mem_setOf_eq] at *
    show ((c • D : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    rw [SetLike.val_smul, LinearMap.smul_apply, hD, smul_zero]
  lie_mem' := by
    intro D E hD hE
    simp only [Set.mem_setOf_eq] at *
    show ((⁅D, E⁆ : derivationLieQ) : Module.End ℚ (O ℚ)) u1 = 0
    -- the bracket on the subalgebra is the commutator in Module.End ℚ (O ℚ)
    have hbr : ((⁅D, E⁆ : derivationLieQ) : Module.End ℚ (O ℚ))
        = ⁅(D : Module.End ℚ (O ℚ)), (E : Module.End ℚ (O ℚ))⁆ := rfl
    rw [hbr]
    show ((D : Module.End ℚ (O ℚ)) * E - E * D) u1 = 0
    simp only [LinearMap.sub_apply, Module.End.mul_apply, hE, hD, map_zero, sub_zero]

end N42Probe
end Phys.Algebra
