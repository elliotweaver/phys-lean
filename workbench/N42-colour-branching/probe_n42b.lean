import Phys.Algebra.DerivationStabilizer
import Phys.Algebra.DerivationPerfect
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

namespace N42bProbe

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- The 6 imaginary units orthogonal to the ⟨1,u1⟩ plane (e2..e7), explicit octonions.
def e2O : O ℚ := ⟨⟨⟨0,0⟩, ⟨1,0⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e3O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,1⟩⟩, ⟨⟨0,0⟩, ⟨0,0⟩⟩⟩
def e4O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨1,0⟩, ⟨0,0⟩⟩⟩
def e5O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,1⟩, ⟨0,0⟩⟩⟩
def e6O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨1,0⟩⟩⟩
def e7O : O ℚ := ⟨⟨⟨0,0⟩, ⟨0,0⟩⟩, ⟨⟨0,0⟩, ⟨0,1⟩⟩⟩

def imgUnit : Fin 6 → O ℚ := ![e2O, e3O, e4O, e5O, e6O, e7O]

-- MEASURE 1: one image computation (confirm the simp set + the value).
example : evalU1 (bL 7) = e2O := by
  rw [evalU1_apply, bL_coe]
  show D7E u1 = e2O
  ext <;> simp [D7E, u1, e2O, c0, c1, c2, c3, c4, c5, c6, c7]

example : evalU1 (bL 3) = e6O := by
  rw [evalU1_apply, bL_coe]
  show D3E u1 = e6O
  ext <;> simp [D3E, u1, e6O, c0, c1, c2, c3, c4, c5, c6, c7]

example : evalU1 (bL 0) = 0 := by
  rw [evalU1_apply, bL_coe]
  show D0E u1 = 0
  ext <;> simp [D0E, u1, c0, c1, c2, c3, c4, c5, c6, c7]

-- MEASURE 2: independence of the 6 units (coordinate read-off pattern).
example : LinearIndependent ℚ imgUnit := by
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

-- MEASURE 3: the range = span(images of bL) plumbing.
example : LinearMap.range evalU1 = Submodule.span ℚ (Set.range (evalU1 ∘ bL)) := by
  rw [LinearMap.range_eq_map, ← bL_span_top, Submodule.map_span, Set.range_comp]

end N42bProbe
