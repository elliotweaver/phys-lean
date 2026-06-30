import Phys.Algebra.DerivationRep7IsospinBranching
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Module
attribute [local instance] CD.narCD CD.srCD
noncomputable section

-- OLD-LINE embedding
def iotaO_p : H ℚ →ₗ[ℚ] O ℚ where
  toFun a := ⟨a, 0⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

theorem iotaO_p_injective : Function.Injective iotaO_p := by
  intro x y h; have := congrArg CD.re h; simpa [iotaO_p] using this

theorem kappaO_injective : Function.Injective (kappaO) := by
  intro x y h; have := congrArg CD.im h; simpa [kappaO] using this

-- starLH and ImH (mirror N22 at rung 2)
def starLH : Module.End ℚ (H ℚ) where
  toFun := star
  map_add' := star_add
  map_smul' := by intro q x; show star (q • x) = q • star x
                  ext <;> simp [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

def ImH : Submodule ℚ (H ℚ) := LinearMap.ker (starLH + 1)

theorem mem_ImH {x : H ℚ} : x ∈ ImH ↔ star x = -x := by
  simp only [ImH, LinearMap.mem_ker, LinearMap.add_apply, starLH,
    LinearMap.coe_mk, AddHom.coe_mk, Module.End.one_apply]
  exact ⟨fun h => by linear_combination (norm := abel) h, fun h => by rw [h]; abel⟩

-- finrank ImH = 3 (rank-nullity on starLH+1; range = ℚ·1, finrank H = 4)
def reH (x : H ℚ) : ℚ := x.re.re

theorem reH_def (x : H ℚ) : x + star x = (2 * reH x) • (1 : H ℚ) := by
  ext <;> simp [reH] <;> ring

theorem one_ne_zero_H : (1 : H ℚ) ≠ 0 := by
  intro h; have hh := congrArg (fun z : H ℚ => z.re.re) h
  simp at hh

theorem range_starLH_add_one :
    LinearMap.range (starLH + 1) = Submodule.span ℚ {(1 : H ℚ)} := by
  apply le_antisymm
  · rintro y ⟨x, rfl⟩
    have : (starLH + 1) x = (2 * reH x) • (1 : H ℚ) := by
      show star x + x = _; rw [add_comm]; exact reH_def x
    rw [this]; exact Submodule.smul_mem _ _ (Submodule.subset_span (by simp))
  · rw [Submodule.span_le]
    rintro y hy
    simp only [Set.mem_singleton_iff] at hy; subst hy
    refine ⟨(1/2 : ℚ) • (1 : H ℚ), ?_⟩
    have hcalc : (starLH + 1) ((1/2 : ℚ) • (1:H ℚ)) = (2 * reH ((1/2:ℚ) • (1:H ℚ))) • (1:H ℚ) := by
      show star ((1/2 : ℚ) • (1:H ℚ)) + ((1/2 : ℚ) • (1:H ℚ)) = _
      rw [add_comm]; exact reH_def _
    rw [hcalc]
    have hr : reH ((1/2 : ℚ) • (1:H ℚ)) = 1/2 := by
      simp [reH, cd_qsmul_re, Dbl.smul_re]
    rw [hr]; norm_num

theorem finrank_ImH_eq_three : Module.finrank ℚ ImH = 3 := by
  have hrk := LinearMap.finrank_range_add_finrank_ker (starLH + 1)
  rw [range_starLH_add_one, finrank_H_eq_four] at hrk
  have h1 : Module.finrank ℚ (Submodule.span ℚ {(1 : H ℚ)}) = 1 :=
    finrank_span_singleton one_ne_zero_H
  rw [h1] at hrk
  have h4 : 1 + Module.finrank ℚ ImH = 4 := hrk
  omega

#print axioms finrank_ImH_eq_three
#print axioms iotaO_p_injective
#print axioms kappaO_injective

end
end Phys.Algebra
