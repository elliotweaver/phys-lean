/-
  Phys.Algebra.TowerGatherProjectionG2Equivariant — N226.
  ===========================================================================
  THE g₂-EQUIVARIANT PROJECTION `so(7) → crossEmb(7)` ALONG `imRep(g₂)`:
  the retraction realizing the `so(7) = 14 ⊕ 7` complement as a MORPHISM OF g₂-MODULES.

  A still-deeper cut of the gather frontier (N218T/N219/…/N224/N225), under the OVERNIGHT
  PRIORITY LOCK. The chain STAYS ON THE GATHER.

  THE ARC SO FAR. N223 showed both the fundamental 7 (`crossOp a`, imaginary `a`) and the adjoint
  g₂ = Der(O ℚ) (`imRep D`) land in ONE `so(7) = skewAdjointLieSubalgebra bornBil` on the banked
  fundamental 7-module `ImO`. N224 packaged the 7-face as the faithful, dim-7, g₂-stable LINEAR map
  `crossEmb`. N225 proved the two COMPLEMENTARY — `range imRep ⊓ range crossEmb = ⊥` (the crux, via
  the simplicity of `Der(O)`), `range imRep ⊔ range crossEmb = so(7)`, `finrank so(7) = 21 = 14+7`.

  BUT N225 banked only the direct-sum FACTS (trivial intersection, span, dimensions). It never built
  the SPLITTING MAP — the projector that, given any skew-adjoint operator in `so(7)`, extracts its
  fundamental-7 component along the adjoint 14. N226 builds it and proves it a MORPHISM OF
  g₂-MODULES:

  (1) THE COMPLEMENT AS `IsCompl`. `isCompl_fun_adj`: inside `↥so(7)`, the pulled-back summands
        `funIn = comap so7.subtype (range crossEmb)`  (the fundamental 7)
        `adjIn = comap so7.subtype (range imRepL)`    (the adjoint 14)
      satisfy `IsCompl funIn adjIn`. Disjoint from the banked N225 `inter_eq_bot` (`comap` preserves
      `⊓`, and `comap subtype ⊥ = ker subtype = ⊥`); codisjoint from the banked N225 `sup_eq_so7`
      (every element of `so(7)` splits as fundamental + adjoint).

  (2) THE ADJOINT g₂-ACTION ON so(7). `adSo7 D : Module.End ℚ ↥so(7)`, `X ↦ ⁅imRep D, X⁆`.
      Well-defined because `so(7)` is a Lie subalgebra containing `imRep D` (banked `imRep_mem_so7`,
      N223) — the bracket of two skew-adjoint operators is skew-adjoint
      (`LinearMap.BilinForm.isSkewAdjoint_bracket`). Both summands are g₂-stable under `adSo7`:
      `funIn_adSo7_inv` (banked N224 `crossEmb_range_g2_invariant`) and `adjIn_adSo7_inv` (banked
      N225 `imRep_range_g2_invariant`).

  (3) THE PROJECTOR. `projFun : Module.End ℚ ↥so(7) := (isCompl_fun_adj).projection`. Idempotent
      (`projFun_idem`, Mathlib `projection_isIdempotentElem`), with `range projFun = funIn`
      (`projFun_range`) and `ker projFun = adjIn` (`projFun_ker`). Its image is the FULL 7-dimensional
      fundamental (`finrank_projFun_range = 7`, via `comapSubtypeEquivOfLe` transporting the banked
      N224 `finrank_crossEmb_range`).

  (4) ★★★ g₂-EQUIVARIANCE (the crown). `projFun_equivariant`:
        `projFun (adSo7 D X) = adSo7 D (projFun X)`.
      The projector COMMUTES with the adjoint g₂-action — a genuine MORPHISM OF g₂-MODULES, not
      merely a vector-space splitting. Proof: decompose `X = projFun X + (X − projFun X)` into its
      fundamental and adjoint parts; push `adSo7 D` through linearity; the fundamental part maps
      into `funIn` (so `projFun` fixes it) and the adjoint part into `adjIn` (so `projFun` kills it),
      by the two g₂-invariances. The complement is not just a direct sum of subspaces but a direct
      sum of g₂-SUBREPRESENTATIONS, and `projFun` is the g₂-equivariant retraction onto the
      fundamental summand.

  Capstone `g2_equivariant_projection_structure` bundles (1)+(3)+(4).

  ONE CAUSE, ANOTHER FACE. The same octonionic non-associativity that (via the simplicity of
  `Der(O)`, N28) forces the trivial intersection N225 now delivers a canonical g₂-equivariant
  projector splitting `so(7)` into its adjoint and fundamental pieces — the gather obstruction's
  `so(7)` arena carries a distinguished g₂-module retraction onto the fundamental 7.

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/so(7)/fundamental/adjoint/projection/
  module/representation): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for `ImO = ker(star+1)`, the
  Born form `bornBil`, `imRep D = D|ImO`, `crossEmb a = (y ↦ octCross a y)|ImO` — inside the
  submodule `bornBil.skewAdjointSubmodule` of `End ℚ ImO`, the two pulled-back linear-map ranges
  `comap subtype (range crossEmb)` and `comap subtype (range imRepL)` are complementary
  (`IsCompl`); the idempotent linear endomorphism `projFun` onto the first along the second has
  range of finrank `7`, kernel the second, and commutes with the endomorphism `X ↦ ⁅imRep D, X⁆`
  for every `D`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N225 `TowerGatherObstructionComplementSo7` (transitively N224
  `crossEmb`/`crossEmb_range_g2_invariant`/`finrank_crossEmb_range`/`crossEmb_range_le_so7'`, N223
  `bornBil`/`imRep_mem_so7`, N22 `imRep`/`imRepL`, N28 the simplicity chain used by N225) and Mathlib
  `LinearAlgebra.Projection` / `Algebra.Lie.SkewAdjoint` MACHINERY on the DERIVED objects. Ground =
  derived ℚ; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherObstructionComplementSo7
