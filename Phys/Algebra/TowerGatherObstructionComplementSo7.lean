/-
  Phys.Algebra.TowerGatherObstructionComplementSo7 — N225.
  ===========================================================================
  THE EXPLICIT g₂-MODULE COMPLEMENT `so(7) = imRep(g₂) ⊕ crossEmb(7)`:
  the `so(7) = 14 ⊕ 7` direct-sum decomposition made rigorous on the banked tower.

  A still-deeper cut of the gather frontier (N218T/N219/N220/N221/N222/N223/N224), under the
  OVERNIGHT PRIORITY LOCK. The chain STAYS ON THE GATHER.

  THE ARC SO FAR. N223 opened the ADJOINT / so(7) face: over the derived `ℚ` and the banked
  octonion rung `O ℚ = CD (H ℚ)`, both the fundamental 7 (via the cross-product operator
  `crossOp a`, imaginary `a`) and the adjoint g₂ = Der(O ℚ) (via `imRep`) land in ONE
  `so(7) = skewAdjointLieSubalgebra bornBil` — the skew-adjoint operators of the Born form `bornBil`
  on `ImO`. N224 packaged the fundamental-7 face as the honest LINEAR MAP
  `crossEmb : ImO →ₗ[ℚ] End(ImO)`, `a ↦ crossOp a`, and proved it FAITHFUL, DIMENSION-7,
  and a g₂-SUBMODULE of so(7).

  BUT N223/N224 never proved the two summands are COMPLEMENTARY: they showed both sit inside one
  so(7), never that they meet only in `0`, span all of so(7), and account for its full dimension
  `21 = 14 + 7`. N225 closes the `so(7) = 14 ⊕ 7` decomposition:

  (1) THE TRIVIAL INTERSECTION (the crux — "one cause, two terminations"). `inter_eq_bot`:
        `range imRepL ⊓ range crossEmb = ⊥`.
      An operator lying in BOTH ranges is simultaneously (a) `imRep D` for a derivation `D` and
      (b) in the g₂-stable image of the fundamental 7. The preimage `interIdeal` of `range crossEmb`
      under the Lie homomorphism `imRep` is a genuine LIE IDEAL of `derivationLieQ` (its
      `lie_mem` is exactly the banked N224 g₂-invariance `crossEmb_range_g2_invariant` composed with
      `imRep`'s `map_lie`). The banked SIMPLICITY of the derivation algebra
      `derivationLieQ_isSimpleOrder` (N28) forces `interIdeal ∈ {⊥, ⊤}`:
        · `⊥` ⟹ the intersection has finrank `0` ⟹ it is `⊥`;
        · `⊤` ⟹ `finrank interIdeal = 14` (banked `finrank_derivationQ_eq_14`), but `imRep` is
          injective so the intersection would have finrank `14 > 7`, contradicting that it sits
          inside the 7-dimensional `range crossEmb`.
      So the intersection is trivial. THE SAME octonionic non-associativity that makes g₂ = Der(O)
      SIMPLE (14-dim, no proper ideal) is what forbids the 7 and the 14 from sharing a submodule:
      one cause (simplicity of Der(O)), one termination (the 14 and the 7 are complementary).

  (2) THE DIRECT SUM SPANS so(7). `sup_eq_so7`: `range imRepL ⊔ range crossEmb = so(7)`. Both
      summands lie in so(7) (`imRep_mem_so7`, `crossOp_mem_so7`, N223); their sum has finrank
      `14 + 7 = 21` (trivial intersection + banked `finrank_imRep_range = 14` /
      `finrank_crossEmb_range = 7`); and `finrank so(7) ≤ C(7,2) = 21` (the banked so(n)-type bound
      `finrank_skewAdjoint_le_choose`, N28, at the 7-dimensional Born form `bornBil`). A 21-dim
      subspace inside a `≤ 21`-dim space is the whole space.

  (3) THE DIMENSION. `finrank_so7_eq_21`: `finrank so(7) = 21`. Falls out of (2): the `≤ 21` bound
      and the 21-dim direct sum pin it exactly. No separate lower-bound argument is needed — the
      complement supplies it.

  (4) THE g₂-MODULE STRUCTURE. Both summands are g₂-submodules of so(7) under the adjoint action
      `X ↦ ⁅imRep D, X⁆`: `range crossEmb` by the banked N224 `crossEmb_range_g2_invariant`, and
      `range imRep` by `imRep`'s own `map_lie` (`imRep_range_g2_invariant`). So `so(7) = 14 ⊕ 7`
      is a decomposition INTO g₂-SUBMODULES — the adjoint 14 and the fundamental 7.

  (5) NON-VACUITY (W8). `so7_complement_nontrivial`: both summands are nonzero (dims `14` and `7`),
      and neither is all of so(7) (`14 < 21`, `7 < 21`) — a genuine non-degenerate direct sum.

  Capstone `so7_eq_adjoint_plus_fundamental` bundles (1)+(2)+(3)+(4).

  PHYSICS-WORDS-REMOVABLE. Delete every physics word (g₂/so(7)/fundamental/adjoint/representation/
  direct-sum-as-decomposition): over the derived `ℚ` and `O ℚ = CD (H ℚ)`, for `ImO = ker(star+1)`,
  the Born form `bornBil`, `imRep D = D|ImO`, and `crossEmb a = (y ↦ octCross a y)|ImO`: the two
  linear-map ranges `range imRep` and `range crossEmb` inside `End ℚ ImO` meet only in `0`, their
  sum equals `bornBil.skewAdjointSubmodule`, that submodule has finrank `21`, and each range is
  closed under `X ↦ ⁅imRep D, X⁆`. No theorem STATEMENT needs a physics word.

  UNBROKEN. Imports only banked N224 (`crossEmb`/`crossEmb_range_g2_invariant`/`finrank_crossEmb_range`),
  N223 (`bornBil`/`crossOp`/`crossOp_mem_so7`/`imRep_mem_so7`), N22 (`imRep`/`imRep_injective`/
  `finrank_ImO`), N24 (`gForm_symm`/`gForm_self_eq_zero`), N28
  (`derivationLieQ_isSimpleOrder`/`finrank_skewAdjoint_le_choose`/`finrank_derivationQ_eq_14`), and
  Mathlib linear-algebra / Lie-ideal MACHINERY. Ground = derived ℚ; nothing posited; no bridge.

  Foundations-only: no posited axiom, no Mathlib number/algebra as content, no sorry, no
  kernel-trust bypass, no heartbeat inflation.
-/
import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationSimpleCollapse
import Phys.Algebra.DerivationIrreducibleFull

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- `imRep` as a plain `ℚ`-linear map, for range / finrank bookkeeping. -/
abbrev imRepL : derivationLieQ →ₗ[ℚ] Module.End ℚ ImO :=
  (imRep : derivationLieQ →ₗ⁅ℚ⁆ _).toLinearMap

/-! ## The Born form `bornBil` on the fundamental 7 is symmetric and nondegenerate. -/

/-- `bornBil` is SYMMETRIC (the banked Born self-overlap `gForm_symm`, N24). -/
theorem bornBil_isSymm : (bornBil).IsSymm :=
  ⟨fun x y => by simp only [bornBil_apply]; exact gForm_symm (x : O ℚ) (y : O ℚ)⟩

/-- `bornBil` is NONDEGENERATE — the trunk's Born POSITIVITY (anisotropy `gForm_self_eq_zero`,
    N24): a definite form is nondegenerate on the whole space. -/
