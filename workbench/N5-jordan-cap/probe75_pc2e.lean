/- PROBE (run 75, W9 MEASURE): pc2 entry (0,0), ocR OPAQUE. Dg diagonal (off-diag->0),
   diagonal -> ocR d_k. Deg-2 cancels by centrality(ocR_comm)+nuclearity(ocR_assoc) ALONE.
   Targeted ocR rewrites + abel. KILL bounded. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe75PC2e
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply,
    Fin.sum_univ_three, Matrix.diagonal_apply_eq, Matrix.diagonal_apply_ne,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero,
    show (0:Fin 3) ≠ 1 by decide, show (0:Fin 3) ≠ 2 by decide,
    show (1:Fin 3) ≠ 0 by decide, show (1:Fin 3) ≠ 2 by decide,
    show (2:Fin 3) ≠ 0 by decide, show (2:Fin 3) ≠ 1 by decide])

set_option maxHeartbeats 2000000 in
set_option maxRecDepth 100000 in
theorem pc2_00 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross2 jb Dg Xz
  entrysimp
  simp only [ocR_assocL, ocR_assocM, ocR_assocR, ocR_comm, mul_add, add_mul,
    mul_zero, zero_mul, add_zero, zero_add]
  abel

end Probe75PC2e
