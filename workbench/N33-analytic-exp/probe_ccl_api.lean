/-
  N33 W9 MEASUREMENT PROBE 2 (bounded — #check fail fast).
  GOAL: survey the Mathlib helper-constructor API for building
  `ConditionallyCompleteLinearOrder` / `ConditionallyCompleteLattice` from an sSup
  that is the LUB of nonempty bounded-above sets, plus IsLUB / BddAbove.
-/
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Order.Bounds.Basic

#check @IsLUB
#check @BddAbove
#check @upperBounds
#check @conditionallyCompleteLatticeOfsSup
#check @conditionallyCompleteLatticeOfLatticeOfsSup
#check @ConditionallyCompleteLinearOrder
#check @ConditionallyCompleteLattice.toConditionallyCompleteLinearOrder
-- the LUB axioms a CCL needs:
#check @le_csSup
#check @csSup_le
