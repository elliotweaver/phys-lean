import Phys.Algebra.DerivationDim
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

section ModuleProbe
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
end ModuleProbe

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
  have h := deriv_star D hD x
  rw [hx] at h
  have hsum : D x + D x = 0 := add_eq_zero_iff_eq_neg.mpr h
  have h2 : (2 : ℚ) • D x = 0 := by rw [two_smul]; exact hsum
  have h3 : ((1/2 : ℚ) * 2) • D x = (1/2 : ℚ) • ((2:ℚ) • D x) := by rw [mul_smul]
  rw [h2, smul_zero] at h3
  simpa using h3

/-- THE BORN BILINEAR FORM (deep-real of `x * star y`): the polarized self-overlap. -/
def bQ (x y : O ℚ) : ℚ := reQ (x * star y)

/-- The form is symmetric. -/
theorem bQ_symm (x y : O ℚ) : bQ x y = bQ y x := by
  simp only [bQ, reQ, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.neg_re, CD.neg_im]
  ring

/-- `bQ x x = Nrm-scalar`, and `bQ` is the polarization. Diagonal positive form. -/
theorem bQ_diag (x : O ℚ) : bQ x x = (x.re.re.re)^2 + (x.re.re.im)^2 + (x.re.im.re)^2
    + (x.re.im.im)^2 + (x.im.re.re)^2 + (x.im.re.im)^2 + (x.im.im.re)^2 + (x.im.im.im)^2 := by
  simp only [bQ, reQ, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im]
  ring

/-- ★ THE SKEW-ADJOINTNESS (`Der(O ℚ) ⊆ so(bQ) = so(7)`). For every derivation,
    `bQ (D x) y + bQ x (D y) = 0`: D is skew for the Born self-overlap form. This is
    the structural containment that, with the unit-killing + trace-free reductions,
    cuts the derivation algebra into so(7) (dim ≤ 21), the route to dim 14 = dim g₂. -/
theorem deriv_skew (D : Module.End ℤ (O ℚ)) (hD : IsDeriv D) (x y : O ℚ) :
    bQ (D x) y + bQ x (D y) = 0 := by
  -- bQ(Dx,y)+bQ(x,Dy) = reQ(Dx·star y) + reQ(x·star(Dy))
  -- = reQ(Dx·star y) + reQ(x·(-D(star y)))  [deriv_star: D(star y)=-Dy ⟹ star(Dy)... ]
  -- Use: D kills reQ(x·star y)+reQ(... ) via product rule on the self-conjugate combo.
  -- Direct route: consider f := x*star y + y*star x (self-conjugate), D f = 0.
  have hself : star (x * star y + y * star x) = x * star y + y * star x := by
    rw [star_add, star_mul, star_mul, star_star, star_star]; abel
  have hzero : D (x * star y + y * star x) = 0 :=
    deriv_real_zero D hD _ hself
  rw [map_add, hD x (star y), hD y (star x), deriv_star D hD y, deriv_star D hD x] at hzero
  -- hzero : (Dx·star y + x·(-Dy)) + (Dy·star x + y·(-Dx)) = 0
  -- take reQ; reQ is additive and reQ(a)=reQ over the ring; bQ x y = reQ(x star y)
  have hre := congrArg reQ hzero
  simp only [reQ, CD.add_re, CD.add_im, CD.mul_re, CD.mul_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, CD.zero_re, CD.zero_im] at hre ⊢
  simp only [bQ, reQ, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im]
  linarith [hre]

end Phys.Algebra
