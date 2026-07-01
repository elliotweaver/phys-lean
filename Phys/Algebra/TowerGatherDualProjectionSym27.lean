/-
  Phys.Algebra.TowerGatherDualProjectionSym27 — N230.
  ===========================================================================
  THE g₂-EQUIVARIANT DUAL PROJECTOR `End ℚ ImO → Sym²7` ALONG `so(7)`, AND THE RESOLUTION OF IDENTITY.

  Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, on the full endomorphism
  space `End ℚ ImO` of the banked fundamental 7-module `ImO` (N22) — the arena `7 ⊗ 7 = 49`.
  N227 split it as an internal direct sum of g₂-submodules

      End ℚ ImO  =  Sym²7 (28, the self-adjoint side)  ⊕  Λ²7 (21 = so(7), the skew side),

  via `selfSkew_isCompl : IsCompl (selfAdjointSubmodule bornBil) (skewAdjointSubmodule bornBil)`
  (`bornBil` the Born form on `ImO`, N223/N225), both summands g₂-stable under `adEnd D : X ↦ ⁅imRep D, X⁆`.

  N229 banked the retraction onto the SKEW side: `projSo7 = skewSelf_isCompl.projection`, idempotent, range
  the full 21-dim so(7), commuting with `adEnd D`. This node banks its COMPLEMENTARY PARTNER — the retraction
  onto the SELF (symmetric) side —

      projSym : End ℚ ImO → End ℚ ImO,   range = Sym²7 (28),   ker = so(7),

  (Mathlib's `IsCompl.projection` on the un-reoriented `selfSkew_isCompl`) and the RELATIONAL CONTENT binding
  the two projectors into one resolution of the identity:

   * RESOLUTION OF IDENTITY   `projSym X + projSo7 X = X`        (`projSym_add_projSo7`);
   * `projSym = 1 − projSo7`  pointwise                          (`projSym_eq_sub`);
   * ORTHOGONALITY            `projSo7 ∘ projSym = 0`            (`projSo7_projSym`),
                              `projSym ∘ projSo7 = 0`            (`projSym_projSo7`);
   * ★★★ g₂-EQUIVARIANCE      `projSym (adEnd D X) = adEnd D (projSym X)`   (`projSym_equivariant`).

  So the pair `(projSo7, projSym)` exhibits `7 ⊗ 7 = End ℚ ImO` as the INTERNAL g₂-EQUIVARIANT direct sum
  `Λ²7 (21 = so(7)) ⊕ Sym²7 (28)` via two commuting, orthogonal, idempotent morphisms of g₂-modules that
  sum to the identity — the resolution-of-identity form of the N227 decomposition. N229 gave one half of the
  retraction pair; N230 gives the other half together with the pair's algebra.

  Structure:
   (1) `projSym` — the dual projector, a self-map of `End ℚ ImO`; idempotent (`projSym_idem`).
   (2) `projSym_range = Sym²7`, `projSym_ker = so(7)`, `finrank_projSym_range = 28`.
   (3) `projSym_apply_self`/`_skew`/`_mem`, `projSym_projSym` — fixes Sym²7, kills so(7), image in Sym²7,
       pointwise idempotence.
   (4) `projSym_add_projSo7` (resolution), `projSym_eq_sub`, `projSo7_projSym`/`projSym_projSo7`
       (orthogonality).
   (5) ★★★ `projSym_equivariant` — the dual projector commutes with `adEnd D` (banked `selfAdj_adEnd_inv` +
       `skewAdj_adEnd_inv`, N227): a genuine g₂-module retraction.
   (6) capstone `end_dual_projection_sym27_structure`.

  Every headline TYPE mentions the banked tower objects (`bornBil`, its self/skew submodules, `adEnd`,
  `ImO`, `derivationLieQ`, `projSo7`) — nothing carrier-agnostic, nothing posited, no bridge; `projSym`
  is `IsCompl.projection` used as MACHINERY on the banked N227 decomposition, the dual partner of N229's
  `projSo7`.

  All declarations foundations-only `{propext, Classical.choice, Quot.sound}` (Audits/AxiomAudit).
  Gather side, under the OVERNIGHT PRIORITY LOCK.
-/
import Phys.Algebra.TowerGatherEndProjectionSo7

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227/N228/N229); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- ★ THE DUAL PROJECTOR `End ℚ ImO → Sym²7` ALONG `so(7)`, as a self-map of `End ℚ ImO`.
    The complementary partner of N229's `projSo7`: `IsCompl.projection` on the un-reoriented N227
    complement `selfSkew_isCompl` (self-adjoint side first). -/
noncomputable def projSym : Module.End ℚ (Module.End ℚ ImO) :=
  selfSkew_isCompl.projection

/-- The dual projector is idempotent. -/
theorem projSym_idem : IsIdempotentElem projSym :=
  selfSkew_isCompl.projection_isIdempotentElem

