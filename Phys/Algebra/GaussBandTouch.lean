/-
  # THE BAND-TOUCH COFACTOR KILL — B_touch collapses (GQ SG-p)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The uniform summit's engine (PREREG-35: max B_touch = 3 over the
  entire deferring population to 1e5; 1019/1019 band touches in
  balanced form — the fold's records read exactly):

  * `band_value_bound` — ★ a band prime's least-root touch value is
    small: 4pq = y² + A with y ≤ p and the gate 3p² ≤ A give 3pq ≤ A.
  * `band_cofactor_kill` — ★★★ THE KILL: two band primes cannot share
    a band touch's cofactor — 3pq ≤ A forces 4q > A vs q(3p−4) < 0,
    dead. A band touch's cofactor carries at most ONE band prime:
    B_touch counting collapses to the value census.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCageAssembly

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★ The least-root value bound: a band prime's touch value is small —
    3pq ≤ A. -/
theorem band_value_bound {p q A y : Z}
    (hy0 : 0 ≤ y) (hyp : y ≤ p)
    (hval : 4 * (p * q) = y * y + A)
    (hgate : 3 * (p * p) ≤ A) :
    3 * (p * q) ≤ A := by
  have hyy : y * y ≤ p * p := by nlinarith
  -- 4pq ≤ p² + A; 12pq ≤ 3p² + 3A ≤ A + 3A
  nlinarith

/-- ★★★ THE BAND-TOUCH COFACTOR KILL: two band primes cannot share a
    band touch's cofactor. -/
theorem band_cofactor_kill {p q A r s e : Z}
    (hApos : 0 < A) (hqpos : 0 < q)
    (hsize : 3 * (p * q) ≤ A) (hp3 : 3 ≤ p)
    (hq : q = r * s * e) (he1 : 1 ≤ e)
    (hr : A < 4 * (r * r)) (hs : A < 4 * (s * s))
    (hrpos : 0 < r) (hspos : 0 < s) : False := by
  -- rs ≤ q; 16(rs)² > A²; so (4q)² ≥ (4rs)² > A² ⟹ 4q > A
  have hrs_le : r * s ≤ q := by nlinarith
  have h16 : A * A < 16 * ((r * s) * (r * s)) := by nlinarith
  have h4q : A < 4 * q := by nlinarith [sq_nonneg (4 * q - A), sq_nonneg (4 * q + A)]
  -- 3pq ≤ A < 4q ⟹ q(3p − 4) < 0 with q > 0, p ≥ 3: dead
  nlinarith


#print axioms band_value_bound
#print axioms band_cofactor_kill

end BQF
end GaussForms
end Phys.Foundation
