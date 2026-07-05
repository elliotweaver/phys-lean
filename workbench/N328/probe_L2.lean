import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set Finset
open scoped Topology BigOperators

noncomputable section

def sinPad (n : ℕ) : Cut :=
  if Even n then 0 else (-1) ^ (n / 2) / ((n.factorial : Cut))

-- the padded series term at index n, as a function of h
-- want: (fun n => h^n * sinPad n) reindexes to sinTermC h under n = 2m+1

-- MEASURE 2a: the padded even terms vanish
example (h : Cut) (m : ℕ) : h ^ (2*m) * sinPad (2*m) = 0 := by
  simp only [sinPad]
  rw [if_pos (by simp [Nat.even_mul] : Even (2*m))]
  ring

-- MEASURE 2b: the padded odd term equals sinTermC h m
example (h : Cut) (m : ℕ) : h ^ (2*m+1) * sinPad (2*m+1) = sinTermC h m := by
  simp only [sinPad, sinTermC]
  have hodd : ¬ Even (2 * m + 1) := by simp [Nat.even_mul]
  rw [if_neg hodd]
  have hdiv : (2 * m + 1) / 2 = m := by omega
  rw [hdiv]
  ring

end
end ContinuumQ
end Phys.Foundation
