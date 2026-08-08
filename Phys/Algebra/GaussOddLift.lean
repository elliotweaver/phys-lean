/-
  # THE ODD LIFT — touching split odd primes climb their tower
  (GQ SG-ah)

  ## What this file proves (SEED-GROWTH campaign, AUDIT WELD 2 ENGINE)

  The q-analogue of the occupation lift (N654): a touching odd prime
  q (∃x: q | P(x)) with q ∤ D climbs every power of its own tower.
  NO modular inverses — Bezout (gcd_bezout_exists) + the prime
  classification (prime_divisor_classification, production) give
  1 = aq + vb whenever q ∤ b, and the lift coefficient t = −u·v
  closes with ONE identity: u + t·b = u(1 − vb) = u·a·q.

  * `zqpow` — the q-tower.
  * `hensel_odd_step` — ★★★ THE LIFT STEP: q prime (Re-witnessed),
    q ∤ D, stage k ≥ 1 exists ⟹ stage k+1 exists (q ∤ b DERIVED
    from q ∤ D inside the step).
  * `hensel_odd` — ★★★ THE TOWER: touching (base k = 1 via the
    branch identity 4P(x) = (2x+1)² − D) + the step ⟹ every stage.

  Toward the inert-arm growth law: with the occupation pattern
  (N654's normalization), realized q-power leading coefficients give
  h ≥ tower length at ANY disc with a touching split odd prime —
  removing the record-table dependence from the inert arm of X_m.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussOccupation

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- The q-tower. -/
def zqpow (q : Z) : Nat → Z
  | 0 => 1
  | n + 1 => q * zqpow q n

theorem zqpow_succ (q : Z) (n : Nat) : zqpow q (n + 1) = q * zqpow q n := rfl

/-- ★★★ THE LIFT STEP: one stage climbs, Bezout-powered. -/
theorem hensel_odd_step {q D : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p)
    (hqndD : ¬ ZDvd q D) (k : Nat) (hk : 1 ≤ k) :
    (∃ b u : Z, b * b - D = 4 * zqpow q k * u) →
    (∃ b u : Z, b * b - D = 4 * zqpow q (k + 1) * u) := by
  intro ⟨b, u, hbu⟩
  have hqne : q ≠ 0 := prime_ne_zero hq hprime
  obtain ⟨k', rfl⟩ : ∃ k', k = k' + 1 := ⟨k - 1, by omega⟩
  -- q ∤ b (else q | D)
  have hqndb : ¬ ZDvd q b := by
    intro ⟨c, hc⟩
    apply hqndD
    refine ⟨q * c * c - 4 * zqpow q k' * u, ?_⟩
    rw [zqpow_succ] at hbu
    have hD : D = (q * c) * (q * c) - 4 * (q * zqpow q k') * u := by
      rw [hc] at hbu
      linarith
    rw [hD]
    ring
  -- Bezout + classification: 1 = a·q + v·b
  obtain ⟨g, hgpos, hgq, hgb, a, v, hbez⟩ := gcd_bezout_exists q b hqne
  have hg1 : g = 1 := by
    rcases prime_divisor_classification hq hprime hgpos hgq with h1 | hgq'
    · exact h1
    · exfalso; exact hqndb (by rw [← hgq']; exact hgb)
  rw [hg1] at hbez
  -- the lift: b' = b + 2·q^k·t with t = −u·v
  refine ⟨b + 2 * zqpow q (k' + 1) * (-(u * v)),
          u * a + zqpow q k' * (-(u * v)) * (-(u * v)), ?_⟩
  have hzz : zqpow q (k' + 1) * zqpow q (k' + 1)
      = q * (zqpow q (k' + 1) * zqpow q k') := by
    rw [zqpow_succ]; ring
  have hz2 : zqpow q (k' + 2) = q * zqpow q (k' + 1) := rfl
  -- u + t·b = u·(1 − v·b) = u·a·q  [from 1 = aq + vb]
  -- b'² − D = (b² − D) + 4·q^k·t·b + 4·q^{2k}·t²
  --         = 4·q^k·(u + t·b) + 4·q^k·q^k·t²
  --         = 4·q^{k+1}·(u·a) + 4·q^{k+1}·q^{k−1}·t²
  calc (b + 2 * zqpow q (k' + 1) * (-(u * v))) * (b + 2 * zqpow q (k' + 1) * (-(u * v))) - D
      = (b * b - D) + 4 * zqpow q (k' + 1) * (-(u * v)) * b
        + 4 * (zqpow q (k' + 1) * zqpow q (k' + 1)) * ((-(u * v)) * (-(u * v))) := by
        ring
    _ = 4 * zqpow q (k' + 1) * (u + (-(u * v)) * b)
        + 4 * (q * (zqpow q (k' + 1) * zqpow q k')) * ((-(u * v)) * (-(u * v))) := by
        rw [hbu, hzz]; ring
    _ = 4 * zqpow q (k' + 1) * (u * (a * q))
        + 4 * (q * (zqpow q (k' + 1) * zqpow q k')) * ((-(u * v)) * (-(u * v))) := by
        have hub : u + (-(u * v)) * b = u * (a * q) := by
          have h1vb : 1 - v * b = a * q := by linarith [hbez]
          calc u + (-(u * v)) * b = u * (1 - v * b) := by ring
            _ = u * (a * q) := by rw [h1vb]
        rw [hub]
    _ = 4 * zqpow q (k' + 2) * (u * a + zqpow q k' * (-(u * v)) * (-(u * v))) := by
        rw [hz2]; ring

/-- ★★★ THE TOWER: a touching split odd prime climbs every stage. -/
theorem hensel_odd {q c₀ x w : Z} {p : Re}
    (hq : q = Z.ofRe p) (hprime : PrimeRe p)
    (htouch : x * x + x + c₀ = q * w)
    (hqndD : ¬ ZDvd q (1 - 4 * c₀)) :
    ∀ k : Nat, 1 ≤ k → ∃ b u : Z, b * b - (1 - 4 * c₀) = 4 * zqpow q k * u := by
  intro k hk
  induction k with
  | zero => omega
  | succ n ih =>
      rcases Nat.eq_or_lt_of_le hk with h1 | hgt
      · -- n + 1 = 1: the base from touching
        refine ⟨2 * x + 1, w, ?_⟩
        have : n = 0 := by omega
        subst this
        simp only [zqpow]
        nlinarith [htouch]
      · -- n ≥ 1: step from ih
        have hn1 : 1 ≤ n := by omega
        exact hensel_odd_step hq hprime hqndD n hn1 (ih hn1)


#print axioms hensel_odd_step
#print axioms hensel_odd

end BQF
end GaussForms
end Phys.Foundation
