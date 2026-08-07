/-
  # THE SEEDCOUNT INTERFACE — deferral welded to the cage (GQ SG-aa/ab)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The deferral-blocking interface — the seam the external audit
  flagged, now kernel content in the GENERAL-m form (partial
  blocking; N648's total blocking is the m-limit special case):

  * `deep_factor_in_touchset` — ★★★ THE INTERFACE: a deep odd prime
    factor of ANY slot's leading coefficient belongs to every
    complete touching list ps (slot factors TOUCH — N633; complete
    ps captures them). Seedcount < m in kernel form = ps complete
    with ps.length < m: the hypothesis shape certificates discharge
    by finite checks.
  * `two_odd_factors_ps` — ★★★ THE DECOMPOSITION: of any two odd
    prime factors of a slot's a, at least one is in ps (deep ⟹
    captured; both shallow ⟹ gate overflow, N635). Contrapositive:
    outside-ps odd parts are SINGLE — the general cage {2^j ×
    ps-smooth × ≤1 band} as a ∀D theorem, no longer a generator
    assertion.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussBoxedTheorem

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE INTERFACE: a deep odd prime factor of any slot's leading
    coefficient belongs to every complete touching list. -/
theorem deep_factor_in_touchset {c₀ A : Z} (hA : A = 4 * c₀ - 1)
    (ps : List Z)
    (hcomplete : ∀ p mm : Z, p = 2 * mm + 1 → 1 ≤ mm →
      4 * (p * p) ≤ A → (∃ x k : Z, x * x + x + c₀ = p * k) → p ∈ ps) :
    ∀ f : BQF, disc f = 1 - 4 * c₀ →
    ∀ p e mm : Z, f.a = p * e → p = 2 * mm + 1 → 1 ≤ mm →
    4 * (p * p) ≤ A → p ∈ ps := by
  intro f hdisc p e mm hpa hodd hmm hdeep
  obtain ⟨x, k, hxk⟩ := slot_factor_touches hdisc hpa hodd
  exact hcomplete p mm hodd hmm hdeep ⟨x, k, hxk⟩

/-- ★★★ THE DECOMPOSITION: of any two odd prime factors of a slot's
    leading coefficient, at least one lies in every complete touching
    list. -/
theorem two_odd_factors_ps {c₀ A : Z} (hA : A = 4 * c₀ - 1) (hApos : 0 < A)
    (ps : List Z)
    (hcomplete : ∀ p mm : Z, p = 2 * mm + 1 → 1 ≤ mm →
      4 * (p * p) ≤ A → (∃ x k : Z, x * x + x + c₀ = p * k) → p ∈ ps) :
    ∀ f : BQF, disc f = 1 - 4 * c₀ → Reduced f → PosDef f →
    ∀ p q e m₁ m₂ : Z, f.a = p * q * e →
    p = 2 * m₁ + 1 → q = 2 * m₂ + 1 → 3 ≤ p → 3 ≤ q → 0 < e →
    p ∈ ps ∨ q ∈ ps := by
  intro f hdisc hred hpos p q e m₁ m₂ hpa hop hoq hp3 hq3 hepos
  -- dichotomy on p deep vs shallow via trichotomy
  rcases lt_trichotomy (4 * (p * p)) A with hpd | hpd | hpd
  · -- p deep (strict)
    left
    have hm₁ : 1 ≤ m₁ := by linarith
    exact deep_factor_in_touchset hA ps hcomplete f hdisc p (q * e) m₁
      (by rw [hpa]; ring) hop hm₁ (le_of_lt hpd)
  · -- p deep (equality)
    left
    have hm₁ : 1 ≤ m₁ := by linarith
    exact deep_factor_in_touchset hA ps hcomplete f hdisc p (q * e) m₁
      (by rw [hpa]; ring) hop hm₁ (le_of_eq hpd)
  · -- p shallow: A < 4p²
    rcases lt_trichotomy (4 * (q * q)) A with hqd | hqd | hqd
    · right
      have hm₂ : 1 ≤ m₂ := by linarith
      exact deep_factor_in_touchset hA ps hcomplete f hdisc q (p * e) m₂
        (by rw [hpa]; ring) hoq hm₂ (le_of_lt hqd)
    · right
      have hm₂ : 1 ≤ m₂ := by linarith
      exact deep_factor_in_touchset hA ps hcomplete f hdisc q (p * e) m₂
        (by rw [hpa]; ring) hoq hm₂ (le_of_eq hqd)
    · -- both shallow: dead by gate + overflow (N635)
      exfalso
      have hgate : 3 * (f.a * f.a) ≤ A :=
        cage_leading_bound hA hApos hdisc hred hpos
      exact single_odd_factor hApos hgate hpos.1 hpa hepos hp3 hq3 hpd hqd


#print axioms deep_factor_in_touchset
#print axioms two_odd_factors_ps

end BQF
end GaussForms
end Phys.Foundation
