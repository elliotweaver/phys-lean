import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- The full-grid majorant.
def gridSum (u : O Cut) : Cut := ∑ i, |coordOCut u i|

-- KEY: |coordOCut (u*v) m| ≤ gridSum u * gridSum v, proved by triangle ineq + termwise bound.
-- Strategy: reduce m, then the goal is |signed sum of products| ≤ (∑|u_i|)(∑|v_j|).
-- ∑|u_i| * ∑|v_j| = ∑_{i,j} |u_i||v_j| ≥ each individual |u_i||v_j| ≥ |any term|, and there are
-- 8 terms each appearing once → use that the RHS ≥ sum of the 8 specific |u_i||v_j| present.
-- Cleanest: bound |LHS| ≤ ∑_8 |u_i||v_j| (triangle) and ∑_8 |u_i||v_j| ≤ full grid (nonneg drop).

set_option linter.unusedSimpArgs false in
example (u v : O Cut) :
    |coordOCut (u * v) 0| ≤ gridSum u * gridSum v := by
  unfold gridSum
  rw [Fin.sum_univ_eight, Fin.sum_univ_eight]
  simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero,
    e0,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  -- goal: |a*A - b*B + -(c*C - -d*D) + -(e*E - -f*F + -(g*(-G) - -h*(-H)))| ≤ (∑8)(∑8)
  -- Let me set abbreviations and try: bound by sum of abs of 8 products, then monotone.
  set Su := |u.re.re.re| + |u.re.re.im| + |u.re.im.re| + |u.re.im.im| + |u.im.re.re| +
    |u.im.re.im| + |u.im.im.re| + |u.im.im.im| with hSu
  set Sv := |v.re.re.re| + |v.re.re.im| + |v.re.im.re| + |v.re.im.im| + |v.im.re.re| +
    |v.im.re.im| + |v.im.im.re| + |v.im.im.im| with hSv
  trace_state
  sorry

end
end Phys.Algebra
