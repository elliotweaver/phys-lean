/- PROBE (run 52): production proof v2 — match + -() form, unify norms via nrm_symm. -/
import Phys.Algebra.JordanTower
import Phys.Algebra.HermitianJordan.CompCentral
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeProd2
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

theorem central_diag {R : Type*} [NonAssocRing R] (n a sp p sa : R)
    (hc : ∀ x : R, n * x = x * n)
    (hAM : ∀ x y : R, (x * n) * y = x * (n * y))
    (hAR : ∀ x y : R, (x * y) * n = x * (y * n)) :
    (a*sp + p*sa) * (n + n) + (n + n) * (a*sp + p*sa)
      + -(a * (sp*(n+n) + (n+n)*sp) + (p*(n+n) + (n+n)*p) * sa) = 0 := by
  have e2 : p * n * sa = p * sa * n := by rw [hAM p sa, hc sa, ← hAR p sa]
  simp only [mul_add, add_mul, hc]
  rw [← hAR a sp, e2]; abel

def Xz (a b c : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0, a, b; star a, 0, c; star b, star c, 0]

set_option maxHeartbeats 1000000 in
theorem jdef_single_pair (a p : CD (CD B)) : jdef (Xz a 0 0) (Xz p 0 0) = 0 := by
  apply Matrix.ext; intro i j
  unfold jdef jb Xz
  fin_cases i <;> fin_cases j <;>
  simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero]
  -- (0,0): unify star a * a → a * star a, then n = a*star a central
  · simp only [← nrm_symm a]
    exact central_diag (a * star a) a (star p) p (star a)
      (nrm_comm a) (nrm_assocM a) (nrm_assocR a)
  -- (1,1): unify star a * a → a * star a, then n = a*star a central
  · simp only [← nrm_symm a]
    exact central_diag (a * star a) (star a) p (star p) a
      (nrm_comm a) (nrm_assocM a) (nrm_assocR a)

end ProbeProd2
