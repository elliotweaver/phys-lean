import Phys.Algebra.DerivationRep7IsospinBranching
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Module
attribute [local instance] CD.narCD CD.srCD
noncomputable section

def iotaO_p : H ℚ →ₗ[ℚ] O ℚ where
  toFun a := ⟨a, 0⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

theorem innerDeriv_iotaO_p (q a : H ℚ) :
    innerDeriv q (iotaO_p a) = iotaO_p (adHom q a) := by
  have h0 : adHom q (0 : H ℚ) = 0 := by simp
  ext <;> simp [innerDeriv_apply, iotaO_p, h0]
theorem innerDeriv_kappaO_p (q b : H ℚ) :
    innerDeriv q (kappaO b) = kappaO (adHom q b) := by
  have h0 : adHom q (0 : H ℚ) = 0 := by simp
  ext <;> simp [innerDeriv_apply, kappaO, h0]

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

-- adHom q preserves ImH for imaginary q (via banked adHom_star_comm)
theorem adHom_mem_ImH {q : H ℚ} (hq : star q = -q) {a : H ℚ} (ha : a ∈ ImH) :
    adHom q a ∈ ImH := by
  rw [mem_ImH] at ha ⊢
  rw [← adHom_star_comm q hq, ha, map_neg]

-- INVARIANCE: innerDeriv q maps iotaO_p(ImH) into itself (imaginary q)
theorem invariant_iotaImH {q : H ℚ} (hq : star q = -q) :
    ∀ x ∈ Submodule.map iotaO_p ImH, innerDeriv q x ∈ Submodule.map iotaO_p ImH := by
  rintro _ ⟨a, ha, rfl⟩
  rw [SetLike.mem_coe] at ha
  rw [innerDeriv_iotaO_p]
  exact Submodule.mem_map_of_mem (adHom_mem_ImH hq ha)
theorem invariant_kappaImH {q : H ℚ} (hq : star q = -q) :
    ∀ x ∈ Submodule.map kappaO ImH, innerDeriv q x ∈ Submodule.map kappaO ImH := by
  rintro _ ⟨b, hb, rfl⟩
  rw [SetLike.mem_coe] at hb
  rw [innerDeriv_kappaO_p]
  exact Submodule.mem_map_of_mem (adHom_mem_ImH hq hb)

-- W8 NON-VACUITY: su(2) acts NONTRIVIALLY on the OLD adjoint 3 — innerDeriv hI moves
-- iotaO_p hJ off zero (adHom hI hJ = 2hK ≠ 0).
theorem hJ_mem_ImH : (hJ : H ℚ) ∈ ImH := by rw [mem_ImH]; exact hJ_imag
theorem action_on_iotaImH_ne_zero : innerDeriv (hI : H ℚ) (iotaO_p hJ) ≠ 0 := by
  rw [innerDeriv_iotaO_p]
  intro h
  have hadj : adHom (hI : H ℚ) hJ = 0 := by
    have := congrArg CD.re h; simpa [iotaO_p] using this
  rw [adHom_apply, hI_hJ, hJ_hI, sub_neg_eq_add, hK_def] at hadj
  -- hadj : ⟨0,J⟩ + ⟨0,J⟩ = 0 ; the .im.im coordinate is 2 ≠ 0
  have hc := congrArg (fun z : H ℚ => z.im.im) hadj
  simp [Dbl.J, CD.add_im, Dbl.add_im] at hc

#print axioms invariant_iotaImH
#print axioms invariant_kappaImH
#print axioms action_on_iotaImH_ne_zero

end
end Phys.Algebra
