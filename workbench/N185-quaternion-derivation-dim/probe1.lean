import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- PROBE 1: ℚ-scalar/product compatibility on H ℚ (the H analog of qsmul_mul_left/right).
theorem H_qsmul_mul_left (c : ℚ) (x y : H ℚ) : (c • x) * y = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

theorem H_qsmul_mul_right (c : ℚ) (x y : H ℚ) : x * (c • y) = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

-- PROBE 2: ad_q as a ℚ-linear endomorphism of H ℚ.
def adQ (q : H ℚ) : Module.End ℚ (H ℚ) where
  toFun x := q * x - x * q
  map_add' x y := by simp [mul_add, add_mul]; abel
  map_smul' c x := by
    simp only [RingHom.id_apply, H_qsmul_mul_right, H_qsmul_mul_left, smul_sub]

@[simp] theorem adQ_apply (q x : H ℚ) : adQ q x = q * x - x * q := rfl

-- PROBE 3: adQ is ℚ-linear in q (so the inner-derivation MAP is a linear map).
def adL : H ℚ →ₗ[ℚ] Module.End ℚ (H ℚ) where
  toFun := adQ
  map_add' p q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, LinearMap.add_apply, add_mul, mul_add]; abel
  map_smul' c q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, RingHom.id_apply, LinearMap.smul_apply,
      H_qsmul_mul_left, H_qsmul_mul_right, smul_sub]

-- PROBE 4: the kernel of adL is the centre. q ∈ ker ↔ q commutes with everything.
-- Test: does the centre computation close? q central → q ∈ span{1}.
-- First: q commutes with hI and hJ forces q = scalar • 1.
example (q : H ℚ) (hi : q * hI = hI * q) (hj : q * hJ = hJ * q) :
    q.im = 0 ∧ q.re.im = 0 := by
  -- coordinate extraction
  constructor
  · sorry
  · sorry

end Phys.Algebra
