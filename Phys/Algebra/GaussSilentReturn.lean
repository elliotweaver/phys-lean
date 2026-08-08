/-
  # THE SILENT RETURN — silence forces primality (GQ SG-an)

  ## What this file proves (SEED-GROWTH campaign, THE RETURN LAW'S
  ENGINE)

  The fold's return: a branch silent below Q cannot hide its values —
  under the square wall they are PRIME (the factory at full rate,
  Euler's mechanism as the fold's own bookkeeping).

  * `silent_value_prime` — ★★★ THE SILENT RETURN (∀ value): v ≥ 1,
    odd, v ≤ Q(Q+2), no odd prime ≤ Q divides v ⟹ v = 1 or v is
    prime in the divisor-shape sense (every Bezout-witnessed divisor
    trivial). Proof: any proper factorization g·c = v has
    min(g,c) ≤ Q by the wall ((Q+1)² > Q(Q+2)); both factors odd;
    silence kills every odd divisor in [3, Q]; integrality
    (z_pos_ge_one step-downs) closes the boundary.

  With the trichotomy (N658/N659/N660): a small-h box over a large
  disc forces total silence below Q, and THIS node turns silence into
  a wall-to-wall prime factory — the window values under Q(Q+2) are
  all prime. The billing composition (each prime value a fresh deep
  touch through the branch identity) is the final assembly.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussAmbiguousArm

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE RETURN: a silent-below-Q branch value under the square
    wall Q(Q+2) is 1 or prime. (The Rabinowitsch square-wall argument
    with the silence hypothesis discharging every candidate factor.) -/
