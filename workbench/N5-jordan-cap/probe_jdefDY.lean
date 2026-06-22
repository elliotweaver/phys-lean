/- PROBE (run 62, W9.2 — STRUCTURAL): the central-diagonal reduction with the diagonal kept
   ABSTRACT and CENTRAL (NOT ocR-expanded — that was the simp-step wall). Model the diagonal
   as a single central element via diagonal matrix of `ocR`-like centrals, but keep the
   octonion off-parts as the only expanded terms. Measure whether one ENTRY of
   jdef(D+X, Y) - jdef(X, Y) closes by `cdsimp0 <;> ring` after keeping D opaque.
   We use ocR but DON'T unfold it; instead rely on its centrality lemmas. Just MEASURE the
   goal shape + whether ring closes the (0,1) entry of claim (3) for a single building block. -/
import Phys.Algebra.HermitianJordan.Core
import Mathlib.Tactic

namespace ProbeRed
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

attribute [local instance] CD.narCD CD.srCD

-- Diagonal of central reals, kept as ocR (centrality via Helpers ocR_* lemmas).
noncomputable def Dm (d0 d1 d2 : ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ ocR d0, 0, 0; 0, ocR d1, 0; 0, 0, ocR d2]

set_option maxHeartbeats 1000000 in
-- claim (2b): jdef(D, Y) = 0 — central first arg, should be CENTRALITY-CLEAN (free model 0).
-- Test the matrix-level statement; measure if it closes structurally cheap.
example (d0 d1 d2 : ℚ) (p q r : O ℚ) : jdef (Dm d0 d1 d2) (Xz p q r) = 0 := by
  apply Matrix.ext; intro i j
  unfold jdef jb Dm Xz ocR
  fin_cases i <;> fin_cases j <;>
  simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero] <;>
  ext <;>
  simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero] <;>
  ring

end ProbeRed
