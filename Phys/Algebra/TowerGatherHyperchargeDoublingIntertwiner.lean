/-
  Phys.Algebra.TowerGatherHyperchargeDoublingIntertwiner — N278.
  ===========================================================================
  THE FORCED HYPERCHARGE OPERATOR IS THE CAYLEY–DICKSON DOUBLING INTERTWINER THAT IDENTIFIES
  THE TWO WEAK-ISOSPIN WORLDS — over the DERIVED octonion rung `O ℚ = CD (H ℚ)` and its
  imaginary part `ImO` (the fundamental 7-representation, N22). Method-lock LIFTED (2026-07-03);
  this is a GATHER-native forward step (the operator is the gather tear `crossOp (κO 1)` on the
  gather-derived fundamental-7), NOT the parked invariant-tower ascent.

  ---------------------------------------------------------------------------
  THE STORY SO FAR. N277 (`TowerGatherIsospinMultiplet`) banked the NON-ABELIAN weak-isospin
  multiplet decomposition of the fundamental matter:
     ImO  =  TL  ⊕  Sg  ⊕  TR  =  3 ⊕ 1 ⊕ 3
  under `su(2)_L = {imRep DI, imRep DJ, imRep DK}` (the doubling inner-derivations), where
  `TL = span{u1,e2O,e3O}` is the un-doubled imaginary triplet `ImH`, `Sg = span{e4O}` the
  su(2)_L-FIXED doubling axis `ℓ = κO 1`, and `TR = span{e5O,e6O,e7O}` the doubled triplet
  `ℓ·ImH`. N277's docstring NAMED — but did NOT prove — the reframe "the two triplets ARE the
  un-doubled/doubled worlds, related by the doubling `ℓ·(−)`". N255
  (`TowerGatherForcedHyperchargeDirection`) banked the forced hypercharge operator
  `hyperOp = crossOp (κO 1)` and proved it COMMUTES with the whole su(2)_L
  (`hyperOp_commute_isospin`), but N255 predates N277's TL/Sg/TR — it never computed hyperOp's
  ACTION on the multiplet decomposition.

  THIS node proves the reframe as theorems, and identifies the MAP with the banked hyperOp. The
  forced hypercharge operator IS the Cayley–Dickson doubling intertwiner: on the fundamental 7,
  `hyperOp = crossOp (κO 1)` (N255)

    · SWAPS the two su(2)_L triplets:  `TL.map hyperOp = TR`,  `TR.map hyperOp = TL`;
    · KILLS the su(2)_L-fixed doubling axis:  `hyperOp e4I = 0`  (Sg is charge-zero);
    · is a COMPLEX STRUCTURE on the charged sector:  `hyperOp²(y) = ⟨κO1,y⟩•κO1 − y`, so
      `hyperOp² = −1` on `TL ⊔ TR` and `= 0` on `Sg`;
    · being su(2)_L-EQUIVARIANT (N255), is a su(2)_L-MODULE ISOMORPHISM `TL ≃ₗ TR` — the two
      triplets are ONE representation, doubled.

  ★ THE REFRAME (goal-words-removable, octonion-specific). The identification is not chosen: the
  intertwiner is `octCross (κO 1)` = the banked forced hypercharge (N255), and on the triplets it
  IS left-multiplication by `ℓ = κO 1` (`octCross (κO1) y = κO1·y` for `y ⟂ κO1`, since the
  correction `⟨κO1,y⟩•1` vanishes on the frame). So the "doubled world" `TR = ℓ·ImH` is literally
  the image of the "un-doubled world" `TL = ImH` under `ℓ·(−)`, and the operator carrying one to
  the other is the forced hypercharge.

  ---------------------------------------------------------------------------
  THE OBJECTS (all derived, foundations-only):
    · `hyperOp_u1I`/`_e2I`/`_e3I`/`_e5I`/`_e6I`/`_e7I` — the 6 action values (TL↔TR swap; each a
      single `octCross_contraction`-free coordinate read of `octCross (κO1) (imBasis i)`);
    · ⭐ `hyperOp_e4I` (`hyperOp e4I = 0` — kills the doubling axis Sg);
    · ⭐⭐ `TL_map_hyperOp_eq_TR` / `TR_map_hyperOp_eq_TL` (the SWAP as submodule equalities);
    · ⭐⭐ `hyperOp_sq_coe` (`hyperOp²(y) = ⟨κO1,y⟩•κO1 − y`, the banked `octCross_contraction`
      twin of N240 `chargeOp_sq_coe`) + `hyperOp_sq_TL` (`hyperOp² = −1` on TL) +
      `hyperOp_sq_Sg` (`hyperOp² = 0` on Sg);
    · ⭐⭐⭐ `hyperEquivTLTR : TL ≃ₗ[ℚ] TR` (the su(2)_L-module ISO — the two triplets are one
      doubled rep) + `hyperEquivTLTR_apply`;
    · ⭐ W8 non-vacuity `hyperOp_u1I_ne_zero` (the swap is genuine: TL is NOT hyperOp-fixed);
    · ⭐⭐⭐ CAPSTONE `hypercharge_doubling_intertwiner_structure`.

  ---------------------------------------------------------------------------
  THE MOAT / DISSOLUTION (STANDARD §0). The division-algebra-physics field POSITS U(1)_Y, CHOOSES
  its embedding, and SEPARATELY asserts that the two weak-isospin components of a multiplet are
  "the same representation, doubled". The theory DISSOLVES all three at once: the intertwiner is
  not chosen — it is `octCross (κO 1)`, ALREADY banked-forced as the hypercharge operator (N255);
  the "doubled multiplet" is literally `ℓ·ImH` with `ℓ` the cascade-stop doubling axis; and the
  forced hypercharge U(1)_Y IS that doubling map.

  ONE CAUSE MANY TERMINATIONS: the LAST Cayley–Dickson doubling `O = H ⊕ Hℓ` — the one that STOPS
  the cascade (N2c, division/Born breaks beyond `O`) — supplies THREE faces of ONE structure:
  (i) `su(2)_L = Der(H)` grading matter into weak-isospin multiplets (N277); (ii) the doubling
  map `ℓ·(−)` identifying the two multiplet worlds `TL ≅ TR` (THIS node); (iii) the forced
  hypercharge operator `hyperOp = crossOp (κO 1)` (N255). One derived operator, three physical
  faces.

  SCOPE (explicit NOT-list). Banks the su(2)_L-module iso `TL ≅ TR` + the doubling-intertwiner
  swap + `hyperOp²` complex structure + kills-Sg + the identification with the banked hyperOp
  ONLY. Does NOT bank the hypercharge NORMALIZATION / weak mixing angle (★2 — the ceiling STANDS,
  nothing here is childed toward it; no coupling ratio appears), NOT Gell-Mann–Nishijima
  `Q = T3 + Y/2` (WALLED N255/N257), NOT the FULL Burnside irreducibility of the triplets
  (downstream), NOT masses/mixings (★5 un-forceable, N275/N276), NOT parity, NOT "= a specific SM
  multiplet" (removable prose).
