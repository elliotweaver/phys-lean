import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- reQ 1 = 1 ?
example : reQ (1 : O ℚ) = 1 := by
  simp [reQ]

-- self-conjugate ⟹ scalar: star y = y → y = (reQ y) • 1
theorem selfconj_eq_smul {y : O ℚ} (h : star y = y) : y = (reQ y) • (1 : O ℚ) := by
  have ht := trace_id y           -- y + star y = (2 reQ y) • 1
  rw [h] at ht                    -- y + y = (2 reQ y) • 1
  -- 2 • y = (2 reQ y) • 1  ⟹  y = (reQ y) • 1
  have h2 : (2 : ℚ) • y = (2 * reQ y) • (1 : O ℚ) := by
    rw [two_smul]; exact ht
  have hc := congrArg (fun z => (2⁻¹ : ℚ) • z) h2
  simp only [smul_smul] at hc
  rw [show (2⁻¹ : ℚ) * 2 = 1 by norm_num, one_smul,
      show (2⁻¹ : ℚ) * (2 * reQ y) = reQ y by ring] at hc
  exact hc

-- x * star x is a scalar = (gForm x x) • 1
theorem selfMul_eq_smul (x : O ℚ) : x * star x = (gForm x x) • (1 : O ℚ) := by
  have hsc := selfMul_selfconj x  -- star (x * star x) = x * star x
  have := selfconj_eq_smul hsc
  rw [this]
  -- reQ (x * star x) = gForm x x by def
  rfl

-- THE QUADRATIC: x * x = (2 reQ x) • x - (gForm x x) • 1
theorem octo_quadratic (x : O ℚ) :
    x * x = (2 * reQ x) • x - (gForm x x) • (1 : O ℚ) := by
  have hst : star x = (2 * reQ x) • (1 : O ℚ) - x := by
    have ht := trace_id x
    linear_combination (norm := abel) ht
  have hsm : x * star x = (gForm x x) • (1 : O ℚ) := selfMul_eq_smul x
  rw [hst] at hsm
  -- x * ((2 reQ x)•1 - x) = (gForm x x)•1
  rw [mul_sub, qsmul_mul_right, mul_one] at hsm
  -- (2 reQ x) • x - x*x = (gForm x x)•1  ⟹  x*x = (2 reQ x)•x - (gForm x x)•1
  linear_combination (norm := abel) -hsm

end
end Phys.Algebra
