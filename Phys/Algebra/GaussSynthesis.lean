/-
  # THE SYNTHESIS KIT — supply to seedcount (GQ SG-ay)

  ## What this file proves (SEED-GROWTH campaign, AUDIT-5 SYNTHESIS)

  The auditor's synthesis decomposes as SUPPLY (m deep touchers
  exist) → CONVERSION (seedcount ≥ m). This file banks the
  CONVERSION whole and the supply arms:

  * `supply_to_seedcount` — ★★★ (∀D): any pairwise-distinct list of
    odd deep touching primes bounds every complete touching list
    from below. The literal seedcount conversion, one term.
  * `ramified_supply_member` — ★★ ramified primes are supply (the
    half-witness N664).
  * `inroot_divisor_deep` — ★★ in-root divisors of quarter-window
    values are deep — compositeness feeds supply.
  * `silent_supply_distinct` — ★★★ at a silent disc, distinct
    composite low positions carry PAIRWISE-DISTINCT deep touchers:
    a shared prime s > Q divides (x′−x)(x+x′+1) ≤ span ≤ Q < s
    (the repeat law + prime Euclid) — dead. Silence forces its
    composites to diversify their touchers.

  THE SEAM (per the audit discipline, stated not hidden): the one
  unproved implication in the ∀m string is SUPPLY AT TOTALLY-SILENT
  DISCS. Touch-rich and ramified discs supply themselves (JAW 1
  N663 / N664); silent discs with ≥ m composite low positions supply
  themselves (this file); the residual — silent AND < m composite
  low positions: the all-prime window — is the Euler-factory tail
  whose emptiness the census confirms at every observed depth and
  whose kernel closure is the return-law campaign.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussRepeatLaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE CONVERSION: an m-supply of deep touching odd primes
    forces every complete touching list past m. -/
theorem supply_to_seedcount {c₀ A : Z}
    (qs : List Z)
    (hqspw : List.Pairwise (· ≠ ·) qs)
    (hqs : ∀ q ∈ qs, (∃ mq : Z, q = 2 * mq + 1 ∧ 1 ≤ mq) ∧
      4 * (q * q) ≤ A ∧ (∃ x w : Z, x * x + x + c₀ = q * w))
    (ps : List Z)
    (hpscomplete : ∀ p mp : Z, p = 2 * mp + 1 → 1 ≤ mp →
      4 * (p * p) ≤ A → (∃ x w : Z, x * x + x + c₀ = p * w) → p ∈ ps)
    (hpspw : List.Pairwise (· ≠ ·) ps) :
    qs.length ≤ ps.length := by
  refine pairwise_subset_length qs ps hqspw hpspw ?_
  intro q hq
  obtain ⟨⟨mq, hqm, hmq1⟩, hdeep, htouch⟩ := hqs q hq
  exact hpscomplete q mq hqm hmq1 hdeep htouch

/-- ★★ Ramified primes are supply: the half-witness converts q | D
    into the touch witness. -/
theorem ramified_supply_member {c₀ q mq k A : Z}
    (hq : q = 2 * mq + 1) (hmq : 1 ≤ mq)
    (hram : 1 - 4 * c₀ = q * k) (hdeep : 4 * (q * q) ≤ A) :
    (∃ mq' : Z, q = 2 * mq' + 1 ∧ 1 ≤ mq') ∧
      4 * (q * q) ≤ A ∧ (∃ x w : Z, x * x + x + c₀ = q * w) := by
  obtain ⟨w, hw⟩ := ramified_touch hq hram
  exact ⟨⟨mq, hq, hmq⟩, hdeep, ⟨mq, w, hw⟩⟩

/-- ★★ Deepness of in-root divisors at low positions: s² ≤ P(x) and
    P(x) in the quarter-window (4·P(x) ≤ A... i.e. x small) ⟹ s deep.
    The bridge from compositeness to deep supply. -/
theorem inroot_divisor_deep {c₀ A x s : Z}
    (hA : 0 < A)
    (hsq : s * s ≤ x * x + x + c₀)
    (hlow : 4 * (x * x + x + c₀) ≤ A) :
    4 * (s * s) ≤ A := by
  nlinarith

/-- ★★★ THE SILENT SUPPLY: at a silent disc, distinct composite
    low positions inside a span shorter than the silence budget give
    PAIRWISE-DISTINCT deep touchers — the repeat law kills sharing:
    a shared prime s divides (x′−x)(x+x′+1), both factors positive
    and < s (prime s > Q ≥ span data) — dead. -/
theorem silent_supply_distinct {c₀ Q s x x' w w' : Z} {p : Re}
    (hs : s = Z.ofRe p) (hprime : PrimeRe p)
    (hsQ : Q < s)
    (hv : x * x + x + c₀ = s * w) (hv' : x' * x' + x' + c₀ = s * w')
    (hxx : x < x') (hx0 : 0 ≤ x)
    (hspan : x + x' + 1 ≤ Q) :
    False := by
  -- s | (x′−x)(x+x′+1) via the difference law
  have hlaw : s * (w' - w) = (x' - x) * (x + x' + 1) :=
    repeat_difference_law hv hv'
  -- s prime divides the product ⟹ divides a factor (prime_euclid)
  have hdvd : ZDvd s ((x' - x) * (x + x' + 1)) := ⟨w' - w, hlaw.symm⟩
  rcases prime_euclid hs hprime _ _ hdvd with ⟨c, hc⟩ | ⟨c, hc⟩
  · -- s | (x′−x): 0 < x′−x ≤ x+x′+1 ≤ Q < s — dead
    have h1 : 0 < x' - x := by linarith
    have h2 : x' - x < s := by linarith
    -- s·c = x′−x with 0 < x′−x < s forces 0 < c < 1: kill by integrality
    have hcpos : 0 < c := by nlinarith [z_pos_ge_one (show (0:Z) < s by linarith)]
    have hc1 : 1 ≤ c := z_pos_ge_one hcpos
    nlinarith
  · -- s | (x+x′+1): 0 < x+x′+1 ≤ Q < s — dead
    have h1 : 0 < x + x' + 1 := by linarith
    have hcpos : 0 < c := by nlinarith [z_pos_ge_one (show (0:Z) < s by linarith)]
    have hc1 : 1 ≤ c := z_pos_ge_one hcpos
    nlinarith

#print axioms inroot_divisor_deep
#print axioms silent_supply_distinct


#print axioms supply_to_seedcount
#print axioms ramified_supply_member
#print axioms inroot_divisor_deep
#print axioms silent_supply_distinct

end BQF
end GaussForms
end Phys.Foundation
