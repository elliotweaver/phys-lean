/-
  Phys.Algebra.TowerGatherAmbientProjection7And14 — N231.
  ===========================================================================
  THE AMBIENT g₂-EQUIVARIANT PROJECTORS `End ℚ ImO → 7` AND `End ℚ ImO → 14`, AND THE THREE-WAY
  RESOLUTION OF IDENTITY.

  Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, on the full endomorphism
  space `End ℚ ImO` of the banked fundamental 7-module `ImO` (N22) — the arena `7 ⊗ 7 = 49`.

  THE ARC. N227 split `End ℚ ImO = Sym²7 (28) ⊕ Λ²7 (21 = so(7))` (g₂-submodules). N229 built the
  AMBIENT retraction `projSo7 : End → so(7)`, N230 its dual `projSym : End → Sym²7`, with the
  RESOLUTION `projSym + projSo7 = id`. Separately, N225/N226 split the SKEW side further,
  `so(7) = 14 ⊕ 7 = imRep(g₂) ⊕ crossEmb(7)`, and N226 built the projector `projFun` retracting the
  `↥so(7)` subtype onto the fundamental 7 along the adjoint 14 — but ONLY inside the subtype.

  This node LIFTS `projFun` to genuine AMBIENT projectors on `End ℚ ImO`, refining `projSo7` into
  the `so(7) = 14 ⊕ 7` pair, and banks the three-way resolution binding them to N230's `projSym`:

      proj7  : End ℚ ImO → End ℚ ImO,   range = range crossEmb (7),   idempotent, g₂-equivariant;
      proj14 : End ℚ ImO → End ℚ ImO,   range = range imRepL  (14),   idempotent, g₂-equivariant;
      proj7 + proj14 = projSo7    (refines the skew side),
      ★★ projSym X + proj7 X + proj14 X = X    (THREE-WAY RESOLUTION: Sym²7 (28) ⊕ 7 ⊕ 14 = 49),
      all six pairwise compositions among {projSym, proj7, proj14} vanish (ORTHOGONALITY).

  THE OBJECTS (derived, not posited).
   * `projSo7cod := codRestrict skewAdjointSubmodule projSo7 projSo7_apply_mem` — N229's `projSo7`
      corestricted to its range so(7).
   * `proj7 := so(7).subtype ∘ₗ projFun ∘ₗ projSo7cod` — the AMBIENT fundamental-7 projector: land in
      so(7) via `projSo7`, take the fundamental part via N226's `projFun`, re-embed.
   * `proj14 := projSo7 - proj7` — the AMBIENT adjoint-14 projector (the complementary skew part).

  Structure:
   (1) `proj7` — idempotent (`proj7_idem`), `proj7_range = range crossEmb`, `finrank = 7`; fixes the
       fundamental 7 (`proj7_apply_fun`), kills the adjoint 14 (`proj7_apply_adj`) and Sym²7
       (`proj7_apply_self`), image in `range crossEmb` (`proj7_apply_mem`).
   (2) `proj14` — idempotent (`proj14_idem`), `proj14_range = range imRepL`, `finrank = 14`; fixes the
       adjoint 14 (`proj14_apply_adj`), kills the fundamental 7 (`proj14_apply_fun`) and Sym²7
       (`proj14_apply_self`), image in `range imRepL` (`proj14_apply_mem`).
   (3) `proj7_add_proj14 : proj7 X + proj14 X = projSo7 X` — refines N229's skew retraction.
   (4) ORTHOGONALITY: `proj7_proj14`/`proj14_proj7 = 0`; and cross with N230's `projSym`:
       `projSym_proj7`/`proj7_projSym`/`projSym_proj14`/`proj14_projSym = 0`.
   (5) ★★ THREE-WAY RESOLUTION `projSym_add_proj7_add_proj14 : projSym X + proj7 X + proj14 X = X`
       (via N230 `projSym_add_projSo7` + (3)).
   (6) ★★★ g₂-EQUIVARIANCE `proj7_equivariant` / `proj14_equivariant` — both commute with `adEnd D`
       (N229 `projSo7_equivariant` + N226 `projFun_equivariant`, transported through the subtype).
   (7) capstone `ambient_fund_adjoint_projection_structure`.

  ONE CAUSE, THE REFINED FACE. The same Born POSITIVITY that made `so(7)` the skew half of `7 ⊗ 7`
  (N223–N227) and the same octonionic non-associativity that (via `Der(O)` simplicity, N28/N225) split
  `so(7) = 14 ⊕ 7` now deliver an AMBIENT three-way g₂-equivariant resolution of the identity on the
  whole `7 ⊗ 7`: `Sym²7 ⊕ (fundamental 7) ⊕ (adjoint 14)`. N226 lived inside the `↥so(7)` subtype;
  this node makes those projectors clean self-maps of the ambient `End ℚ ImO` and binds them to N230's
  symmetric-side retraction into a single resolution of the identity.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/so(7)/fundamental/adjoint/projector/module/
  representation): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for `ImO = ker(star+1)`, the Born form
  `bornBil`, `imRep D = D|ImO`, `crossEmb`: the ambient idempotent
  `subtype ∘ projFun ∘ codRestrict projSo7` has range `range crossEmb` (finrank 7); the difference
  `projSo7 − proj7` is idempotent with range `range imRepL` (finrank 14); the two are orthogonal, sum
  to `projSo7`, each commutes with `X ↦ ⁅imRep D, X⁆`, and together with `projSym` (N230) sum to the
  identity. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only the banked N230 `TowerGatherDualProjectionSym27` (transitively the whole
  tower: `projSym`/`projSo7`/`projSo7_apply_mem`/`projSo7_apply_self`/`projSo7_apply_skew`/
  `projSo7_equivariant`/`projSym_apply_skew`/`projSym_apply_self`/`projSym_add_projSo7`/`adEnd`/
  `bornBil`/`ImO`/`imRep`/self-skew submodules, N229/N227/…) and the banked N226
  `TowerGatherProjectionG2Equivariant` (`projFun`/`projFun_apply_mem`/`projFun_apply_fun`/
  `projFun_apply_adj`/`projFun_equivariant`/`adSo7`/`crossEmb`/`crossEmb_range_le_so7'`/
  `finrank_crossEmb_range`/`imRepL`/`imRep_range_le_so7`/`finrank_imRep_range`, N225/N224) + Mathlib
  `LinearMap.codRestrict`/`subtype`/`comp` MACHINERY on the DERIVED objects. Ground = derived ℚ; NO
  Mathlib ℝ/ℂ as content; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation (only the synthInstance ceiling for the ℚ-End instance
  diamond inherited from N227–N230, not a proof-search raise).
