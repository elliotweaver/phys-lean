import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationAutExp
import Mathlib.Topology.Algebra.InfiniteSum.Ring
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD
-- Can O-Cut Summable reduce entrywise like matrices?  O Cut = CD(CD(Dbl Cut)).
-- The toProd projections give re/im components. Is there a Pi.summable analogue?
-- Probe: summability of a CD-valued series via its two component series.
example (f : ℕ → O Cut)
    (hre : Summable (fun n => (f n).re)) (him : Summable (fun n => (f n).im)) :
    Summable f := by
  exact?
end