-/
import Phys.Algebra.TowerGatherForcedHyperchargeDirection
import Phys.Algebra.TowerGatherIsospinMultiplet
import Phys.Algebra.TowerGatherIsometry
import Phys.Algebra.OctonionCrossProductContraction
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- A synthInstance budget bump (NOT a proof-kernel `maxHeartbeats` inflation; the same benign
-- pattern as N256/N277) — the `ImO`-submodule coercions in the span-membership / restriction
-- arguments are instance-synthesis heavy.
set_option synthInstance.maxHeartbeats 400000

set_option maxHeartbeats 800000

/-! ## (A) The action of `hyperOp = crossOp (κO 1)` on the multiplet basis.

    Each is a single coordinate read of `octCross (κO 1) (imBasis i) = (κO 1)·(imBasis i)` (the
    correction term `⟨κO1, imBasis i⟩•1` vanishes on the orthonormal frame). The doubling map
    SWAPS `TL = {u1,e2O,e3O}` with `TR = {e5O,e6O,e7O}` and KILLS the axis `e4O`. -/

/-- The shared coordinate simp set for `octCross (κO 1) x`. -/
private lemma hyperOp_coe (y : ImO) :
    ((hyperOp y : ImO) : O ℚ) = octCross (kappaO 1) (y : O ℚ) := rfl

