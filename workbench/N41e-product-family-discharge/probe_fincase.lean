import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

example (a b : ℕ → O Cut) :
    Summable (fun kl : ℕ × ℕ => coordOCut (a kl.1 * b kl.2)) := by
  rw [Pi.summable]
  intro m
  fin_cases m
  · trace_state
    sorry
  all_goals sorry

end
end Phys.Algebra
