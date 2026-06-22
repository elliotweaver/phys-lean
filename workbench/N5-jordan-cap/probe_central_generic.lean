/- PROBE (run 52, W9.7 EXECUTE): close the generic central identity. -/
import Mathlib.Tactic

namespace ProbeCentralGeneric

variable {R : Type*} [NonAssocRing R]

theorem central_pair00 (n a sp p sa : R)
    (hc : ∀ x : R, n * x = x * n)
    (hAL : ∀ x y : R, n * (x * y) = (n * x) * y)
    (hAM : ∀ x y : R, (x * n) * y = x * (n * y))
    (hAR : ∀ x y : R, (x * y) * n = x * (y * n)) :
    (a*sp + p*sa) * (n + n) + (n + n) * (a*sp + p*sa)
      - (a * (sp*(n+n) + (n+n)*sp) + (p*(n+n) + (n+n)*p) * sa) = 0 := by
  have e2 : p * n * sa = p * sa * n := by rw [hAM p sa, hc sa, ← hAR p sa]
  simp only [mul_add, add_mul, hc]
  rw [← hAR a sp, e2]
  abel

end ProbeCentralGeneric
