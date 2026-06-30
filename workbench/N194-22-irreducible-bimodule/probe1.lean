import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-! ## PROBE 1: the four-square Born norm of H ℚ, anisotropic over ℚ. -/

/-- The four-square Born self-overlap form on `H ℚ = CD (Dbl ℚ)`. -/
def quatNorm (w : H ℚ) : ℚ :=
  w.re.re ^ 2 + w.re.im ^ 2 + w.im.re ^ 2 + w.im.im ^ 2

/-- ★ THE BORN LEVER (one rung down): `star w * w = quatNorm w • 1`. -/
theorem starMulSelf_eq_quatNorm (w : H ℚ) :
    star w * w = quatNorm w • (1 : H ℚ) := by
  ext <;> simp [quatNorm, Dbl.mul_re, Dbl.mul_im, cd_qsmul_re, cd_qsmul_im,
    Dbl.smul_re, Dbl.smul_im] <;> ring

/-- ★ Born anisotropy over ℚ: `quatNorm w = 0 ↔ w = 0` (four rational squares). -/
theorem quatNorm_eq_zero {w : H ℚ} : quatNorm w = 0 ↔ w = 0 := by
  constructor
  · intro h
    have h4 : w.re.re ^ 2 + w.re.im ^ 2 + w.im.re ^ 2 + w.im.im ^ 2 = 0 := h
    have e1 : w.re.re = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e2 : w.re.im = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e3 : w.im.re = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    have e4 : w.im.im = 0 := by nlinarith [sq_nonneg w.re.re, sq_nonneg w.re.im, sq_nonneg w.im.re, sq_nonneg w.im.im]
    ext <;> simp [e1, e2, e3, e4]
  · intro h; subst h; simp [quatNorm]

theorem quatNorm_ne_zero {w : H ℚ} (hw : w ≠ 0) : quatNorm w ≠ 0 :=
  fun h => hw (quatNorm_eq_zero.mp h)

/-! ## PROBE 2: an su(2)_T-invariant submodule of H ℚ (under left-mult by ImH) is a left ideal. -/

/-- The decomposition `q = (reH q)•1 + q_im` with `q_im ∈ ImH`. -/
theorem h_decomp (q : H ℚ) : q = (reH q) • (1 : H ℚ) + (q - (reH q) • (1 : H ℚ)) := by
  abel

theorem sub_reH_mem_ImH (q : H ℚ) : (q - (reH q) • (1 : H ℚ)) ∈ ImH := by
  rw [mem_ImH]
  have ht : q + star q = (2 * reH q) • (1 : H ℚ) := reH_trace q
  -- star (q - r•1) = star q - r•1 = (2r•1 - q) - r•1 = r•1 - q = -(q - r•1)
  have : star (q - (reH q) • (1:H ℚ)) = star q - (reH q) • (1:H ℚ) := by
    rw [star_sub]; congr 1; ext <;> simp [reH]
  rw [this]
  have hsq : star q = (2 * reH q) • (1:H ℚ) - q := by
    have := ht; linear_combination (norm := abel) this
  rw [hsq]
  module

end

end Phys.Algebra
