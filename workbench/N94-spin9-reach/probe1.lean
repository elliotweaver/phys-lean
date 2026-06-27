import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- CORE: for a unit imaginary u (u*u = -1, u*(u*v) = -v), the two-sided product
-- v ↦ u*(v*u) composed with itself returns v.  Pure alternative-law algebra.
theorem probe_biMul_imag_sq (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) (v : O Cut) :
    u * ((u * (v * u)) * u) = v := by
  have hflex : (u * (v * u)) * u = u * ((v * u) * u) := (mul_flex u (v * u)).symm
  have hrt : (v * u) * u = -v := by
    rw [mul_mul_right v u, hsq, mul_neg_one]
  rw [hflex, hrt, hL (-v), neg_neg]

-- The involution on STVC (pointwise).
theorem probe_biMul_imag_involutive (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) (p : STVC) :
    biMulFun u u (biMulFun u u p) = p := by
  obtain ⟨t, x, v⟩ := p
  simp only [biMulFun]
  rw [probe_biMul_imag_sq u hsq hL v]

-- Geometry: negates 1.
theorem probe_biMul_negates_one (u : O Cut) (hsq : u * u = -1) :
    biMulFun u u ((0 : Cut), (0 : Cut), (1 : O Cut)) = ((0 : Cut), (0 : Cut), -(1 : O Cut)) := by
  simp only [biMulFun, one_mul]
  rw [hsq]

-- Geometry: negates u.
theorem probe_biMul_negates_self (u : O Cut) (hsq : u * u = -1) :
    biMulFun u u ((0 : Cut), (0 : Cut), u) = ((0 : Cut), (0 : Cut), -u) := by
  simp only [biMulFun]
  rw [hsq, mul_neg_one]

-- Geometry: fixes an anticommuting w.
theorem probe_biMul_fixes_anticomm (u w : O Cut)
    (hL : ∀ z : O Cut, u * (u * z) = -z) (hac : u * w = -(w * u)) :
    biMulFun u u ((0 : Cut), (0 : Cut), w) = ((0 : Cut), (0 : Cut), w) := by
  simp only [biMulFun]
  have hwu : w * u = -(u * w) := by rw [hac, neg_neg]
  rw [hwu, mul_neg u (u * w), hL w, neg_neg]

end

end Phys.Algebra
