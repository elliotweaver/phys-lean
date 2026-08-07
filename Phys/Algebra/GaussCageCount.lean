/-
  # THE CAGE COUNT — a caged box is small (GQ SG-m)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The uniform route's counting half (SG-l gave the structure — total
  odd-deep blocking pins every slot into the 2-power × band monoid):

  * `cage_leading_bound` — ★★ THE GATE CEILING: Reduced + PosDef + odd
    disc 1 − 4c₀ = −A ⟹ 3a² ≤ A (b² ≤ a², a ≤ c ⟹ A = 4ac − b² ≥ 3a²).
  * `single_odd_factor` — ★★★ THE DICHOTOMY: two shallow odd primes
    cannot both divide a gate-bounded leading coefficient — 3(pq)² ≤ A
    with A < 4p², A < 4q² collide (A ≤ 5 vs pq ≥ 9). Under deferral
    the box's a-values live in {2^j} ∪ {2^j · p, single shallow p}.

  With the ledger (box size = h) the assembly (SG-n) counts the cage:
  deferring D have h ≤ (2-tower length) + (band count) — explicit —
  and the record table's fiber maxima close the ∀m loop.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussDeferralStructure

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★ The gate ceiling: reduced + posdef + odd disc 1 − 4c₀ = −A < 0
    forces 3·a² ≤ A. -/
theorem cage_leading_bound {f : BQF} {c₀ A : Z}
    (hA : A = 4 * c₀ - 1) (hApos : 0 < A)
    (hdisc : disc f = 1 - 4 * c₀)
    (hred : Reduced f) (hpos : PosDef f) :
    3 * (f.a * f.a) ≤ A := by
  obtain ⟨hb1, hb2, hac⟩ := hred
  obtain ⟨ha, hc⟩ := hpos
  have hD : f.b * f.b - 4 * f.a * f.c = 1 - 4 * c₀ := hdisc
  -- b² ≤ a²: from −a < b ≤ a
  have hbb : f.b * f.b ≤ f.a * f.a := by nlinarith
  -- A = 4ac − b² ≥ 4a·a − a² = 3a²
  have hAc : A = 4 * f.a * f.c - f.b * f.b := by linarith
  have h4ac : 4 * f.a * f.a ≤ 4 * f.a * f.c := by nlinarith
  nlinarith

/-- ★★★ THE SINGLE-ODD-FACTOR LEMMA: two shallow odd primes cannot both
    divide a gate-bounded leading coefficient — the cage is
    {2-power} × {at most ONE shallow odd prime}. -/
theorem single_odd_factor {a A p q e : Z}
    (hApos : 0 < A)
    (hgate : 3 * (a * a) ≤ A) (hapos : 0 < a)
    (hpq : a = p * q * e) (hepos : 0 < e)
    (hp3 : 3 ≤ p) (hq3 : 3 ≤ q)
    (hpshallow : A < 4 * (p * p)) (hqshallow : A < 4 * (q * q)) :
    False := by
  -- a ≥ p·q (e ≥ 1), so 3(pq)² ≤ 3a² ≤ A; but p² > A/4 and q² > A/4
  -- give (pq)² > A²/16, so 3A²/16 < A ⟹ A < 16/3 — while shallow
  -- p ≥ 3 forces A < 4p² is fine but 4p² > A means p > √A/2 ≥ ...
  -- concrete: 3·(pq)²·... work with integers only:
  have he1 : 1 ≤ e := z_pos_ge_one hepos
  have hpq_le_a : p * q ≤ a := by nlinarith
  have h3pq : 3 * ((p * q) * (p * q)) ≤ A := by nlinarith
  -- (pq)² = p²·q²; 16·p²·q² > A·A from the two shallow bounds
  have h16 : A * A < 16 * ((p * p) * (q * q)) := by nlinarith
  -- 3·p²·q² ≤ A ⟹ 48·p²·q² ≤ 16·A... combine: A·A < 16/3·A·... 
  -- A·A < 16·(p²q²) and 3·(p²q²) ≤ A ⟹ 3·A·A < 48·p²q² ≤ 16·A
  -- ⟹ 3A² < 16A ⟹ 3A < 16 ⟹ A ≤ 5. But shallow p ≥ 3: A < 36 OK...
  -- need the contradiction: A ≤ 5 AND 3·(pq)² ≤ A with pq ≥ 9:
  -- 3·81 = 243 ≤ A ≤ 5: FALSE.
  have h3A2 : 3 * (A * A) < 16 * A := by nlinarith
  have hA5 : A ≤ 5 := by nlinarith
  have hpq9 : 9 ≤ p * q := by nlinarith
  nlinarith


#print axioms cage_leading_bound
#print axioms single_odd_factor

end BQF
end GaussForms
end Phys.Foundation
