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
  rw [show (-(2 * - reQC (p * q))) = 2 * reQC (p * q) by ring]; exact ht

theorem selfconj_eq_smul_cut {y : O Cut} (h : star y = y) : y = (reQC y) • (1 : O Cut) := by
  have ht := trace_id_cut y
  rw [h] at ht
  have h2 : (2 : Cut) • y = (2 * reQC y) • (1 : O Cut) := by rw [two_smul]; exact ht
  have hc := congrArg (fun z => (2⁻¹ : Cut) • z) h2
  simp only [smul_smul] at hc
  rw [show (2⁻¹ : Cut) * 2 = 1 by norm_num, one_smul,
      show (2⁻¹ : Cut) * (2 * reQC y) = reQC y by ring] at hc
  exact hc

theorem mm_imag {m : O Cut} (hm : star m = -m) : m * m = (-(gFormC m m)) • (1 : O Cut) := by
  have hsc : star (m * star m) = m * star m := by rw [star_mul, star_star]
  have hreal : m * star m = (reQC (m * star m)) • (1 : O Cut) := selfconj_eq_smul_cut hsc
  have hg : reQC (m * star m) = gFormC m m := rfl
  rw [hg] at hreal
  rw [hm] at hreal; rw [mul_neg m m] at hreal
  rw [show m * m = -(-(m * m)) by rw [neg_neg], hreal, neg_smul]

-- THE GENERAL two-sided reflection: m*(v*m) = (gFormC m m)•v - (2 gFormC v m)•m  (m,v imaginary).
theorem reflect_imag_general {m : O Cut} (hm : star m = -m)
    {v : O Cut} (hv : star v = -v) :
    m * (v * m) = (gFormC m m) • v - (2 * gFormC v m) • m := by
  have hpol := polarize_imag hv hm
  have hvm : v * m = (-(2 * gFormC v m)) • (1 : O Cut) - m * v := by
    rw [eq_sub_iff_add_eq]; exact hpol
  rw [hvm, mul_sub]
  rw [show m * ((-(2 * gFormC v m)) • (1 : O Cut)) = (-(2 * gFormC v m)) • m by
        rw [smulCompat_oCut.hr, mul_one]]
  rw [show m * (m * v) = (m * m) * v from (mul_mul_left m v)]
  rw [mm_imag hm]
  rw [show ((-(gFormC m m)) • (1 : O Cut)) * v = (-(gFormC m m)) • v by
        rw [smulCompat_oCut.hl, one_mul]]
  rw [neg_smul, neg_smul, sub_neg_eq_add]; abel

-- gFormC bilinearity helpers (banked): gFormC_add_left/right, gFormC_smul, gFormC_symm, gFormC_neg
-- THE SWAP.  Let e, w be unit-imaginary, gFormC e w =: k.  Set m := e - w.
-- gFormC m m = 2 - 2k ;  gFormC e m = gFormC e e - gFormC e w = 1 - k ;  gFormC w m = k - 1.
-- reflect at m on w:  m*(w*m) = (gFormC m m)•w - (2 gFormC w m)•m
--                            = (2-2k)•w - 2(k-1)•(e-w)
--                            = (2-2k)•w - (2k-2)•e + (2k-2)•w
--                            = [(2-2k)+(2k-2)]•w - (2k-2)•e = 0•w + (2-2k)•e = (2-2k)•e
-- So m*(w*m) = (gFormC m m) • e.   i.e. biMulV m m sends w to (gFormC m m)•e.
-- With NORMALIZED m (so gFormC m m would be 1) it sends w↦e exactly.  But cleaner:
-- biMulLin (n) (n) for n = m/|m| has biMulV n n w = e.
-- For the deflation we want an EXACT operator in genIsomMonoidLin.  Use n := (gFormC m m)^(-1/2)•m.
-- Let's first just PROVE the unnormalized swap: m*(w*m) = (gFormC m m)•e.
theorem gFormC_neg_right (v w : O Cut) : gFormC v (-w) = - gFormC v w := by
  rw [gFormC_symm, gFormC_neg_left, gFormC_symm]

theorem swap_unnorm {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hee : gFormC e e = 1) (hww : gFormC w w = 1) :
    (e - w) * (w * (e - w)) = (gFormC (e - w) (e - w)) • e := by
  have hmim : star (e - w) = -(e - w) := by rw [star_sub, he, hw]; abel
  have hrefl := reflect_imag_general hmim hw
  rw [hrefl]
  have hk : gFormC w (e - w) = gFormC w e - gFormC w w := by
    rw [show e - w = e + (-w) by abel, gFormC_add_right, gFormC_neg_right]; ring
  have hmm : gFormC (e - w) (e - w) = (2 : Cut) - 2 * gFormC w e := by
    rw [show e - w = e + (-w) by abel, gFormC_add_left, gFormC_add_right, gFormC_add_right,
        gFormC_neg_left, gFormC_neg_right, gFormC_neg_right, gFormC_neg_left]
    rw [gFormC_symm w e, hee, hww]; ring
  rw [hk, hww]
  rw [hmm]
  -- goal: (2 - 2 gFormC w e) • w - (2 * (gFormC w e - 1)) • (e - w) = (2 - 2 gFormC w e) • e
  set k := gFormC w e with hkdef
  module

end

end Phys.Algebra