theorem bornBil_nondegenerate : (bornBil).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro x hx
    have h0 : gForm (x : O ℚ) (x : O ℚ) = 0 := by simpa [bornBil_apply] using hx x
    exact Subtype.ext (gForm_self_eq_zero.mp h0)
  · intro y hy
    have h0 : gForm (y : O ℚ) (y : O ℚ) = 0 := by simpa [bornBil_apply] using hy y
    exact Subtype.ext (gForm_self_eq_zero.mp h0)

/-! ## (1) THE TRIVIAL INTERSECTION (the crux). -/

/-- ★ THE INTERSECTION LIE IDEAL: the derivations `D` whose 7-rep image `imRep D` lands inside
    `range crossEmb`. This is a genuine LIE IDEAL of `derivationLieQ = g₂`: for `D'` in the set
    and any `D`, `imRep ⁅D, D'⁆ = ⁅imRep D, imRep D'⁆ ∈ range crossEmb` by the banked g₂-invariance
    of `range crossEmb` (N224 `crossEmb_range_g2_invariant`) composed with `imRep`'s `map_lie`. -/
def interIdeal : LieIdeal ℚ derivationLieQ where
  toSubmodule := Submodule.comap imRepL (LinearMap.range crossEmb)
  lie_mem := by
    intro D D' hD'
    have hD'' : imRep D' ∈ LinearMap.range crossEmb := hD'
    show imRep ⁅D, D'⁆ ∈ LinearMap.range crossEmb
    rw [LieHom.map_lie]
    exact crossEmb_range_g2_invariant D hD''

