import Phys.Algebra.LorentzContinuumGenerationIndefiniteHouseholder

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- General send-back: if `c` is anisotropic and `2·BvC c w = BvC c c`, then the reflection at `c`
    sends `w` to `w − c`. -/
theorem houseHolderM_sendback {c w : STVC} (hc : BvC c c ≠ 0)
    (hcoef : 2 * BvC c w = BvC c c) :
    houseHolderM c w = w - c := by
  rw [houseHolderM_apply]
  have h1 : 2 * (BvC c c)⁻¹ * BvC c w = 1 := by
    field_simp
    linarith [hcoef]
  rw [h1, one_smul]

/-- The difference-coefficient identity (the oracle's `hkey`, isolated). -/
theorem BvC_isom_coef_diff {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    2 * BvC (T v - v) (T v) = BvC (T v - v) (T v - v) := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  have e1 : BvC (T v - v) (T v) = BvC (T v) (T v) - BvC v (T v) := by rw [BvC_sub_left]
  have e2 : BvC (T v - v) (T v - v)
      = BvC (T v) (T v) - BvC (T v) v - BvC v (T v) + BvC v v := by
    rw [BvC_sub_left, BvC_sub_right, BvC_sub_right]; ring
  rw [e1, e2, BvC_symm (T v) v, hTvTv]; ring

/-- The sum-coefficient identity. -/
theorem BvC_isom_coef_sum {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    2 * BvC (T v + v) (T v) = BvC (T v + v) (T v + v) := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  have e1 : BvC (T v + v) (T v) = BvC (T v) (T v) + BvC v (T v) := by rw [BvC_add_left]
  have e2 : BvC (T v + v) (T v + v)
      = BvC (T v) (T v) + BvC (T v) v + BvC v (T v) + BvC v v := by
    rw [BvC_add_left, BvC_add_right, BvC_add_right]; ring
  rw [e1, e2, BvC_symm (T v) v, hTvTv]; ring

/-- THE PERP: the moved difference is `BvC`-orthogonal to the moved sum. -/
theorem BvC_isom_diff_perp_sum {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    BvC (T v - v) (T v + v) = 0 := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  rw [BvC_sub_left, BvC_add_right, BvC_add_right, BvC_symm v (T v), hTvTv]; ring

/-- THE NORM SUM: `BvC a a + BvC b b = 4·BvC v v` for `a := Tv−v`, `b := Tv+v`. -/
theorem BvC_isom_diff_sum_norm {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC) :
    BvC (T v - v) (T v - v) + BvC (T v + v) (T v + v) = 4 * BvC v v := by
  have hTvTv : BvC (T v) (T v) = BvC v v := hT v v
  have ea : BvC (T v - v) (T v - v)
      = BvC (T v) (T v) - BvC (T v) v - BvC v (T v) + BvC v v := by
    rw [BvC_sub_left, BvC_sub_right, BvC_sub_right]; ring
  have eb : BvC (T v + v) (T v + v)
      = BvC (T v) (T v) + BvC (T v) v + BvC v (T v) + BvC v v := by
    rw [BvC_add_left, BvC_add_right, BvC_add_right]; ring
  rw [ea, eb, hTvTv]; ring

/-- THE DICHOTOMY: for an anisotropic moved `v`, at least one of the difference/sum is anisotropic. -/
theorem isom_moved_aniso_dichotomy {T : Module.End Cut STVC} (hT : IsBvIsomLin T) {v : STVC}
    (hvv : BvC v v ≠ 0) :
    BvC (T v - v) (T v - v) ≠ 0 ∨ BvC (T v + v) (T v + v) ≠ 0 := by
  by_contra h
  push Not at h
  obtain ⟨ha, hb⟩ := h
  have hsum := BvC_isom_diff_sum_norm hT v
  rw [ha, hb] at hsum
  apply hvv
  linarith [hsum]

/-- The difference reflection sends `Tv` back to `v` (the single-reflection / anisotropic route). -/
theorem houseHolderM_diff_sends_back {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC)
    (ha : BvC (T v - v) (T v - v) ≠ 0) :
    houseHolderM (T v - v) (T v) = v := by
  rw [houseHolderM_sendback ha (BvC_isom_coef_diff hT v)]; abel

/-- The sum reflection sends `Tv` to `−v` (the auxiliary for the null route). -/
theorem houseHolderM_sum_sends_neg {T : Module.End Cut STVC} (hT : IsBvIsomLin T) (v : STVC)
    (hb : BvC (T v + v) (T v + v) ≠ 0) :
    houseHolderM (T v + v) (T v) = -v := by
  rw [houseHolderM_sendback hb (BvC_isom_coef_sum hT v)]; abel

/-- ★★ THE NULL-DIFFERENCE TWO-REFLECTION PEEL-BACK over the 10-dim `STVC`: for a `BvC`-isometry `T`
    with an anisotropic moved `v` (`BvC v v ≠ 0`, `Tv ≠ v`), a product of at most TWO indefinite
    Householder reflections (each a `BvC`-isometry, all from `houseHolderMSet`) sends `Tv` back to `v`
    — EVEN when the moved difference `Tv − v` is NULL (`BvC (Tv−v)(Tv−v) = 0`), the case the N125
    anisotropic oracle could not reach. The null obstruction DISSOLVES through the SUM auxiliary
    `b := Tv + v`: anisotropy of `v` forces `BvC a a + BvC b b = 4·BvC v v ≠ 0`, so when the
    difference `a` is null the sum `b` is anisotropic, and `houseHolderM v ∘ houseHolderM b` sends
    `Tv ↦ −v ↦ v`. Positivity NOWHERE used — only the anisotropy of `v` the indefinite signature
    permits as a genuine spacelike possibility. -/
theorem houseHolderM_null_peel_back {T : Module.End Cut STVC} (hT : IsBvIsomLin T)
    {v : STVC} (hvv : BvC v v ≠ 0) :
    ∃ R : Module.End Cut STVC,
      R ∈ Submonoid.closure houseHolderMSet ∧ IsBvIsomLin R ∧ R (T v) = v := by
  rcases isom_moved_aniso_dichotomy hT hvv with ha | hb
  · -- anisotropic difference: single reflection
    refine ⟨houseHolderM (T v - v), ?_, houseHolderM_isom ha, houseHolderM_diff_sends_back hT v ha⟩
    exact Submonoid.subset_closure ⟨T v - v, ha, rfl⟩
  · -- null difference: two reflections through the sum auxiliary
    refine ⟨houseHolderM v * houseHolderM (T v + v), ?_,
      (houseHolderM_isom hvv).comp (houseHolderM_isom hb), ?_⟩
    · exact Submonoid.mul_mem _
        (Submonoid.subset_closure ⟨v, hvv, rfl⟩)
        (Submonoid.subset_closure ⟨T v + v, hb, rfl⟩)
    · rw [Module.End.mul_apply, houseHolderM_sum_sends_neg hT v hb, map_neg,
          houseHolderM_neg_self hvv, neg_neg]

end

end Phys.Algebra
