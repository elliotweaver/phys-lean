import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem trace_id_cut (z : O Cut) : z + star z = (2 * reQC z) • (1 : O Cut) := by
  ext <;> simp [reQC] <;> ring

example (x y : O Cut) : star (x * y) = star y * star x := star_mul x y

theorem gFormC_imag_right {q : O Cut} (hq : star q = -q) (p : O Cut) :
    gFormC p q = - reQC (p * q) := by
  unfold gFormC
  rw [hq, mul_neg p q, reQC_neg]

-- THE POLARIZATION: for imaginary p, q:  p*q + q*p = -(2 * gFormC p q) • 1
theorem polarize_imag {p q : O Cut} (hp : star p = -p) (hq : star q = -q) :
    p * q + q * p = (-(2 * gFormC p q)) • (1 : O Cut) := by
  have ht : (p * q) + star (p * q) = (2 * reQC (p * q)) • (1 : O Cut) := trace_id_cut (p * q)
  rw [star_mul, hp, hq, neg_mul_neg] at ht
  rw [gFormC_imag_right hq p]
  rw [show (-(2 * - reQC (p * q))) = 2 * reQC (p * q) by ring]
  exact ht

-- THE ANTICOMMUTATION CRITERION
theorem anticomm_of_gFormC_zero {p q : O Cut} (hp : star p = -p) (hq : star q = -q)
    (h0 : gFormC p q = 0) : p * q = -(q * p) := by
  have hpol := polarize_imag hp hq
  rw [h0, mul_zero, neg_zero, zero_smul] at hpol
  rw [eq_neg_iff_add_eq_zero]; exact hpol

end

end Phys.Algebra
