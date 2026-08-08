/-
  # THE INVERSE THEOREM — both jaws, one term (GQ SG-ap v2)

  ## What this file proves (SEED-GROWTH campaign, THE SENTENCE)

  The single quantifier string the campaign forces, in both
  directions, ∀D:

  * JAW 1 (seedcount forces h): a touching split odd prime q ≤ Q over
    a disc past 4·Q^(2(H+1)) forces the box past H — deep small-prime
    content EXPELS the disc from every small fiber (the realized
    q-tower, N655/N656/N657, contraposed through the squeeze N658).
  * JAW 2 (small h forces silence): a box within H over a disc past
    the cap forces every touching odd prime ≤ Q to DIVIDE the disc —
    and ramified content bills the box (N660); the residue is the
    factory (N661/N662), whose walled values are PRIME.

  X_m explicit at every m from JAW 1: any m distinct touching split
  odd primes under Q(m) with A ≥ 4·Q(m)^(2(H(m)+1)) force
  h > H(m). The v1 form of this node (a deepness clause 4·P(x)² ≤ A
  on window VALUES) was caught VACUOUS by the W8 costume audit —
  values sit at A/4-scale, deep primes arise only as DIVISORS — and
  was purged uncommitted; this form quantifies over the touching
  primes themselves, is non-vacuous on both jaws (real firings: any
  covered disc; the Heegner landscape), and is the honest sentence.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussFactoryTheorem

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE INVERSE THEOREM (single term, both jaws): for every disc,
    every complete duplicate-free box, every prime budget Q —
    (JAW 1, seedcount forces h): any touching split odd prime q ≤ Q
    with the disc past the cap forces the box past H.
    (JAW 2, small h forces silence): a box within H over a disc past
    the cap forces every touching odd prime ≤ Q to divide the disc.
    One quantifier string; the confinement in both directions. -/
theorem inverse_theorem {c₀ A Q : Z} {H : Nat}
    (hA : A = 4 * c₀ - 1)
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = 1 - 4 * c₀ →
      f ∈ box)
    (hbig : 4 * (zqpow Q (H + 1) * zqpow Q (H + 1)) ≤ A) :
    (∀ q : Z, ∀ p : Re, q = Z.ofRe p → PrimeRe p → 3 ≤ q → q ≤ Q →
      (∃ x w : Z, x * x + x + c₀ = q * w) → ¬ ZDvd q (1 - 4 * c₀) →
      H < box.length) ∧
    (box.length ≤ H →
      ∀ q : Z, ∀ p : Re, q = Z.ofRe p → PrimeRe p → 3 ≤ q → q ≤ Q →
      ∀ x w : Z, x * x + x + c₀ = q * w → ZDvd q (1 - 4 * c₀)) := by
  constructor
  · -- JAW 1: the squeeze contraposed — a coprime toucher forces h > H
    intro q p hq hprime hq3 hqQ ⟨x, w, htouch⟩ hqndD
    by_contra hle
    push_neg at hle
    have hH : box.length ≤ H := by omega
    have hsq := touching_squeeze hA hq hprime hq3 htouch hqndD box
      hboxpw hcomplete hH
    have hmono : zqpow q (H + 1) ≤ zqpow Q (H + 1) :=
      zqpow_base_mono (by linarith) hqQ (H + 1)
    have hqp : 0 < zqpow q (H + 1) := zqpow_pos3 hq3 (H + 1)
    nlinarith
  · -- JAW 2: the dichotomy — small box forces the divide
    intro hH q p hq hprime hq3 hqQ x w htouch
    exact small_h_dichotomy hA box hboxpw hcomplete hH hbig
      q p hq hprime hq3 hqQ x w htouch

#print axioms inverse_theorem

end BQF
end GaussForms
end Phys.Foundation
