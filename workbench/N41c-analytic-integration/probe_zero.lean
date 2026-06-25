import Phys.Cascade.OctonionTopology
import Phys.Algebra.DerivationLeibnizPow
import Mathlib.Topology.Algebra.InfiniteSum.Ring
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD
def expO (D : Module.End ℤ (O Cut)) (x : O Cut) : O Cut :=
  ∑' n, (1 / (n.factorial : Cut)) • ((D ^ n) x)
-- expO 0 = id : only n=0 term survives (0^0=1=id, 0^n=0 for n≥1)
theorem expO_zero (x : O Cut) : expO 0 x = x := by
  unfold expO
  rw [tsum_eq_single 0]
  · simp
  · intro n hn
    rw [zero_pow hn]
    simp
end
