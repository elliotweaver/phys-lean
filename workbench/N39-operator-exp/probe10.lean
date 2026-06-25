import Phys.Algebra.DerivationAutOpNorm
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.Basic
namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- the 5 scalar levers (assumed banked in ContinuumExp):
axiom cut_summable_of_nonneg_of_le {f g : ℕ → Cut} (hf : ∀ n, 0 ≤ f n)
    (hfg : ∀ n, f n ≤ g n) (hg : Summable g) : Summable f
axiom cut_summable_of_abs {f : ℕ → Cut} (h : Summable (fun n => |f n|)) : Summable f
axiom cut_summable_pow_div_factorial {c : Cut} (hc : 0 ≤ c) :
    Summable (fun n => c ^ n / (n.factorial : Cut))

-- the matrix exponential term
def expTerm (D : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) : Matrix (Fin 8) (Fin 8) Cut :=
  (1 / (n.factorial : Cut)) • (D ^ n)

-- TARGET (c): the matrix power series is Summable.
theorem expTerm_summable (D : Matrix (Fin 8) (Fin 8) Cut) : Summable (expTerm D) := by
  rw [Matrix.summable_iff]  -- guess; else Pi.summable twice
  sorry

end
end Phys.Algebra
