import Phys.Algebra.LorentzContinuumCliffordPinExactKernelComplete

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

/-! ## Scale-invariance of the reflection and the unit-axis normalization. -/

theorem QvC_smul (c : Cut) (a : STVC) : QvC (c • a) = c * c * QvC a := by
  rw [← BvC_self, BvC_smul_left, BvC_smul_right, BvC_self]; ring

theorem houseHolderM_smul {a : STVC} (c : Cut) (hc : c ≠ 0) (ha : BvC a a ≠ 0) :
    houseHolderM (c • a) = houseHolderM a := by
  apply LinearMap.ext
  intro p
  rw [houseHolderM_apply, houseHolderM_apply]
  have hcc : BvC (c • a) (c • a) = c * c * BvC a a := by
    rw [BvC_smul_left, BvC_smul_right]; ring
  have hcp : BvC (c • a) p = c * BvC a p := by rw [BvC_smul_left]
  rw [hcc, hcp, smul_smul]
  have hco : 2 * (c * c * BvC a a)⁻¹ * (c * BvC a p) * c
      = 2 * (BvC a a)⁻¹ * BvC a p := by
    field_simp
  rw [hco]

/-- The rescale scalar `cutSqrt |QvC a|⁻¹` taking an anisotropic axis to a unit axis. -/
noncomputable def unitNormCut (a : STVC) : Cut := cutSqrt (|QvC a|⁻¹)

theorem unitNormCut_sq (a : STVC) : unitNormCut a * unitNormCut a = |QvC a|⁻¹ :=
  cutSqrt_sq (inv_nonneg.mpr (abs_nonneg _))

theorem unitNormCut_pos {a : STVC} (ha : QvC a ≠ 0) : 0 < unitNormCut a :=
  cutSqrt_pos (inv_pos.mpr (abs_pos.mpr ha))

/-- The unit-normalized axis: the same direction as `a`, rescaled to `QvC = ±1`. -/
noncomputable def unitAxis (a : STVC) : STVC := unitNormCut a • a

theorem QvC_unitAxis {a : STVC} (ha : QvC a ≠ 0) :
    QvC (unitAxis a) = 1 ∨ QvC (unitAxis a) = -1 := by
  have hval : QvC (unitAxis a) = |QvC a|⁻¹ * QvC a := by
    unfold unitAxis; rw [QvC_smul, unitNormCut_sq]
  rcases lt_or_gt_of_ne ha with h | h
  · right
    rw [hval, abs_of_neg h, inv_neg, neg_mul, inv_mul_cancel₀ ha]
  · left
    rw [hval, abs_of_pos h, inv_mul_cancel₀ (ne_of_gt h)]

theorem unitAxis_aniso {a : STVC} (ha : QvC a ≠ 0) :
    BvC (unitAxis a) (unitAxis a) ≠ 0 := by
  rw [BvC_self]
  rcases QvC_unitAxis ha with h | h <;> rw [h]
  · exact one_ne_zero
  · exact neg_ne_zero.mpr one_ne_zero

theorem houseHolderM_unitAxis {a : STVC} (ha : BvC a a ≠ 0) :
    houseHolderM (unitAxis a) = houseHolderM a := by
  have hqa : QvC a ≠ 0 := by rw [← BvC_self]; exact ha
  unfold unitAxis
  exact houseHolderM_smul (unitNormCut a) (ne_of_gt (unitNormCut_pos hqa)) ha

/-! ## The unit-axis covering generator lands in `PinUnitSub` and covers the same reflection. -/

theorem cliffUnitOf_unitAxis_mem {a : STVC} (hqa : QvC a ≠ 0) :
    cliffUnitOf (unitAxis a) (unitAxis_aniso hqa) ∈ PinUnitSub :=
  Submonoid.subset_closure ⟨unitAxis a, unitAxis_aniso hqa, QvC_unitAxis hqa, rfl⟩

theorem cliffUnitOf_unitAxis_covers {a : STVC} (ha : BvC a a ≠ 0) :
    CliffCovers (cliffUnitOf (unitAxis a) (unitAxis_aniso (by rw [← BvC_self]; exact ha)))
      (houseHolderM a) := by
  have hqa : QvC a ≠ 0 := by rw [← BvC_self]; exact ha
  have hc := cliffCovers_reflection (unitAxis_aniso hqa)
  rwa [houseHolderM_unitAxis ha] at hc

/-! ## The global cover landing in the UNIT-normalized Pin group, and surjectivity. -/