-/
import Phys.Algebra.TowerGatherDualProjectionSym27
import Phys.Algebra.TowerGatherProjectionG2Equivariant

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Instance-diamond ceiling for the ℚ-End synthesis (as in N227–N230); NOT a proof-search raise.
set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-! ## (0) The corestriction of `projSo7` to its range so(7). -/

/-- N229's `projSo7` corestricted to its range `so(7) = skewAdjointSubmodule bornBil`. -/
noncomputable def projSo7cod : Module.End ℚ ImO →ₗ[ℚ] (bornBil).skewAdjointSubmodule :=
  LinearMap.codRestrict _ projSo7 projSo7_apply_mem

@[simp] theorem projSo7cod_coe (X : Module.End ℚ ImO) :
    ((projSo7cod X : (bornBil).skewAdjointSubmodule) : Module.End ℚ ImO) = projSo7 X := rfl

/-! ## (1) THE AMBIENT FUNDAMENTAL-7 PROJECTOR. -/

/-- ★ THE AMBIENT PROJECTOR onto the fundamental 7 `range crossEmb`, along `Sym²7 ⊕ (adjoint 14)`:
    land in so(7) via `projSo7`, take the fundamental part via N226's `projFun`, re-embed. -/
noncomputable def proj7 : Module.End ℚ (Module.End ℚ ImO) :=
  (bornBil).skewAdjointSubmodule.subtype ∘ₗ (projFun ∘ₗ projSo7cod)

theorem proj7_apply (X : Module.End ℚ ImO) :
    proj7 X = ((projFun (projSo7cod X) : (bornBil).skewAdjointSubmodule) : Module.End ℚ ImO) := rfl

/-- Every image of `proj7` lies in the fundamental 7 `range crossEmb`. -/
theorem proj7_apply_mem (X : Module.End ℚ ImO) :
    proj7 X ∈ LinearMap.range crossEmb := by
  have h := projFun_apply_mem (projSo7cod X)
  rw [Submodule.mem_comap] at h
  rw [proj7_apply]; exact h

