/-
  # THE AMBIGUOUS ARM — ramified primes bill h (GQ SG-am)

  ## What this file proves (SEED-GROWTH campaign, THE GATHER'S OWN ARM)

  The fold reading: a prime q | D is the gather's SELF-CONJUGATE
  content — its ambiguous form ⟨q, q, c⟩ IS a box member whenever q
  clears the gate. This closes the dichotomy's q | D escape (N659):
  under a small box over a large disc, every small odd prime is now
  BLOCKED or BILLING — no third state.

  * `ambiguous_slot` — ★★★ (∀D): A = 4c₀ − 1, q odd ≥ 3, q | A
    (ramified), 3q² ≤ A ⟹ ∃ reduced PosDef form of the disc with
    a = q AND b = q (the self-conjugate signature). Pure parity
    descent: A odd kills even cofactors; q odd forces the half-sum
    even; the gate arithmetic forces c ≥ a.

  THE COMPLETE TRICHOTOMY at any disc, per small odd prime q ≤ Q,
  under box ≤ H and A ≥ the explicit caps:
    q touches, q ∤ D  → dead (squeeze N658)
    q | D, gate       → bills h (this node + the counting engines)
    else              → q is BLOCKED (never divides a branch value)
  The residue of the covered region is TOTAL SILENCE below Q — the
  return-law frontier, now with no side doors.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussDichotomy

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE AMBIGUOUS ARM: a ramified odd prime under the gate is a
    reduced leading coefficient — the gather's self-conjugate form. -/
theorem ambiguous_slot {c₀ A q k mq : Z} (hA : A = 4 * c₀ - 1)
    (hq : q = 2 * mq + 1) (hmq : 1 ≤ mq)
    (hram : A = q * k) (hgate : 3 * (q * q) ≤ A) :
    ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = 1 - 4 * c₀ ∧
      f.a = q ∧ f.b = q := by
  have hq3 : 3 ≤ q := by linarith
  have hqpos : 0 < q := by linarith
  -- k is odd (A odd): parity descent
  obtain ⟨mk, hk | hk⟩ := z_parity k
  · -- k = 2mk: A = 2q·mk even — dead against A = 4c₀ − 1
    exfalso
    have : 2 * (q * mk - 2 * c₀) = -1 := by
      rw [hk] at hram
      linarith [hram]
    rcases lt_trichotomy (q * mk - 2 * c₀) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) < -(q * mk - 2 * c₀) by linarith)]
    · rw [hc] at this; norm_num at this
    · nlinarith [z_pos_ge_one hc]
  -- q + k = 2s with s = mq + mk + 1 explicit
  set s := mq + mk + 1 with hs
  have hqk2 : q + k = 2 * s := by rw [hq, hk, hs]; ring
  -- q·s is even: 2·q·s = q(q+k) = q² + A = 4(mq² + mq + c₀)
  have hqs : q * s = 2 * (mq * mq + mq + c₀) := by
    have h4 : q * (q + k) = q * q + A := by rw [hram]; ring
    rw [hqk2] at h4
    have hsq : q * q = 4 * (mq * mq) + 4 * mq + 1 := by rw [hq]; ring
    have hAe : A = 4 * c₀ - 1 := hA
    nlinarith [h4]
  -- s is even: s = 2u (q odd kills the odd case)
  obtain ⟨u, hu | hu⟩ := z_parity s
  swap
  · -- s = 2u+1: q·s odd·odd = odd, but = even: dead
    exfalso
    rw [hu, hq] at hqs
    have : 2 * ((mq * mq + mq + c₀) - (2 * mq * u + mq + u)) = 1 := by
      nlinarith [hqs]
    rcases lt_trichotomy ((mq * mq + mq + c₀) - (2 * mq * u + mq + u)) 0 with hc | hc | hc
    · nlinarith [z_pos_ge_one (show (0:Z) <
        -((mq * mq + mq + c₀) - (2 * mq * u + mq + u)) by linarith)]
    · rw [hc] at this; norm_num at this
    · nlinarith [z_pos_ge_one hc]
  -- the form: ⟨q, q, u⟩ with 4qu = q² + A
  have hqu : 4 * q * u = q * q + A := by
    have h4 : q * (q + k) = q * q + A := by rw [hram]; ring
    rw [hqk2, hu] at h4
    linarith [h4]
  -- c ≥ a from the gate: 4qu = q² + A ≥ 4q² ⟹ u ≥ q
  have huq : q ≤ u := by nlinarith
  have hupos : 0 < u := by linarith
  refine ⟨⟨q, q, u⟩, ⟨by linarith, le_refl q, huq⟩, ⟨hqpos, hupos⟩, ?_, rfl, rfl⟩
  show q * q - 4 * q * u = 1 - 4 * c₀
  rw [hqu]
  linarith [hA]


#print axioms ambiguous_slot

end BQF
end GaussForms
end Phys.Foundation
