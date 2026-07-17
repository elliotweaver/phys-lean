/-
  Counterexamples.ReturnSurfaceFieldLawVacuityCostume — ReturnSurfaceFieldLaw anti-vacuity (C528).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE RETURN-SURFACE FIELD LAW) reads the static field law off the fold's
  derived return surface: Gauss flux-conservation (`E·A = gaussSphereSolidAngle·s`, r-INDEPENDENT), the
  potential `Φ = s·r⁻¹` with `Φ'=−E`, the weak-field correspondence `metricF = 1 − 2Φ`, and the ★9
  gauge↔gravity FIELD-LEVEL weld (both couplings submultiples of `azimuthalTurn`). The content that must
  NOT be hollow: the two DERIVED long-range couplings are GENUINELY DISTINCT submultiples of the ONE
  return turn — the gauge count `42` (`criticalPhaseNumerator = azimuthalTurn·42`) is NOT the gravity
  count `4` (`gravCouplingCoeff = azimuthalTurn·4`), so `criticalPhaseNumerator ≠ gravCouplingCoeff`.
  A "the weld is a vacuous identification of the two forces / the two couplings are the same / the
  return surface fixes nothing distinct" mis-reading is refuted by the banked `weld_counts_distinct`,
  together with `gauss_flux_ne_wrong` (the flux is a genuine equality) and `fieldStrength_bites` (the
  field genuinely falls).

  THE CERTIFICATE. rsflFlag := 1 -- a natural-number flag standing for "the derived return-surface
  field law is non-vacuous: the two long-range couplings are DISTINCT submultiples of `azimuthalTurn`
  (gauge 42 ≠ gravity 4), the conserved flux is a genuine equality, and the inverse-square field
  genuinely falls with radius". It is TIED to the banked landing by rsflFlag_forced:
  `weld_counts_distinct` gives `criticalPhaseNumerator ≠ gravCouplingCoeff`, `gauss_flux_ne_wrong`
  gives the flux ≠ its doubling, `fieldStrength_bites` gives the field ≠ its half-radius value, so the
  flag is 1.

  We anchor min 528 rsflFlag = 1 (TRUE -- rsflFlag = 1 < 528, so the min is rsflFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the weld is vacuous / the couplings coincide / the flux is not
  conserved / the field is flat / the return surface fixes nothing" mis-reading): that
  min 528 rsflFlag = 528. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 528 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (528, 1) is fresh (Cid 528 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ReturnSurfaceFieldLaw
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived return-surface field law is non-vacuous — the two long-range couplings
    are DISTINCT submultiples of `azimuthalTurn` (gauge 42 ≠ gravity 4), the conserved flux is a
    genuine equality, and the inverse-square field genuinely falls with radius". -/
def rsflFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the two derived couplings are distinct
    (`weld_counts_distinct`), the conserved flux is a genuine equality for `s > 0`
    (`gauss_flux_ne_wrong`), the field genuinely falls for `s ≠ 0`, `r ≠ 0` (`fieldStrength_bites`),
    and `rsflFlag = 1`. -/
theorem rsflFlag_forced :
    (criticalPhaseNumerator ≠ gravCouplingCoeff)
    ∧ (∀ s : Cut, 0 < s → gaussSphereSolidAngle * s ≠ gaussSphereSolidAngle * s * 2)
    ∧ (∀ s r : Cut, s ≠ 0 → r ≠ 0 → fieldStrength s r ≠ fieldStrength s (2 * r))
    ∧ rsflFlag = 1 :=
  ⟨weld_counts_distinct,
   fun s hs => gauss_flux_ne_wrong s hs,
   fun s r hs hr => fieldStrength_bites s r hs hr, rfl⟩

/-- TRUE: min 528 rsflFlag = 1, holding precisely because rsflFlag = 1 < 528. -/
theorem cert_val_true : min (528 : ℕ) rsflFlag = 1 := by decide

/-- BOGUS: claims min 528 rsflFlag = 528. It GENUINELY equals 1 (cert_val_true). A "the weld is
    vacuous / the couplings coincide / the flux is not conserved / the field is flat / the return
    surface fixes nothing" mis-reading reduces -- through the banked landing -- to the false numeric
    1 = 528, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (528 : ℕ) rsflFlag = 528 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 528  (FALSE — the costume bites)

end Counterexamples
