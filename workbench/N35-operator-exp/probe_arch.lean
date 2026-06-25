import Phys.Foundation.ContinuumTopology
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Topology.Order.MonotoneConvergence
import Mathlib.Topology.Algebra.Order.Archimedean

open Phys.Foundation
open scoped ConditionallyCompleteLinearOrderedField

namespace Phys.Foundation.ContinuumQ

-- Q1: Archimedean Cut reachable as machinery from banked completeness? (the C6 property)
#synth Archimedean Cut

-- Q2: monotone bounded convergence via the ORDER topology (no metric needed)?
-- tendsto_atTop_ciSup : Monotone f → BddAbove (range f) → Tendsto f atTop (nhds (⨆ i, f i))
#check @tendsto_atTop_ciSup

-- Q3: does a uniform structure come for free from anything on Cut now?
#synth UniformSpace Cut

end Phys.Foundation.ContinuumQ
