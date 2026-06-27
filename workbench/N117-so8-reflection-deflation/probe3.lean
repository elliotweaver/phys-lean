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

theorem gFormC_imag_right {q : O Cut} (hq : star q = -q) (p : O Cut) :
    gFormC p q = - reQC (p * q) := by
  unfold gFormC; rw [hq, mul_neg p q, reQC_neg]

theorem polarize_imag {p q : O Cut} (hp : star p = -p) (hq : star q = -q) :
    p * q + q * p = (-(2 * gFormC p q)) • (1 : O Cut) := by
  have ht : (p * q) + star (p * q) = (2 * reQC (p * q)) • (1 : O Cut) := trace_id_cut (p * q)
  rw [star_mul, hp, hq, neg_mul_neg] at ht
  rw [gFormC_imag_right hq p]
  rw [show (-(2 * - reQC (p * q))) = 2 * reQC (p * q) by ring]
  exact ht

-- THE REFLECTION IDENTITY (the crux).  For unit-imaginary m (m*m=-1, hL: m*(m*v)=-v), any imag v:
-- m * (v * m) = (2 * gFormC v m) • m - v
-- Derivation: from polarize_imag, v*m = -(m*v) - (2*gFormC v m)•1.
-- Then m*(v*m) = m*(-(m*v) - (2*gFormC v m)•1)
--             = -(m*(m*v)) - (2*gFormC v m)•(m*1)
--             = -(-v) - (2*gFormC v m)•m   [using hL and m*1 = m]
-- Wait sign: = v - (2*gFormC v m)•m.  Let me just compute and read off.
theorem reflect_imag {m : O Cut} (hm : star m = -m) (hL : ∀ z : O Cut, m * (m * z) = -z)
    {v : O Cut} (hv : star v = -v) :
    m * (v * m) = v - (2 * gFormC v m) • m := by
  have hpol := polarize_imag hv hm  -- v*m + m*v = -(2*gFormC v m) • 1
  have hvm : v * m = (-(2 * gFormC v m)) • (1 : O Cut) - m * v := by
    rw [eq_sub_iff_add_eq]; exact hpol
  rw [hvm, mul_sub]
  -- m * ((-(2*gFormC v m))•1) = (-(2*gFormC v m)) • (m*1) = (-(2*gFormC v m))•m
  rw [show m * ((-(2 * gFormC v m)) • (1 : O Cut)) = (-(2 * gFormC v m)) • m by
        rw [smulCompat_oCut.hr, mul_one]]
  rw [hL v]
  -- goal: (-(2*gFormC v m))•m - (-v) = v - (2*gFormC v m)•m
  rw [sub_neg_eq_add, neg_smul]
  abel

end

end Phys.Algebra
