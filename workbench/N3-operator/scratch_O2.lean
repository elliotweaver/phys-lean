import Phys.Cascade.ForcedStop
import Mathlib.Tactic
import Mathlib.Algebra.Group.Hom.End

open Phys.Cascade
open Phys.Cascade.CD

namespace Phys.Cascade.ScratchO2

attribute [local instance] CD.narCD CD.srCD

-- candidate orthogonal imaginary units in O ℚ
noncomputable def u : O ℚ := (CD.e2 : O ℚ)
noncomputable def v : O ℚ := CD.iota (CD.e2 : H ℚ)

-- both imaginary
theorem star_u : star u = -u := by ext <;> simp [u, CD.e2]
theorem star_v : star v = -v := by ext <;> simp [v, CD.iota, CD.e2]

-- bilin u v = ? want 0 for anticommutation
theorem bilin_uv : CD.bilin u v = (0 : H ℚ) := by
  simp only [CD.bilin, u, v]
  ext <;> simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im']

-- Nrm u = 1
theorem Nrm_u : CD.Nrm u = (1 : H ℚ) := by
  rw [CD.Nrm_def]; simp [u, CD.e2]

-- one_mul on O ℚ via narCD
example (y : O ℚ) : (1 : O ℚ) * y = y := one_mul y

-- Lop 1 = 1 ?
example : True := trivial

#check @AddMonoid.End.one_apply

end Phys.Cascade.ScratchO2
