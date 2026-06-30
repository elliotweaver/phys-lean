import Phys.Algebra.DerivationHDim
import Phys.Algebra.DerivationDblPhase
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The NEW-dimension embedding `κ : Dbl ℚ → H ℚ`, `b ↦ ⟨0, b⟩`. -/
def kappa : Dbl ℚ →ₗ[ℚ] H ℚ where
  toFun b := ⟨0, b⟩
  map_add' x y := by ext <;> simp
  map_smul' c x := by ext <;> simp [cd_qsmul_re, cd_qsmul_im]

@[simp] theorem kappa_apply (b : Dbl ℚ) : kappa b = (⟨0, b⟩ : H ℚ) := rfl

theorem kappa_injective : Function.Injective kappa := by
  intro a b h
  have := congrArg CD.im h
  simpa [kappa] using this

/-- The SU(2) generator `adQ hI` ANNIHILATES the embedded U(1) line `ι(Dbl ℚ)`. -/
theorem adQ_hI_iota (a : Dbl ℚ) : adQ hI (CD.iota a) = 0 := by
  rw [adQ_apply]
  ext <;>
    simp [hI, CD.iota, sub_eq_add_neg, CD.mul_re, CD.mul_im, Dbl.J, Dbl.star_J,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'] <;> ring

/-- ★ THE POINTWISE RELATION: on the new plane κ, the SU(2) generator is TWICE the U(1)
    phase rotation. -/
theorem adQ_hI_kappa (b : Dbl ℚ) : adQ hI (kappa b) = kappa ((2 : ℚ) • L_J b) := by
  rw [adQ_apply]
  ext <;>
    simp [hI, kappa, L_J, CD.iota, sub_eq_add_neg, CD.mul_re, CD.mul_im, Dbl.J, Dbl.star_J,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', cd_qsmul_re, cd_qsmul_im,
      Dbl.smul_re, Dbl.smul_im] <;> ring

/-- ★★ THE INTERTWINER (the lower rung `u(1) ↪ su(2)`). -/
theorem isospin_intertwines_hypercharge :
    (adQ hI).comp kappa = kappa.comp ((2 : ℚ) • L_J) := by
  refine LinearMap.ext fun b => ?_
  rw [LinearMap.comp_apply, LinearMap.comp_apply, adQ_hI_kappa, LinearMap.smul_apply]

/-- W8 non-vacuity: the witnessing coordinate is the genuine relational coefficient `2`. -/
theorem intertwiner_coord : (adQ hI (kappa 1)).im.im = 2 := by
  rw [adQ_hI_kappa]
  simp [kappa, L_J, Dbl.J, cd_qsmul_im, Dbl.smul_im, Dbl.mul_im, Dbl.mul_re]

theorem isospin_intertwines_hypercharge_ne_zero :
    (adQ hI).comp kappa ≠ 0 := by
  intro h
  have hc : (adQ hI (kappa 1)).im.im = 2 := intertwiner_coord
  rw [show adQ hI (kappa 1) = ((adQ hI).comp kappa) 1 from rfl, h] at hc
  simp at hc

end

end Phys.Algebra

#print axioms Phys.Algebra.kappa
#print axioms Phys.Algebra.adQ_hI_iota
#print axioms Phys.Algebra.adQ_hI_kappa
#print axioms Phys.Algebra.isospin_intertwines_hypercharge
#print axioms Phys.Algebra.intertwiner_coord
#print axioms Phys.Algebra.isospin_intertwines_hypercharge_ne_zero
