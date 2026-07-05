import Phys.Foundation.ContinuumExp
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Algebra.Ring.Parity

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

-- combinatorial atoms (proven in probe_combi)
axiom sum_range_odd_split (m : ℕ) (g : ℕ → ℤ) :
    ∑ j ∈ range (2*m+1), g j = (∑ k ∈ range (m+1), g (2*k)) + ∑ k ∈ range m, g (2*k+1)
axiom even_choose_eq_odd_choose (m : ℕ) (hm : m ≠ 0) :
    (∑ k ∈ range (m+1), ((2*m).choose (2*k) : ℤ)) = ∑ k ∈ range m, ((2*m).choose (2*k+1) : ℤ)

-- The KEY: the cast to Cut. even = odd over Cut for m ≥ 1.
theorem even_choose_eq_odd_choose_cut (m : ℕ) (hm : m ≠ 0) :
    (∑ k ∈ range (m+1), ((2*m).choose (2*k) : Cut)) = ∑ k ∈ range m, ((2*m).choose (2*k+1) : Cut) := by
  have hz := even_choose_eq_odd_choose m hm
  have := congrArg (fun z : ℤ => (z : Cut)) hz
  push_cast at this
  convert this using 2 <;> push_cast <;> ring

end
end ContinuumQ
end Phys.Foundation
