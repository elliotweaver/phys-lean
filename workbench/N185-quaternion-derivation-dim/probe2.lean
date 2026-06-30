import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem H_qsmul_mul_left (c : ℚ) (x y : H ℚ) : (c • x) * y = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring
theorem H_qsmul_mul_right (c : ℚ) (x y : H ℚ) : x * (c • y) = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

def adQ (q : H ℚ) : Module.End ℚ (H ℚ) where
  toFun x := q * x - x * q
  map_add' x y := by simp [mul_add, add_mul]; abel
  map_smul' c x := by simp only [RingHom.id_apply, H_qsmul_mul_right, H_qsmul_mul_left, smul_sub]

@[simp] theorem adQ_apply (q x : H ℚ) : adQ q x = q * x - x * q := rfl

-- CENTRE: q commutes with hI ⟹ q.im = 0; then commutes with hJ ⟹ q.re.im = 0.
-- hI = (J,0), hJ = (0,1). Let me see the coordinate form of the commutators.

example (q : H ℚ) : (q * hI - hI * q) = ⟨0, 0⟩ ∨ True := by
  right; trivial

-- Test: commuting-with-hI coordinate. q*hI - hI*q, extract .im (a Dbl ℚ).
example (q : H ℚ) (h : q * hI = hI * q) : q.im = 0 := by
  have := congrArg CD.im h
  simp only [hI, CD.mul_im, CD.iota, CD.mul_re, Dbl.star_J] at this
  -- this : q.im * (-J) + ... = ...  (need to see)
  sorry

end Phys.Algebra
