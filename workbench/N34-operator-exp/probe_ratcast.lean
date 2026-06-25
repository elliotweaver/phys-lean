import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field

open Phys.Foundation ContinuumQ

-- Does Cut have CharZero / RatCast (canonical ℚ → Cut from being an ordered field)?
example : CharZero Cut := inferInstance
#check (Rat.cast : ℚ → Cut)
example : RatCast Cut := inferInstance
-- monotone? ratCast is order-preserving in a LinearOrderedField
#check @Rat.cast_le
example (a b : ℚ) (h : a ≤ b) : (a : Cut) ≤ (b : Cut) := by exact_mod_cast h
-- |·| preserved: |(q:Cut)| = (|q| : Cut)
example (q : ℚ) : |(q : Cut)| = ((|q| : ℚ) : Cut) := by exact_mod_cast rfl
-- ratCast ≤ 1 from q ≤ 1
example (q : ℚ) (h : |q| ≤ 1) : |(q : Cut)| ≤ 1 := by
  rw [show |(q:Cut)| = ((|q|:ℚ):Cut) by exact_mod_cast rfl]
  exact_mod_cast h
