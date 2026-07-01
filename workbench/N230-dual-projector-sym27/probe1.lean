import Phys.Algebra.TowerGatherEndProjectionSo7

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- The DUAL projector `End ℚ ImO → Sym²7` along `so(7)`. -/
noncomputable def projSym : Module.End ℚ (Module.End ℚ ImO) :=
  selfSkew_isCompl.projection

theorem projSym_idem : IsIdempotentElem projSym :=
  selfSkew_isCompl.projection_isIdempotentElem

theorem projSym_range :
    LinearMap.range projSym = (bornBil).selfAdjointSubmodule :=
  selfSkew_isCompl.projection_range

theorem projSym_ker :
    LinearMap.ker projSym = (bornBil).skewAdjointSubmodule :=
  selfSkew_isCompl.projection_ker

theorem finrank_projSym_range : Module.finrank ℚ (LinearMap.range projSym) = 28 := by
  rw [projSym_range, finrank_selfAdj_eq_28]

theorem projSym_apply_self {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).selfAdjointSubmodule) : projSym X = X :=
  selfSkew_isCompl.projection_apply_left ⟨X, hX⟩

theorem projSym_apply_skew {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).skewAdjointSubmodule) : projSym X = 0 :=
  (selfSkew_isCompl.projection_apply_eq_zero_iff).2 hX

theorem projSym_apply_mem (X : Module.End ℚ ImO) :
    projSym X ∈ (bornBil).selfAdjointSubmodule :=
  selfSkew_isCompl.projection_apply_mem X

theorem projSym_projSym (X : Module.End ℚ ImO) :
    projSym (projSym X) = projSym X := by
  have h := projSym_idem
  rw [IsIdempotentElem] at h
  calc projSym (projSym X) = (projSym * projSym) X := by rw [Module.End.mul_apply]
    _ = projSym X := by rw [h]

/-- RESOLUTION OF IDENTITY: `projSym X + projSo7 X = X`. -/
theorem projSym_add_projSo7 (X : Module.End ℚ ImO) :
    projSym X + projSo7 X = X :=
  selfSkew_isCompl.projection_add_projection_eq_self X

/-- `projSym = 1 − projSo7` pointwise. -/
theorem projSym_eq_sub (X : Module.End ℚ ImO) :
    projSym X = X - projSo7 X :=
  eq_sub_of_add_eq (projSym_add_projSo7 X)

/-- ORTHOGONALITY: `projSo7 ∘ projSym = 0`. -/
theorem projSo7_projSym (X : Module.End ℚ ImO) :
    projSo7 (projSym X) = 0 :=
  projSo7_apply_self (projSym_apply_mem X)

/-- ORTHOGONALITY: `projSym ∘ projSo7 = 0`. -/
theorem projSym_projSo7 (X : Module.End ℚ ImO) :
    projSym (projSo7 X) = 0 :=
  projSym_apply_skew (projSo7_apply_mem X)

/-- ★★★ g₂-EQUIVARIANCE of the dual projector. -/
theorem projSym_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    projSym (adEnd D X) = adEnd D (projSym X) := by
  have hself := projSym_apply_mem X
  have hskew : X - projSym X ∈ (bornBil).skewAdjointSubmodule := by
    have hz : projSym (X - projSym X) = 0 := by
      rw [map_sub projSym X (projSym X), projSym_projSym, sub_self]
    exact (selfSkew_isCompl.projection_apply_eq_zero_iff).1 hz
  have h1 := selfAdj_adEnd_inv D _ hself
  have h2 := skewAdj_adEnd_inv D _ hskew
  have hX : X = projSym X + (X - projSym X) := by abel
  calc projSym (adEnd D X)
      = projSym (adEnd D (projSym X)) + projSym (adEnd D (X - projSym X)) := by
        conv_lhs => rw [hX]; rw [map_add, map_add]
    _ = adEnd D (projSym X) + 0 := by
        rw [projSym_apply_self h1, projSym_apply_skew h2]
    _ = adEnd D (projSym X) := add_zero _

/-- CAPSTONE. -/
theorem end_dual_projection_sym27_structure :
    IsIdempotentElem projSym ∧
    LinearMap.range projSym = (bornBil).selfAdjointSubmodule ∧
    LinearMap.ker projSym = (bornBil).skewAdjointSubmodule ∧
    Module.finrank ℚ (LinearMap.range projSym) = 28 ∧
    (∀ X : Module.End ℚ ImO, projSym X + projSo7 X = X) ∧
    (∀ X : Module.End ℚ ImO, projSo7 (projSym X) = 0) ∧
    (∀ X : Module.End ℚ ImO, projSym (projSo7 X) = 0) ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      projSym (adEnd D X) = adEnd D (projSym X)) :=
  ⟨projSym_idem, projSym_range, projSym_ker, finrank_projSym_range,
   projSym_add_projSo7, projSo7_projSym, projSym_projSo7, projSym_equivariant⟩

end

end Phys.Algebra