/-- The image of `interIdeal` under `imRep` is exactly the intersection
    `range imRep ⊓ range crossEmb`. -/
theorem imRep_map_interIdeal :
    (interIdeal.toSubmodule).map imRepL
      = LinearMap.range imRepL ⊓ LinearMap.range crossEmb := by
  ext X
  constructor
  · rintro ⟨D, hD, rfl⟩
    exact ⟨⟨D, rfl⟩, hD⟩
  · rintro ⟨⟨D, rfl⟩, hmem⟩
    exact ⟨D, hmem, rfl⟩

/-- `finrank` of the intersection equals `finrank interIdeal` (`imRep` is injective, N22). -/
theorem finrank_inter_eq :
    Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO)))
      = Module.finrank ℚ interIdeal.toSubmodule := by
  rw [← imRep_map_interIdeal]
  exact (Submodule.equivMapOfInjective imRepL imRep_injective _).finrank_eq.symm

/-- The intersection sits inside `range crossEmb` (dim 7), so its finrank is `≤ 7`. -/
theorem finrank_inter_le_7 :
    Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO))) ≤ 7 := by
  calc Module.finrank ℚ ((LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
          Submodule ℚ (Module.End ℚ ImO)))
      ≤ Module.finrank ℚ (LinearMap.range crossEmb) := Submodule.finrank_mono inf_le_right
    _ = 7 := finrank_crossEmb_range

/-- ★★★ THE TRIVIAL INTERSECTION (the crux): `range imRep ⊓ range crossEmb = ⊥`. The banked
    SIMPLICITY of `derivationLieQ = g₂` (`derivationLieQ_isSimpleOrder`, N28) forces the
    intersection Lie ideal `interIdeal` to be `⊥` or `⊤`. If `⊤`, the intersection would have
    finrank `14` (via injective `imRep`), impossible since it embeds in the 7-dimensional
    `range crossEmb`. So it is `⊥`: the intersection is trivial. The adjoint 14 and the
    fundamental 7 share NO common operator inside `so(7)` — the "14 ≠ 7" complementarity forced by
    the simplicity of Der(O ℚ). -/
theorem inter_eq_bot :
    (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) = ⊥ := by
  rcases (derivationLieQ_isSimpleOrder).eq_bot_or_eq_top interIdeal with hbot | htop
  · have h0 : Module.finrank ℚ interIdeal.toSubmodule = 0 := by
      rw [show interIdeal.toSubmodule = (⊥ : Submodule ℚ derivationLieQ) from by
        rw [← LieSubmodule.toSubmodule_eq_bot] at hbot; exact hbot]
      simp
    have hfr := finrank_inter_eq
    rw [h0] at hfr
    exact Submodule.finrank_eq_zero.mp hfr
  · exfalso
    have h14 : Module.finrank ℚ interIdeal.toSubmodule = 14 := by
      rw [show interIdeal.toSubmodule = (⊤ : Submodule ℚ derivationLieQ) from by
        rw [← LieSubmodule.toSubmodule_eq_top] at htop; exact htop]
      rw [finrank_top]
      exact finrank_derivationQ_eq_14
    have hle := finrank_inter_le_7
    rw [finrank_inter_eq, h14] at hle
    omega