import Mathlib.LinearAlgebra.Projection

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## (1) THE COMPLEMENT AS `IsCompl` inside `↥so(7)`. -/

/-- ★ The N225 direct-sum decomposition packaged as `IsCompl` on the subtype `↥so(7)`: the
    pulled-back fundamental 7 `comap subtype (range crossEmb)` and adjoint 14
    `comap subtype (range imRepL)` are complementary. Disjointness is the banked N225 trivial
    intersection `inter_eq_bot` (through `comap`); codisjointness is the banked N225 span
    `sup_eq_so7` (every skew-adjoint operator splits as fundamental + adjoint). -/
theorem isCompl_fun_adj :
    IsCompl ((LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype)
      ((LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) := by
  constructor
  · rw [disjoint_iff, ← Submodule.comap_inf, inf_comm, inter_eq_bot, Submodule.comap_bot,
      Submodule.ker_subtype]
  · rw [codisjoint_iff, eq_top_iff]
    rintro ⟨x, hx⟩ -
    have hx' : x ∈ (LinearMap.range imRepL ⊔ LinearMap.range crossEmb) := by
      rw [sup_eq_so7]; exact hx
    rw [Submodule.mem_sup] at hx'
    obtain ⟨a, ha, b, hb, rfl⟩ := hx'
    have hasub : a ∈ (bornBil).skewAdjointSubmodule := by
      rw [← sup_eq_so7]; exact Submodule.mem_sup_left ha
    have hbsub : b ∈ (bornBil).skewAdjointSubmodule := by
      rw [← sup_eq_so7]; exact Submodule.mem_sup_right hb
    have hsplit : (⟨a + b, hx⟩ : (bornBil).skewAdjointSubmodule)
        = (⟨b, hbsub⟩ : (bornBil).skewAdjointSubmodule) + (⟨a, hasub⟩ : _) := by
      apply Subtype.ext; simp [add_comm]
    rw [hsplit]
    exact Submodule.add_mem _ (Submodule.mem_sup_left (by simpa using hb))
      (Submodule.mem_sup_right (by simpa using ha))

/-! ## (2) THE ADJOINT g₂-ACTION ON so(7); both summands g₂-stable. -/

/-- The adjoint g₂-action on `↥so(7)`: `X ↦ ⁅imRep D, X⁆`. Well-defined because `so(7)` is a Lie
    subalgebra and `imRep D ∈ so(7)` (banked `imRep_mem_so7`, N223), so the bracket of two
    skew-adjoint operators is skew-adjoint (`isSkewAdjoint_bracket`). -/
def adSo7 (D : derivationLieQ) : Module.End ℚ (bornBil).skewAdjointSubmodule where
  toFun X := ⟨⁅imRep D, (X : Module.End ℚ ImO)⁆,
    LinearMap.BilinForm.isSkewAdjoint_bracket _ (imRep_mem_so7 D) X.2⟩
  map_add' X Y := by apply Subtype.ext; simp [lie_add]
  map_smul' c X := by apply Subtype.ext; simp [lie_smul]

@[simp] theorem adSo7_coe (D : derivationLieQ) (X : (bornBil).skewAdjointSubmodule) :
    ((adSo7 D X : (bornBil).skewAdjointSubmodule) : Module.End ℚ ImO)
      = ⁅imRep D, (X : Module.End ℚ ImO)⁆ := rfl

/-- The fundamental summand is g₂-stable under `adSo7` (banked N224 `crossEmb_range_g2_invariant`). -/
theorem funIn_adSo7_inv (D : derivationLieQ)
    {Y : (bornBil).skewAdjointSubmodule}
    (hY : Y ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype) :
    adSo7 D Y ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype :=
  crossEmb_range_g2_invariant D hY

/-- The adjoint summand is g₂-stable under `adSo7` (banked N225 `imRep_range_g2_invariant`). -/
theorem adjIn_adSo7_inv (D : derivationLieQ)
    {Y : (bornBil).skewAdjointSubmodule}
    (hY : Y ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) :
    adSo7 D Y ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype :=
  imRep_range_g2_invariant D hY

/-! ## (3) THE PROJECTOR onto the fundamental 7 along the adjoint 14. -/

/-- ★★ THE g₂-EQUIVARIANT PROJECTOR: the projection of `↥so(7)` onto the fundamental 7
    `comap subtype (range crossEmb)` along the adjoint 14 `comap subtype (range imRepL)`. -/
noncomputable def projFun : Module.End ℚ (bornBil).skewAdjointSubmodule :=
  @Submodule.IsCompl.projection ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

theorem projFun_eq (X : (bornBil).skewAdjointSubmodule) :
    projFun X = isCompl_fun_adj.projection X := rfl

/-- `projFun` is idempotent (a genuine projection). -/
theorem projFun_idem : IsIdempotentElem projFun :=
  @Submodule.IsCompl.projection_isIdempotentElem ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _
    isCompl_fun_adj

theorem projFun_projFun (X : (bornBil).skewAdjointSubmodule) :
    projFun (projFun X) = projFun X := by
  have h := projFun_idem
  rw [IsIdempotentElem] at h
  calc projFun (projFun X) = (projFun * projFun) X := by rw [Module.End.mul_apply]
    _ = projFun X := by rw [h]

/-- The image of `projFun` is the fundamental 7 (Mathlib `projection_range`). -/
theorem projFun_range :
    LinearMap.range projFun
      = (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype :=
  @Submodule.IsCompl.projection_range ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

/-- The kernel of `projFun` is the adjoint 14 (Mathlib `projection_ker`). -/
theorem projFun_ker :
    LinearMap.ker projFun
      = (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype :=
  @Submodule.IsCompl.projection_ker ℚ _ (bornBil).skewAdjointSubmodule _ _ _ _ isCompl_fun_adj

theorem projFun_apply_mem (X : (bornBil).skewAdjointSubmodule) :
    projFun X ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype := by
  rw [projFun_eq]; exact isCompl_fun_adj.projection_apply_mem X

theorem projFun_apply_fun {X : (bornBil).skewAdjointSubmodule}
    (hX : X ∈ (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype) :
    projFun X = X := by
  rw [projFun_eq]; exact isCompl_fun_adj.projection_apply_left ⟨X, hX⟩

theorem projFun_apply_adj {X : (bornBil).skewAdjointSubmodule}
    (hX : X ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype) :
    projFun X = 0 := by
  rw [projFun_eq]; exact (isCompl_fun_adj.projection_apply_eq_zero_iff).2 hX

/-- ★★ W8 NON-VACUITY: the projector's image is the FULL 7-dimensional fundamental (not the zero
    projector, not a degenerate collapse). Transports the banked N224 `finrank_crossEmb_range = 7`
    through `comapSubtypeEquivOfLe`. -/
theorem finrank_projFun_range : Module.finrank ℚ (LinearMap.range projFun) = 7 := by
  rw [projFun_range]
  have hle : LinearMap.range crossEmb ≤ (bornBil).skewAdjointSubmodule := crossEmb_range_le_so7'
  rw [(Submodule.comapSubtypeEquivOfLe hle).finrank_eq]
  exact finrank_crossEmb_range

/-! ## (4) THE CROWN: g₂-EQUIVARIANCE. -/

/-- ★★★ THE PROJECTOR IS g₂-EQUIVARIANT: `projFun (adSo7 D X) = adSo7 D (projFun X)`. The
    projection onto the fundamental 7 along the adjoint 14 COMMUTES with the adjoint g₂-action —
    a genuine MORPHISM OF g₂-MODULES, the g₂-equivariant retraction realizing the complement.
    Proof: split `X = projFun X + (X − projFun X)` into its fundamental and adjoint parts, push
    `adSo7 D` through, and project each summand (fundamental fixed, adjoint killed) using the two
    g₂-invariances `funIn_adSo7_inv` / `adjIn_adSo7_inv`. -/
theorem projFun_equivariant (D : derivationLieQ) (X : (bornBil).skewAdjointSubmodule) :
    projFun (adSo7 D X) = adSo7 D (projFun X) := by
  have hfun := projFun_apply_mem X
  have hadj : X - projFun X
      ∈ (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype := by
    have hz : projFun (X - projFun X) = 0 := by
      rw [map_sub projFun X (projFun X), projFun_projFun, sub_self]
    rw [projFun_eq] at hz
    exact (isCompl_fun_adj.projection_apply_eq_zero_iff).1 hz
  have h1 := funIn_adSo7_inv D hfun
  have h2 := adjIn_adSo7_inv D hadj
  have hX : X = projFun X + (X - projFun X) := by abel
  calc projFun (adSo7 D X)
      = projFun (adSo7 D (projFun X)) + projFun (adSo7 D (X - projFun X)) := by
        conv_lhs => rw [hX]; rw [map_add, map_add]
    _ = adSo7 D (projFun X) + 0 := by
        rw [projFun_apply_fun h1, projFun_apply_adj h2]
    _ = adSo7 D (projFun X) := add_zero _

/-! ## THE CAPSTONE. -/

/-- ★★★ THE g₂-EQUIVARIANT PROJECTION `so(7) → crossEmb(7)` ALONG `imRep(g₂)`.
    Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, inside the concrete
    `so(7) = skewAdjointLieSubalgebra bornBil` on the fundamental 7-representation `ImO`, the
    idempotent linear endomorphism `projFun`:
    (i)   is IDEMPOTENT (a genuine projection);
    (ii)  has image the FUNDAMENTAL 7 (`range projFun = comap subtype (range crossEmb)`),
          of full dimension `7`;
    (iii) has kernel the ADJOINT 14 (`ker projFun = comap subtype (range imRepL)`);
    (iv)  is g₂-EQUIVARIANT: it commutes with `X ↦ ⁅imRep D, X⁆` for every derivation `D`.
    The `so(7) = 14 ⊕ 7` complement is not merely a direct sum of subspaces but a direct sum of
    g₂-subrepresentations, split by a canonical g₂-equivariant retraction onto the fundamental 7. -/
theorem g2_equivariant_projection_structure :
    IsIdempotentElem projFun ∧
    LinearMap.range projFun
      = (LinearMap.range crossEmb).comap (bornBil).skewAdjointSubmodule.subtype ∧
    Module.finrank ℚ (LinearMap.range projFun) = 7 ∧
    LinearMap.ker projFun
      = (LinearMap.range imRepL).comap (bornBil).skewAdjointSubmodule.subtype ∧
    (∀ (D : derivationLieQ) (X : (bornBil).skewAdjointSubmodule),
        projFun (adSo7 D X) = adSo7 D (projFun X)) :=
  ⟨projFun_idem, projFun_range, finrank_projFun_range, projFun_ker, projFun_equivariant⟩

end

end Phys.Algebra
