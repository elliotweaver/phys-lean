import Phys.Algebra.SpinorCover
import Phys.Algebra.LorentzIsometry
import Phys.Algebra.DerivationStabilizer
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN47

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def rotMat (u : O ℚ) : Matrix (Fin 2) (Fin 2) (O ℚ) :=
  !![ u, 0 ;
      0, (1 : O ℚ) ]

theorem star_u1 : star u1 = -u1 := rfl

theorem gForm_u1 : gForm u1 u1 = 1 := by
  have : u1 * star u1 = 1 := by rw [star_u1, mul_neg, complexUnit_sq, neg_neg]
  show reQ (u1 * star u1) = 1
  rw [this]; rfl

theorem rotMat_u1_ne_one : rotMat u1 ≠ (1 : Matrix (Fin 2) (Fin 2) (O ℚ)) := by
  intro hc
  have h00 := congrFun (congrFun hc 0) 0
  simp only [rotMat, Matrix.one_apply_eq, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.of_apply] at h00
  have := congrArg (fun z => z.re.re.im) h00
  simp only [u1] at this
  norm_num at this

end

end Phys.Algebra.ProbeN47
