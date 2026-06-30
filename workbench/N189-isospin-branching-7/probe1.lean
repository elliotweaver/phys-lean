import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- O-level new-dimension embedding b ↦ ⟨0,b⟩. -/
def kappaO : H ℚ →ₗ[ℚ] O ℚ where
  toFun b := ⟨0, b⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

@[simp] theorem kappaO_apply (b : H ℚ) : kappaO b = (⟨0, b⟩ : O ℚ) := rfl

/-- O-level old-line embedding a ↦ ⟨a,0⟩. -/
def iotaO : H ℚ →ₗ[ℚ] O ℚ where
  toFun a := ⟨a, 0⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

@[simp] theorem iotaO_apply (a : H ℚ) : iotaO a = (⟨a, 0⟩ : O ℚ) := rfl

-- MEASURE 1: intertwiner on the new summand
theorem innerDeriv_kappaO (q b : H ℚ) :
    innerDeriv q (kappaO b) = kappaO (adHom q b) := by
  simp [innerDeriv_apply, kappaO]

-- MEASURE 2: intertwiner on the old summand
theorem innerDeriv_iotaO (q a : H ℚ) :
    innerDeriv q (iotaO a) = iotaO (adHom q a) := by
  simp [innerDeriv_apply, iotaO]

-- MEASURE 3: the singlet (doubling unit e₄ = ⟨0,1⟩) is annihilated by isospin
theorem innerDeriv_singlet (q : H ℚ) : innerDeriv q (kappaO 1) = 0 := by
  rw [innerDeriv_kappaO]
  have : adHom q (1 : H ℚ) = 0 := by simp [adHom_apply]
  rw [this, map_zero]

-- MEASURE 4: the singlet lies in ImO (imaginary)
theorem kappaO_one_mem_ImO : kappaO (1 : H ℚ) ∈ ImO := by
  rw [mem_ImO]
  ext <;> simp [kappaO, CD.star_re, CD.star_im]

-- MEASURE 5: the singlet is nonzero
theorem kappaO_one_ne_zero : kappaO (1 : H ℚ) ≠ 0 := by
  intro h
  have := congrArg CD.im h
  simp [kappaO] at this

-- MEASURE 6 (W8 non-vacuity): the isospin action on ImO is genuinely NONZERO
-- (innerDeriv hI moves something in ImO), so reducibility is not because the action is trivial.
theorem innerDeriv_hI_nonzero_on_ImO :
    innerDeriv (hI : H ℚ) ≠ 0 := innerDeriv_hI_ne_zero

#print axioms innerDeriv_kappaO
#print axioms innerDeriv_iotaO
#print axioms innerDeriv_singlet
#print axioms kappaO_one_mem_ImO
#print axioms kappaO_one_ne_zero

end

end Phys.Algebra
