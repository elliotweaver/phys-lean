/-
  # THE CAGE IS EXACT — no cofactor survives (GQ SG-n)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The cage inventory's exactness (with N634's structure + N635's
  dichotomy): a caged leading coefficient with an odd shallow prime
  factor IS that prime.

  * `cage_cofactor_kill` — ★★★ a = p·e, p ≥ 3 shallow (A < 4p²), gate
    3a² ≤ A, e ≥ 2 ⟹ False (3p²e² ≥ 12p² > 4p² > A vs 3a² ≤ A).
  * `cage_odd_exact` — ★★★ THE EXACTNESS: positive cofactor forces
    e = 1 — a = p exactly.

  COMPOSED INVENTORY: a deferring D's box a-values are EXACTLY
  {2^j ≤ gate} ∪ {single band primes p ∈ (√A/2, gate]} — a two-family
  list whose counting closes the uniform route (SG-o): box = h
  (banked ledger) ⟹ h ≤ 2-tower + band count, explicit.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCageCount

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE COFACTOR KILL: a shallow odd prime's cofactor in a
    gate-bounded leading coefficient cannot reach 2. -/
theorem cage_cofactor_kill {a A p e : Z}
    (hgate : 3 * (a * a) ≤ A)
    (hpa : a = p * e) (hp3 : 3 ≤ p)
    (hshallow : A < 4 * (p * p)) (he2 : 2 ≤ e) : False := by
  -- 3p²e² ≤ A < 4p² ⟹ p²(3e² − 4) < 0 with p ≥ 3, e ≥ 2: 3e² − 4 ≥ 8
  have h1 : 3 * ((p * e) * (p * e)) ≤ A := by
    rw [hpa] at hgate
    exact hgate
  have hpp : 0 < p * p := by nlinarith
  have hee : 4 ≤ e * e := by nlinarith
  have hkey : 12 * (p * p) ≤ 3 * ((p * e) * (p * e)) := by nlinarith
  linarith

/-- ★★★ THE EXACTNESS: a caged leading coefficient with an odd shallow
    prime factor IS that prime. -/
theorem cage_odd_exact {a A p e : Z}
    (hgate : 3 * (a * a) ≤ A)
    (hpa : a = p * e) (hp3 : 3 ≤ p) (hepos : 0 < e)
    (hshallow : A < 4 * (p * p)) : a = p := by
  have he1 : 1 ≤ e := z_pos_ge_one hepos
  rcases lt_trichotomy e 2 with h | h | h
  · -- e < 2 with e ≥ 1: e = 1
    have he : e = 1 := by
      have := z_zero_or_one (b := e - 1) (by linarith) (by linarith)
      rcases this with h0 | h1
      · linarith
      · linarith
    rw [hpa, he, mul_one]
  · exfalso
    exact cage_cofactor_kill hgate hpa hp3 hshallow (le_of_eq h.symm)
  · exfalso
    exact cage_cofactor_kill hgate hpa hp3 hshallow (le_of_lt h)


#print axioms cage_cofactor_kill
#print axioms cage_odd_exact

end BQF
end GaussForms
end Phys.Foundation
