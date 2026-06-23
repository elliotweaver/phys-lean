/- PROBE 105: close transported (2,2) by linear_combination (norm := module) of asw_star/ka
   instances, smul-coefficiented. First: does `module` alone reduce after we rewrite the
   associator monomials? Try: supply the assoc identities as hypotheses and abel/module. -/
import Phys.Algebra.HermitianJordan.PieceBdeg2
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe105
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

-- The diagonal (2,2): structurally Σ_k d_k • (2·[assoc] + 2·star[assoc]) by asw_star.
-- Each associator monomial pair: (x*y)*z vs x*(y*z). We need the assoc=... facts.
-- Try the most aggressive: convert all 3-products to a canonical form via assoc rewriting
-- under smul, then module. First test if `module` closes after using mul_assoc-style on
-- products that ARE associative? No -- O is non-assoc. So we MUST use asw_star/ka.

-- Approach: the (2,2) goal is Σ d_k • Σ_pairs ([u,v,w] + star[u,v,w]). Rewrite each
-- monomial m as half via asw via the matrix-level. Too complex per-hand here; instead
-- test the SMALLEST viable: does `module` reduce the goal to octonion identities by
-- treating each distinct monomial as an atom, leaving Σ d_k • (atom_combo) where the
-- atom_combo per d_k must be shown 0 separately?

set_option maxHeartbeats 4000000 in
theorem pc1_22_test (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 2 2 = 0 := by
  unfold polarCross1
  transport
  -- try: collect by d_k via module, then each octonion coefficient closes by alt laws.
  -- First just see if module makes progress treating monomials as atoms (it should
  -- collapse the d_k-linear structure). Expect: leaves octonion content.
  sorry

end Probe105
