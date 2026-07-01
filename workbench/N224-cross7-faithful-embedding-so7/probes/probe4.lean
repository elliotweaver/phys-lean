import Phys.Algebra.TowerGatherObstructionAdjointSo7
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

noncomputable def crossEmb : ImO →ₗ[ℚ] Module.End ℚ ImO where
  toFun a := crossOp (a : O ℚ)
  map_add' a b := by
    refine LinearMap.ext fun y => Subtype.ext ?_
    simp only [Submodule.coe_add, crossOp_coe, LinearMap.add_apply, Submodule.coe_add]
    unfold octCross
    rw [add_mul, gForm_add_left, add_smul]; abel
  map_smul' c a := by
    refine LinearMap.ext fun y => Subtype.ext ?_
    simp only [SetLike.val_smul, crossOp_coe, RingHom.id_apply, LinearMap.smul_apply]
    unfold octCross
    rw [qsmul_mul_left, gForm_smul_left, smul_add, smul_smul]

@[simp] theorem crossEmb_apply (a : ImO) : crossEmb a = crossOp (a : O ℚ) := rfl

-- ★★ THE g₂-SUBMODULE PROPERTY: the range of crossEmb (the fundamental 7 inside so(7))
-- is closed under the adjoint action X ↦ ⁅imRep D, X⁆ of g₂ = Der(O ℚ).
theorem crossEmb_range_g2_invariant (D : derivationLieQ) {X : Module.End ℚ ImO}
    (hX : X ∈ LinearMap.range crossEmb) : ⁅imRep D, X⁆ ∈ LinearMap.range crossEmb := by
  obtain ⟨a, ha⟩ := hX
  refine ⟨⟨(D : Module.End ℚ (O ℚ)) (a : O ℚ), derivLieQ_mapsTo D (a : O ℚ) a.2⟩, ?_⟩
  show crossOp ((D : Module.End ℚ (O ℚ)) (a : O ℚ)) = ⁅imRep D, X⁆
  rw [← ha]
  show crossOp ((D : Module.End ℚ (O ℚ)) (a : O ℚ)) = ⁅imRep D, crossOp (a : O ℚ)⁆
  exact (crossOp_imRep_intertwine D (a : O ℚ)).symm

-- W8 non-vacuity: the embedding is not the zero map — its range is a NONZERO submodule.
theorem crossEmb_ne_zero : crossEmb ≠ 0 := by
  intro h
  have hz : crossOp u1 = crossEmb ⟨u1, u1_mem_ImO⟩ := rfl
  rw [h] at hz
  simp only [LinearMap.zero_apply] at hz
  exact crossOp_ne_zero hz

#print axioms crossEmb_range_g2_invariant
#print axioms crossEmb_ne_zero

end
end Phys.Algebra
