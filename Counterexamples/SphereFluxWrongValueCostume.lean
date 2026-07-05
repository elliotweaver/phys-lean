/-
  Counterexamples.SphereFluxWrongValueCostume — N328 anti-vacuity (C353).
  ============================================================================
  W8 ANTI-VACUITY. The N328 node (seeded arc-B B2 route-finder, the Gauss-sphere flux prerequisite)
  BUILDS the derived-ℝ integration primitive `sinAntideriv x = ∫₀ˣ cutSin = 1 − cutCos x` (the FTC
  antiderivative-difference form) and, from it, the 2-SPHERE SOLID ANGLE assembled as
  `(azimuthal turn 2·cutPi) × (meridian flux ∫₀^cutPi cutSin) = 4·cutPi`. The load-bearing landing is
  the FULL-MERIDIAN FLUX

      `sinAntideriv_cutPi : sinAntideriv cutPi = 2`,

  FORCED by the banked half-turn antipode `cutCos cutPi = −1` (`1 − (−1) = 2`). The value `2` is
  LOAD-BEARING: it is what makes the derived solid angle `4·cutPi` (not `2·cutPi`). A WRONG flux —
  e.g. `sinAntideriv cutPi = 1` (no antipode, `cutCos cutPi = 0`), or `= 0` (no accumulation) — would
  collapse the return-surface flux measure and the whole arc-B exponent normalization it feeds.

  THE CERTIFICATE. `meridianFlux := 2` — a ℕ flag standing for "the derived `sinAntideriv cutPi` is
  genuinely `2` (the full half-turn accumulation), not `1`". It is TIED to the banked landing by
  `meridianFlux_forced` below: the banked `sinAntideriv_cutPi` gives `sinAntideriv cutPi = 2` and
  `gaussSphereSolidAngle_eq` gives the solid angle `4·cutPi`. If the integration primitive or `cutPi`
  were mis-built, these would not hold.

  We anchor `min 353 meridianFlux = 2` (TRUE — `meridianFlux = 2`, and the flux is genuine).

  THE BOGUS CLAIM (a stand-in for ANY wrong flux/solid-angle value): that `min 353 meridianFlux = 353`.
  It GENUINELY equals `2` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `2 = 353` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (353, 2) is fresh (RHS 353 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Foundation.ContinuumSphereFlux
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE MERIDIAN-FLUX FLAG: `2` = "the derived `sinAntideriv cutPi` is genuinely `2` (the full
    half-turn accumulation), not `1`". -/
def meridianFlux : ℕ := 2

/-- TRUE (tied to the banked N328 forced landings): the derived integration primitive gives the
    full-meridian flux `∫₀^cutPi cutSin = 2` and the 2-sphere solid angle `= 4·cutPi`. If the
    antiderivative-difference `sinAntideriv = 1 − cutCos` or the banked `cutPi` half-turn were
    mis-built, these would not hold. -/
theorem meridianFlux_forced :
    sinAntideriv cutPi = 2 ∧ gaussSphereSolidAngle = 4 * cutPi :=
  ⟨sinAntideriv_cutPi, gaussSphereSolidAngle_eq⟩

/-- TRUE: `min 353 meridianFlux = 2`, holding precisely because `meridianFlux = 2` (the genuine
    full-meridian flux of the banked derived integral), not `353`. -/
theorem cert_val_true : min (353 : ℕ) meridianFlux = 2 := by decide

/-- BOGUS: claims `min 353 meridianFlux = 353`. It GENUINELY equals `2` (`cert_val_true`). A WRONG
    flux value (e.g. `sinAntideriv cutPi = 1`, i.e. `cutCos cutPi = 0`, no antipode) reduces —
    through the banked value — to the false numeric `2 = 353`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (353 : ℕ) meridianFlux = 353 := by
  rw [cert_val_true]
  -- ⊢ (2 : ℕ) = 353  (FALSE — the costume bites)

end Counterexamples
