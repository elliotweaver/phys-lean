import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cSkel
noncomputable section

def JO : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := u1 * x
  map_add' x y := CD.mul_add_na u1 x y
  map_smul' c x := by show u1 * (c • x) = c • (u1 * x); ext <;> simp [u1] <;> ring

@[simp] theorem JO_apply (x : O ℚ) : JO x = u1 * x := rfl

theorem JO_sq : JO.comp JO = -LinearMap.id := by
  refine LinearMap.ext (fun x => ?_)
  show u1 * (u1 * x) = -x
  rw [mul_mul_left, complexUnit_sq, neg_one_mul]

-- U = span of the Fin 3 family {e2,e4,e6}, the "holomorphic" 3.
def uHol : Fin 3 → O ℚ := ![e2O, e4O, e6O]

set_option linter.unusedSimpArgs false in
theorem uHol_indep : LinearIndependent ℚ uHol := by
  rw [Fintype.linearIndependent_iff]
  intro g hg
  simp only [Fin.sum_univ_succ, Fin.sum_univ_zero, Matrix.cons_val_zero,
    Matrix.cons_val_succ, add_zero, uHol] at hg
  have h2 := congrArg c2 hg
  have h4 := congrArg c4 hg
  have h6 := congrArg c6 hg
  simp only [e2O, e4O, e6O, c2, c4, c6,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im,
    cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im] at h2 h4 h6
  intro i
  fin_cases i
  · simpa using h2
  · simpa using h4
  · simpa using h6

example : Module.finrank ℚ (Submodule.span ℚ (Set.range uHol)) = 3 := by
  rw [finrank_span_eq_card uHol_indep]; rfl

-- J(U) = span {e3,e5,e7}: J e2=e3, J e4=e5, J e6=e7.
example : JO e2O = e3O := by show u1 * e2O = e3O; ext <;> simp [u1, e2O, e3O]
example : JO e4O = e5O := by show u1 * e4O = e5O; ext <;> simp [u1, e4O, e5O]
example : JO e6O = e7O := by show u1 * e6O = e7O; ext <;> simp [u1, e6O, e7O]

end
end N42cSkel
