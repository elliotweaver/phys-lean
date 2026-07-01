/-
  N229 PROBE 1 — the g₂-equivariant projector End ℚ ImO → so(7) along Sym²7.
  Measure the whole construction (W9) before committing to production.
  Template: N226 projFun, but ONE LEVEL UP and CLEANER (self-map on End ℚ ImO,
  no comap/subtype juggling).
-/
import Phys.Algebra.TowerGatherTracelessSym27

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- The complement, oriented so(7) FIRST: skewAdj (so(7)) is complementary to selfAdj (Sym²7). -/
theorem skewSelf_isCompl :
    IsCompl (bornBil).skewAdjointSubmodule (bornBil).selfAdjointSubmodule :=
  selfSkew_isCompl.symm

/-- THE PROJECTOR: End ℚ ImO → so(7) along Sym²7, as a self-map of End ℚ ImO. -/
noncomputable def projSo7 : Module.End ℚ (Module.End ℚ ImO) :=
  skewSelf_isCompl.projection

/-- idempotent -/
theorem projSo7_idem : IsIdempotentElem projSo7 :=
  skewSelf_isCompl.projection_isIdempotentElem

/-- range = so(7) -/
theorem projSo7_range :
    LinearMap.range projSo7 = (bornBil).skewAdjointSubmodule :=
  skewSelf_isCompl.projection_range

/-- ker = Sym²7 -/
theorem projSo7_ker :
    LinearMap.ker projSo7 = (bornBil).selfAdjointSubmodule :=
  skewSelf_isCompl.projection_ker

/-- range dimension = 21 (banked finrank_so7_eq_21) -/
theorem finrank_projSo7_range : Module.finrank ℚ (LinearMap.range projSo7) = 21 := by
  rw [projSo7_range, finrank_so7_eq_21]

/-- projSo7 fixes so(7) elements -/
theorem projSo7_apply_skew {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).skewAdjointSubmodule) : projSo7 X = X :=
  skewSelf_isCompl.projection_apply_left ⟨X, hX⟩

/-- projSo7 kills Sym²7 elements -/
theorem projSo7_apply_self {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).selfAdjointSubmodule) : projSo7 X = 0 :=
  (skewSelf_isCompl.projection_apply_eq_zero_iff).2 hX

theorem projSo7_apply_mem (X : Module.End ℚ ImO) :
    projSo7 X ∈ (bornBil).skewAdjointSubmodule :=
  skewSelf_isCompl.projection_apply_mem X

theorem projSo7_projSo7 (X : Module.End ℚ ImO) :
    projSo7 (projSo7 X) = projSo7 X := by
  have h := projSo7_idem
  rw [IsIdempotentElem] at h
  calc projSo7 (projSo7 X) = (projSo7 * projSo7) X := by rw [Module.End.mul_apply]
    _ = projSo7 X := by rw [h]

/-- ★★★ g₂-EQUIVARIANCE: projSo7 commutes with adEnd D. -/
theorem projSo7_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    projSo7 (adEnd D X) = adEnd D (projSo7 X) := by
  have hskew := projSo7_apply_mem X
  have hself : X - projSo7 X ∈ (bornBil).selfAdjointSubmodule := by
    have hz : projSo7 (X - projSo7 X) = 0 := by
      rw [map_sub projSo7 X (projSo7 X), projSo7_projSo7, sub_self]
    exact (skewSelf_isCompl.projection_apply_eq_zero_iff).1 hz
  have h1 := skewAdj_adEnd_inv D _ hskew
  have h2 := selfAdj_adEnd_inv D _ hself
  have hX : X = projSo7 X + (X - projSo7 X) := by abel
  calc projSo7 (adEnd D X)
      = projSo7 (adEnd D (projSo7 X)) + projSo7 (adEnd D (X - projSo7 X)) := by
        conv_lhs => rw [hX]; rw [map_add, map_add]
    _ = adEnd D (projSo7 X) + 0 := by
        rw [projSo7_apply_skew h1, projSo7_apply_self h2]
    _ = adEnd D (projSo7 X) := add_zero _

end

end Phys.Algebra
