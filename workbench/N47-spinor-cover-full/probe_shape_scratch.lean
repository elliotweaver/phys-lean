import Phys.Algebra.SpinorCover
import Phys.Algebra.LorentzIsometry
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN47

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def rotMat (u : O ℚ) : Matrix (Fin 2) (Fin 2) (O ℚ) :=
  !![ u, 0 ;
      0, (1 : O ℚ) ]

theorem act_herm2_rot (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    actBy (rotMat u) (herm2 t x v) = herm2 t x (u * v) := by
  have husu : u * star u = 1 := by rw [selfMul_eq_smul, hu, one_smul]
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;>
    simp [actBy, rotMat, herm2, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.conjTranspose_apply, qsmul_mul_left,
      StarMul.star_mul, husu]

/-- The rotated coordinates carry the SAME Qform (Born composition, gForm u u = 1). -/
theorem rot_Qform (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    Qform t x (u * v) = Qform t x v := by
  unfold Qform
  rw [gForm_comp, hu, one_mul]

/-- Result stays Hermitian. -/
theorem act_isHermitian_rot (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    (actBy (rotMat u) (herm2 t x v))ᴴ = actBy (rotMat u) (herm2 t x v) := by
  rw [act_herm2_rot u hu t x v]; exact herm2_isHermitian _ _ _

/-- THE HEADLINE: determinant preservation for the rotation generator. -/
theorem mdet_act_rot (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v := by
  rw [act_herm2_rot u hu t x v, mdet_herm2, herm2_det_eq, rot_Qform u hu t x v]

theorem mdet_act_rot_eq_herm2_det (u : O ℚ) (hu : gForm u u = 1) (t x : ℚ) (v : O ℚ) :
    mdet (actBy (rotMat u) (herm2 t x v)) = herm2_det t x v := by
  rw [mdet_act_rot u hu t x v, ← herm2_det_eq]

/-! Non-trivial witness: u1 is a Born unit and rotMat u1 ≠ 1, AND it genuinely rotates v. -/

-- check u1 is a Born unit (gForm u1 u1 = 1)?
example : gForm u1 u1 = 1 := by
  show reQ (u1 * star u1) = 1
  decide

-- rotMat u1 ≠ 1
example : rotMat u1 ≠ (1 : Matrix (Fin 2) (Fin 2) (O ℚ)) := by
  intro hc
  have h00 := congrFun (congrFun hc 0) 0
  simp only [rotMat, Matrix.one_apply_eq, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.of_apply] at h00
  -- h00 : u1 = 1 ; contradiction via reQ or im component
  have := congrArg (fun z => z.im.re.re) h00
  simp [u1] at this

end

end Phys.Algebra.ProbeN47