/-- ★★ THE GLOBAL COVER over the reflection-word group, landing in `PinUnitSub`: EVERY
    `g ∈ Submonoid.closure houseHolderMSet` has a UNIT-normalized covering unit. The reflection is
    scale-invariant in its axis (`houseHolderM_smul`), so each generator's RAW axis is replaced by
    its unit axis (`unitAxis`, `QvC = ±1`), whose `cliffUnitOf` is a UNIT Pin generator covering the
    SAME reflection — the cover induction now lands inside `PinUnitSub`. -/
theorem cover_global_reflection_word_pinUnit {g : Module.End Cut STVC}
    (hg : g ∈ Submonoid.closure houseHolderMSet) :
    ∃ u : CliffCˣ, u ∈ PinUnitSub ∧ CliffCovers u g := by
  induction hg using Submonoid.closure_induction with
  | mem x hx =>
      obtain ⟨a, ha, rfl⟩ := hx
      have hqa : QvC a ≠ 0 := by rw [← BvC_self]; exact ha
      refine ⟨cliffUnitOf (unitAxis a) (unitAxis_aniso hqa), ?_, ?_⟩
      · exact cliffUnitOf_unitAxis_mem hqa
      · have hc := cliffCovers_reflection (unitAxis_aniso hqa)
        rwa [houseHolderM_unitAxis ha] at hc
  | one => exact ⟨1, Submonoid.one_mem _, cliffCovers_one⟩
  | mul x y _ _ ihx ihy =>
      obtain ⟨u, hu, hcu⟩ := ihx
      obtain ⟨w, hw, hcw⟩ := ihy
      exact ⟨u * w, mul_mem hu hw, cliffCovers_mul hcu hcw⟩

/-- ★★ THE GLOBAL SURJECTIVITY over the UNIT-normalized Pin group: EVERY linear `BvC`-isometry
    `g ∈ bvIsomLinMonoid` (the full continuum Lorentz group `SO⁺(1,9)`, N132) has a UNIT-normalized
    covering unit `u ∈ PinUnitSub`. Combines `cover_global_reflection_word_pinUnit` with N132's
    classification `reflection_closure_eq_bvIsomLinMonoid`. -/
theorem cover_global_bvIsom_pinUnit {g : Module.End Cut STVC}
    (hg : g ∈ bvIsomLinMonoid) :
    ∃ u : CliffCˣ, u ∈ PinUnitSub ∧ CliffCovers u g := by
  apply cover_global_reflection_word_pinUnit
  rw [reflection_closure_eq_bvIsomLinMonoid]
  exact hg

/-- ★★★ THE SURJECTIVITY of the UNIT-normalized Pin double cover `coverMapPinUnit ↠ SO⁺(1,9)`:
    `coverMapPinUnit` is ONTO the continuum Lorentz group `bvIsomLinMonoid`. With N150's exact
    kernel `{1,-1}` this completes the double-cover picture: `Pin(1,9) ↠ SO⁺(1,9)` is a surjective
    two-to-one group homomorphism, DERIVED forward (no posited Pin/Spin group, no posited cover,
    no posited surjectivity). -/
theorem coverMapPinUnit_surjective : Function.Surjective coverMapPinUnit := by
  rintro ⟨g, hg⟩
  obtain ⟨u, hu, hcov⟩ := cover_global_bvIsom_pinUnit hg
  refine ⟨⟨u, hu⟩, ?_⟩
  apply Subtype.ext
  rw [coverMapPinUnit_coe]
  exact cliffCovers_unique (coverOp_covers ⟨u, pinUnitSub_le_coversSub hu⟩) hcov

/-! ## W8 teeth — a concrete boost is the image of a UNIT-normalized Pin element. -/

/-- ★ W8 NON-VACUITY — the CONCRETE boost `(5/3,4/3)` (a genuine non-identity Lorentz element,
    off-diagonal `4/3 ≠ 0`) is the IMAGE under `coverMapPinUnit` of a UNIT-normalized Pin element.
    The surjectivity realized on a real boost. -/
theorem coverMapPinUnit_boost_apply :
    ∃ u : PinUnitSub,
      (coverMapPinUnit u : Module.End Cut STVC) = boostEndC ((5:Cut)/3) ((4:Cut)/3) := by
  have hab : ((5:Cut)/3) ^ 2 - ((4:Cut)/3) ^ 2 = 1 := by ring
  have hg : boostEndC ((5:Cut)/3) ((4:Cut)/3) ∈ bvIsomLinMonoid := boostEndC_isBvIsomLin hab
  obtain ⟨u, hu, hcov⟩ := cover_global_bvIsom_pinUnit hg
  refine ⟨⟨u, hu⟩, ?_⟩
  rw [coverMapPinUnit_coe]
  exact cliffCovers_unique (coverOp_covers ⟨u, pinUnitSub_le_coversSub hu⟩) hcov

end

end Phys.Algebra
