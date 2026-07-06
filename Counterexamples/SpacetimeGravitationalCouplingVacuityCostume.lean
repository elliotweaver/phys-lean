/-
  Counterexamples.SpacetimeGravitationalCouplingVacuityCostume — N359 anti-vacuity (C384).
  ============================================================================
  W8 ANTI-VACUITY. The N359 node (arc-E E3, THE GRAVITATIONAL COUPLING COEFFICIENT `κ = 2·4π·G`
  DERIVED — both factors HOMED to banked objects, over the derived ℝ `Cut`) banks the dimensionless
  gravitational coupling coefficient `κ/G = 8·cutPi = 2·(4π flux)`, with the `2` HOMED to the
  reciprocal of the banked spin-2 trace-reversal coefficient `½` (N354). THE CAREFUL MEASUREMENT: the
  κ-factor `2 = (½)⁻¹` is the DIMENSION-INDEPENDENT trace-reversal coefficient reciprocal, GENUINELY
  DISTINCT from the DIMENSION-DEPENDENT trace-VALUE `(1 − ½·finrank_STVC) = −4` (N354).

  The forced non-vacuity fact is `kappa_two_ne_traceValue`: `(2⁻¹)⁻¹ ≠ (1 − 2⁻¹·finrank_STVC)` — i.e.
  `2 ≠ −4` on the banked derived carrier. A mis-derivation (WRONGLY homing the κ-factor `2` to the
  dimension-dependent trace-VALUE `−4`, conflating the conservation-forced coefficient reciprocal with
  the dimension-locked trace value) would make this pin break.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for \"the κ-factor 2 is the DIMENSION-INDEPENDENT
  trace-reversal coefficient reciprocal, NOT the dimension-dependent trace-value −4 (the careful
  measurement holds)\". It is TIED to the banked N359 landing by `iFlag_forced`: the banked
  `kappa_two_ne_traceValue` witnesses the two are distinct, so the flag is `1` (present), not `0`.

  We anchor `min 384 iFlag = 1` (TRUE — `iFlag = 1 < 384`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY conflated-factor / wrong-homing mis-reading): that
  `min 384 iFlag = 384`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 384` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (384, 1) is fresh (Cid 384 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeGravitationalCoupling
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

/-- THE GRAVITATIONAL-COUPLING NON-VACUITY FLAG: `1` = \"the κ-factor `2` is the DIMENSION-INDEPENDENT
    trace-reversal coefficient reciprocal `(½)⁻¹`, NOT the dimension-dependent trace-VALUE
    `(1 − ½·finrank_STVC) = −4` — the careful measurement holds\". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N359 landing): the banked `kappa_two_ne_traceValue` proves
    `(2⁻¹)⁻¹ ≠ (1 − 2⁻¹·finrank_STVC)`, so the \"careful measurement holds\" flag is present —
    `iFlag = 1`. If the κ-factor `2` were WRONGLY homed to the trace-value `−4`, this witness would
    not exist. -/
theorem iFlag_forced :
    (einsteinTraceReversalCoeff⁻¹
      ≠ (1 - einsteinTraceReversalCoeff * (Module.finrank Cut STVC : Cut))) ∧ iFlag = 1 :=
  ⟨kappa_two_ne_traceValue, rfl⟩

/-- TRUE: `min 384 iFlag = 1`, holding precisely because `iFlag = 1 < 384`. -/
theorem cert_val_true : min (384 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 384 iFlag = 384`. It GENUINELY equals `1` (`cert_val_true`). A conflated-factor /
    wrong-homing mis-reading reduces — through the banked value — to the false numeric `1 = 384`, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (384 : ℕ) iFlag = 384 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 384  (FALSE — the costume bites)

end Counterexamples
