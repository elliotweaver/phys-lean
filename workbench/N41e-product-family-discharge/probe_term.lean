import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- Abstract bound lemma: if w = signed sum of products u_i * v_j (from a list), then
-- |w| ≤ (∑|u_i|)(∑|v_j|).  Build a reusable "termwise" abs bound.
-- Cleanest: prove gridSum is an absolute value style: |∑ ± u_i v_j| ≤ ∑_{ij} |u_i||v_j| = (∑|u_i|)(∑|v_j|).
-- Test the GRID identity (∑|u_i|)(∑|v_j|) = ∑_{i,j}|u_i||v_j| and a single termwise drop via positivity.

-- The key tactic test: |a*A| ≤ (∑8 |u|)(∑8 |v|) when a∈{u_i}, A∈{v_j}.
example (u v : O Cut) :
    |u.re.re.re * v.re.re.re| ≤ (∑ i, |coordOCut u i|) * (∑ j, |coordOCut v j|) := by
  rw [Fin.sum_univ_eight, Fin.sum_univ_eight]
  simp only [coordOCut, LinearEquiv.coe_mk, LinearMap.coe_mk, AddHom.coe_mk,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val,
    Matrix.cons_val_fin_one, e0, e1, e2, e3, e4, e5, e6, e7]
  rw [abs_mul]
  have hu : |u.re.re.re| ≤ |u.re.re.re| + |u.re.re.im| + |u.re.im.re| + |u.re.im.im| +
    |u.im.re.re| + |u.im.re.im| + |u.im.im.re| + |u.im.im.im| := by
    nlinarith [abs_nonneg u.re.re.im, abs_nonneg u.re.im.re, abs_nonneg u.re.im.im,
      abs_nonneg u.im.re.re, abs_nonneg u.im.re.im, abs_nonneg u.im.im.re, abs_nonneg u.im.im.im]
  have hv : |v.re.re.re| ≤ |v.re.re.re| + |v.re.re.im| + |v.re.im.re| + |v.re.im.im| +
    |v.im.re.re| + |v.im.re.im| + |v.im.im.re| + |v.im.im.im| := by
    nlinarith [abs_nonneg v.re.re.im, abs_nonneg v.re.im.re, abs_nonneg v.re.im.im,
      abs_nonneg v.im.re.re, abs_nonneg v.im.re.im, abs_nonneg v.im.im.re, abs_nonneg v.im.im.im]
  exact mul_le_mul hu hv (abs_nonneg _) (by positivity)

end
end Phys.Algebra
