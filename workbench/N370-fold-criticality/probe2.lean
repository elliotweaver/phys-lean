import Phys.Foundation.ContinuumExpDeriv
import Phys.Algebra.CosmoInflationPlateauExclusion

namespace Phys.Foundation.ContinuumQ

open Filter Set
open Phys.Algebra
open scoped Topology BigOperators

noncomputable section

-- const_mul rule
theorem p_const_mul {f : Cut → Cut} {df x : Cut} (a : Cut) (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => a * f y) (a * df) x := by
  unfold CutHasDerivAt at *
  have := hf.const_mul a
  refine this.congr' ?_
  filter_upwards with h; ring

-- neg
theorem p_neg {f : Cut → Cut} {df x : Cut} (hf : CutHasDerivAt f df x) :
    CutHasDerivAt (fun y => - f y) (- df) x := by
  unfold CutHasDerivAt at *
  have := hf.neg
  refine this.congr' ?_
  filter_upwards with h; ring

-- sub
theorem p_sub {f g : Cut → Cut} {df dg x : Cut}
    (hf : CutHasDerivAt f df x) (hg : CutHasDerivAt g dg x) :
    CutHasDerivAt (fun y => f y - g y) (df - dg) x := by
  have hng := p_neg hg
  have := hf.add hng
  refine this.congr' ?_
  · unfold CutHasDerivAt at *; filter_upwards with h; ring

-- V' as an explicit function: V'(φ) = 2c·cutExp((-c)·φ) − 2c·cutExp((-2c)·φ)
def Vprime (c φ : Cut) : Cut := 2*c * cutExp ((-c) * φ) - 2*c * cutExp ((-(2*c)) * φ)

-- V''(φ) = 2c·(-c)·cutExp((-c)φ) − 2c·(-2c)·cutExp((-2c)φ)  [via scale rule + const_mul + sub]
theorem p_Vprime_deriv (c φ : Cut) (hc : c ≠ 0) :
    CutHasDerivAt (Vprime c)
      (2*c * ((-c) * cutExp ((-c) * φ)) - 2*c * ((-(2*c)) * cutExp ((-(2*c)) * φ))) φ := by
  have hne1 : (-c) ≠ 0 := neg_ne_zero.mpr hc
  have hne2 : (-(2*c)) ≠ 0 := by
    have : (2:Cut)*c ≠ 0 := by
      intro h; rcases mul_eq_zero.mp h with h1 | h2
      · norm_num at h1
      · exact hc h2
    exact neg_ne_zero.mpr this
  have h1 : CutHasDerivAt (fun y => 2*c * cutExp ((-c) * y)) (2*c * ((-c) * cutExp ((-c) * φ))) φ :=
    p_const_mul (2*c) (cutExp_scale_hasDerivAt (-c) φ hne1)
  have h2 : CutHasDerivAt (fun y => 2*c * cutExp ((-(2*c)) * y))
      (2*c * ((-(2*c)) * cutExp ((-(2*c)) * φ))) φ :=
    p_const_mul (2*c) (cutExp_scale_hasDerivAt (-(2*c)) φ hne2)
  exact p_sub h1 h2

-- V''(0) = 2c²
theorem p_Vpp_origin (c : Cut) :
    (2*c * ((-c) * cutExp ((-c) * 0)) - 2*c * ((-(2*c)) * cutExp ((-(2*c)) * 0))) = 2*c^2 := by
  rw [mul_zero, mul_zero, cutExp_zero]
  ring

end
end Phys.Foundation.ContinuumQ