/-- `proj7` fixes elements of the fundamental 7 `range crossEmb`. -/
theorem proj7_apply_fun {X : Module.End ℚ ImO} (hX : X ∈ LinearMap.range crossEmb) :
    proj7 X = X := by
  have hso7 : X ∈ (bornBil).skewAdjointSubmodule := crossEmb_range_le_so7' hX
  have hcod : projSo7cod X = ⟨X, hso7⟩ := by
    apply Subtype.ext; rw [projSo7cod_coe]; exact projSo7_apply_skew hso7
  have hfunIn : (⟨X, hso7⟩ : (bornBil).skewAdjointSubmodule)
      ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype := by
    rw [Submodule.mem_comap]; exact hX
  rw [proj7_apply, hcod, projFun_apply_fun hfunIn]

/-- `proj7` kills the adjoint 14 `range imRepL`. -/
theorem proj7_apply_adj {X : Module.End ℚ ImO} (hX : X ∈ LinearMap.range imRepL) :
    proj7 X = 0 := by
  have hso7 : X ∈ (bornBil).skewAdjointSubmodule := imRep_range_le_so7 hX
  have hcod : projSo7cod X = ⟨X, hso7⟩ := by
    apply Subtype.ext; rw [projSo7cod_coe]; exact projSo7_apply_skew hso7
  have hadjIn : (⟨X, hso7⟩ : (bornBil).skewAdjointSubmodule)
      ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype := by
    rw [Submodule.mem_comap]; exact hX
  rw [proj7_apply, hcod, projFun_apply_adj hadjIn]
  rfl

/-- `proj7` kills the symmetric side `Sym²7` (`projSo7` already sends it to `0`). -/
theorem proj7_apply_self {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).selfAdjointSubmodule) : proj7 X = 0 := by
  have hcod : projSo7cod X = 0 := by
    apply Subtype.ext; rw [projSo7cod_coe]; simpa using projSo7_apply_self hX
  rw [proj7_apply, hcod, map_zero]; rfl

/-- `proj7` is idempotent. -/
theorem proj7_idem : IsIdempotentElem proj7 := by
  rw [IsIdempotentElem]
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply]
  exact proj7_apply_fun (proj7_apply_mem X)

/-- Pointwise idempotence. -/
theorem proj7_proj7 (X : Module.End ℚ ImO) : proj7 (proj7 X) = proj7 X :=
  proj7_apply_fun (proj7_apply_mem X)

/-- The range of `proj7` is exactly the fundamental 7 `range crossEmb`. -/
theorem proj7_range : LinearMap.range proj7 = LinearMap.range crossEmb := by
  apply le_antisymm
  · rintro _ ⟨X, rfl⟩; exact proj7_apply_mem X
  · rintro X hX; exact ⟨X, proj7_apply_fun hX⟩

/-- ★ `proj7` lands ONTO the FULL 7-dimensional fundamental (banked `finrank_crossEmb_range`, N224). -/
theorem finrank_proj7_range : Module.finrank ℚ (LinearMap.range proj7) = 7 := by
  rw [proj7_range]; exact finrank_crossEmb_range

/-! ## (2) THE AMBIENT ADJOINT-14 PROJECTOR `proj14 := projSo7 - proj7`. -/

/-- ★ THE AMBIENT PROJECTOR onto the adjoint 14 `range imRepL`: the complementary skew part of
    `projSo7`. -/
noncomputable def proj14 : Module.End ℚ (Module.End ℚ ImO) := projSo7 - proj7

theorem proj14_apply (X : Module.End ℚ ImO) : proj14 X = projSo7 X - proj7 X :=
  LinearMap.sub_apply _ _ _

/-- The so(7) form of `proj14`: it is the subtype image of `projSo7cod X − projFun (projSo7cod X)`. -/
theorem proj14_coe (X : Module.End ℚ ImO) :
    proj14 X
      = (((projSo7cod X - projFun (projSo7cod X)) : (bornBil).skewAdjointSubmodule)
          : Module.End ℚ ImO) := by
  rw [proj14_apply, proj7_apply, Submodule.coe_sub, projSo7cod_coe]

/-- Every image of `proj14` lies in the adjoint 14 `range imRepL`. -/
theorem proj14_apply_mem (X : Module.End ℚ ImO) :
    proj14 X ∈ LinearMap.range imRepL := by
  set W : (bornBil).skewAdjointSubmodule := projSo7cod X with hW
  have hker : W - projFun W ∈ LinearMap.ker projFun := by
    rw [LinearMap.mem_ker, map_sub projFun W (projFun W), projFun_projFun, sub_self]
  rw [projFun_ker, Submodule.mem_comap] at hker
  rw [proj14_coe]; exact hker

