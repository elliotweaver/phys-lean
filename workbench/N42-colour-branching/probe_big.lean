import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative
import Phys.Algebra.DerivationRep7

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cBig
noncomputable section

-- The complex structure J = L_{u1}.
def JO : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := u1 * x
  map_add' x y := CD.mul_add_na u1 x y
  map_smul' c x := by show u1 * (c • x) = c • (u1 * x); ext <;> simp [u1] <;> ring

@[simp] theorem JO_apply (x : O ℚ) : JO x = u1 * x := rfl

theorem JO_sq : JO.comp JO = -LinearMap.id := by
  refine LinearMap.ext (fun x => ?_)
  show u1 * (u1 * x) = -x
  rw [mul_mul_left, complexUnit_sq, neg_one_mul]

-- The 7-element family ![u1, e2,e3,e4,e5,e6,e7] spanning ImO.
def imBasis : Fin 7 → O ℚ := ![u1, e2O, e3O, e4O, e5O, e6O, e7O]

set_option linter.unusedSimpArgs false in
theorem imBasis_indep : LinearIndependent ℚ imBasis := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero, imBasis] at hg
  have h1 := congrArg c1 hg
  have h2 := congrArg c2 hg
  have h3 := congrArg c3 hg
  have h4 := congrArg c4 hg
  have h5 := congrArg c5 hg
  have h6 := congrArg c6 hg
  have h7 := congrArg c7 hg
  simp only [u1, e2O, e3O, e4O, e5O, e6O, e7O, c1, c2, c3, c4, c5, c6, c7,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h1 h2 h3 h4 h5 h6 h7
  intro i
  fin_cases i
  · simpa using h1
  · simpa using h2
  · simpa using h3
  · simpa using h4
  · simpa using h5
  · simpa using h6
  · simpa using h7

-- each imBasis i ∈ ImO
theorem imBasis_mem_ImO (i : Fin 7) : imBasis i ∈ ImO := by
  fin_cases i
  · exact u1_mem_ImO
  all_goals {
    rw [mem_ImO]
    first
    | (show star e2O = -e2O; ext <;> simp [e2O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im'])
    | (show star e3O = -e3O; ext <;> simp [e3O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im'])
    | (show star e4O = -e4O; ext <;> simp [e4O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im'])
    | (show star e5O = -e5O; ext <;> simp [e5O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im'])
    | (show star e6O = -e6O; ext <;> simp [e6O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im'])
    | (show star e7O = -e7O; ext <;> simp [e7O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']) }

end
end N42cBig