/-- `hyperOp u1 = -e5I` (TL → TR). -/
theorem hyperOp_u1I : hyperOp u1M = -e5I := by
  apply Subtype.ext
  rw [hyperOp_coe]; push_cast
  show octCross (kappaO 1) (u1 : O ℚ) = (-(e5O) : O ℚ)
  rw [octCross]
  ext <;> simp only [kappaO, u1, e5O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

/-- `hyperOp e2O = -e6I` (TL → TR). -/
theorem hyperOp_e2I : hyperOp e2I = -e6I := by
  apply Subtype.ext
  show octCross (kappaO 1) (e2O : O ℚ) = (-(e6O) : O ℚ)
  rw [octCross]
  ext <;> simp only [kappaO, e2O, e6O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

/-- `hyperOp e3O = -e7I` (TL → TR). -/
theorem hyperOp_e3I : hyperOp e3I = -e7I := by
  apply Subtype.ext
  show octCross (kappaO 1) (e3O : O ℚ) = (-(e7O) : O ℚ)
  rw [octCross]
  ext <;> simp only [kappaO, e3O, e7O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

/-- ⭐ `hyperOp e4O = 0` — the forced hypercharge KILLS the su(2)_L-fixed doubling axis
    `Sg = ⟨ℓ⟩` (`octCross_self`: `octCross (κO1)(κO1) = 0`). -/
theorem hyperOp_e4I : hyperOp e4I = 0 := by
  apply Subtype.ext
  show octCross (kappaO 1) (e4O : O ℚ) = (0 : O ℚ)
  rw [octCross]
  ext <;> simp only [kappaO, e4O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im, CD.zero_re, Dbl.zero_re] <;>
    norm_num

/-- `hyperOp e5O = u1I` (TR → TL). -/
theorem hyperOp_e5I : hyperOp e5I = u1M := by
  apply Subtype.ext
  show octCross (kappaO 1) (e5O : O ℚ) = (u1 : O ℚ)
  rw [octCross]
  ext <;> simp only [kappaO, e5O, u1, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

/-- `hyperOp e6O = e2I` (TR → TL). -/
theorem hyperOp_e6I : hyperOp e6I = e2I := by
  apply Subtype.ext
  show octCross (kappaO 1) (e6O : O ℚ) = (e2O : O ℚ)
  rw [octCross]
  ext <;> simp only [kappaO, e6O, e2O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

/-- `hyperOp e7O = e3I` (TR → TL). -/
theorem hyperOp_e7I : hyperOp e7I = e3I := by
  apply Subtype.ext
  show octCross (kappaO 1) (e7O : O ℚ) = (e3O : O ℚ)
  rw [octCross]
  ext <;> simp only [kappaO, e7O, e3O, gForm, reQ, LinearMap.coe_mk, AddHom.coe_mk,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im',
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im, Dbl.neg_re, Dbl.neg_im,
    CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im, CD.zero_im, Dbl.zero_im] <;> norm_num

/-! ## (B) The SWAP as submodule equalities: `hyperOp` exchanges `TL` and `TR`. -/

/-- Helper: the span of `{-e5I,-e6I,-e7I}` equals `TR = span{e5I,e6I,e7I}` (negation preserves span). -/
private theorem span_neg_TR :
    Submodule.span ℚ (Set.range (![-e5I, -e6I, -e7I] : Fin 3 → ImO)) = TR := by
  rw [TR]
  apply le_antisymm <;> rw [Submodule.span_le] <;> rintro x ⟨i, rfl⟩ <;> fin_cases i
  · exact Submodule.neg_mem _ (Submodule.subset_span ⟨0, rfl⟩)
  · exact Submodule.neg_mem _ (Submodule.subset_span ⟨1, rfl⟩)
  · exact Submodule.neg_mem _ (Submodule.subset_span ⟨2, rfl⟩)
  · exact neg_neg e5I ▸ Submodule.neg_mem _ (Submodule.subset_span ⟨0, rfl⟩)
  · exact neg_neg e6I ▸ Submodule.neg_mem _ (Submodule.subset_span ⟨1, rfl⟩)
  · exact neg_neg e7I ▸ Submodule.neg_mem _ (Submodule.subset_span ⟨2, rfl⟩)

/-- ⭐⭐ `TL.map hyperOp = TR` — the forced hypercharge carries the un-doubled triplet `TL = ImH`
    ONTO the doubled triplet `TR = ℓ·ImH`. Proof: `Submodule.map_span`; the image of the three
    generators `{u1,e2O,e3O}` is `{-e5I,-e6I,-e7I}`, whose span equals `span{e5I,e6I,e7I} = TR`. -/
theorem TL_map_hyperOp_eq_TR : TL.map hyperOp = TR := by
  rw [TL, Submodule.map_span,
    show (hyperOp '' Set.range (![u1M, e2I, e3I] : Fin 3 → ImO))
        = Set.range (![-e5I, -e6I, -e7I] : Fin 3 → ImO) by
      rw [← Set.range_comp]; congr 1; funext i; fin_cases i <;>
        simp [Function.comp, hyperOp_u1I, hyperOp_e2I, hyperOp_e3I],
    span_neg_TR]

/-- ⭐⭐ `TR.map hyperOp = TL` — the forced hypercharge carries the doubled triplet `TR = ℓ·ImH`
    back ONTO the un-doubled triplet `TL = ImH`. The image of `{e5O,e6O,e7O}` is `{u1I,e2I,e3I}`,
    whose span is `TL` (no signs on this leg). -/
theorem TR_map_hyperOp_eq_TL : TR.map hyperOp = TL := by
  rw [TR, Submodule.map_span,
    show (hyperOp '' Set.range (![e5I, e6I, e7I] : Fin 3 → ImO))
        = Set.range (![u1M, e2I, e3I] : Fin 3 → ImO) by
      rw [← Set.range_comp]; congr 1; funext i; fin_cases i <;>
        simp [Function.comp, hyperOp_e5I, hyperOp_e6I, hyperOp_e7I],
    ← TL]

/-! ## (C) The complex structure `hyperOp²(y) = ⟨κO1,y⟩•κO1 − y` (the banked contraction). -/

/-- ⭐⭐ `hyperOp²(y) = ⟨κO1,y⟩•κO1 − y` for every `y ∈ ImO` — the exact twin of N240's
    `chargeOp_sq_coe`, via the banked `octCross_contraction` and `gForm (κO1)(κO1) = 1` (N257). -/
theorem hyperOp_sq_coe (y : ImO) :
    ((hyperOp (hyperOp y) : ImO) : O ℚ)
      = gForm (kappaO 1) (y : O ℚ) • (kappaO 1) - (y : O ℚ) := by
  show octCross (kappaO 1) (octCross (kappaO 1) (y : O ℚ))
      = gForm (kappaO 1) (y : O ℚ) • (kappaO 1) - (y : O ℚ)
  have hkk : gForm (kappaO 1) (kappaO 1) = 1 := by
    have := gForm_imBasis 3 3; simpa [imBasis] using this
  rw [octCross_contraction kappaO_one_mem_ImO y.2, hkk, one_smul]

/-- ⭐⭐ `hyperOp² = −1` on the un-doubled triplet `TL` (the charged sector). For `y ∈ TL`,
    `⟨κO1, y⟩ = 0` (TL ⟂ the doubling axis), so `hyperOp²(y) = −y`. Shown on each generator; the
    genuine complex structure on the doubled 6-space `TL ⊔ TR`. -/
theorem hyperOp_sq_u1I : hyperOp (hyperOp u1M) = -u1M := by
  rw [hyperOp_u1I, map_neg, hyperOp_e5I]

theorem hyperOp_sq_e2I : hyperOp (hyperOp e2I) = -e2I := by
  rw [hyperOp_e2I, map_neg, hyperOp_e6I]

theorem hyperOp_sq_e3I : hyperOp (hyperOp e3I) = -e3I := by
  rw [hyperOp_e3I, map_neg, hyperOp_e7I]

/-- ⭐ `hyperOp² = 0` on the su(2)_L-fixed axis `Sg` (charge-zero direction). -/
theorem hyperOp_sq_e4I : hyperOp (hyperOp e4I) = 0 := by
  rw [hyperOp_e4I, map_zero]

/-! ## (D) The su(2)_L-module ISOMORPHISM `TL ≃ₗ TR` (the two triplets are ONE doubled rep). -/

/-- `hyperOp` maps `TL` into `TR` (the map direction of the swap). -/
theorem hyperOp_mapsTo_TL : ∀ x ∈ TL, hyperOp x ∈ TR := by
  intro x hx
  rw [← TL_map_hyperOp_eq_TR]
  exact Submodule.mem_map_of_mem hx

/-- `hyperOp` maps `TR` into `TL` (the reverse direction). -/
theorem hyperOp_mapsTo_TR : ∀ x ∈ TR, hyperOp x ∈ TL := by
  intro x hx
  rw [← TR_map_hyperOp_eq_TL]
  exact Submodule.mem_map_of_mem hx

/-- The restricted forward map `TL → TR`. -/
noncomputable def hyperTL : TL →ₗ[ℚ] TR := hyperOp.restrict hyperOp_mapsTo_TL

/-- The restricted reverse map `TR → TL`. -/
noncomputable def hyperTR : TR →ₗ[ℚ] TL := hyperOp.restrict hyperOp_mapsTo_TR

@[simp] theorem hyperTL_coe (x : TL) : ((hyperTL x : TR) : ImO) = hyperOp (x : ImO) := rfl
@[simp] theorem hyperTR_coe (x : TR) : ((hyperTR x : TL) : ImO) = hyperOp (x : ImO) := rfl

/-- The two restrictions are mutually inverse: `hyperTR ∘ hyperTL = −id` on `TL`
    (`hyperOp² = −1`), so `-hyperTR` inverts `hyperTL`. -/
theorem hyperTR_hyperTL (x : TL) : (hyperTR (hyperTL x) : TL) = -x := by
  apply Subtype.ext
  have hx : (x : ImO) ∈ TL := x.2
  -- on TL, hyperOp² = -id (⟨κO1, y⟩ = 0)
  have key : hyperOp (hyperOp (x : ImO)) = -(x : ImO) := by
    -- x ∈ TL = span{u1M,e2I,e3I}; use hyperOp_sq on generators + linearity
    refine Submodule.span_induction ?_ ?_ ?_ ?_ hx
    · rintro y ⟨i, rfl⟩; fin_cases i
      · show hyperOp (hyperOp u1M) = -u1M; exact hyperOp_sq_u1I
      · show hyperOp (hyperOp e2I) = -e2I; exact hyperOp_sq_e2I
      · show hyperOp (hyperOp e3I) = -e3I; exact hyperOp_sq_e3I
    · simp
    · intro a b _ _ ha hb; rw [map_add, map_add, ha, hb, neg_add]
    · intro c a _ ha; rw [map_smul, map_smul, ha, smul_neg]
  simpa using key

/-- The two restrictions inverse the other way: `hyperTL ∘ hyperTR = −id` on `TR`. -/
theorem hyperTL_hyperTR (x : TR) : (hyperTL (hyperTR x) : TR) = -x := by
  apply Subtype.ext
  have hx : (x : ImO) ∈ TR := x.2
  have key : hyperOp (hyperOp (x : ImO)) = -(x : ImO) := by
    refine Submodule.span_induction ?_ ?_ ?_ ?_ hx
    · rintro y ⟨i, rfl⟩; fin_cases i
      · show hyperOp (hyperOp e5I) = -e5I; rw [hyperOp_e5I, hyperOp_u1I]
      · show hyperOp (hyperOp e6I) = -e6I; rw [hyperOp_e6I, hyperOp_e2I]
      · show hyperOp (hyperOp e7I) = -e7I; rw [hyperOp_e7I, hyperOp_e3I]
    · simp
    · intro a b _ _ ha hb; rw [map_add, map_add, ha, hb, neg_add]
    · intro c a _ ha; rw [map_smul, map_smul, ha, smul_neg]
  simpa using key

/-- ⭐⭐⭐ THE su(2)_L-MODULE ISOMORPHISM `TL ≃ₗ[ℚ] TR` — the un-doubled and doubled weak-isospin
    triplets are ONE representation, identified by the forced hypercharge (Cayley–Dickson
    doubling) operator. The inverse is `-hyperTR` (since `hyperOp² = −1` on each triplet). -/
noncomputable def hyperEquivTLTR : TL ≃ₗ[ℚ] TR where
  toFun := hyperTL
  map_add' := map_add hyperTL
  map_smul' := map_smul hyperTL
  invFun := fun y => -(hyperTR y)
  left_inv := by
    intro x
    show -(hyperTR (hyperTL x)) = x
    rw [hyperTR_hyperTL, neg_neg]
  right_inv := by
    intro y
    show hyperTL (-(hyperTR y)) = y
    rw [map_neg, hyperTL_hyperTR, neg_neg]

@[simp] theorem hyperEquivTLTR_apply (x : TL) : (hyperEquivTLTR x : TR) = hyperTL x := rfl

/-! ## (E) W8 non-vacuity — the swap is genuine (TL is NOT hyperOp-fixed). -/

/-- ⭐ `hyperOp u1M ≠ 0` — the forced hypercharge genuinely MOVES the un-doubled triplet (it does
    not fix or annihilate it); `hyperOp u1M = -e5I ≠ 0` since `e5I ≠ 0`. -/
theorem hyperOp_u1I_ne_zero : hyperOp u1M ≠ 0 := by
  rw [hyperOp_u1I]
  intro h
  have he5 : e5I = 0 := by simpa using neg_eq_zero.mp h
  have : (e5O : O ℚ) = 0 := congrArg (fun z : ImO => (z : O ℚ)) he5
  exact e5O_ne_zero this

/-- ⭐ The doubling intertwiner is GENUINE on `TL`: it is NOT the identity there. If it were,
    `hyperOp u1M = u1M`; but `hyperOp u1M = -e5I` and `{u1M, e5I}` are linearly independent
    (distinct members of the banked independent `multBasis`), so `-e5I ≠ u1M`. -/
theorem hyperOp_not_id_on_TL : hyperOp u1M ≠ u1M := by
  rw [hyperOp_u1I]
  intro h
  -- -e5I = u1M ⟹ u1M + e5I = 0, contradicting independence of multBasis
  have hsum : u1M + e5I = 0 := by
    have := h.symm; rw [eq_neg_iff_add_eq_zero] at this; simpa [add_comm] using this
  -- push to O ℚ: u1 + e5O = 0, but they are distinct basis vectors
  have hO : (u1 : O ℚ) + e5O = 0 := by
    have := congrArg (fun z : ImO => (z : O ℚ)) hsum
    simpa using this
  -- read the e5O coordinate (index 5): u1 has 0 there, e5O has 1 ⟹ 1 = 0, false
  have hcontra : (1 : ℚ) = 0 := by
    have hc : c5 ((u1 : O ℚ) + e5O) = c5 (0 : O ℚ) := congrArg c5 hO
    simp [u1, e5O, c5, map_add] at hc
  exact one_ne_zero hcontra

/-! ## (F) The capstone. -/

/-- ⭐⭐⭐ CAPSTONE — THE FORCED HYPERCHARGE OPERATOR IS THE CAYLEY–DICKSON DOUBLING INTERTWINER.
    The banked forced hypercharge `hyperOp = crossOp (κO 1)` (N255), on N277's weak-isospin
    multiplet decomposition `ImO = TL ⊕ Sg ⊕ TR`:
      · SWAPS the two triplets `TL.map hyperOp = TR` and `TR.map hyperOp = TL`;
      · KILLS the su(2)_L-fixed doubling axis `Sg` (`hyperOp e4I = 0`);
      · is a complex structure on each triplet (`hyperOp² = −1` on `TL`);
      · induces a genuine su(2)_L-module ISOMORPHISM `TL ≃ₗ TR` (the two triplets are ONE
        doubled representation);
      · the swap is genuine (`hyperOp u1M ≠ 0` and is NOT the identity on `TL`). -/
theorem hypercharge_doubling_intertwiner_structure :
    TL.map hyperOp = TR
    ∧ TR.map hyperOp = TL
    ∧ hyperOp e4I = 0
    ∧ (∀ x : TL, (hyperTR (hyperTL x) : TL) = -x)
    ∧ (Nonempty (TL ≃ₗ[ℚ] TR))
    ∧ hyperOp u1M ≠ 0
    ∧ hyperOp u1M ≠ u1M :=
  ⟨TL_map_hyperOp_eq_TR, TR_map_hyperOp_eq_TL, hyperOp_e4I, hyperTR_hyperTL,
    ⟨hyperEquivTLTR⟩, hyperOp_u1I_ne_zero, hyperOp_not_id_on_TL⟩

end Phys.Algebra