/-- `proj14` fixes elements of the adjoint 14 `range imRepL`. -/
theorem proj14_apply_adj {X : Module.End ℚ ImO} (hX : X ∈ LinearMap.range imRepL) :
    proj14 X = X := by
  have hso7 : X ∈ (bornBil).skewAdjointSubmodule := imRep_range_le_so7 hX
  rw [proj14_apply, projSo7_apply_skew hso7, proj7_apply_adj hX, sub_zero]

/-- `proj14` kills the fundamental 7 `range crossEmb`. -/
theorem proj14_apply_fun {X : Module.End ℚ ImO} (hX : X ∈ LinearMap.range crossEmb) :
    proj14 X = 0 := by
  have hso7 : X ∈ (bornBil).skewAdjointSubmodule := crossEmb_range_le_so7' hX
  rw [proj14_apply, projSo7_apply_skew hso7, proj7_apply_fun hX, sub_self]

/-- `proj14` kills the symmetric side `Sym²7`. -/
theorem proj14_apply_self {X : Module.End ℚ ImO}
    (hX : X ∈ (bornBil).selfAdjointSubmodule) : proj14 X = 0 := by
  rw [proj14_apply, projSo7_apply_self hX, proj7_apply_self hX, sub_zero]

/-- `proj14` is idempotent. -/
theorem proj14_idem : IsIdempotentElem proj14 := by
  rw [IsIdempotentElem]
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply]
  exact proj14_apply_adj (proj14_apply_mem X)

/-- Pointwise idempotence. -/
theorem proj14_proj14 (X : Module.End ℚ ImO) : proj14 (proj14 X) = proj14 X :=
  proj14_apply_adj (proj14_apply_mem X)

/-- The range of `proj14` is exactly the adjoint 14 `range imRepL`. -/
theorem proj14_range : LinearMap.range proj14 = LinearMap.range imRepL := by
  apply le_antisymm
  · rintro _ ⟨X, rfl⟩; exact proj14_apply_mem X
  · rintro X hX; exact ⟨X, proj14_apply_adj hX⟩

/-- ★ `proj14` lands ONTO the FULL 14-dimensional adjoint (banked `finrank_imRep_range`, N225). -/
theorem finrank_proj14_range : Module.finrank ℚ (LinearMap.range proj14) = 14 := by
  rw [proj14_range]; exact finrank_imRep_range

/-! ## (3) `proj7 + proj14 = projSo7` — refines the skew retraction. -/

/-- The two skew-side projectors sum to N229's `projSo7`. -/
theorem proj7_add_proj14 (X : Module.End ℚ ImO) : proj7 X + proj14 X = projSo7 X := by
  rw [proj14_apply]; abel

/-! ## (4) ORTHOGONALITY. -/

/-- `proj7 ∘ proj14 = 0` (images of `proj14` lie in the adjoint 14, which `proj7` kills). -/
theorem proj7_proj14 (X : Module.End ℚ ImO) : proj7 (proj14 X) = 0 :=
  proj7_apply_adj (proj14_apply_mem X)

/-- `proj14 ∘ proj7 = 0` (images of `proj7` lie in the fundamental 7, which `proj14` kills). -/
theorem proj14_proj7 (X : Module.End ℚ ImO) : proj14 (proj7 X) = 0 :=
  proj14_apply_fun (proj7_apply_mem X)

/-- `projSym ∘ proj7 = 0` (images of `proj7` lie in `range crossEmb ⊆ so(7)`, which `projSym`
    kills, N230). -/