/-! ## (2)+(3) THE DIRECT SUM SPANS so(7); `finrank so(7) = 21`. -/

/-- The adjoint copy has finrank `14` (`imRep` injective + banked `finrank_derivationQ_eq_14`). -/
theorem finrank_imRep_range : Module.finrank ℚ (LinearMap.range imRepL) = 14 := by
  rw [LinearMap.finrank_range_of_inj imRep_injective]
  exact finrank_derivationQ_eq_14

/-- The adjoint 14 lands in `so(7)` (banked N223 `imRep_mem_so7`). -/
theorem imRep_range_le_so7 :
    LinearMap.range imRepL ≤ (bornBil).skewAdjointSubmodule := by
  rintro X ⟨D, rfl⟩
  exact imRep_mem_so7 D

/-- The fundamental 7 lands in `so(7)` (banked N223 `crossOp_mem_so7`). -/
theorem crossEmb_range_le_so7' :
    LinearMap.range crossEmb ≤ (bornBil).skewAdjointSubmodule := by
  rintro X ⟨a, rfl⟩
  exact crossOp_mem_so7 (a : O ℚ) a.2

/-- The direct sum `range imRep ⊔ range crossEmb` has finrank `14 + 7 = 21` (trivial intersection
    + the two summand dimensions). -/
theorem finrank_sup_eq_21 :
    Module.finrank ℚ ((LinearMap.range imRepL ⊔ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO))) = 21 := by
  have key := Submodule.finrank_sup_add_finrank_inf_eq
    (LinearMap.range imRepL) (LinearMap.range crossEmb)
  rw [inter_eq_bot, finrank_bot, add_zero, finrank_imRep_range, finrank_crossEmb_range] at key
  omega

/-- ★★★ THE DIRECT SUM SPANS so(7): `range imRep ⊔ range crossEmb = so(7)`. Both summands lie in
    `so(7)`, their sum has finrank `21`, and `finrank so(7) ≤ C(7,2) = 21` (the banked so(n)-type
    bound `finrank_skewAdjoint_le_choose`, N28, at the 7-dim Born form). A 21-dim subspace of a
    `≤ 21`-dim space is everything. -/
theorem sup_eq_so7 :
    (LinearMap.range imRepL ⊔ LinearMap.range crossEmb :
      Submodule ℚ (Module.End ℚ ImO)) = (bornBil).skewAdjointSubmodule := by
  have hle : (LinearMap.range imRepL ⊔ LinearMap.range crossEmb) ≤
      (bornBil).skewAdjointSubmodule := sup_le imRep_range_le_so7 crossEmb_range_le_so7'
  have hfr : Module.finrank ℚ (bornBil).skewAdjointSubmodule
      ≤ Module.finrank ℚ (LinearMap.range imRepL ⊔ LinearMap.range crossEmb :
          Submodule ℚ (Module.End ℚ ImO)) := by
    rw [finrank_sup_eq_21]
    have h := finrank_skewAdjoint_le_choose bornBil bornBil_isSymm bornBil_nondegenerate
    rw [show Module.finrank ℚ ImO = 7 from finrank_ImO] at h
    simpa using h
  exact Submodule.eq_of_le_of_finrank_le hle hfr

/-- ★★ `finrank so(7) = 21`. Falls out of the 21-dim direct sum filling the `≤ 21`-dim so(7):
    the complement supplies the lower bound; no separate argument needed. -/
theorem finrank_so7_eq_21 :
    Module.finrank ℚ (bornBil).skewAdjointSubmodule = 21 := by
  rw [← sup_eq_so7, finrank_sup_eq_21]

/-! ## (4) BOTH SUMMANDS ARE g₂-SUBMODULES. -/

