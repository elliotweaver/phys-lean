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

def adL : H ℚ →ₗ[ℚ] Module.End ℚ (H ℚ) where
  toFun := adQ
  map_add' p q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, LinearMap.add_apply, add_mul, mul_add]; abel
  map_smul' c q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, RingHom.id_apply, LinearMap.smul_apply,
      H_qsmul_mul_left, H_qsmul_mul_right, smul_sub]

@[simp] theorem adL_apply (q x : H ℚ) : adL q x = q * x - x * q := rfl

-- The scalar embedding ℚ → H ℚ.
def oneEmb : ℚ →ₗ[ℚ] H ℚ where
  toFun c := c • (1 : H ℚ)
  map_add' a b := by rw [add_smul]
  map_smul' a b := by simp [mul_smul]

@[simp] theorem oneEmb_apply (c : ℚ) : oneEmb c = c • (1 : H ℚ) := rfl

theorem oneEmb_injective : Function.Injective oneEmb := by
  intro a b h
  simp only [oneEmb_apply] at h
  have := congrArg (fun z : H ℚ => z.re.re) h
  simpa [cd_qsmul_re] using this

-- coordinate centre lemmas (from probe7/9)
theorem centre_im (q : H ℚ) (h : q * hI = hI * q) : q.im = 0 := by
  have him := congrArg CD.im h
  simp only [hI, CD.iota, CD.mul_im, Dbl.star_J, zero_mul, zero_add, add_zero] at him
  have key : q.im * (Dbl.J : Dbl ℚ) + q.im * Dbl.J = 0 := by
    rw [mul_neg] at him; linear_combination -him
  have hqJ : q.im * (Dbl.J : Dbl ℚ) = 0 := by
    have h2 : (2:ℚ) • (q.im * (Dbl.J : Dbl ℚ)) = 0 := by rw [two_smul]; exact key
    rcases smul_eq_zero.mp h2 with hc | hc
    · norm_num at hc
    · exact hc
  have hJunit : (Dbl.J : Dbl ℚ) * (-Dbl.J) = 1 := by rw [mul_neg, Dbl.J_mul_J, neg_neg]
  calc q.im = q.im * ((Dbl.J : Dbl ℚ) * (-Dbl.J)) := by rw [hJunit, mul_one]
    _ = (q.im * Dbl.J) * (-Dbl.J) := by rw [mul_assoc]
    _ = 0 := by rw [hqJ, zero_mul]

theorem centre_reim (q : H ℚ) (hq : q.im = 0) (h : q * hJ = hJ * q) : q.re.im = 0 := by
  have him := congrArg CD.im h
  simp only [hJ, CD.e2, CD.mul_re, CD.mul_im, hq, zero_mul, mul_zero, zero_add, add_zero, neg_zero] at him
  have hir := congrArg Dbl.im him
  simp only [Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.one_re, Dbl.one_im,
    mul_one, mul_neg] at hir
  -- hir : 1*q.re.im + 0*q.re.re = -(1*q.re.im) + 0*q.re.re
  linarith [hir]

-- THE CENTRE = range oneEmb. q ∈ ker adL ↔ q commutes with everything ↔ q = (q.re.re)•1.
theorem ker_adL_eq : LinearMap.ker adL = LinearMap.range oneEmb := by
  ext q
  simp only [LinearMap.mem_ker, LinearMap.mem_range]
  constructor
  · intro h
    -- adL q = 0 means q commutes with all x; in particular hI, hJ.
    have hcomm : ∀ x : H ℚ, q * x = x * q := by
      intro x
      have := congrArg (fun (f : Module.End ℚ (H ℚ)) => f x) h
      simp only [adL_apply, LinearMap.zero_apply, sub_eq_zero] at this
      exact this
    have hi := centre_im q (hcomm hI)
    have hj := centre_reim q hi (hcomm hJ)
    refine ⟨q.re.re, ?_⟩
    simp only [oneEmb_apply]
    ext
    · simp [cd_qsmul_re, Dbl.smul_re]
    · simp [cd_qsmul_re, Dbl.smul_im, hj]
    · simp [cd_qsmul_im, hi]
    · simp [cd_qsmul_im, hi]
  · rintro ⟨c, rfl⟩
    refine LinearMap.ext fun x => ?_
    simp only [adL_apply, oneEmb_apply, LinearMap.zero_apply]
    rw [H_qsmul_mul_left, one_mul, H_qsmul_mul_right, mul_one, sub_self]

end Phys.Algebra
