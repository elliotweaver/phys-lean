import Phys.Algebra.Derivation

/-! N184 PROBE2 — full Der(H ℚ) su(2)/so(3) + Lie subalgebra + non-vacuity + indep. -/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

section QuatDeriv2

attribute [local instance] CD.narCD CD.srCD

/-- `i := iota J`, `j := e2`, `k := i*j` -/
def hI : H ℚ := CD.iota (Dbl.J)
def hJ : H ℚ := (CD.e2 : H ℚ)
def hK : H ℚ := hI * hJ

theorem hK_def : hK = ⟨0, Dbl.J⟩ := by
  unfold hK hI hJ; ext <;> simp [CD.iota, CD.e2, Dbl.J]

-- full table
theorem hI_sq : hI * hI = -1 := by unfold hI; ext <;> simp [CD.iota, Dbl.J_mul_J]
theorem hJ_sq : hJ * hJ = -1 := by unfold hJ; ext <;> simp [CD.e2]
theorem hK_sq : hK * hK = -1 := by rw [hK_def]; ext <;> simp [Dbl.star_J, Dbl.J_mul_J]
theorem hI_hJ : hI * hJ = hK := rfl
theorem hJ_hI : hJ * hI = -hK := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hJ_hK : hJ * hK = hI := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hK_hJ : hK * hJ = -hI := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hK_hI : hK * hI = hJ := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring
theorem hI_hK : hI * hK = -hJ := by
  rw [hK_def]; unfold hJ hI; ext <;> simp [CD.iota, CD.e2, Dbl.star_J, Dbl.J] <;> ring

def adM (q : H ℚ) : Module.End ℤ (H ℚ) := (adHom q).toIntLinearMap
@[simp] theorem adM_apply (q x : H ℚ) : adM q x = q * x - x * q := rfl

theorem adM_add (p q : H ℚ) : adM (p + q) = adM p + adM q := by
  refine LinearMap.ext fun x => ?_
  simp only [adM_apply, LinearMap.add_apply, add_mul, mul_add]; abel

/-- ★★ THE LIE-HOM IDENTITY. -/
theorem adM_bracket (p q : H ℚ) : ⁅adM p, adM q⁆ = adM (p * q - q * p) := by
  refine LinearMap.ext fun x => ?_
  show (adM p * adM q - adM q * adM p) x = adM (p * q - q * p) x
  simp only [LinearMap.sub_apply, Module.End.mul_apply, adM_apply]
  noncomm_ring

/-- the three so(3) structure constants. -/
theorem adM_ij : ⁅adM hI, adM hJ⁆ = (2 : ℤ) • adM hK := by
  rw [adM_bracket, two_zsmul, ← adM_add]; congr 1; rw [hI_hJ, hJ_hI, sub_neg_eq_add]
theorem adM_jk : ⁅adM hJ, adM hK⁆ = (2 : ℤ) • adM hI := by
  rw [adM_bracket, two_zsmul, ← adM_add]; congr 1; rw [hJ_hK, hK_hJ, sub_neg_eq_add]
theorem adM_ki : ⁅adM hK, adM hI⁆ = (2 : ℤ) • adM hJ := by
  rw [adM_bracket, two_zsmul, ← adM_add]; congr 1; rw [hK_hI, hI_hK, sub_neg_eq_add]

/-- W8: ad_k(i) = 2j. -/
theorem adM_k_on_i : adM hK hI = (2 : ℤ) • hJ := by
  rw [adM_apply, two_zsmul, hK_hI, hI_hK, sub_neg_eq_add]

theorem hJ_ne_zero : hJ ≠ 0 := by
  intro h
  have him := congrArg (fun z : H ℚ => z.im.re) h
  simp only [hJ, CD.e2] at him
  norm_num at him

theorem twoJ_ne_zero : (2 : ℤ) • hJ ≠ 0 := by
  rw [two_zsmul]; intro h
  have := congrArg (fun z : H ℚ => z.im.re) h
  simp [hJ, CD.e2] at this

theorem fourJ_ne_zero : (4 : ℤ) • hJ ≠ 0 := by
  have e4 : (4 : ℤ) • hJ = hJ + hJ + hJ + hJ := by
    rw [show (4:ℤ) = 1+1+1+1 by norm_num, add_smul, add_smul, add_smul, one_smul]
  rw [e4]; intro h
  have := congrArg (fun z : H ℚ => z.im.re) h
  simp only [hJ, CD.e2, CD.add_im, Dbl.add_re, CD.zero_im, Dbl.zero_re] at this
  norm_num at this

/-- W8: `adM hK ≠ 0` — it moves `i` to `2j ≠ 0`. -/
theorem adM_k_ne_zero : adM hK ≠ 0 := by
  intro h
  apply twoJ_ne_zero
  rw [← adM_k_on_i, h]; rfl

/-- W8: the bracket is genuinely non-abelian — it sends `i` to `4j ≠ 0`. -/
theorem adM_ij_ne_zero : ⁅adM hI, adM hJ⁆ ≠ 0 := by
  intro h
  apply fourJ_ne_zero
  have h2 : (⁅adM hI, adM hJ⁆) hI = 0 := by rw [h]; rfl
  rw [adM_ij, LinearMap.smul_apply, adM_k_on_i, smul_smul] at h2
  rw [← h2]; norm_num

end QuatDeriv2

end Phys.Algebra

#print axioms Phys.Algebra.adM_jk
#print axioms Phys.Algebra.adM_ki
#print axioms Phys.Algebra.adM_ij_ne_zero
