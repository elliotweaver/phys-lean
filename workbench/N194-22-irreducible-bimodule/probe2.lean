import Phys.Algebra.DerivationRep7SU2SBranching
import Phys.Algebra.DerivationRep7SU2TBranching
import Phys.Algebra.DerivationRep7FullBranching
import Phys.Algebra.DerivationRep7
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

noncomputable section

def quatNorm (w : H ℚ) : ℚ :=
  w.re.re ^ 2 + w.re.im ^ 2 + w.im.re ^ 2 + w.im.im ^ 2

theorem starMulSelf_eq_quatNorm (w : H ℚ) :
    star w * w = quatNorm w • (1 : H ℚ) := by
  ext <;> simp [quatNorm, Dbl.mul_re, Dbl.mul_im, cd_qsmul_re, cd_qsmul_im,
    Dbl.smul_re, Dbl.smul_im] <;> ring

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

theorem sub_reH_mem_ImH (q : H ℚ) : (q - (reH q) • (1 : H ℚ)) ∈ ImH := by
  rw [mem_ImH]
  have ht : q + star q = (2 * reH q) • (1 : H ℚ) := reH_trace q
  have hst : star (q - (reH q) • (1:H ℚ)) = star q - (reH q) • (1:H ℚ) := by
    rw [star_sub]; congr 1; ext <;> simp [reH]
  rw [hst]
  have hsq : star q = (2 * reH q) • (1:H ℚ) - q := by
    linear_combination (norm := abel) ht
  rw [hsq]; module

/-! ## PROBE 2: irreducibility of the left-regular H ℚ-module under ImH-left-multiplication. -/

/-- A submodule `W` closed under left-multiplication by imaginary quaternions, given the unit
    `1 ∈ W`, is closed under left-multiplication by ALL quaternions (it is a left ideal). -/
theorem left_mul_mem_of_one_mem {W : Submodule ℚ (H ℚ)}
    (hW : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W)
    (h1 : (1 : H ℚ) ∈ W) (q x : H ℚ) (hx : x ∈ W) : q * x ∈ W := by
  have hsplit : q * x = (reH q) • x + (q - (reH q) • (1:H ℚ)) * x := by
    rw [sub_mul, smul_mul_assoc, one_mul]; abel
  rw [hsplit]
  refine W.add_mem (W.smul_mem _ hx) ?_
  exact hW _ ((mem_ImH).mp (sub_reH_mem_ImH q)) x hx

/-- ★★ THE IRREDUCIBILITY: a submodule `W ⊆ H ℚ` closed under left-multiplication by every
    imaginary quaternion is `⊥` or `⊤`. The trunk lever: for `0 ≠ w ∈ W`,
    `star w * w = quatNorm w • 1 ∈ W` with `quatNorm w ≠ 0` (Born anisotropy over ℚ), so `1 ∈ W`,
    then the left-ideal closure gives `W = ⊤`. -/
theorem leftRegular_H_irreducible (W : Submodule ℚ (H ℚ))
    (hW : ∀ (Q : H ℚ), star Q = -Q → ∀ x ∈ W, Q * x ∈ W) :
    W = ⊥ ∨ W = ⊤ := by
  by_cases hbot : W = ⊥
  · exact Or.inl hbot
  · right
    -- pick a nonzero w ∈ W
    obtain ⟨w, hwW, hwne⟩ := (Submodule.ne_bot_iff W).mp hbot
    -- first: star w * w ∈ W. Decompose star w into re-part + imaginary part.
    have hstarw_mul : star w * w ∈ W := by
      have hsplit : star w * w
          = (reH (star w)) • w + (star w - (reH (star w)) • (1:H ℚ)) * w := by
        rw [sub_mul, smul_mul_assoc, one_mul]; abel
      rw [hsplit]
      refine W.add_mem (W.smul_mem _ hwW) ?_
      exact hW _ ((mem_ImH).mp (sub_reH_mem_ImH (star w))) w hwW
    -- star w * w = quatNorm w • 1, nonzero scalar, so 1 ∈ W
    rw [starMulSelf_eq_quatNorm] at hstarw_mul
    have hq : quatNorm w ≠ 0 := quatNorm_ne_zero hwne
    have h1 : (1 : H ℚ) ∈ W := by
      have := W.smul_mem (quatNorm w)⁻¹ hstarw_mul
      rwa [smul_smul, inv_mul_cancel₀ hq, one_smul] at this
    -- 1 ∈ W + left-ideal ⟹ W = ⊤
    rw [eq_top_iff]; intro q _
    have := left_mul_mem_of_one_mem hW h1 q 1 h1
    rwa [mul_one] at this

end

end Phys.Algebra
