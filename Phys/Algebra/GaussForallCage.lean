/-
  # THE ∀D CAGE SHAPE — the cage as a law of the landscape (GQ SG-x)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The ∀D bridge's first half — LIST-FREE, D-GENERIC: the cage is not a
  per-discriminant observation but a shape theorem over ALL of them.

  * `forall_cage_shape` — ★★★ for every c₀ with A = 4c₀ − 1 > 0 and
    all deep odd primes blocked (deferral), NO reduced PosDef form of
    disc 1 − 4c₀ carries two odd prime factors in its leading
    coefficient (including p = q: no odd squares). Composition:
    deferral_pins_box (N634) + cage_leading_bound (N635) +
    single_odd_factor (N635) — all ∀-quantified production.

  Per-D certificates (N643/N646/N647) add the sharp COUNTING on top;
  the STRUCTURE holds ∀D in the kernel as of this node. Remaining for
  the boxed theorem: the ledger link at the ∀ level (box-to-h), then
  the final assembly with the case dichotomy (N645).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCaseComposition

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE ∀D CAGE SHAPE: under total odd-deep blocking, no reduced
    form's leading coefficient carries two odd prime factors. -/
theorem forall_cage_shape {c₀ A : Z} (hA : A = 4 * c₀ - 1) (hApos : 0 < A)
    (hblockall : ∀ p m : Z, p = 2 * m + 1 → 1 ≤ m → 4 * (p * p) ≤ A →
      ∀ x : Z, ¬ ZDvd' p (x * x + x + c₀)) :
    ∀ f : BQF, disc f = 1 - 4 * c₀ → Reduced f → PosDef f →
    ∀ p q e m₁ m₂ : Z, f.a = p * q * e → p = 2 * m₁ + 1 → q = 2 * m₂ + 1 →
    3 ≤ p → 3 ≤ q → 0 < e → False := by
  intro f hdisc hred hpos p q e m₁ m₂ hpa hop hoq hp3 hq3 hepos
  -- gate: 3a² ≤ A
  have hgate : 3 * (f.a * f.a) ≤ A :=
    cage_leading_bound hA hApos hdisc hred hpos
  -- p shallow: p | f.a ⟹ (deferral_pins_box) A < 4p²
  have hm₁ : 1 ≤ m₁ := by linarith
  have hm₂ : 1 ≤ m₂ := by linarith
  have hpshallow : A < 4 * (p * p) :=
    deferral_pins_box hA hblockall f hdisc p (q * e) m₁
      (by rw [hpa]; ring) hop hm₁
  have hqshallow : A < 4 * (q * q) :=
    deferral_pins_box hA hblockall f hdisc q (p * e) m₂
      (by rw [hpa]; ring) hoq hm₂
  -- two shallow odd primes overflow the gate (a > 0 from PosDef)
  have hapos : 0 < f.a := hpos.1
  exact single_odd_factor hApos hgate hapos hpa hepos hp3 hq3
    hpshallow hqshallow


#print axioms forall_cage_shape

end BQF
end GaussForms
end Phys.Foundation
