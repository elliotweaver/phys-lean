/- PROBE 109: ACTUALLY CLOSE pc1(Dg)(Xz)(Xz) entry (2,2) via transport + smul-lifted
   asw_star/ka. Diagonal = Σ_k d_k•(assoc + star assoc) per FINDINGS. After transport the
   goal is Σ d_k•(3-monomials). Build the close: rewrite each monomial pair to associators.
   STRATEGY: the goal is ℚ-linear in monomials; if we can show each distinct monomial-combo
   per d_k is 0 via alt laws, module finishes. Try: linear_combination of smul•(alt instance).
   KILL via measure. -/
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe109
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod

local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

local macro "transport" : tactic =>
  `(tactic|
    (simp only [Matrix.add_apply, Matrix.sub_apply]
     dgsimp
     simp only [add_mul, mul_add, sub_eq_add_neg, neg_mul, mul_neg, neg_neg]
     simp only [tr_l, tr_r, tr_sl, tr_sr, smul_smul, smul_add, smul_neg, neg_smul]))

-- The diagonal (2,2). Try to close by `module` treating products as atoms but with the
-- alt laws (product form, equalities) supplied as simp rewrites BEFORE transport-smul so
-- the smul-monomials match. Actually: rewrite associativity-pattern via mul_swap at the
-- octonion level (BEFORE transport) won't help since smul wraps. Instead, AFTER transport,
-- the goal is Σ c_i • M_i = 0 with c_i ∈ {d0,d1,d2}. Group: for it to be module-closable,
-- we need Σ_{i: c_i=d_k} M_i = 0 as octonion identities. Provide those.
-- Test the raw `module` first to see residual (it canonicalizes smul, leaves octonion eqs).
set_option maxHeartbeats 4000000 in
theorem pc1_22 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 2 2 = 0 := by
  unfold polarCross1
  transport
  -- collect the d_k coefficients: rewrite using add_smul backwards won't directly group.
  -- Try: `module` then see what octonion subgoals remain.
  first
  | module
  | (trace_state; sorry)

end Probe109
