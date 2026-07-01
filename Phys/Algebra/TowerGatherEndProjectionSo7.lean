/-
  Phys.Algebra.TowerGatherEndProjectionSo7 — N229.
  ===========================================================================
  THE g₂-EQUIVARIANT PROJECTOR `End ℚ ImO → so(7)` ALONG `Sym²7`.

  Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, on the full endomorphism
  space `End ℚ ImO` of the banked fundamental 7-module `ImO` (N22) — the arena `7 ⊗ 7 = 49`.
  N227 split it as an internal direct sum of g₂-submodules

      End ℚ ImO  =  Sym²7 (28, the self-adjoint side)  ⊕  Λ²7 (21 = so(7), the skew side),

  via `selfSkew_isCompl : IsCompl (selfAdjointSubmodule bornBil) (skewAdjointSubmodule bornBil)`,
  where `bornBil` is the Born form on `ImO` (N223/N225), both summands g₂-stable under the adjoint
  action `adEnd D : X ↦ ⁅imRep D, X⁆` (N227).

  This node realizes that complement as an EXPLICIT RETRACTION: the linear projection

      projSo7 : End ℚ ImO → End ℚ ImO,   range = so(7),   ker = Sym²7,

  (Mathlib's `IsCompl.projection` on the reoriented complement `skewSelf_isCompl`) and — the crown
  — proves it is a MORPHISM OF g₂-MODULES: `projSo7` COMMUTES with `adEnd D`

      projSo7 (adEnd D X) = adEnd D (projSo7 X)     (`projSo7_equivariant`).

  So `so(7) = Λ²7` is a g₂-equivariant direct summand of the whole `7 ⊗ 7`, retracted by an
  idempotent g₂-module map whose image is the FULL 21-dimensional so(7) (`finrank_projSo7_range =
  21`, banked `finrank_so7_eq_21`, N225). This is ONE LEVEL UP from N226's projector `projFun`,
  which retracted *within* `⁅so(7)⁆` onto `crossEmb(7)`; here the projector is a clean self-map of
  the ambient `End ℚ ImO` onto the banked so(7) along the symmetric 28.

  Structure:
   (1) `skewSelf_isCompl` — so(7) complementary to Sym²7 (`selfSkew_isCompl.symm`, N227).
   (2) `projSo7` — the projector, a self-map of `End ℚ ImO`; idempotent (`projSo7_idem`).
   (3) `projSo7_range = so(7)`, `projSo7_ker = Sym²7`, `finrank_projSo7_range = 21`.
   (4) `projSo7_apply_skew`/`_self`/`_mem`, `projSo7_projSo7` — fixes so(7), kills Sym²7, image in
       so(7), pointwise idempotence.
   (5) ★★★ `projSo7_equivariant` — the projector commutes with `adEnd D` (banked `skewAdj_adEnd_inv`
       + `selfAdj_adEnd_inv`, N227): a genuine g₂-module retraction.
   (6) capstone `end_projection_so7_structure`.

  Every headline TYPE mentions the banked tower objects (`bornBil`, its self/skew submodules,
  `adEnd`, `ImO`, `derivationLieQ`) — nothing carrier-agnostic, nothing posited, no bridge; the
  projector is `IsCompl.projection` used as MACHINERY on the banked N227 decomposition.

  All declarations foundations-only `{propext, Classical.choice, Quot.sound}` (Audits/AxiomAudit).
  Gather side, under the OVERNIGHT PRIORITY LOCK.
-/
import Phys.Algebra.TowerGatherTracelessSym27

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227/N228); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- The complement of N227 reoriented so that so(7) is FIRST: `skewAdjointSubmodule` (= so(7)) is
    complementary to `selfAdjointSubmodule` (= Sym²7). -/
theorem skewSelf_isCompl :
    IsCompl (bornBil).skewAdjointSubmodule (bornBil).selfAdjointSubmodule :=
  selfSkew_isCompl.symm