theorem projSym_proj7 (X : Module.End ℚ ImO) : projSym (proj7 X) = 0 :=
  projSym_apply_skew (crossEmb_range_le_so7' (proj7_apply_mem X))

/-- `proj7 ∘ projSym = 0` (images of `projSym` lie in `Sym²7`, which `proj7` kills, N230). -/
theorem proj7_projSym (X : Module.End ℚ ImO) : proj7 (projSym X) = 0 :=
  proj7_apply_self (projSym_apply_mem X)

/-- `projSym ∘ proj14 = 0` (images of `proj14` lie in `range imRepL ⊆ so(7)`, which `projSym`
    kills, N230). -/
theorem projSym_proj14 (X : Module.End ℚ ImO) : projSym (proj14 X) = 0 :=
  projSym_apply_skew (imRep_range_le_so7 (proj14_apply_mem X))

/-- `proj14 ∘ projSym = 0` (images of `projSym` lie in `Sym²7`, which `proj14` kills). -/
theorem proj14_projSym (X : Module.End ℚ ImO) : proj14 (projSym X) = 0 :=
  proj14_apply_self (projSym_apply_mem X)

/-! ## (5) ★★ THE THREE-WAY RESOLUTION OF IDENTITY. -/

/-- ★★ THREE-WAY RESOLUTION `projSym X + proj7 X + proj14 X = X` — the identity on `7 ⊗ 7` splits as
    `Sym²7 (28) ⊕ 7 ⊕ 14 = 49` via three commuting, mutually-orthogonal idempotents. Combines N230's
    `projSym + projSo7 = id` with the refinement `proj7 + proj14 = projSo7`. -/
theorem projSym_add_proj7_add_proj14 (X : Module.End ℚ ImO) :
    projSym X + proj7 X + proj14 X = X := by
  rw [add_assoc, proj7_add_proj14]; exact projSym_add_projSo7 X

/-! ## (6) ★★★ g₂-EQUIVARIANCE of both ambient projectors. -/

/-- `projSo7cod` intertwines `adEnd D` (ambient) and `adSo7 D` (on the subtype), from N229's
    `projSo7_equivariant`. -/
theorem projSo7cod_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    projSo7cod (adEnd D X) = adSo7 D (projSo7cod X) := by
  apply Subtype.ext
  rw [projSo7cod_coe, adSo7_coe, projSo7cod_coe, ← adEnd_apply]
  exact projSo7_equivariant D X

/-- ★★★ g₂-EQUIVARIANCE of the fundamental-7 projector: `proj7 (adEnd D X) = adEnd D (proj7 X)`.
    Chains N229's `projSo7_equivariant` (through `projSo7cod`) with N226's `projFun_equivariant`. -/
theorem proj7_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    proj7 (adEnd D X) = adEnd D (proj7 X) := by
  rw [proj7_apply, projSo7cod_equivariant, projFun_equivariant, adSo7_coe, ← proj7_apply,
    adEnd_apply]

/-- ★★★ g₂-EQUIVARIANCE of the adjoint-14 projector: `proj14 (adEnd D X) = adEnd D (proj14 X)`.
    Since `proj14 = projSo7 − proj7` and both are equivariant. -/
theorem proj14_equivariant (D : derivationLieQ) (X : Module.End ℚ ImO) :
    proj14 (adEnd D X) = adEnd D (proj14 X) := by
  rw [proj14_apply, projSo7_equivariant, proj7_equivariant, proj14_apply, map_sub]

/-! ## CAPSTONE. -/

/-- ★★★ THE AMBIENT g₂-EQUIVARIANT FUNDAMENTAL-7 AND ADJOINT-14 PROJECTORS + THE THREE-WAY
    RESOLUTION OF IDENTITY on the banked tower. Both `proj7` (range the FULL 7-dim `range crossEmb`)
    and `proj14` (range the FULL 14-dim `range imRepL`) are idempotent, mutually orthogonal, sum to
    N229's `projSo7`, each commutes with the adjoint g₂-action `adEnd D`, and together with N230's
    `projSym` resolve the identity: `projSym + proj7 + proj14 = id` — the internal g₂-equivariant
    direct sum `7 ⊗ 7 = Sym²7 (28) ⊕ 7 ⊕ 14`. -/
theorem ambient_fund_adjoint_projection_structure :
    IsIdempotentElem proj7 ∧
    IsIdempotentElem proj14 ∧
    LinearMap.range proj7 = LinearMap.range crossEmb ∧
    LinearMap.range proj14 = LinearMap.range imRepL ∧
    Module.finrank ℚ (LinearMap.range proj7) = 7 ∧
    Module.finrank ℚ (LinearMap.range proj14) = 14 ∧
    (∀ X : Module.End ℚ ImO, proj7 X + proj14 X = projSo7 X) ∧
    (∀ X : Module.End ℚ ImO, proj14 (proj7 X) = 0) ∧
    (∀ X : Module.End ℚ ImO, proj7 (proj14 X) = 0) ∧
    (∀ X : Module.End ℚ ImO, projSym X + proj7 X + proj14 X = X) ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      proj7 (adEnd D X) = adEnd D (proj7 X)) ∧
    (∀ (D : derivationLieQ) (X : Module.End ℚ ImO),
      proj14 (adEnd D X) = adEnd D (proj14 X)) :=
  ⟨proj7_idem, proj14_idem, proj7_range, proj14_range, finrank_proj7_range, finrank_proj14_range,
   proj7_add_proj14, proj14_proj7, proj7_proj14, projSym_add_proj7_add_proj14,
   proj7_equivariant, proj14_equivariant⟩

end

end Phys.Algebra
