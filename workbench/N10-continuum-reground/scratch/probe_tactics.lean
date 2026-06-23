-- PROBE: do the order/field tactics work over the DERIVED Q (OrderedTower)?
-- The continuum port "ports verbatim" ONLY if norm_num/nlinarith/positivity/div lemmas
-- fire on Phys.Foundation.Q. W6: verify, don't trust.
import Phys.Foundation.OrderedTower
import Mathlib.Tactic

namespace Phys.Foundation
open Q

-- (1) norm_num on numerals over derived Q
example : (0 : Q) < 2 := by norm_num
example : (2 : Q) ^ 2 = 4 := by norm_num
example : ¬ ((2:Q) ≤ 0) := by norm_num
example : (1 : Q) ^ 2 < 2 := by norm_num

-- (2) linarith / nlinarith over derived Q
example (q : Q) (h : q ≤ 0) : q < 1 := by linarith
example (q : Q) (hq : q ^ 2 < 2) (hp : 0 < q) : q < 2 := by nlinarith [hq, hp]

-- (3) positivity over derived Q
example (q : Q) (h : 0 < q) : 0 < q + 2 := by positivity

-- (4) division lemmas over derived Q (the Heron mediant machinery)
example (q : Q) (hpos : 0 < q + 2) : (2 * q + 2) / (q + 2) < 2 ↔ 2 * q + 2 < 2 * (q + 2) := by
  rw [div_lt_iff₀ hpos]
example (q : Q) (hpos : 0 < (q + 2)) :
    ((2 * q + 2) / (q + 2)) ^ 2 = (2 * q + 2)^2 / (q + 2)^2 := by
  rw [div_pow]

-- (5) lt_div_iff₀ and the down-step
example (c : Q) (hc : 0 < c) : (c ^ 2 + 2) / (2 * c) < c ↔ c ^ 2 + 2 < c * (2 * c) := by
  rw [div_lt_iff₀ (by positivity)]

end Phys.Foundation
