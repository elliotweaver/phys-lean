import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

section M
variable {A : Type*}
instance cdSmulQ [SMul ℚ A] : SMul ℚ (CD A) := ⟨fun q z => ⟨q • z.re, q • z.im⟩⟩
@[simp] theorem cd_qsmul_re [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).re = q • z.re := rfl
@[simp] theorem cd_qsmul_im [SMul ℚ A] (q : ℚ) (z : CD A) : (q • z).im = q • z.im := rfl
@[reducible] def cdModuleQ [NonAssocRing A] [StarRing A] [Module ℚ A] :
    @Module ℚ (CD A) _ (by letI := CD.narCD (A := A); infer_instance) := by
  letI := CD.narCD (A := A)
  exact { one_smul := by intro z; ext <;> simp
          mul_smul := by intro a b z; ext <;> simp [mul_smul]
          smul_zero := by intro a; ext <;> simp
          smul_add := by intro a x y; ext <;> simp [smul_add]
          add_smul := by intro a b z; ext <;> simp [add_smul]
          zero_smul := by intro z; ext <;> simp }
end M

@[reducible] def dblModuleQ : Module ℚ (Dbl ℚ) := by
  exact { one_smul := by intro z; ext <;> simp
          mul_smul := by intro a b z; ext <;> simp [mul_assoc]
          smul_zero := by intro a; ext <;> simp
          smul_add := by intro a x y; ext <;> simp [mul_add]
          add_smul := by intro a b z; ext <;> simp [add_mul]
          zero_smul := by intro z; ext <;> simp }
attribute [local instance] dblModuleQ cdModuleQ
noncomputable instance iMH : Module ℚ (H ℚ) := cdModuleQ (A := Dbl ℚ)
noncomputable instance iMO : Module ℚ (O ℚ) := cdModuleQ (A := H ℚ)

def reQ (x : O ℚ) : ℚ := x.re.re.re
theorem trace_id (x : O ℚ) : x + star x = (2 * reQ x) • (1 : O ℚ) := by
  ext <;> simp [reQ] <;> ring
theorem deriv_qsmul (D : Module.End ℤ (O ℚ)) (q : ℚ) (x : O ℚ) :
    D (q • x) = q • D x := map_rat_smul D q x
theorem deriv_star (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D (star x) = - D x := by
  have hstar : star x = (2 * reQ x) • (1 : O ℚ) - x := by
    have h := trace_id x; rw [eq_sub_iff_add_eq, add_comm]; exact h
  rw [hstar, map_sub, deriv_qsmul, deriv_one D hD, smul_zero, zero_sub]
theorem deriv_real_zero (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ)
    (hx : star x = x) : D x = 0 := by
  have h := deriv_star D hD x; rw [hx] at h
  have hsum : D x + D x = 0 := add_eq_zero_iff_eq_neg.mpr h
  have h2 : (2 : ℚ) • D x = 0 := by rw [two_smul]; exact hsum
  have h3 : ((1/2 : ℚ) * 2) • D x = (1/2 : ℚ) • ((2:ℚ) • D x) := by rw [mul_smul]
  rw [h2, smul_zero] at h3; simpa using h3

theorem deriv_norm_preserve (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x : O ℚ) :
    D x * star x = x * D x := by
  have hself : star (x * star x) = x * star x := by rw [star_mul, star_star]
  have hzero : D (x * star x) = 0 := deriv_real_zero D hD _ hself
  rw [hD x (star x), deriv_star D hD x, mul_neg] at hzero
  linear_combination (norm := abel) hzero

/-- ★ THE POLARIZED SKEW-ADJOINTNESS (`Der ⊆ so(Born)`). Polarizing
    `deriv_norm_preserve`: `D x · star y + D y · star x = x · D y + y · D x`. -/
theorem deriv_skew_polar (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x y : O ℚ) :
    D x * star y + D y * star x = x * D y + y * D x := by
  have hxy := deriv_norm_preserve D hD (x + y)
  have hx := deriv_norm_preserve D hD x
  have hy := deriv_norm_preserve D hD y
  simp only [map_add, star_add, mul_add, add_mul] at hxy
  -- hxy: (Dx+Dy)(star x+star y) = (x+y)(Dx+Dy) expanded
  linear_combination (norm := abel) hxy - hx - hy

end Phys.Algebra
