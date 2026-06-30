import Phys.Algebra.DerivationRep7IsospinBranching
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Module
attribute [local instance] CD.narCD CD.srCD
noncomputable section

def iotaO_p : H ℚ →ₗ[ℚ] O ℚ where
  toFun a := ⟨a, 0⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

theorem iotaO_p_injective : Function.Injective iotaO_p := by
  intro x y h; have := congrArg CD.re h; simpa [iotaO_p] using this
theorem kappaO_inj : Function.Injective (kappaO) := by
  intro x y h; have := congrArg CD.im h; simpa [kappaO] using this

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

def reH (x : H ℚ) : ℚ := x.re.re
theorem reH_def (x : H ℚ) : x + star x = (2 * reH x) • (1 : H ℚ) := by
  ext <;> simp [reH] <;> ring

-- MEASURE 1: finrank of an injective map image equals finrank of source
example : Module.finrank ℚ (Submodule.map iotaO_p ImH) = Module.finrank ℚ ImH := by
  exact (Submodule.equivMapOfInjective iotaO_p iotaO_p_injective ImH).symm.finrank_eq

-- MEASURE 2: the span e₄, finrank 1
example : Module.finrank ℚ (Submodule.span ℚ {kappaO (1:H ℚ)}) = 1 :=
  finrank_span_singleton kappaO_one_ne_zero

-- MEASURE 3 (the heavy one): A ⊔ B ⊔ C = ImO where
--   A = iotaO_p(ImH), B = ℚ·e₄, C = kappaO(ImH).
-- An imaginary x=⟨a,b⟩ has a ∈ ImH (a imaginary), b arbitrary; b=(reH b)•1+b_im.
example :
    (Submodule.map iotaO_p ImH) ⊔ (Submodule.span ℚ {kappaO (1:H ℚ)})
        ⊔ (Submodule.map kappaO ImH) = ImO := by
  apply le_antisymm
  · -- ⊆ ImO : each piece is imaginary
    apply sup_le
    apply sup_le
    · rintro _ ⟨a, ha, rfl⟩
      rw [SetLike.mem_coe, mem_ImH] at ha
      rw [mem_ImO]
      ext <;> simp [iotaO_p, CD.star_re, CD.star_im, ha]
    · rw [Submodule.span_le, Set.singleton_subset_iff]; exact kappaO_one_mem_ImO
    · rintro _ ⟨b, hb, rfl⟩
      rw [mem_ImO]
      ext <;> simp [kappaO, CD.star_re, CD.star_im]
  · -- ⊇ : every imaginary x decomposes
    intro x hx
    rw [mem_ImO] at hx
    -- x.re ∈ ImH, x.im arbitrary
    have hre : star x.re = -x.re := by
      have := congrArg CD.re hx; simpa [CD.star_re, CD.neg_re] using this
    -- x = iotaO_p x.re + kappaO x.im
    have hdecomp : x = iotaO_p x.re + kappaO x.im := by
      ext <;> simp [iotaO_p, kappaO]
    rw [hdecomp]
    apply Submodule.add_mem
    · apply Submodule.mem_sup_left; apply Submodule.mem_sup_left
      exact Submodule.mem_map_of_mem (by rw [mem_ImH]; exact hre)
    · -- kappaO x.im = (reH x.im)•e₄ + kappaO (x.im - (reH x.im)•1)
      have hb_im : star (x.im - (reH x.im) • (1:H ℚ)) = -(x.im - (reH x.im) • (1:H ℚ)) := by
        have hsum := reH_def x.im
        have hstar1 : star ((reH x.im) • (1:H ℚ)) = (reH x.im) • (1:H ℚ) := by
          ext <;> simp [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
            CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
        rw [star_sub, hstar1]
        have key : star x.im = (2 * reH x.im) • (1:H ℚ) - x.im := by
          linear_combination (norm := abel) hsum
        rw [key, two_mul, add_smul]; abel
      have hsplit : kappaO x.im
          = (reH x.im) • kappaO (1:H ℚ) + kappaO (x.im - (reH x.im) • (1:H ℚ)) := by
        rw [← map_smul, ← map_add]; congr 1; module
      rw [hsplit]
      apply Submodule.add_mem
      · apply Submodule.mem_sup_left; apply Submodule.mem_sup_right
        exact Submodule.smul_mem _ _ (Submodule.mem_span_singleton_self _)
      · apply Submodule.mem_sup_right
        exact Submodule.mem_map_of_mem (by rw [mem_ImH]; exact hb_im)

end
end Phys.Algebra
