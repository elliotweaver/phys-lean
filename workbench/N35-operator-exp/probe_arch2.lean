import Phys.Foundation.ContinuumTopology
import Mathlib.Algebra.Order.CompleteField
import Mathlib.Topology.Order.MonotoneConvergence

open Phys.Foundation Filter
open scoped Topology

namespace Phys.Foundation.ContinuumQ

-- Q1: Archimedean Cut as machinery (the scoped instance from banked completeness = C6 eternal approach)
example : Archimedean Cut := ConditionallyCompleteLinearOrderedField.to_archimedean

-- Q2: monotone bounded convergence via ORDER topology (no metric) — the C6 eternal approach as convergence
example (f : ℕ → Cut) (hmono : Monotone f) (hbdd : BddAbove (Set.range f)) :
    Tendsto f atTop (𝓝 (⨆ i, f i)) :=
  tendsto_atTop_ciSup hmono hbdd

-- Q3: SupConvergenceClass synthesizes for Cut (LinearOrder + OrderTopology)?
#synth SupConvergenceClass Cut

end Phys.Foundation.ContinuumQ
