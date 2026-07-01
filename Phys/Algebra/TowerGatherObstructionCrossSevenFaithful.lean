/-
  Phys.Algebra.TowerGatherObstructionCrossSevenFaithful — N224.
  ===========================================================================
  THE CROSS PRODUCT'S FAITHFUL, FULL, g₂-STABLE EMBEDDING OF THE FUNDAMENTAL 7 INTO so(7):
  the 7-summand of `so(7) = 14 ⊕ 7`, made rigorous on the banked tower.

  A still-deeper cut of the gather frontier (N218T/N219/N220/N221/N222/N223), under the OVERNIGHT
  PRIORITY LOCK. The chain STAYS ON THE GATHER.

  THE ARC SO FAR. N219 made the inter-world gluing obstruction EXPLICIT as the associator
  `gluingDefect = [·,·,·]`. N221 proved that obstruction cocycle carries the `g₂ = Der(O ℚ)`
  symmetry. N222 decomposed it as a g₂-representation valued in the fundamental 7 `ImO`. N223
  opened the ADJOINT / so(7) face: the cross-product operator `crossOp a` (imaginary `a`) is
  skew-adjoint for the Born form (lands in `so(7)`), the adjoint g₂ = Der(O ℚ) lands in the SAME
  `so(7)`, and the g₂-intertwiner `⁅imRep D, crossOp a⁆ = crossOp (D a)` links them.

  BUT N223's embedding statement was POINTWISE. It never proved `a ↦ crossOp a` is LINEAR in `a`,
  never INJECTIVE (faithful), never that the image is a FULL 7-dimensional g₂-submodule of so(7).
  Its only non-vacuity was `crossOp u1 ≠ 0` — a single nonzero witness, not faithfulness.

  N224 packages the embedding as an honest LINEAR MAP and proves it a FAITHFUL, DIMENSION-7,
  g₂-STABLE copy of the fundamental 7 sitting inside so(7) — the first half of the
  `so(7) = 14 ⊕ 7` decomposition made rigorous. Over the derived `ℚ` and the banked octonion rung
  `O ℚ = CD (H ℚ)`, with the banked fundamental 7-module `ImO`:

  (1) THE LINEAR EMBEDDING. `crossEmb : ImO →ₗ[ℚ] Module.End ℚ ImO`, `a ↦ crossOp a`, is
      `ℚ`-linear in the first argument (from `add_mul` / the banked scalar law `qsmul_mul_left` +
      Born-form bilinearity). N223 never bundled this.

  (2) FAITHFUL. `crossOp_inj_on_ImO` / `crossEmb_injective`: `crossOp a = 0 ⟹ a = 0` for
      imaginary `a`. If `octCross a y = 0` for every `y ∈ ImO`, the banked contraction identity
      `octCross a (octCross a y) = gForm a y • a − gForm a a • y` (N206) forces
      `gForm a a • y = gForm a y • a`, i.e. `ImO ⊆ span{a}` (dimension `≤ 1`) unless
      `gForm a a = 0`; but `finrank ℚ ImO = 7 > 1` (banked N22), so `gForm a a = 0`, hence `a = 0`
      by the banked Born anisotropy `gForm_self_eq_zero` (N24). The Born POSITIVITY
      (self-blindness → self-overlap) is exactly what makes the embedding faithful.

  (3) THE FULL 7 EMBEDS. `finrank_crossEmb_range = 7`: the image has dimension exactly `7`
      (`LinearMap.finrank_range_of_inj` + `finrank_ImO`). Not a degenerate/partial copy.

  (4) INSIDE so(7). `crossEmb_range_le_so7`: the whole image lands in
      `skewAdjointLieSubalgebra bornBil = so(7)` (the banked N223 `crossOp_mem_so7`).

  (5) A g₂-SUBMODULE. `crossEmb_range_g2_invariant`: `⁅imRep D, X⁆ ∈ range crossEmb` for every
      `D ∈ g₂ = Der(O ℚ)` and `X ∈ range crossEmb` — the copy of the 7 inside so(7) is CLOSED
      under the adjoint action of g₂ (via the N223 intertwiner + the banked `derivLieQ_mapsTo`).
      A genuine g₂-submodule: the 7-summand of `so(7) = 14 ⊕ 7`.

  (6) NON-VACUITY (W8). `crossEmb_ne_zero`: the embedding is not the zero map.

  Capstone `cross_seven_faithful_in_so7_structure` bundles (2)+(3)+(4)+(5)+(6).

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (fundamental/adjoint/so(7)/g₂/embedding/
  representation): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for `ImO = ker(star+1)` and the
  cross product `octCross a y = a·y + ⟨a,y⟩•1`, the map `a ↦ (y ↦ octCross a y)` restricted to
  `ImO` is `ℚ`-linear and INJECTIVE, its image has dimension `7`, lies in
  `skewAdjointLieSubalgebra bornBil`, and is closed under `X ↦ ⁅imRep D, X⁆`. No theorem STATEMENT
  needs a physics word.

  UNBROKEN. Imports only banked N223 (`crossOp`/`crossOp_mem_so7`/`bornBil`/`crossOp_imRep_intertwine`),
  N206 (`octCross_contraction`), N22 (`ImO`/`imRep`/`finrank_ImO`/`derivLieQ_mapsTo`), N24
  (`gForm_self_eq_zero`), `DerivationFinrank` (`qsmul_mul_left`), and Mathlib linear-algebra
  MACHINERY. Ground = derived ℚ; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
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

