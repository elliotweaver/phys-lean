import Phys.Algebra.TowerGatherDualProjectionSym27
import Phys.Algebra.TowerGatherProjectionG2Equivariant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- Corestriction of N229's `projSo7` to its range so(7). -/
noncomputable def projSo7cod : Module.End ℚ ImO →ₗ[ℚ] (bornBil).skewAdjointSubmodule :=
  LinearMap.codRestrict _ projSo7 projSo7_apply_mem

@[simp] theorem projSo7cod_coe (X : Module.End ℚ ImO) :
    ((projSo7cod X : (bornBil).skewAdjointSubmodule) : Module.End ℚ ImO) = projSo7 X := rfl

/-- ★ THE AMBIENT PROJECTOR onto the fundamental 7 `range crossEmb`. -/
noncomputable def proj7 : Module.End ℚ (Module.End ℚ ImO) :=
  (bornBil).skewAdjointSubmodule.subtype ∘ₗ (projFun ∘ₗ projSo7cod)

theorem proj7_apply (X : Module.End ℚ ImO) :
    proj7 X = ((projFun (projSo7cod X) : (bornBil).skewAdjointSubmodule) : Module.End ℚ ImO) := rfl

/-- Every image of proj7 lies in `range crossEmb`. -/
theorem proj7_apply_mem (X : Module.End ℚ ImO) :
    proj7 X ∈ LinearMap.range crossEmb := by
  have h := projFun_apply_mem (projSo7cod X)
  rw [Submodule.mem_comap] at h
  rw [proj7_apply]
  exact h

/-- proj7 fixes elements of `range crossEmb`. -/
theorem proj7_apply_fun {X : Module.End ℚ ImO} (hX : X ∈ LinearMap.range crossEmb) :
    proj7 X = X := by
  have hso7 : X ∈ (bornBil).skewAdjointSubmodule := crossEmb_range_le_so7' hX
  have hcod : projSo7cod X = ⟨X, hso7⟩ := by
    apply Subtype.ext
    rw [projSo7cod_coe]
    exact projSo7_apply_skew hso7
  have hfunIn : (⟨X, hso7⟩ : (bornBil).skewAdjointSubmodule)
      ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype := by
    rw [Submodule.mem_comap]; exact hX
  rw [proj7_apply, hcod, projFun_apply_fun hfunIn]

/-- proj7 is idempotent (its image lies in `range crossEmb`, which it fixes). -/
theorem proj7_idem : IsIdempotentElem proj7 := by
  rw [IsIdempotentElem]
  apply LinearMap.ext
  intro X
  rw [Module.End.mul_apply]
  exact proj7_apply_fun (proj7_apply_mem X)

theorem proj7_range : LinearMap.range proj7 = LinearMap.range crossEmb := by
  apply le_antisymm
  · rintro _ ⟨X, rfl⟩; exact proj7_apply_mem X
  · rintro X hX; exact ⟨X, proj7_apply_fun hX⟩

theorem finrank_proj7_range : Module.finrank ℚ (LinearMap.range proj7) = 7 := by
  rw [proj7_range]; exact finrank_crossEmb_range

/-! ## Equivariance correspondence. -/

theorem projSo7cod_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    projSo7cod (adEnd D X) = adSo7 D (projSo7cod X) := by
  apply Subtype.ext
  rw [projSo7cod_coe, adSo7_coe, projSo7cod_coe, ← adEnd_apply]
  exact projSo7_equivariant D X

theorem proj7_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    proj7 (adEnd D X) = adEnd D (proj7 X) := by
  rw [proj7_apply, projSo7cod_equivariant, projFun_equivariant, adSo7_coe, ← proj7_apply,
    adEnd_apply]

end

end Phys.Algebra
