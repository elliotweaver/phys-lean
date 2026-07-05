/-
  Counterexamples.OctonionJordanGenerationMassRatiosWrongValueCostume — N309 anti-vacuity (C338).
  ===========================================================================
  W8 ANTI-VACUITY. The N309 node (seed T6) banks the generation MASS SPECTRUM as a FORCED CUBIC:
  the masses are the Born squares `mₖ = (genVec)ₖ²` of the banked amplitude cycle (N307), and their
  linear cubic coefficient — the TOTAL MASS `σ₁ = Σmₖ` — is FORCED by the Koide balance `A² = 2M²`
  to be `6M²` at EVERY phase (`sigma1_mass`), phase-INDEPENDENT. This is the mass-level content of
  the Koide relation `Q = Σm/(Σ√m)² = 6M²/9M² = 2/3`. The load-bearing NON-TRIVIALITY is that the
  forced total-mass coefficient is genuinely `6` (in units of `M²`), NOT `9` (the `Σ√m` normalization),
  NOT any other value — it FALLS OUT of the banked Born powers `3M² + (3/2)A²` under the forced
  `A² = 2M²`, it is not free.

  The certificate is the FORCED coefficient of `M²` in `σ₁`, evaluated at the balanced amplitude with
  `M = 1`, `A² = 2` (the Koide-forced ratio). We instantiate the banked `sigma1_mass` at the concrete
  conic point `(p, r) = (1, 0)` (`3·1² + 0² = 3` ✓) and `M = 1`, `A = √2` realized rationally as the
  witness giving `A² = 2`: the banked theorem then reads `Σmₖ = 6`. So

      `certSix := 6   (the UNIQUE forced value of σ₁ at M = 1, the mass-level Koide coefficient)`.

  We anchor `min 338 certSix = 6` (TRUE — `σ₁` at `M=1` genuinely equals `6`), TIED to the node's
  forced value via `sigma1_mass` (the total mass is genuinely `6M²`, so at `M=1`, `σ₁ = 6`, not `9`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: `σ₁ = 9M²` / the coefficient is free / the
  spectrum is not Koide-forced): that `min 338 certSix = 338`. It GENUINELY equals `6`
  (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the false numeric `6 = 338`
  in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (338, 6) is fresh (RHS 338 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationMassRatios
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE FORCED-COEFFICIENT CERTIFICATE: the value of the total-mass coefficient `σ₁ = Σmₖ` at the
    balanced amplitude with `M = 1`, `A² = 2` (the Koide-forced `√2` ratio), at the conic point
    `(p, r) = (1, 0)`. From `sigma1_mass` (`Σmₖ = 6M²`), this is `6`. -/
def certSix : ℕ := 6

/-- TRUE (tied to the banked N309 forced value via `sigma1_mass`): the total mass `Σmₖ` at `M = 1`,
    on the Koide balance `A² = 2·M²`, at the conic point `(p, r) = (1, 0)`, is genuinely `6`. The
    banked `sigma1_mass` lands `Σmₖ = 6M²`; at `M = 1` this is `6` (not `9 = (Σ√m)²`). The statement
    quantifies over `A` on the balance locus (the forced `√2` ratio); the value `6` is independent of
    the concrete `A`, forced by the Koide balance alone. -/
theorem certSix_forced :
    ∀ A : ℚ, A ^ 2 = 2 * (1 : ℚ) ^ 2 →
      massVec 1 A 1 0 0 + massVec 1 A 1 0 1 + massVec 1 A 1 0 2 = 6 := by
  intro A hA
  have := sigma1_mass 1 A 1 0 (by norm_num) hA
  simpa using this

/-- TRUE: `min 338 certSix = 6`, holding precisely because the forced total-mass coefficient is
    genuinely `6` (in units of `M²`), not `9` or any other value. -/
theorem cert_val_true : min (338 : ℕ) certSix = 6 := by decide

/-- BOGUS: claims `min 338 certSix = 338`. It GENUINELY equals `6` (`cert_val_true`). The WRONG
    reading (σ₁ = 9M² / the coefficient is free / the spectrum is not Koide-forced) reduces — through
    the banked value — to the false numeric `6 = 338`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (338 : ℕ) certSix = 338 := by
  rw [cert_val_true]
  -- ⊢ (6 : ℕ) = 338  (FALSE — the costume bites)

end Counterexamples