/-! ## (1) THE LINEAR EMBEDDING of the fundamental 7 into `End(ImO)`. -/

/-- ★ THE LINEAR EMBEDDING: the cross-product operator, bundled as a `ℚ`-linear map
    `crossEmb : ImO →ₗ[ℚ] Module.End ℚ ImO`, `a ↦ crossOp a`. Linear in the FIRST argument by the
    banked right-distributivity `add_mul` and the scalar law `qsmul_mul_left`, plus the Born-form
    bilinearity — the correction term `⟨a,y⟩•1` in `octCross` is linear in `a` too. N223 only had
    the pointwise operator `crossOp a`; here `a ↦ crossOp a` is a genuine linear map. -/
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

/-! ## (2) FAITHFUL: the embedding is injective. -/

/-- ★★ FAITHFULNESS (the crux): `crossOp a = 0 ⟹ a = 0` for imaginary `a`. If the cross-product
    operator kills all of `ImO`, the banked triple-product CONTRACTION
    `octCross a (octCross a y) = gForm a y • a − gForm a a • y` (N206) collapses to
    `gForm a a • y = gForm a y • a`, so `ImO ⊆ span{a}` (dimension `≤ 1`) UNLESS `gForm a a = 0`.
    But `finrank ℚ ImO = 7 > 1` (banked `finrank_ImO`, N22), forcing `gForm a a = 0`, hence
    `a = 0` by the banked Born anisotropy `gForm_self_eq_zero` (N24). The trunk's Born positivity
    is precisely what makes the fundamental-7 embedding faithful. -/
theorem crossOp_inj_on_ImO {a : O ℚ} (ha : a ∈ ImO) (h : crossOp a = 0) : a = 0 := by
  have hoc : ∀ y : O ℚ, y ∈ ImO → octCross a y = 0 := by
    intro y hy
    have hz : (crossOp a ⟨y, hy⟩ : ImO) = 0 := by rw [h]; rfl
    have := congrArg (Subtype.val) hz
    simpa [crossOp_coe] using this
  suffices hgaa : gForm a a = 0 by exact gForm_self_eq_zero.mp hgaa
  by_contra hne
  have hcontr : ∀ y : O ℚ, y ∈ ImO → gForm a a • y = gForm a y • a := by
    intro y hy
    have hc := octCross_contraction ha hy
    rw [hoc y hy] at hc
    have h0 : octCross a (0 : O ℚ) = 0 := by rw [← crossOpO_apply]; exact map_zero (crossOpO a)
    rw [h0] at hc
    exact (sub_eq_zero.mp hc.symm).symm
  have hsub : (ImO : Submodule ℚ (O ℚ)) ≤ Submodule.span ℚ {a} := by
    intro y hy
    have hy2 := hcontr y hy
    have hy_eq : y = ((gForm a a)⁻¹ * gForm a y) • a := by
      have h1 : (gForm a a)⁻¹ • (gForm a a • y) = (gForm a a)⁻¹ • (gForm a y • a) := by rw [hy2]
      rw [smul_smul, inv_mul_cancel₀ hne, one_smul, smul_smul] at h1
      exact h1
    rw [hy_eq]; exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self a)
  have hane : a ≠ 0 := by rintro rfl; exact hne (gForm_self_eq_zero.mpr rfl)
  have h7 : Module.finrank ℚ ImO = 7 := finrank_ImO
  have hle : Module.finrank ℚ (ImO : Submodule ℚ (O ℚ))
      ≤ Module.finrank ℚ (Submodule.span ℚ {a}) :=
    Submodule.finrank_mono hsub
  have hspan : Module.finrank ℚ (Submodule.span ℚ {a}) = 1 := finrank_span_singleton hane
  omega

/-- ★★ THE EMBEDDING IS FAITHFUL: `crossEmb` is injective. The fundamental 7 embeds without
    collapse — a full copy inside `End(ImO)`. -/
theorem crossEmb_injective : Function.Injective crossEmb := by
  rw [injective_iff_map_eq_zero]
  intro a ha
  exact Subtype.ext (crossOp_inj_on_ImO a.2 ha)

/-! ## (3) THE FULL 7 EMBEDS: the image has dimension exactly 7. -/

/-- ★★ THE FULL FUNDAMENTAL 7 EMBEDS: the image of `crossEmb` has dimension exactly `7`
    (injective image of a `7`-dimensional space, banked `finrank_ImO`, N22). The copy of the 7
    inside `so(7)` is the WHOLE 7 — not a partial or degenerate subspace. -/