/-- The adjoint copy `range imRep` is a g₂-submodule of `so(7)`: closed under the adjoint action
    `X ↦ ⁅imRep D, X⁆`, because `imRep` is a Lie homomorphism (`⁅imRep D, imRep D'⁆ = imRep ⁅D,D'⁆`).
    (The fundamental copy `range crossEmb` is g₂-stable by the banked N224
    `crossEmb_range_g2_invariant`.) -/
theorem imRep_range_g2_invariant (D : derivationLieQ) {X : Module.End ℚ ImO}
    (hX : X ∈ LinearMap.range imRepL) : ⁅imRep D, X⁆ ∈ LinearMap.range imRepL := by
  obtain ⟨D', rfl⟩ := hX
  exact ⟨⁅D, D'⁆, by rw [show imRepL ⁅D, D'⁆ = imRep ⁅D, D'⁆ from rfl, LieHom.map_lie]; rfl⟩

/-! ## (5) W8 NON-VACUITY. -/

/-- W8 NON-VACUITY: the `so(7) = 14 ⊕ 7` split is genuine — both summands are nonzero (finranks
    `14` and `7`) and neither exhausts `so(7)` (`14 < 21`, `7 < 21`). -/
theorem so7_complement_nontrivial :
    0 < Module.finrank ℚ (LinearMap.range imRepL) ∧
    0 < Module.finrank ℚ (LinearMap.range crossEmb) ∧
    Module.finrank ℚ (LinearMap.range imRepL)
      < Module.finrank ℚ (bornBil).skewAdjointSubmodule ∧
    Module.finrank ℚ (LinearMap.range crossEmb)
      < Module.finrank ℚ (bornBil).skewAdjointSubmodule := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · rw [finrank_imRep_range]; norm_num
  · rw [finrank_crossEmb_range]; norm_num
  · rw [finrank_imRep_range, finrank_so7_eq_21]; norm_num
  · rw [finrank_crossEmb_range, finrank_so7_eq_21]; norm_num

/-! ## THE CAPSTONE. -/

/-- ★★★ THE EXPLICIT g₂-MODULE COMPLEMENT `so(7) = imRep(g₂) ⊕ crossEmb(7)`.
    Over the derived `ℚ` and the banked octonion rung `O ℚ = CD (H ℚ)`, inside the concrete
    `so(7) = skewAdjointLieSubalgebra bornBil` on the fundamental 7-representation `ImO`, the
    adjoint g₂ (`range imRep`, dim 14) and the fundamental 7 (`range crossEmb`, dim 7):
    (i)   MEET TRIVIALLY: `range imRep ⊓ range crossEmb = ⊥`;
    (ii)  SPAN so(7):     `range imRep ⊔ range crossEmb = so(7)`;
    (iii) ACCOUNT FOR IT: `finrank so(7) = 21 = 14 + 7`;
    (iv)  are BOTH g₂-SUBMODULES: each is closed under `X ↦ ⁅imRep D, X⁆`.
    The `so(7) = 14 ⊕ 7` decomposition into g₂-submodules — the adjoint 14 and the fundamental 7 —
    made rigorous on the banked tower. -/
theorem so7_eq_adjoint_plus_fundamental :
    (LinearMap.range imRepL ⊓ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO)) = ⊥ ∧
    (LinearMap.range imRepL ⊔ LinearMap.range crossEmb :
        Submodule ℚ (Module.End ℚ ImO)) = (bornBil).skewAdjointSubmodule ∧
    Module.finrank ℚ (bornBil).skewAdjointSubmodule = 21 ∧
    (∀ (D : derivationLieQ) {X : Module.End ℚ ImO},
        X ∈ LinearMap.range imRepL → ⁅imRep D, X⁆ ∈ LinearMap.range imRepL) ∧
    (∀ (D : derivationLieQ) {X : Module.End ℚ ImO},
        X ∈ LinearMap.range crossEmb → ⁅imRep D, X⁆ ∈ LinearMap.range crossEmb) :=
  ⟨inter_eq_bot, sup_eq_so7, finrank_so7_eq_21,
    fun D _ hX => imRep_range_g2_invariant D hX,
    fun D _ hX => crossEmb_range_g2_invariant D hX⟩

end

end Phys.Algebra
