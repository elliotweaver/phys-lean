import Mathlib.Tactic
import Phys.Foundation.Fold
import Phys.Cascade.ComplexUnit
import Phys.Quantum.PrimitiveFibre
import Phys.Quantum.ComplexStructure
import Phys.Quantum.BornRule
import Phys.Quantum.Composite
namespace Phys.Quantum.Q3Probe
open Phys.Foundation Phys.Cascade Module
open Phys.Foundation.ContinuumQ

theorem sqrt2_sq : sqrt2 * sqrt2 = (2 : Cut) := by
  rw [sqrt2_mul_sqrt2]
  have h1 : (1 : Cut) = Qcut 1 := rfl
  have : Qcut (1+1) = Qcut 1 + Qcut 1 := (Qcut_add 1 1).symm
  rw [show (2:Q) = 1 + 1 by norm_num, this, ← h1]; norm_num

-- sqrt2 > 1, hence 2√2 > 2 (exceeds classical bound)
theorem one_lt_sqrt2 : (1:Cut) < sqrt2 := by
  have h := sqrt2_sq; have h0 := zero_lt_sqrt2; nlinarith [h, h0]
theorem two_lt_twoSqrt2 : (2:Cut) < 2 * sqrt2 := by
  have := one_lt_sqrt2; nlinarith [this]

-- per-correlation bound |E| ≤ 1 for unit settings
theorem corr_le_one (a b : StateFibre) (ha : bornForm a a = 1) (hb : bornForm b b = 1) :
    (bornForm a b)^2 ≤ 1 := by
  have cs : (bornForm a b)^2 ≤ bornForm a a * bornForm b b := by
    unfold bornForm; nlinarith [sq_nonneg (a.1*b.2 - a.2*b.1)]
  rw [ha, hb] at cs; linarith
end Phys.Quantum.Q3Probe
