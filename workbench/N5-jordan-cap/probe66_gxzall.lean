/- PROBE (run 66, W9.2): MEASURE the full G_Xz off-diagonal burden as ONE lemma.
   ∀ i j, i ≠ j → Gmat (Xz a b c) i j = 0. 9 fin_cases (3 killed by hyp, 6 octonion-coord).
   Each off-diag entry ~11s measured ⇒ expect ~66s. KILL 170s. Decides split vs single. -/
import Phys.Algebra.HermitianJordan.Reduction
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe66GXZall
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD
variable {B : Type*} [CommRing B] [StarRing B]

noncomputable def Gmat (A : Matrix (Fin 3) (Fin 3) (CD (CD B))) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  A * (jb A A) - (jb A A) * A

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])
local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

set_option maxHeartbeats 1600000 in
theorem gxz_offdiag (a b c : CD (CD B)) :
    ∀ i j, i ≠ j → Gmat (Xz a b c) i j = 0 := by
  intro i j hij
  unfold Gmat jb Xz
  fin_cases i <;> fin_cases j <;>
    first
    | (exact absurd rfl hij)
    | (entrysimp; ext <;> cdsimp0 <;> ring)

end Probe66GXZall
