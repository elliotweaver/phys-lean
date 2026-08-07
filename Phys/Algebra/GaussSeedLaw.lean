/-
  # THE SEED LAW — principal contact occupies a slot (GQ L2)

  ## What this file proves (INVERSE-ENGINE port, production node)

  The early jaw's anchor, numerically confirmed at 1,148,195 checks / 0
  violations before porting: a prime touching the principal branch is
  FORCED into the box.

  * `seed_form` — ★ THE RAW SEED: 4·P(x) = (2x+1)² + |D|, so p | P(x)
    yields ⟨p, 2x+1, P(x)/p⟩ of disc D on the nose — the principal value
    IS a represented miss (the miss_split presentation, read forward).
  * `translate_down` / `translate_up` — the a-preserving b-translations,
    disc-exact.
  * `bnorm` — ★★ THE WINDOW WALK: any ⟨p, b, c⟩ of disc D reaches the
    reduction window −p < b ≤ p by translations — fuel induction on the
    b² measure over the derived integers, strict drop by integrality.
  * `seed_slot` — ★★★ THE SEED LAW (deep window): p > 0 dividing a
    principal value at depth 4p² ≤ |D| occupies a REDUCED PosDef slot at
    a = p. (The (3p², 4p²] boundary sliver is excluded by design — the
    completeness schema bills deep seeds only.)

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussLedger

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open Re
open IntegerArith

/-- ★ THE RAW SEED (odd disc): D = 1 − 4c₀ and P(x) = x² + x + c₀ = p·m ⟹
    ⟨p, 2x+1, m⟩ has disc D. -/
theorem seed_form {D c₀ p m x : Z} (hD : D = 1 - 4 * c₀)
    (hpm : x * x + x + c₀ = p * m) :
    disc (⟨p, 2 * x + 1, m⟩ : BQF) = D := by
  show (2 * x + 1) * (2 * x + 1) - 4 * p * m = D
  have h4 : 4 * (x * x + x + c₀) = 4 * (p * m) := by rw [hpm]
  linarith [h4]

/-- b-step down: b ↦ b − 2p, c ↦ c − (b − p), disc and a preserved. -/
theorem translate_down {p b c : Z} :
    disc (⟨p, b - 2 * p, c - (b - p)⟩ : BQF) = disc (⟨p, b, c⟩ : BQF) := by
  show (b - 2*p) * (b - 2*p) - 4 * p * (c - (b - p))
      = b * b - 4 * p * c
  ring

/-- b-step up: b ↦ b + 2p, c ↦ c + (b + p). -/
theorem translate_up {p b c : Z} :
    disc (⟨p, b + 2 * p, c + (b + p)⟩ : BQF) = disc (⟨p, b, c⟩ : BQF) := by
  show (b + 2*p) * (b + 2*p) - 4 * p * (c + (b + p))
      = b * b - 4 * p * c
  ring

/-- ★★ THE WINDOW WALK: fuel recursion shrinking b² until −p < b ≤ p. -/
theorem bnorm {p : Z} (hp : 0 < p) :
    ∀ (fuel : Re) (b c : Z), b * b ≤ Z.ofRe fuel →
    ∃ b' c', disc (⟨p, b', c'⟩ : BQF) = disc (⟨p, b, c⟩ : BQF) ∧
      -p < b' ∧ b' ≤ p := by
  intro fuel
  induction fuel with
  | void =>
      intro b c hb
      -- b² ≤ 0 ⟹ b = 0; window: −p < 0 ≤ p ✓
      have hb0 : b = 0 := by
        have hz : Z.ofRe Re.void = (0 : Z) := rfl
        rw [hz] at hb
        nlinarith [mul_self_nonneg b]
      subst hb0
      exact ⟨0, c, rfl, by linarith, by linarith⟩
  | step n ih =>
      intro b c hb
      have hp1 : (1 : Z) ≤ p := z_pos_ge_one hp
      have hstep : Z.ofRe (Re.step n) = Z.ofRe n + 1 := by
        rw [show Re.step n = n + Re.step Re.void from rfl, Z.ofRe_add,
            show Z.ofRe (Re.step Re.void) = (1:Z) from Z.ofRe_one]
      rw [hstep] at hb
      by_cases hhi : b ≤ p
      · by_cases hlo : -p < b
        · exact ⟨b, c, rfl, hlo, hhi⟩
        · push_neg at hlo
          rcases lt_or_eq_of_le hlo with hlt | heq
          · -- b < −p strictly: step up, measure drops
            have hint : (1 : Z) ≤ -(b + p) := z_pos_ge_one (by linarith)
            have hdrop : (b + 2*p) * (b + 2*p) ≤ Z.ofRe n := by
              nlinarith [hb, hint, hp1]
            obtain ⟨b', c', hd, hw1, hw2⟩ := ih (b + 2*p) (c + (b + p)) hdrop
            exact ⟨b', c', by rw [hd, translate_up], hw1, hw2⟩
          · -- b = −p: land at p directly (b + 2p = p, c unchanged)
            refine ⟨p, c + (b + p), ?_, by linarith, le_refl p⟩
            have hd := translate_up (p := p) (b := b) (c := c)
            have hbp : b + 2*p = p := by rw [heq]; ring
            rw [hbp] at hd
            exact hd
      · -- b > p: step down, measure drops
        push_neg at hhi
        have hint : (1 : Z) ≤ b - p := z_pos_ge_one (by linarith)
        have hdrop : (b - 2*p) * (b - 2*p) ≤ Z.ofRe n := by
          nlinarith [hb, hint, hp1]
        obtain ⟨b', c', hd, hw1, hw2⟩ := ih (b - 2*p) (c - (b - p)) hdrop
        exact ⟨b', c', by rw [hd, translate_down], hw1, hw2⟩

