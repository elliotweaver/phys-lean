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

-- (2√2)² = 8
theorem twoSqrt2_sq : (2 * sqrt2) * (2 * sqrt2) = 8 := by
  have h := sqrt2_sq; nlinarith [h]

theorem twoSqrt2_nonneg : (0:Cut) ≤ 2 * sqrt2 := by
  have := zero_lt_sqrt2; nlinarith [this]

-- exclusion: 2√2 < 4  (quantum ceiling strictly below the logical max 4)
theorem twoSqrt2_lt_four : 2 * sqrt2 < (4:Cut) := by
  have hsq : (2 * sqrt2) * (2 * sqrt2) = 8 := twoSqrt2_sq
  have hnn : (0:Cut) ≤ 2 * sqrt2 := twoSqrt2_nonneg
  nlinarith [hsq, hnn]

-- from S² ≤ 8, S ≤ 2√2
theorem le_from_sq (S : Cut) (h : S^2 ≤ 8) : S ≤ 2 * sqrt2 := by
  have hsq : (2 * sqrt2) * (2 * sqrt2) = 8 := twoSqrt2_sq
  have hnn : (0:Cut) ≤ 2 * sqrt2 := twoSqrt2_nonneg
  nlinarith [hsq, hnn, sq_nonneg (S - 2*sqrt2), sq_nonneg (S + 2*sqrt2), h]

-- also |S| ≤ 2√2 (both bounds)
theorem abs_le_from_sq (S : Cut) (h : S^2 ≤ 8) : -(2*sqrt2) ≤ S ∧ S ≤ 2 * sqrt2 := by
  have hsq : (2 * sqrt2) * (2 * sqrt2) = 8 := twoSqrt2_sq
  have hnn : (0:Cut) ≤ 2 * sqrt2 := twoSqrt2_nonneg
  constructor <;> nlinarith [hsq, hnn, sq_nonneg (S - 2*sqrt2), sq_nonneg (S + 2*sqrt2), h]

end Phys.Quantum.Q3Probe
