/- N234 probe 5 — decide over Finset.sum on ℤ (kills the foldr bridge). -/
import Mathlib.Data.Fin.VecNotation
import Mathlib.Algebra.BigOperators.Fin

namespace N234Probe5

def f : Fin 3 → Fin 3 → ℤ := ![![1, 2, 0], ![0, 1, 0], ![0, 0, 1]]
def g : Fin 3 → Fin 3 → ℤ := ![![1, -2, 0], ![0, 1, 0], ![0, 0, 1]]

theorem inv_test : ∀ i k : Fin 3,
    ∑ j : Fin 3, f i j * g j k = (if i = k then 1 else 0) := by decide

end N234Probe5
