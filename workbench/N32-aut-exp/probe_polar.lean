/-
  N32 W9 PROBE 5 — lock gForm_polar (Born form = inner product in the orthonormal frame)
  and the column-unit / entry-bound route.
-/
import Phys.Algebra.DerivationAutGroup

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
open scoped BigOperators
noncomputable section

-- Is gForm linear in each argument? Probe additive/smul in second arg.
example (v w1 w2 : O ℚ) : gForm v (w1 + w2) = gForm v w1 + gForm v w2 := by
  unfold gForm; rw [star_add, mul_add, reQ_add]

example (v w : O ℚ) (c : ℚ) : gForm v (c • w) = c * gForm v w := by
  unfold gForm
  rw [show star (c • w) = c • star w by rw [star_smul]; rfl, qsmul_mul_right, reQ_smul]

-- basis expansion: w = ∑ j, coordO w j • bO j  (Basis.sum_repr via ofEquivFun)
#check @Module.Basis.sum_repr
example (w : O ℚ) : ∑ j : Fin 8, coordO w j • bO j = w := by
  have := Module.Basis.sum_repr bO w
  simpa [bO, Module.Basis.ofEquivFun_repr_apply] using this

end
end Phys.Algebra
