/- PROBE (run 69, W9.7 MEASURE): can block-1 entry (0,1) close keeping ocR OPAQUE?
   (0,1) has EMPTY L1 (Dg-deg dist {0:12}) — pure centrality, the cheapest entry.
   Test whether pushing ocR to canonical form + abel + banked octonion content closes it.
   KILL via /tmp/measure_probe.sh 80s. -/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Probe69Close01
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

-- ATTEMPT: push ocR products to canonical form (ocR central) then abel-cancel the
-- ocR-degree-2 terms, leaving the pure-octonion residue. See what remains.
set_option maxHeartbeats 800000 in
theorem b01_close (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Xz p 0 0)) 0 1 = 0 := by
  unfold jdef jb Hm Xz
  entrysimp
  simp only [ocR_assocL, ocR_assocM, ocR_assocR, ocR_comm]
  extract_goal
  sorry

end Probe69Close01
