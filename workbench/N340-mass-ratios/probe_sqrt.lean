import Phys.Algebra.LorentzContinuumSqrt
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- sqrt bracket helper: from x≥0 and x*x=v, and rational bounds a²≤v, v≤b², derive a≤x≤b.
-- generic lemma (abstract) — measure cost.
example (x : Cut) (hx : 0 ≤ x) (hxx : x * x = 2)
    (a b : Cut) (ha : 0 ≤ a) (hb : 0 ≤ b) (hav : a*a ≤ 2) (hvb : 2 ≤ b*b) : a ≤ x ∧ x ≤ b := by
  constructor
  · nlinarith [hx, hxx, ha, hav, mul_le_mul hx hx (le_refl (0:Cut)) hx]
  · nlinarith [hx, hxx, hb, hvb]

-- concrete w = cutSqrt 2 bracket
example : (1414213:Cut)/1000000 ≤ cutSqrt 2 ∧ cutSqrt 2 ≤ 1414214/1000000 := by
  have hx : 0 ≤ cutSqrt (2:Cut) := cutSqrt_nonneg 2
  have hxx : cutSqrt (2:Cut) * cutSqrt 2 = 2 := cutSqrt_sq (by norm_num)
  constructor
  · nlinarith [hx, hxx]
  · nlinarith [hx, hxx]

end
end Phys.Algebra