/-- ★★★ THE SEED LAW (deep window): p > 0 dividing a principal value at
    depth 4p² ≤ |D| occupies a REDUCED PosDef slot at a = p. -/
theorem seed_slot {D c₀ p m x : Z} (hD : D = 1 - 4 * c₀)
    (hp : 0 < p) (hpm : x * x + x + c₀ = p * m)
    (hdeep : 4 * (p * p) ≤ -D) (hDneg : D < 0) :
    ∃ f : BQF, Reduced f ∧ PosDef f ∧ disc f = D ∧ f.a = p := by
  -- measure fuel for the initial b = 2x+1
  obtain ⟨n, hn | hn⟩ := z_trichotomy ((2*x+1) * (2*x+1))
  case _ =>
    obtain ⟨b', c', hd, hw1, hw2⟩ := bnorm hp n (2*x+1) m (le_of_eq hn)
    rw [seed_form hD hpm] at hd
    -- c' from the disc equation: b'² − 4pc' = D ⟹ 4pc' = b'² − D ≥ |D| > 0
    have hdisc : b' * b' - 4 * p * c' = D := hd
    have hc'pos : 0 < c' := by nlinarith [mul_self_nonneg b']
    -- Reduced: −p < b' ✓, b' ≤ p ✓, p ≤ c': 4pc' = b'² − D ≥ 0 + (−D) ≥ 4p²
    have hpc : p ≤ c' := by nlinarith [mul_self_nonneg b']
    exact ⟨⟨p, b', c'⟩, ⟨hw1, hw2, hpc⟩, ⟨hp, hc'pos⟩, hd, rfl⟩
  case _ =>
    -- (2x+1)² = −(ofRe n) ≤ 0 forces (2x+1)² = 0 — impossible for odd b;
    -- but ≤ 0 with square ⟹ = 0 ⟹ n = 0 fuel works too: use fuel void
    have hsq : (2*x+1) * (2*x+1) ≤ 0 := by
      rw [hn]
      have := ofRe_nonneg n
      linarith
    have : (2*x+1) * (2*x+1) = 0 := le_antisymm hsq (mul_self_nonneg _)
    obtain ⟨b', c', hd, hw1, hw2⟩ := bnorm hp Re.void (2*x+1) m
      (by rw [this]; exact le_of_eq Z.ofRe_zero.symm)
    rw [seed_form hD hpm] at hd
    have hdisc : b' * b' - 4 * p * c' = D := hd
    have hc'pos : 0 < c' := by nlinarith [mul_self_nonneg b']
    have hpc : p ≤ c' := by nlinarith [mul_self_nonneg b']
    exact ⟨⟨p, b', c'⟩, ⟨hw1, hw2, hpc⟩, ⟨hp, hc'pos⟩, hd, rfl⟩


#print axioms seed_form
#print axioms bnorm
#print axioms seed_slot

end BQF
end GaussForms
end Phys.Foundation
