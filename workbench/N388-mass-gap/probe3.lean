import Phys.Algebra.ConfinementAreaLaw
import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

/-!
  PROBE 3 (N388 arc-I I4). bornAction floor casts + no-floor-over-continuum contrast.
-/

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- witness floor cast into Cut: bornAction at coloured witness ≥ 4 (in the derived ℝ).
example :
    (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  unfold bornAction
  have hq : (4:ℚ) ≤ gForm (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))
        (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) := by
    rw [gForm_self_sum_sq]
    have h7 : c7 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) = 2 := by
      unfold c7; exact assoc_witness_coord
    rw [h7]
    nlinarith [sq_nonneg (c0 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
      sq_nonneg (c1 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
      sq_nonneg (c2 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
      sq_nonneg (c3 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
      sq_nonneg (c4 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
      sq_nonneg (c5 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ))),
      sq_nonneg (c6 (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)))]
  calc (4:Cut) = ((4:ℚ):Cut) := by norm_num
    _ ≤ ((gForm _ _ : ℚ):Cut) := by exact_mod_cast hq

-- no-floor-over-continuum: a scalar (1/(n+1))•1 has gForm = 1/(n+1)² < any ε for big n.
-- First: c0 of scalar multiple.
example (q : ℚ) : gForm (q • (1 : O ℚ)) (q • (1 : O ℚ)) = q^2 := by
  rw [gForm_self_sum_sq]
  simp only [c0, c1, c2, c3, c4, c5, c6, c7]
  -- (q • 1).re.re.re = q, others 0
  sorry

end
end Phys.Algebra
