import Phys.Algebra.DerivationOExpSummable

namespace Counterexamples
open Phys.Algebra Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- CANDIDATE C: claim the UN-NORMALIZED series (drop the 1/n! factorial that makes the operator-norm
-- majorant converge) is summable, routing through expO_summable via .congr. Leaves the false
-- per-term identity (1/n!)•(D'^n x) = (D'^n) x as an unsolved goal.
theorem candC (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Summable (fun n => (D' ^ n) x) := by
  refine (expO_summable D' x).congr (fun n => ?_)

end
end Counterexamples
