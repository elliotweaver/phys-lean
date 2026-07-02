import Phys.Algebra.Derivation

/-! N184 PROBE — Der(H ℚ) ≅ so(3) ≅ su(2): the weak-isospin gauge seed.
    H ℚ = CD (Dbl ℚ) is associative; ad_q its inner derivations. -/

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

section QuatDeriv

-- The quaternion units in H ℚ = CD (Dbl ℚ).
/-- `i := iota J` -/
def hI : H ℚ := CD.iota (Dbl.J)
/-- `j := e2` -/
def hJ : H ℚ := (CD.e2 : H ℚ)
/-- `k := i * j` -/
def hK : H ℚ := hI * hJ

-- The quaternion multiplication table.
theorem hI_sq : hI * hI = -1 := by
  unfold hI; ext <;> simp [CD.iota, Dbl.J_mul_J]
theorem hJ_sq : hJ * hJ = -1 := by
  unfold hJ; ext <;> simp [CD.e2]
theorem hK_def : hK = ⟨0, Dbl.J⟩ := by
  unfold hK hI hJ; ext <;> simp [CD.iota, CD.e2]
theorem hK_sq : hK * hK = -1 := by
  rw [hK_def]; ext <;> simp [Dbl.star_J, Dbl.J_mul_J]
theorem hJ_hI : hJ * hI = -hK := by
  unfold hJ hI hK; ext <;> simp [CD.iota, CD.e2, Dbl.star_J]

-- The inner derivation as a ℤ-linear endomorphism.
/-- `adM q := ad_q` as `Module.End ℤ (H ℚ)`. -/
def adM (q : H ℚ) : Module.End ℤ (H ℚ) := (adHom q).toIntLinearMap

@[simp] theorem adM_apply (q x : H ℚ) : adM q x = q * x - x * q := rfl

theorem adM_add (p q : H ℚ) : adM (p + q) = adM p + adM q := by
  ext x; simp [adM_apply, add_mul, mul_add]; abel

theorem adM_smul (n : ℤ) (q : H ℚ) : adM (n • q) = n • adM q := by
  ext x
  simp only [adM_apply, LinearMap.smul_apply]
  rw [smul_sub, smul_mul_assoc, mul_smul_comm]

/-- ★★ THE LIE-HOM IDENTITY: ad carries the associative commutator to the End commutator. -/
theorem adM_bracket (p q : H ℚ) : ⁅adM p, adM q⁆ = adM (p * q - q * p) := by
  ext x
  rw [Ring.lie_def]
  show adM p (adM q x) - adM q (adM p x) = adM (p * q - q * p) x
  simp only [adM_apply]
  noncomm_ring

/-- ★★ THE so(3)/su(2) STRUCTURE CONSTANT: `⁅adM i, adM j⁆ = 2 • adM k`. -/
theorem adM_ij : ⁅adM hI, adM hJ⁆ = (2 : ℤ) • adM hK := by
  rw [adM_bracket]
  have : hI * hJ - hJ * hI = (2 : ℤ) • hK := by
    rw [hJ_hI, ← hK]; ext <;> simp <;> ring
  rw [this, adM_smul]

end QuatDeriv

end Phys.Algebra

-- axiom audit
#print axioms Phys.Algebra.adM_bracket
#print axioms Phys.Algebra.adM_ij
#print axioms Phys.Algebra.hK_sq
#print axioms Phys.Algebra.hJ_hI