theorem finrank_crossEmb_range : Module.finrank ℚ (LinearMap.range crossEmb) = 7 := by
  rw [LinearMap.finrank_range_of_inj crossEmb_injective, finrank_ImO]

/-! ## (4) THE IMAGE LANDS INSIDE so(7). -/

/-- ★ THE IMAGE LANDS IN so(7): the whole `range crossEmb` sits inside
    `skewAdjointLieSubalgebra bornBil = so(7)` (the banked N223 skew-adjointness `crossOp_mem_so7`
    of every cross-product operator). -/
theorem crossEmb_range_le_so7 :
    LinearMap.range crossEmb ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule := by
  rw [LinearMap.range_le_iff_comap]
  refine le_top.antisymm ?_
  intro a _
  exact crossOp_mem_so7 (a : O ℚ) a.2

/-! ## (5) THE IMAGE IS A g₂-SUBMODULE OF so(7). -/

/-- ★★★ THE g₂-SUBMODULE PROPERTY: the image of `crossEmb` (the fundamental 7 inside `so(7)`) is
    CLOSED under the adjoint action `X ↦ ⁅imRep D, X⁆` of `g₂ = Der(O ℚ)`. For every derivation
    `D` and every `X = crossOp a` in the image, `⁅imRep D, crossOp a⁆ = crossOp (D a)` (the banked
    N223 intertwiner) and `D a ∈ ImO` (the banked `derivLieQ_mapsTo`, N22), so the bracket is
    again in the image. Hence `range crossEmb` is a genuine g₂-submodule of `so(7)` — the
    7-summand of the `so(7) = 14 ⊕ 7` decomposition, made rigorous on the banked tower. -/
theorem crossEmb_range_g2_invariant (D : derivationLieQ) {X : Module.End ℚ ImO}
    (hX : X ∈ LinearMap.range crossEmb) : ⁅imRep D, X⁆ ∈ LinearMap.range crossEmb := by
  obtain ⟨a, ha⟩ := hX
  refine ⟨⟨(D : Module.End ℚ (O ℚ)) (a : O ℚ), derivLieQ_mapsTo D (a : O ℚ) a.2⟩, ?_⟩
  show crossOp ((D : Module.End ℚ (O ℚ)) (a : O ℚ)) = ⁅imRep D, X⁆
  rw [← ha]
  exact (crossOp_imRep_intertwine D (a : O ℚ)).symm

/-! ## (6) W8 NON-VACUITY. -/

/-- W8 NON-VACUITY: the embedding is not the zero map (`crossEmb ⟨u1,_⟩ = crossOp u1 ≠ 0`, banked
    N223 `crossOp_ne_zero`) — its range is a genuinely NONZERO g₂-submodule of `so(7)`. -/
theorem crossEmb_ne_zero : crossEmb ≠ 0 := by
  intro h
  have hz : crossOp u1 = crossEmb ⟨u1, u1_mem_ImO⟩ := rfl
  rw [h] at hz
  simp only [LinearMap.zero_apply] at hz
  exact crossOp_ne_zero hz

/-! ## THE CAPSTONE. -/

/-- ★★★ THE CROSS PRODUCT'S FAITHFUL, FULL, g₂-STABLE EMBEDDING OF THE FUNDAMENTAL 7 INTO so(7).
    Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, with the banked
    fundamental 7-representation `ImO` and the Born form `bornBil` on it, the linear map
    `crossEmb : ImO →ₗ[ℚ] End(ImO)`, `a ↦ crossOp a`, is:
    (i)   INJECTIVE (faithful — the full 7 embeds without collapse);
    (ii)  DIMENSION-7 image (`finrank (range crossEmb) = 7`);
    (iii) valued in `so(7)` (`range crossEmb ≤ skewAdjointLieSubalgebra bornBil`);
    (iv)  a g₂-SUBMODULE (`⁅imRep D, X⁆ ∈ range crossEmb` for `X ∈ range crossEmb`);
    (v)   NONZERO (`crossEmb ≠ 0`).
    The fundamental 7 sits inside `so(7)` as a faithful, full, g₂-stable copy — the 7-summand of
    the `so(7) = 14 ⊕ 7` arena, made rigorous on the banked tower. -/
theorem cross_seven_faithful_in_so7_structure :
    Function.Injective crossEmb ∧
    Module.finrank ℚ (LinearMap.range crossEmb) = 7 ∧
    LinearMap.range crossEmb ≤ (skewAdjointLieSubalgebra bornBil).toSubmodule ∧
    (∀ (D : derivationLieQ) {X : Module.End ℚ ImO},
        X ∈ LinearMap.range crossEmb → ⁅imRep D, X⁆ ∈ LinearMap.range crossEmb) ∧
    crossEmb ≠ 0 :=
  ⟨crossEmb_injective, finrank_crossEmb_range, crossEmb_range_le_so7,
    fun D _ hX => crossEmb_range_g2_invariant D hX, crossEmb_ne_zero⟩

end

end Phys.Algebra