theorem silent_value_prime {Q v : Z}
    (hQ3 : 3 ≤ Q)
    (hv1 : 1 ≤ v) (hwall : v ≤ Q * (Q + 2))
    (hodd : ¬ ZDvd (2 : Z) v)
    (hsilent : ∀ r mr : Z, r = 2 * mr + 1 → 1 ≤ mr → r ≤ Q → ¬ ZDvd r v) :
    v = 1 ∨ ∀ g a b : Z, 0 < g → ZDvd g v → g = a * v + b * g → g = 1 ∨ g = v := by
  -- kernel shape: either v = 1, or every Bezout-witnessed divisor of v
  -- is trivial — v is prime in the divisor-shape sense used by the
  -- production chain (prime_divisor_classification's target form).
  rcases lt_trichotomy v 1 with hlt | heq | hgt
  · exfalso; linarith
  · exact Or.inl heq
  · right
    intro g a b hgpos hgdvd hbez
    -- g | v: either g = 1 or g has a prime factor r ≤ √v... the
    -- DIRECT route: g ≤ v (divisor of positive), and if 1 < g < v
    -- then the cofactor c = v/g satisfies 1 < c, and min(g,c)² ≤ v ≤
    -- Q(Q+2) < (Q+1)²... so min(g,c) ≤ Q; its parity: odd (v odd) —
    -- but EVERY odd divisor d with 3 ≤ d ≤ Q is killed by silence
    -- (d | g | v). The remaining case: min(g,c) = 1 — g = 1 or c = 1
    -- (g = v). Kernel: work with g directly — g odd (divides odd v),
    -- so g = 1, or 3 ≤ g; if 3 ≤ g ≤ Q silence kills; if Q < g < v
    -- then c = v/g < v/Q ≤ Q+2, c odd, c ≥ 3 would be ≤ Q+1 — c odd
    -- ≤ Q+1 means c ≤ Q (Q+1 even when Q odd... Q ≥ 3 arbitrary: c
    -- odd and c ≤ Q+1; if c = Q+1 then Q even — allowed... handle:
    -- c ≤ Q+1 and c odd; silence kills 3 ≤ c ≤ Q; c = Q+1 odd forces
    -- Q even ⟹ Q ≥ 4 ⟹ c = Q+1 ≥ 5 and c² = (Q+1)² > Q(Q+2) = v·(g/c
    -- ...) — wait c·g = v ≤ Q(Q+2) = (Q+1)² − 1 < (Q+1)² = c² ⟹ g < c
    -- ⟹ g ≤ Q (g odd < c = Q+1) ⟹ silence kills g (3 ≤ g ≤ Q) or
    -- g = 1. So: c = 1 ⟹ g = v. All cases close.
    obtain ⟨c, hc⟩ := hgdvd
    have hcpos : 0 < c := by
      rcases lt_trichotomy c 0 with h | h | h
      · exfalso; nlinarith
      · exfalso; rw [h, mul_zero] at hc; linarith
      · exact h
    -- g odd: 2 | g would give 2 | v
    have hgodd : ¬ ZDvd (2 : Z) g := by
      intro ⟨t, ht⟩
      exact hodd ⟨t * c, by rw [hc, ht]; ring⟩
    -- c odd similarly
    have hcodd : ¬ ZDvd (2 : Z) c := by
      intro ⟨t, ht⟩
      exact hodd ⟨g * t, by rw [hc, ht]; ring⟩
    -- g = 2mg+1 form
    obtain ⟨mg, hmg | hmg⟩ := z_parity g
    · exact absurd ⟨mg, hmg⟩ hgodd
    obtain ⟨mc, hmc | hmc⟩ := z_parity c
    · exact absurd ⟨mc, hmc⟩ hcodd
    -- case g = 1
    rcases lt_trichotomy g 1 with hg1 | hg1 | hg1
    · exfalso
      have := z_pos_ge_one hgpos
      linarith
    · exact Or.inl hg1
    · -- g ≥ 3 (odd > 1)
      have hg3 : 3 ≤ g := by
        have hmgpos : 0 < mg := by linarith
        have hmg1 : 1 ≤ mg := z_pos_ge_one hmgpos
        linarith
      -- case c = 1: g = v
      rcases lt_trichotomy c 1 with hc1 | hc1 | hc1
      · exfalso
        have := z_pos_ge_one hcpos
        linarith
      · exact Or.inr (by rw [hc, hc1, mul_one])
      · -- c ≥ 3 (odd > 1): both g, c ≥ 3 — the wall kills
        exfalso
        have hc3 : 3 ≤ c := by
          have hmcpos : 0 < mc := by linarith
          have hmc1 : 1 ≤ mc := z_pos_ge_one hmcpos
          linarith
        -- min(g, c) ≤ Q: else both ≥ Q+1 (odd ⟹ both ≥ Q+1... need
        -- ≤ Q for silence): suppose g ≥ Q+1 AND c ≥ Q+1 — then
        -- v = gc ≥ (Q+1)² > Q(Q+2) ≥ v: dead. So g ≤ Q or c ≤ Q.
        rcases lt_trichotomy g (Q + 1) with hgQ | hgQ | hgQ
        · -- g ≤ Q: silence kills g (3 ≤ g ≤ Q, odd)
          have hgle : g ≤ Q := by
            by_contra hgt
            push_neg at hgt
            have := z_pos_ge_one (show (0:Z) < g - Q by linarith)
            linarith
          have hmg1 : 1 ≤ mg := z_pos_ge_one (by linarith)
          exact hsilent g mg hmg hmg1 hgle ⟨c, hc⟩
        · -- g = Q+1: gc ≥ (Q+1)·3 vs... c ≥ 3: if c ≤ Q silence
          -- kills c; else c ≥ Q+1 and v ≥ (Q+1)² > Q(Q+2): dead
          rcases lt_trichotomy c (Q + 1) with hcQ | hcQ | hcQ
          · have hcle : c ≤ Q := by
              by_contra hgt
              push_neg at hgt
              have := z_pos_ge_one (show (0:Z) < c - Q by linarith)
              linarith
            have hmc1 : 1 ≤ mc := z_pos_ge_one (by linarith)
            exact hsilent c mc hmc hmc1 hcle ⟨g, by rw [hc]; ring⟩
          · nlinarith
          · nlinarith
        · -- g > Q+1: c ≤ Q (else v > Q(Q+2)) — silence kills c
          rcases lt_trichotomy c (Q + 1) with hcQ | hcQ | hcQ
          · have hcle : c ≤ Q := by
              by_contra hgt
              push_neg at hgt
              have := z_pos_ge_one (show (0:Z) < c - Q by linarith)
              linarith
            have hmc1 : 1 ≤ mc := z_pos_ge_one (by linarith)
            exact hsilent c mc hmc hmc1 hcle ⟨g, by rw [hc]; ring⟩
          · nlinarith
          · nlinarith


#print axioms silent_value_prime

end BQF
end GaussForms
end Phys.Foundation
