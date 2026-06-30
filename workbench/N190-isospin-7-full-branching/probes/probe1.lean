import Phys.Algebra.DerivationRep7IsospinBranching
import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationIrreducible
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Module
attribute [local instance] CD.narCD CD.srCD
noncomputable section

-- OLD-LINE embedding a ↦ ⟨a,0⟩ as ℚ-linear (mirror of kappaO)
def iotaO_p : H ℚ →ₗ[ℚ] O ℚ where
  toFun a := ⟨a, 0⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

-- THE TWO INTERTWINERS (the engine — generalizes N189's e₄ special case)
theorem innerDeriv_iotaO_p (q a : H ℚ) :
    innerDeriv q (iotaO_p a) = iotaO_p (adHom q a) := by
  have h0 : adHom q (0 : H ℚ) = 0 := by simp
  ext <;> simp [innerDeriv_apply, iotaO_p, h0]

theorem innerDeriv_kappaO_p (q b : H ℚ) :
    innerDeriv q (kappaO b) = kappaO (adHom q b) := by
  have h0 : adHom q (0 : H ℚ) = 0 := by simp
  ext <;> simp [innerDeriv_apply, kappaO, h0]

-- iotaO_p lands in ImO iff a imaginary
theorem iotaO_p_mem_ImO {a : H ℚ} (ha : star a = -a) : iotaO_p a ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [iotaO_p, CD.star_re, CD.star_im, ha]

theorem kappaO_mem_ImO {b : H ℚ} (hb : star b = -b) : kappaO b ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [kappaO, CD.star_re, CD.star_im, hb]

#print axioms innerDeriv_iotaO_p
#print axioms innerDeriv_kappaO_p
#print axioms iotaO_p_mem_ImO
#print axioms kappaO_mem_ImO

end
end Phys.Algebra
