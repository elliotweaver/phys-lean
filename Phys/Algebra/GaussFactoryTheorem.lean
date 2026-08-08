/-
  # THE FACTORY THEOREM — the residue IS Euler's mechanism (GQ SG-ao)

  ## What this file proves (SEED-GROWTH campaign, THE FINAL
  COMPOSITION)

  The dichotomy (N659) composed with the silent return (N661), one
  theorem: over a large disc, a small box forces every hygienic
  window value (odd, under the wall Q(Q+2), coprime to D) to be 1 or
  PRIME. Route: an odd prime r ≤ Q dividing v = P(x₀) TOUCHES (the
  divisibility IS the touch); the dichotomy forces r | D; coprimality
  kills — silence holds and the silent return fires.

  * `factory_theorem` — ★★★ (∀D): the inverse problem's residue
    class IS the Euler-factory class, exactly. The prime witnesses
    below Q are quantified (the Re-transport schema the certificates
    discharge per rung — the C647 divisor-shape pattern).

  THE COMPLETE STRUCTURE at every m: split-2 arm (N654), small-q arm
  (N658), ramified arm (N660), and the residue = the factory (this
  node) whose own prime output feeds seed_slot/seeds_force_h — the
  box billed by what the branch generates. Nothing left outside.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSilentReturn

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE FACTORY THEOREM: over a large disc, a small box forces
    every hygienic window value to be 1 or prime — Euler's mechanism
    as the unique residue of the inverse problem. -/
theorem factory_theorem {c₀ A Q : Z} {H : Nat}
    (hA : A = 4 * c₀ - 1) (hQ3 : 3 ≤ Q)
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f → disc f = 1 - 4 * c₀ →
      f ∈ box)
    (hH : box.length ≤ H)
    (hbig : 4 * (zqpow Q (H + 1) * zqpow Q (H + 1)) ≤ A)
    -- prime witnesses below Q are available (the Re-transport schema
    -- certificates discharge per rung; quantified here):
    (hwitness : ∀ r mr : Z, r = 2 * mr + 1 → 1 ≤ mr → r ≤ Q →
      (∃ x : Z, ZDvd r (x * x + x + c₀)) →
      ∃ p : Re, r = Z.ofRe p ∧ PrimeRe p)
    -- the value: v = P(x₀), odd, walled, coprime to D
    (x₀ : Z) (v : Z) (hv : v = x₀ * x₀ + x₀ + c₀)
    (hv1 : 1 ≤ v) (hwall : v ≤ Q * (Q + 2))
    (hodd : ¬ ZDvd (2 : Z) v)
    (hcop : ∀ r : Z, ZDvd r v → ZDvd r (1 - 4 * c₀) → r = 1 ∨ r = -1) :
    v = 1 ∨ ∀ g a b : Z, 0 < g → ZDvd g v → g = a * v + b * g →
      g = 1 ∨ g = v := by
  refine silent_value_prime hQ3 hv1 hwall hodd ?_
  -- silence: an odd prime r ≤ Q dividing v would touch, hence divide D
  intro r mr hr hmr hrQ hrdvd
  -- r touches: r | P(x₀)
  have htouch : ∃ x : Z, ZDvd r (x * x + x + c₀) := ⟨x₀, by rw [← hv]; exact hrdvd⟩
  -- prime witness for r
  obtain ⟨p, hp, hprime⟩ := hwitness r mr hr hmr hrQ htouch
  -- the dichotomy forces r | D
  obtain ⟨xr, kr⟩ := htouch
  obtain ⟨w, hw⟩ := kr
  have hdvdD := small_h_dichotomy hA box hboxpw hcomplete hH hbig
    r p hp hprime (by linarith) hrQ xr w hw
  -- coprimality kills: r | v ∧ r | D ⟹ r = ±1, against r ≥ 3
  rcases hcop r hrdvd hdvdD with h1 | h1
  · linarith
  · linarith


#print axioms factory_theorem

end BQF
end GaussForms
end Phys.Foundation
