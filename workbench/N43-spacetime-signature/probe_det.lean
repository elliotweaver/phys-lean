import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank
import Phys.Cascade.ForcedStop
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace N43probe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def herm2 (t x : ℚ) (v : O ℚ) : Matrix (Fin 2) (Fin 2) (O ℚ) :=
  !![((t + x) • (1 : O ℚ)), v;
     star v, ((t - x) • (1 : O ℚ))]

def herm2_det (t x : ℚ) (v : O ℚ) : ℚ :=
  reQ ((herm2 t x v) 0 0 * (herm2 t x v) 1 1 - (herm2 t x v) 0 1 * (herm2 t x v) 1 0)

-- PROBE 1: Hermiticity (refine Matrix.ext stops at entry level).
theorem herm2_isHermitian (t x : ℚ) (v : O ℚ) :
    (herm2 t x v)ᴴ = herm2 t x v := by
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;>
    simp [herm2, Matrix.conjTranspose_apply, star_smul]

-- PROBE 2 (THE FORCED CONTENT): det reduces to the Born quadratic form.
theorem herm2_det_eq (t x : ℚ) (v : O ℚ) :
    herm2_det t x v = t^2 - x^2 - gForm v v := by
  unfold herm2_det herm2
  simp only [Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_fin_one, Matrix.empty_val', Matrix.head_fin_const, Matrix.of_apply,
    Matrix.cons_val]
  have h1 : (t + x) • (1 : O ℚ) * (t - x) • (1 : O ℚ) = ((t + x) * (t - x)) • (1 : O ℚ) := by
    rw [qsmul_mul_left, qsmul_mul_right, one_mul, smul_smul]
  have hsmul1 : ∀ q : ℚ, reQ (q • (1 : O ℚ)) = q := by
    intro q
    simp only [reQ, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]
    show q • (1 : ℚ) = q
    rw [smul_eq_mul, mul_one]
  rw [sub_eq_add_neg, reQ_add, reQ_neg, h1, hsmul1]
  unfold gForm
  ring

end

end N43probe
