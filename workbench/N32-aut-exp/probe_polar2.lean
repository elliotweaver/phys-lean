/-
  N32 W9 PROBE 6 — lock gForm_polar (full expansion) + aut_col_unit + entry_bound end-to-end.
-/
import Phys.Algebra.DerivationAutGroup

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
open scoped BigOperators
noncomputable section

-- gForm additive/smul in 2nd arg (banked-route helpers)
theorem gForm_add_right (v w1 w2 : O ℚ) : gForm v (w1 + w2) = gForm v w1 + gForm v w2 := by
  unfold gForm; rw [star_add, mul_add, reQ_add]
theorem gForm_smul_right (v w : O ℚ) (c : ℚ) : gForm v (c • w) = c * gForm v w := by
  unfold gForm
  rw [show star (c • w) = c • star w by rw [star_smul]; rfl, qsmul_mul_right, reQ_smul]
theorem gForm_add_left (v1 v2 w : O ℚ) : gForm (v1 + v2) w = gForm v1 w + gForm v2 w := by
  rw [gForm_symm, gForm_add_right, gForm_symm v1 w, gForm_symm v2 w]
theorem gForm_smul_left (v w : O ℚ) (c : ℚ) : gForm (c • v) w = c * gForm v w := by
  rw [gForm_symm, gForm_smul_right, gForm_symm w v]

theorem basis_expand (w : O ℚ) : ∑ j : Fin 8, coordO w j • bO j = w := by
  have := Module.Basis.sum_repr bO w
  simpa [bO, Module.Basis.ofEquivFun_repr_apply] using this

-- THE POLARIZATION: gForm v w = ∑ i, coordO v i * coordO w i
theorem gForm_polar (v w : O ℚ) :
    gForm v w = ∑ i : Fin 8, coordO v i * coordO w i := by
  conv_lhs => rw [← basis_expand v, ← basis_expand w]
  rw [Finset.sum_comm' (s := Finset.univ) (t := fun _ => Finset.univ)]
  sorry  -- probe: just want to see if the bilinear expansion shape is tractable

end
end Phys.Algebra
