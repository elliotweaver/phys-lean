import Phys.Algebra.DerivationSO4TwoSU2
import Phys.Algebra.DerivationRep7FullBranching
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- (1) su(2)_T annihilates the first slot
theorem P_leftImDeriv_iotaO (Q : H ℚ) (a : H ℚ) :
    leftImDeriv Q (iotaO a) = 0 := by
  rw [leftImDeriv_apply, iotaO_apply]
  ext <;> simp

-- (2) su(2)_T acts on the second slot by left multiplication
theorem P_leftImDeriv_kappaO (Q : H ℚ) (b : H ℚ) :
    leftImDeriv Q (kappaO b) = kappaO (Q * b) := by
  rw [leftImDeriv_apply, kappaO_apply]
  ext <;> simp [kappaO]

-- (3) the full second slot is invariant under su(2)_T
theorem P_invariant_kappaTop (Q : H ℚ) :
    ∀ x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)),
      leftImDeriv Q x ∈ Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)) := by
  rintro _ ⟨b, _, rfl⟩
  rw [P_leftImDeriv_kappaO]
  exact Submodule.mem_map_of_mem trivial

-- (4) the su(2)_T decomposition of the 7
theorem P_branchingT_sup_eq_ImO :
    (Submodule.map iotaO ImH) ⊔ (Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ))) = ImO := by
  apply le_antisymm
  · apply sup_le
    · rintro _ ⟨a, ha, rfl⟩
      rw [SetLike.mem_coe, mem_ImH] at ha
      rw [mem_ImO]; ext <;> simp [iotaO, CD.star_re, CD.star_im, ha]
    · rintro _ ⟨b, _, rfl⟩
      rw [mem_ImO]; ext <;> simp [kappaO, CD.star_re, CD.star_im]
  · intro x hx
    rw [mem_ImO] at hx
    have hre : star x.re = -x.re := by
      have := congrArg CD.re hx; simpa [CD.star_re, CD.neg_re] using this
    have hdecomp : x = iotaO x.re + kappaO x.im := by
      ext <;> simp [iotaO, kappaO]
    rw [hdecomp]
    apply Submodule.add_mem
    · apply Submodule.mem_sup_left
      exact Submodule.mem_map_of_mem (by rw [mem_ImH]; exact hre)
    · apply Submodule.mem_sup_right
      exact Submodule.mem_map_of_mem trivial

-- (5) dimensions: the second slot is the full 4
theorem P_finrank_kappaTop :
    Module.finrank ℚ (Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ))) = 4 := by
  rw [(Submodule.equivMapOfInjective kappaO kappaO_injective ⊤).symm.finrank_eq,
    finrank_top, finrank_H_eq_four]

theorem P_branchingT_dim_sum :
    Module.finrank ℚ (Submodule.map iotaO ImH)
      + Module.finrank ℚ (Submodule.map kappaO (⊤ : Submodule ℚ (H ℚ)))
    = Module.finrank ℚ ImO := by
  rw [finrank_iotaImH, P_finrank_kappaTop, finrank_ImO]

-- (6) W8 ROLE SWAP
theorem P_leftImDeriv_moves_singlet : leftImDeriv (hI : H ℚ) (kappaO 1) ≠ 0 := by
  intro h
  have hc : (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = (1 : ℚ) := by
    rw [leftImDeriv_apply]
    simp [kappaO, hI, CD.iota, Dbl.J]
  rw [h] at hc; simp at hc

theorem P_leftImDeriv_annihilates_iotaImH : leftImDeriv (hI : H ℚ) (iotaO hJ) = 0 :=
  P_leftImDeriv_iotaO hI hJ

-- witness coordinate for the costume
theorem P_singlet_moved_coord :
    (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = 1 := by
  rw [leftImDeriv_apply]
  simp [kappaO, hI, CD.iota, Dbl.J]

#print axioms P_leftImDeriv_iotaO
#print axioms P_leftImDeriv_kappaO
#print axioms P_invariant_kappaTop
#print axioms P_branchingT_sup_eq_ImO
#print axioms P_finrank_kappaTop
#print axioms P_branchingT_dim_sum
#print axioms P_leftImDeriv_moves_singlet
#print axioms P_leftImDeriv_annihilates_iotaImH
#print axioms P_singlet_moved_coord

end

end Phys.Algebra
