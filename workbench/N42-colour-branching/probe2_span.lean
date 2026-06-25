import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationPerfect
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

namespace N42bProbe2

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

def e2O : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e3O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e4O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨1,0⟩, ⟨0,0⟩⟩⟩
def e5O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,1⟩, ⟨0,0⟩⟩⟩
def e6O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨1,0⟩⟩⟩
def e7O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,1⟩⟩⟩
def imgUnit : Fin 6 → O ℚ := ![e2O, e3O, e4O, e5O, e6O, e7O]
def imgVec : Fin 14 → O ℚ :=
  ![0, 0, 0, e6O, -e5O, -e4O, e3O, e2O, e7O, e4O, -e5O, -e2O, e3O, 0]

set_option linter.unusedSimpArgs false in
theorem img_3  : evalU1 (bL 3)  = e6O := by
  rw [evalU1_apply, bL_coe]; show D3E u1 = e6O
  ext <;> simp [D3E, u1, e6O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_7  : evalU1 (bL 7)  = e2O := by
  rw [evalU1_apply, bL_coe]; show D7E u1 = e2O
  ext <;> simp [D7E, u1, e2O, c0, c1, c2, c3, c4, c5, c6, c7]

-- TEST A: the ⊇ branch via LinearMap.mem_range + defeq witness (positive unit)
example : imgUnit 0 ∈ LinearMap.range evalU1 := by
  exact LinearMap.mem_range.mpr ⟨bL 7, img_7⟩

-- TEST B: the ⊇ branch for a negated unit (e5O at index 3 = -(evalU1 (bL 4)))
set_option linter.unusedSimpArgs false in
theorem img_4  : evalU1 (bL 4)  = -e5O := by
  rw [evalU1_apply, bL_coe]; show D4E u1 = -e5O
  ext <;> simp [D4E, u1, e5O, c0, c1, c2, c3, c4, c5, c6, c7]

example : imgUnit 3 ∈ LinearMap.range evalU1 := by
  refine LinearMap.mem_range.mpr ⟨-(bL 4), ?_⟩
  show evalU1 (-(bL 4)) = e5O
  rw [map_neg, img_4, neg_neg]

set_option linter.unusedSimpArgs false in
theorem img_0  : evalU1 (bL 0)  = 0   := by
  rw [evalU1_apply, bL_coe]; show D0E u1 = 0
  ext <;> simp [D0E, u1, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_1  : evalU1 (bL 1)  = 0   := by
  rw [evalU1_apply, bL_coe]; show D1E u1 = 0
  ext <;> simp [D1E, u1, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_2  : evalU1 (bL 2)  = 0   := by
  rw [evalU1_apply, bL_coe]; show D2E u1 = 0
  ext <;> simp [D2E, u1, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_5  : evalU1 (bL 5)  = -e4O := by
  rw [evalU1_apply, bL_coe]; show D5E u1 = -e4O
  ext <;> simp [D5E, u1, e4O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_6  : evalU1 (bL 6)  = e3O := by
  rw [evalU1_apply, bL_coe]; show D6E u1 = e3O
  ext <;> simp [D6E, u1, e3O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_8  : evalU1 (bL 8)  = e7O := by
  rw [evalU1_apply, bL_coe]; show D8E u1 = e7O
  ext <;> simp [D8E, u1, e7O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_9  : evalU1 (bL 9)  = e4O := by
  rw [evalU1_apply, bL_coe]; show D9E u1 = e4O
  ext <;> simp [D9E, u1, e4O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_10 : evalU1 (bL 10) = -e5O := by
  rw [evalU1_apply, bL_coe]; show D10E u1 = -e5O
  ext <;> simp [D10E, u1, e5O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_11 : evalU1 (bL 11) = -e2O := by
  rw [evalU1_apply, bL_coe]; show D11E u1 = -e2O
  ext <;> simp [D11E, u1, e2O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_12 : evalU1 (bL 12) = e3O := by
  rw [evalU1_apply, bL_coe]; show D12E u1 = e3O
  ext <;> simp [D12E, u1, e3O, c0, c1, c2, c3, c4, c5, c6, c7]
set_option linter.unusedSimpArgs false in
theorem img_13 : evalU1 (bL 13) = 0   := by
  rw [evalU1_apply, bL_coe]; show D13E u1 = 0
  ext <;> simp [D13E, u1, c0, c1, c2, c3, c4, c5, c6, c7]

-- TEST C: the FULL range = span equality.
theorem range_evalU1_eq :
    LinearMap.range evalU1 = Submodule.span ℚ (Set.range imgUnit) := by
  have hU2 : e2O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨0, rfl⟩
  have hU3 : e3O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨1, rfl⟩
  have hU4 : e4O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨2, rfl⟩
  have hU5 : e5O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨3, rfl⟩
  have hU6 : e6O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨4, rfl⟩
  have hU7 : e7O ∈ Submodule.span ℚ (Set.range imgUnit) := Submodule.subset_span ⟨5, rfl⟩
  apply le_antisymm
  · rw [LinearMap.range_eq_map, ← bL_span_top, Submodule.map_span]
    apply Submodule.span_le.mpr
    rw [Set.image_subset_iff, Set.range_subset_iff]
    intro i
    rw [Set.mem_preimage, SetLike.mem_coe]
    fin_cases i
    · show evalU1 (bL 0) ∈ _; rw [img_0]; exact Submodule.zero_mem _
    · show evalU1 (bL 1) ∈ _; rw [img_1]; exact Submodule.zero_mem _
    · show evalU1 (bL 2) ∈ _; rw [img_2]; exact Submodule.zero_mem _
    · show evalU1 (bL 3) ∈ _; rw [img_3]; exact hU6
    · show evalU1 (bL 4) ∈ _; rw [img_4]; exact Submodule.neg_mem _ hU5
    · show evalU1 (bL 5) ∈ _; rw [img_5]; exact Submodule.neg_mem _ hU4
    · show evalU1 (bL 6) ∈ _; rw [img_6]; exact hU3
    · show evalU1 (bL 7) ∈ _; rw [img_7]; exact hU2
    · show evalU1 (bL 8) ∈ _; rw [img_8]; exact hU7
    · show evalU1 (bL 9) ∈ _; rw [img_9]; exact hU4
    · show evalU1 (bL 10) ∈ _; rw [img_10]; exact Submodule.neg_mem _ hU5
    · show evalU1 (bL 11) ∈ _; rw [img_11]; exact Submodule.neg_mem _ hU2
    · show evalU1 (bL 12) ∈ _; rw [img_12]; exact hU3
    · show evalU1 (bL 13) ∈ _; rw [img_13]; exact Submodule.zero_mem _
  · rw [Submodule.span_le, Set.range_subset_iff]
    intro j
    rw [SetLike.mem_coe]
    fin_cases j
    · show e2O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 7, img_7⟩
    · show e3O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 6, img_6⟩
    · show e4O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 9, img_9⟩
    · show e5O ∈ _
      refine LinearMap.mem_range.mpr ⟨-(bL 4), ?_⟩
      rw [map_neg, img_4, neg_neg]
    · show e6O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 3, img_3⟩
    · show e7O ∈ _; exact LinearMap.mem_range.mpr ⟨bL 8, img_8⟩

theorem imgUnit_indep : LinearIndependent ℚ imgUnit := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero, imgUnit] at hg
  have h2 := congrArg c2 hg
  have h3 := congrArg c3 hg
  have h4 := congrArg c4 hg
  have h5 := congrArg c5 hg
  have h6 := congrArg c6 hg
  have h7 := congrArg c7 hg
  simp only [e2O, e3O, e4O, e5O, e6O, e7O, c2, c3, c4, c5, c6, c7,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h2 h3 h4 h5 h6 h7
  intro i
  fin_cases i
  · simpa using h2
  · simpa using h3
  · simpa using h4
  · simpa using h5
  · simpa using h6
  · simpa using h7

theorem finrank_range_evalU1 : Module.finrank ℚ (LinearMap.range evalU1) = 6 := by
  rw [range_evalU1_eq, finrank_span_eq_card imgUnit_indep]
  rfl

end N42bProbe2
