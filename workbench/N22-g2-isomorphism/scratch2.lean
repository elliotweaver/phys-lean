import Phys.Algebra.DerivationBracket
import Mathlib.Tactic

namespace Phys.Algebra.Scratch
open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable def starL : Module.End ℚ (O ℚ) where
  toFun := star
  map_add' := star_add
  map_smul' := by
    intro q x
    show star (q • x) = q • star x
    ext <;> simp [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

@[simp] theorem starL_apply (x : O ℚ) : starL x = star x := rfl

noncomputable def ImO : Submodule ℚ (O ℚ) := LinearMap.ker (starL + 1)

theorem starL_add_one_apply (x : O ℚ) : (starL + 1) x = (2 * reQ x) • (1 : O ℚ) := by
  show star x + x = _
  rw [add_comm]; exact trace_id x

theorem one_ne_zero_O : (1 : O ℚ) ≠ 0 := by
  intro h
  have : reQ (1 : O ℚ) = reQ (0 : O ℚ) := by rw [h]
  simp only [reQ] at this
  norm_num at this

theorem range_starL_add_one : LinearMap.range (starL + 1) = Submodule.span ℚ {(1 : O ℚ)} := by
  apply le_antisymm
  · rintro y ⟨x, rfl⟩
    rw [starL_add_one_apply]
    exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  · rw [Submodule.span_le]
    rintro y hy
    simp only [Set.mem_singleton_iff] at hy; subst hy
    refine ⟨(1/2 : ℚ) • (1 : O ℚ), ?_⟩
    rw [map_smul, starL_add_one_apply]
    have hr : reQ (1 : O ℚ) = 1 := by simp only [reQ]; rfl
    rw [hr, smul_smul]; norm_num

theorem finrank_ImO : Module.finrank ℚ ImO = 7 := by
  have hrk := LinearMap.finrank_range_add_finrank_ker (starL + 1)
  rw [range_starL_add_one, finrank_O_eq_eight] at hrk
  have h1 : Module.finrank ℚ (Submodule.span ℚ {(1 : O ℚ)}) = 1 :=
    finrank_span_singleton one_ne_zero_O
  rw [h1] at hrk
  show Module.finrank ℚ (LinearMap.ker (starL + 1)) = 7
  omega
