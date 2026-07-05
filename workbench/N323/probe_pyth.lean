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

def cosTermC (x : Cut) (n : ℕ) : Cut := (-1)^n * x ^ (2*n) / ((2*n).factorial : Cut)
def sinTermC (x : Cut) (n : ℕ) : Cut := (-1)^n * x ^ (2*n+1) / ((2*n+1).factorial : Cut)
def cutCos (x : Cut) : Cut := ∑' n, cosTermC x n
def cutSin (x : Cut) : Cut := ∑' n, sinTermC x n

noncomputable def cosCoeff (x : Cut) (N : ℕ) : Cut := ∑ kl ∈ Finset.antidiagonal N, cosTermC x kl.1 * cosTermC x kl.2
noncomputable def sinCoeff (x : Cut) (N : ℕ) : Cut := ∑ kl ∈ Finset.antidiagonal N, sinTermC x kl.1 * sinTermC x kl.2

axiom cosCoeff_summable (x : Cut) : Summable (cosCoeff x)
axiom sinCoeff_summable (x : Cut) : Summable (sinCoeff x)
axiom cutCos_sq_tsum (x : Cut) : cutCos x * cutCos x = ∑' N, cosCoeff x N
axiom cutSin_sq_tsum (x : Cut) : cutSin x * cutSin x = ∑' N, sinCoeff x N
axiom cosCoeff_zero (x : Cut) : cosCoeff x 0 = 1
axiom cancel (x : Cut) (N : ℕ) : cosCoeff x (N+1) + sinCoeff x N = 0

theorem pythagorean (x : Cut) : cutCos x * cutCos x + cutSin x * cutSin x = 1 := by
  rw [cutCos_sq_tsum, cutSin_sq_tsum, (cosCoeff_summable x).tsum_eq_zero_add, cosCoeff_zero, add_assoc]
  have hshift : Summable (fun n => cosCoeff x (n+1)) :=
    (cosCoeff_summable x).comp_injective (add_left_injective 1)
  have hcombine : (∑' n, cosCoeff x (n+1)) + (∑' n, sinCoeff x n)
      = ∑' n, (cosCoeff x (n+1) + sinCoeff x n) := (hshift.tsum_add (sinCoeff_summable x)).symm
  rw [hcombine]
  have hz : (fun n => cosCoeff x (n+1) + sinCoeff x n) = (fun _ => (0:Cut)) := by
    funext n; exact cancel x n
  rw [hz, tsum_zero, add_zero]

end
end ContinuumQ
end Phys.Foundation
