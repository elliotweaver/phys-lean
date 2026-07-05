import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

/-- The full (zero-padded) sine coefficient sequence: a(2m+1) = (−1)^m/(2m+1)!, a(even)=0. -/
def sinPad (n : ℕ) : Cut :=
  if Even n then 0 else (-1) ^ (n / 2) / ((n.factorial : Cut))

-- MEASURE 1: f ∘ (2m+1) = sinTermC 1 (pointwise), for the summability reindex
example (m : ℕ) : (fun n => |sinPad n|) (2 * m + 1) = |sinTermC (1 : Cut) m| := by
  simp only [sinPad, sinTermC]
  have hodd : ¬ Even (2 * m + 1) := by simp [Nat.even_add_one, Nat.even_mul]
  rw [if_neg hodd]
  have hdiv : (2 * m + 1) / 2 = m := by omega
  rw [hdiv]
  simp

end
end ContinuumQ
end Phys.Foundation