/-- The dual projector's range is exactly `Sym²7` (`selfAdjointSubmodule bornBil`). -/
theorem projSym_range :
    LinearMap.range projSym = (bornBil).selfAdjointSubmodule :=
  selfSkew_isCompl.projection_range

/-- The dual projector's kernel is exactly the banked so(7) (`skewAdjointSubmodule bornBil`). -/
theorem projSym_ker :
    LinearMap.ker projSym = (bornBil).skewAdjointSubmodule :=
  selfSkew_isCompl.projection_ker

/-- ★ The dual projector lands ONTO the FULL 28-dimensional `Sym²7` (banked `finrank_selfAdj_eq_28`, N227). -/
theorem finrank_projSym_range : Module.finrank ℚ (LinearMap.range projSym) = 28 := by
  rw [projSym_range, finrank_selfAdj_eq_28]

/-- The dual projector fixes `Sym²7` elements. -/
theorem projSym_apply_self {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).selfAdjointSubmodule) : projSym X = X :=
  selfSkew_isCompl.projection_apply_left ⟨X, hX⟩

/-- The dual projector kills so(7) elements. -/
theorem projSym_apply_skew {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).skewAdjointSubmodule) : projSym X = 0 :=
  (selfSkew_isCompl.projection_apply_eq_zero_iff).2 hX

/-- Every image of the dual projector lies in `Sym²7`. -/
theorem projSym_apply_mem (X : Module.End ℚ ImO) :
    projSym X ∈ (bornBil).selfAdjointSubmodule :=
  selfSkew_isCompl.projection_apply_mem X

/-- Pointwise idempotence: `projSym (projSym X) = projSym X`. -/
theorem projSym_projSym (X : Module.End ℚ ImO) :
    projSym (projSym X) = projSym X := by
  have h := projSym_idem
  rw [IsIdempotentElem] at h
  calc projSym (projSym X) = (projSym * projSym) X := by rw [Module.End.mul_apply]
    _ = projSym X := by rw [h]

/-! ## RESOLUTION OF IDENTITY & ORTHOGONALITY — binding the pair `(projSo7, projSym)`. -/

/-- ★★ RESOLUTION OF IDENTITY: the self-side and skew-side retractions sum to the identity
    (`Mathlib.IsCompl.projection_add_projection_eq_self` on the N227 complement). -/
theorem projSym_add_projSo7 (X : Module.End ℚ ImO) :
    projSym X + projSo7 X = X :=
  selfSkew_isCompl.projection_add_projection_eq_self X

/-- `projSym = 1 − projSo7` pointwise (the resolution rearranged). -/
theorem projSym_eq_sub (X : Module.End ℚ ImO) :
    projSym X = X - projSo7 X :=
  eq_sub_of_add_eq (projSym_add_projSo7 X)

/-- ★★ ORTHOGONALITY: `projSo7 ∘ projSym = 0` — the so(7) retraction kills every image of the
    Sym²7 retraction (images lie in `Sym²7 = ker projSo7`). -/
theorem projSo7_projSym (X : Module.End ℚ ImO) :
    projSo7 (projSym X) = 0 :=
  projSo7_apply_self (projSym_apply_mem X)

/-- ★★ ORTHOGONALITY: `projSym ∘ projSo7 = 0` — the Sym²7 retraction kills every image of the
    so(7) retraction (images lie in `so(7) = ker projSym`). -/
theorem projSym_projSo7 (X : Module.End ℚ ImO) :
    projSym (projSo7 X) = 0 :=
  projSym_apply_skew (projSo7_apply_mem X)

/-! ## g₂-EQUIVARIANCE of the dual projector. -/

/-- ★★★ g₂-EQUIVARIANCE: the dual projector commutes with the adjoint g₂-action `adEnd D`.
    Split `X = projSym X + (X − projSym X)` into its Sym²7 part (image of `projSym`, banked
    `selfAdj_adEnd_inv`) and its so(7) part (in the kernel, banked `skewAdj_adEnd_inv`); `adEnd D`
    preserves each side, so pushing `projSym` through `adEnd D` keeps the Sym²7 part and drops the
    so(7) part exactly as `adEnd D ∘ projSym` does. The dual of N229's `projSo7_equivariant`. -/
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

/-! ## CAPSTONE. -/

/-- ★★★ THE g₂-EQUIVARIANT DUAL RETRACTION `End ℚ ImO → Sym²7` ALONG `so(7)` on the banked tower:
    an idempotent projector with range the FULL 28-dim `Sym²7`, kernel so(7), summing with N229's
    `projSo7` to the identity (resolution of identity), orthogonal to it, and commuting with the
    adjoint g₂-action `adEnd D`. Together `(projSo7, projSym)` is the internal g₂-equivariant direct
    sum `7 ⊗ 7 = Λ²7 (so(7)) ⊕ Sym²7`. -/
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
