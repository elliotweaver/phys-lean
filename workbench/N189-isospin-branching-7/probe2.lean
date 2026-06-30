import Phys.Algebra.DerivationHIntoO
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationIrreducible
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

def kappaO : H ℚ →ₗ[ℚ] O ℚ where
  toFun b := ⟨0, b⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

@[simp] theorem kappaO_apply (b : H ℚ) : kappaO b = (⟨0, b⟩ : O ℚ) := rfl

-- the singlet vector is in ImO
theorem kappaO_one_mem_ImO : kappaO (1 : H ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [kappaO, CD.star_re, CD.star_im]

theorem kappaO_one_ne_zero : kappaO (1 : H ℚ) ≠ 0 := by
  intro h; have := congrArg CD.im h; simp [kappaO] at this

-- su(2) (in fact ALL inner derivations) fix the singlet
theorem innerDeriv_kappaO_one (q : H ℚ) : innerDeriv q (kappaO 1) = 0 := by
  have h : adHom q (1 : H ℚ) = 0 := by simp [adHom_apply]
  ext <;> simp [innerDeriv_apply, kappaO, h]

-- the singlet's witnessing coordinate is 1 (genuinely nonzero fixed vector)
theorem kappaO_one_coord : (kappaO (1 : H ℚ)).im.re.re = 1 := by
  simp [kappaO]

-- ★★ the contrast: g₂ has no invariant line, so SOME derivation moves the singlet line.
-- This needs the ℚ-linear no_one_dim_invariant_ImO (over Module.End ℚ).
theorem g2_moves_singletLine :
    ∃ D : Module.End ℚ (O ℚ), IsDerivQ D ∧
      ∃ x ∈ Submodule.span ℚ {kappaO (1 : H ℚ)}, D x ∉ Submodule.span ℚ {kappaO (1 : H ℚ)} := by
  by_contra h
  push_neg at h
  apply no_one_dim_invariant_ImO (Submodule.span ℚ {kappaO (1 : H ℚ)})
  · rw [Submodule.span_le, Set.singleton_subset_iff]; exact kappaO_one_mem_ImO
  · rw [finrank_span_singleton kappaO_one_ne_zero]
  · intro D hD x hx; exact h D hD x hx

#print axioms kappaO_one_mem_ImO
#print axioms innerDeriv_kappaO_one
#print axioms kappaO_one_coord
#print axioms g2_moves_singletLine

end

end Phys.Algebra
