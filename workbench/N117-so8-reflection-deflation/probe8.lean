import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
open scoped BigOperators

-- ===== banked-in-this-file crux =====
theorem trace_id_cut (z : O Cut) : z + star z = (2 * reQC z) • (1 : O Cut) := by
  ext <;> simp [reQC] <;> ring
theorem gFormC_imag_right {q : O Cut} (hq : star q = -q) (p : O Cut) :
    gFormC p q = - reQC (p * q) := by unfold gFormC; rw [hq, mul_neg p q, reQC_neg]
theorem polarize_imag {p q : O Cut} (hp : star p = -p) (hq : star q = -q) :
    p * q + q * p = (-(2 * gFormC p q)) • (1 : O Cut) := by
  have ht := trace_id_cut (p * q)
  rw [star_mul, hp, hq, neg_mul_neg] at ht
  rw [gFormC_imag_right hq p, show (-(2 * - reQC (p * q))) = 2 * reQC (p * q) by ring]; exact ht
theorem selfconj_eq_smul_cut {y : O Cut} (h : star y = y) : y = (reQC y) • (1 : O Cut) := by
  have ht := trace_id_cut y; rw [h] at ht
  have h2 : (2 : Cut) • y = (2 * reQC y) • (1 : O Cut) := by rw [two_smul]; exact ht
  have hc := congrArg (fun z => (2⁻¹ : Cut) • z) h2
  simp only [smul_smul] at hc
  rw [show (2⁻¹ : Cut) * 2 = 1 by norm_num, one_smul,
      show (2⁻¹ : Cut) * (2 * reQC y) = reQC y by ring] at hc
  exact hc
theorem mm_imag {m : O Cut} (hm : star m = -m) : m * m = (-(gFormC m m)) • (1 : O Cut) := by
  have hsc : star (m * star m) = m * star m := by rw [star_mul, star_star]
  have hreal := selfconj_eq_smul_cut hsc
  have hg : reQC (m * star m) = gFormC m m := rfl
  rw [hg] at hreal; rw [hm] at hreal; rw [mul_neg m m] at hreal
  rw [show m * m = -(-(m * m)) by rw [neg_neg], hreal, neg_smul]
theorem reflect_imag_general {m : O Cut} (hm : star m = -m) {v : O Cut} (hv : star v = -v) :
    m * (v * m) = (gFormC m m) • v - (2 * gFormC v m) • m := by
  have hpol := polarize_imag hv hm
  have hvm : v * m = (-(2 * gFormC v m)) • (1 : O Cut) - m * v := by rw [eq_sub_iff_add_eq]; exact hpol
  rw [hvm, mul_sub,
      show m * ((-(2 * gFormC v m)) • (1 : O Cut)) = (-(2 * gFormC v m)) • m by rw [smulCompat_oCut.hr, mul_one],
      show m * (m * v) = (m * m) * v from (mul_mul_left m v), mm_imag hm,
      show ((-(gFormC m m)) • (1 : O Cut)) * v = (-(gFormC m m)) • v by rw [smulCompat_oCut.hl, one_mul],
      neg_smul, neg_smul, sub_neg_eq_add]; abel
theorem gFormC_neg_right (v w : O Cut) : gFormC v (-w) = - gFormC v w := by
  rw [gFormC_symm, gFormC_neg_left, gFormC_symm]
theorem swap_unnorm {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hee : gFormC e e = 1) (hww : gFormC w w = 1) :
    (e - w) * (w * (e - w)) = (gFormC (e - w) (e - w)) • e := by
  have hmim : star (e - w) = -(e - w) := by rw [star_sub, he, hw]; abel
  rw [reflect_imag_general hmim hw]
  have hk : gFormC w (e - w) = gFormC w e - gFormC w w := by
    rw [show e - w = e + (-w) by abel, gFormC_add_right, gFormC_neg_right]; ring
  have hmm : gFormC (e - w) (e - w) = (2 : Cut) - 2 * gFormC w e := by
    rw [show e - w = e + (-w) by abel, gFormC_add_left, gFormC_add_right, gFormC_add_right,
        gFormC_neg_left, gFormC_neg_right, gFormC_neg_right, gFormC_neg_left, gFormC_symm w e, hee, hww]; ring
  rw [hk, hww, hmm]
  set k := gFormC w e with hkdef; module

-- ===== the deflation operator =====
-- octReflectLin m := biMulLin m m  (the two-sided half-turn, a single generator)
-- We need: for unit-imaginary axis e, moved unit-imaginary image w, e ≠ w, the NORMALIZED
-- bisector n := r⁻¹ • (e - w) with r := cutSqrt (gFormC (e-w) (e-w)), the operator biMulLin n n
-- sends (0,0,w) to (0,0,e), and is a sound QvC-isometry in genIsomMonoidLin.

-- First: e ≠ w (both unit-imaginary) ⇒ gFormC (e-w)(e-w) > 0, so r ≠ 0.
theorem ew_ne_pos {e w : O Cut} (hne : e - w ≠ 0) : 0 < gFormC (e - w) (e - w) :=
  gFormC_pos_of_ne hne

-- biMulV n n w = (gFormC n n) • e  when n = s • (e - w)?  Actually let's directly compute with
-- the unit n.  n := r⁻¹ • (e - w), gFormC n n = r⁻² gFormC(e-w)(e-w) = 1.
-- biMulV n n w = n*(w*n) = (r⁻¹)² • ((e-w)*(w*(e-w)))  [biMul_scale]
--             = r⁻² • (gFormC(e-w)(e-w) • e)  [swap_unnorm]
--             = (r⁻² gFormC(e-w)(e-w)) • e = 1 • e = e.
theorem biMul_scale (s : Cut) (m v : O Cut) :
    (s • m) * (v * (s • m)) = (s * s) • (m * (v * m)) := by
  rw [smulCompat_oCut.hr s v m, smulCompat_oCut.hl s m (s • (v * m)),
      smulCompat_oCut.hr s m (v * m), smul_smul]

theorem swap_norm {e w : O Cut} (he : star e = -e) (hw : star w = -w)
    (hee : gFormC e e = 1) (hww : gFormC w w = 1) (hne : e - w ≠ 0) :
    let r := cutSqrt (gFormC (e - w) (e - w))
    (r⁻¹ • (e - w)) * (w * (r⁻¹ • (e - w))) = e := by
  intro r
  have hpos : 0 < gFormC (e - w) (e - w) := gFormC_pos_of_ne hne
  have hrr : r * r = gFormC (e - w) (e - w) := cutSqrt_sq (le_of_lt hpos)
  have hr : r ≠ 0 := ne_of_gt (cutSqrt_pos hpos)
  rw [biMul_scale, swap_unnorm he hw hee hww, smul_smul]
  rw [show r⁻¹ * r⁻¹ * gFormC (e - w) (e - w) = 1 by rw [← hrr]; field_simp]
  rw [one_smul]

end
end Phys.Algebra