/-- ★ THE PROJECTOR `End ℚ ImO → so(7)` ALONG `Sym²7`, as a self-map of `End ℚ ImO`. -/
noncomputable def projSo7 : Module.End ℚ (Module.End ℚ ImO) :=
  skewSelf_isCompl.projection

/-- The projector is idempotent. -/
theorem projSo7_idem : IsIdempotentElem projSo7 :=
  skewSelf_isCompl.projection_isIdempotentElem

/-- The projector's range is exactly the banked so(7) (`skewAdjointSubmodule bornBil`). -/
theorem projSo7_range :
    LinearMap.range projSo7 = (bornBil).skewAdjointSubmodule :=
  skewSelf_isCompl.projection_range

/-- The projector's kernel is exactly the symmetric side `Sym²7` (`selfAdjointSubmodule bornBil`). -/
theorem projSo7_ker :
    LinearMap.ker projSo7 = (bornBil).selfAdjointSubmodule :=
  skewSelf_isCompl.projection_ker

/-- ★ The projector lands ONTO the FULL 21-dimensional so(7) (banked `finrank_so7_eq_21`, N225). -/
theorem finrank_projSo7_range : Module.finrank ℚ (LinearMap.range projSo7) = 21 := by
  rw [projSo7_range, finrank_so7_eq_21]

/-- The projector fixes so(7) elements. -/
theorem projSo7_apply_skew {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).skewAdjointSubmodule) : projSo7 X = X :=
  skewSelf_isCompl.projection_apply_left ⟨X, hX⟩

/-- The projector kills `Sym²7` elements. -/
theorem projSo7_apply_self {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).selfAdjointSubmodule) : projSo7 X = 0 :=
  (skewSelf_isCompl.projection_apply_eq_zero_iff).2 hX

/-- Every image of the projector lies in so(7). -/
theorem projSo7_apply_mem (X : Module.End ℚ ImO) :
    projSo7 X ∈ (bornBil).skewAdjointSubmodule :=
  skewSelf_isCompl.projection_apply_mem X

/-- Pointwise idempotence: `projSo7 (projSo7 X) = projSo7 X`. -/
theorem projSo7_projSo7 (X : Module.End ℚ ImO) :
    projSo7 (projSo7 X) = projSo7 X := by
  have h := projSo7_idem
  rw [IsIdempotentElem] at h
  calc projSo7 (projSo7 X) = (projSo7 * projSo7) X := by rw [Module.End.mul_apply]
    _ = projSo7 X := by rw [h]

/-- ★★★ g₂-EQUIVARIANCE: the projector commutes with the adjoint g₂-action `adEnd D`.
    Split `X = projSo7 X + (X − projSo7 X)` into its so(7) part (image of the projector, banked
    `skewAdj_adEnd_inv`) and its Sym²7 part (in the kernel, banked `selfAdj_adEnd_inv`); `adEnd D`
    preserves each side, so pushing `projSo7` through `adEnd D` keeps the so(7) part and drops the
    Sym²7 part exactly as `adEnd D ∘ projSo7` does. A genuine morphism of g₂-modules. -/
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

/-! ## CAPSTONE. -/

/-- ★★★ THE g₂-EQUIVARIANT RETRACTION `End ℚ ImO → so(7)` ALONG `Sym²7` on the banked tower:
    an idempotent projector with range the FULL 21-dim so(7), kernel `Sym²7`, commuting with the
    adjoint g₂-action `adEnd D`. -/
theorem end_projection_so7_structure :
    IsIdempotentElem projSo7 ∧
    LinearMap.range projSo7 = (bornBil).skewAdjointSubmodule ∧
    LinearMap.ker projSo7 = (bornBil).selfAdjointSubmodule ∧
    Module.finrank ℚ (LinearMap.range projSo7) = 21 ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      projSo7 (adEnd D X) = adEnd D (projSo7 X)) :=
  ⟨projSo7_idem, projSo7_range, projSo7_ker, finrank_projSo7_range, projSo7_equivariant⟩

end

end Phys.Algebra
