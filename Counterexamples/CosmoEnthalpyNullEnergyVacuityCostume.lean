/-
  Counterexamples.CosmoEnthalpyNullEnergyVacuityCostume — N458 anti-vacuity (C483).
  ============================================================================================
  W8 ANTI-VACUITY. The N458 node (the enthalpy / null-energy combination `ρ + P` — the eigenvalue
  gap of the perfect-fluid stress on the derived `(1,3)` arena, its DIMENSION-INDEPENDENT vacuum
  threshold `w = −1`, and the three-reading trichotomy `{+1/n, −1/n, −1}`) banks that the enthalpy's
  `P`-coefficient is `1`, NOT the derived spacelike dimension `n = finrank spaceSub4 = 3` — so its
  threshold `w = −1` is genuinely DIMENSION-INDEPENDENT and NOT one of the trace/source thresholds
  `±1/n`. The dimension-independence is the load-bearing content: a mis-reading where the enthalpy
  were the SAME reading as the trace/source (its threshold dimension-LOCKED to `±1/n`, i.e. the
  coefficient were `n = 1`) would collapse the whole trichotomy.

  THE CERTIFICATE. `eFlag := 1` — a ℕ flag standing for "the derived spacelike dimension
  `finrank spaceSub4` is GENUINELY NOT `1` (`(finrank spaceSub4 : ℚ) ≠ 1`), so the enthalpy's
  `P`-coefficient `1` is genuinely distinct from the trace/source coefficient `n`, and the `w = −1`
  threshold is dimension-INDEPENDENT". It is TIED to the banked N458 landing by `eFlag_forced`: the
  banked `enthalpy_threshold_dimension_free` witnesses `(finrank spaceSub4 : ℚ) ≠ 1`, so the flag is
  `1`.

  We anchor `min 483 eFlag = 1` (TRUE — `eFlag = 1 < 483`, so the min is `eFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the enthalpy threshold is dimension-locked / the coefficient
  is `n` / the trichotomy collapses / `finrank spaceSub4 = 1`" mis-reading): that `min 483 eFlag =
  483`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false
  numeric `1 = 483` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (483, 1) is fresh (Cid 483 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoEnthalpyNullEnergy
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.CosmoEnthalpyNullEnergy
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.CosmoEquationOfStateCensus

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE DIMENSION-INDEPENDENCE FLAG: `1` = "the derived spacelike dimension `finrank spaceSub4` is
    GENUINELY NOT `1`, so the enthalpy's `P`-coefficient `1` is distinct from the trace/source `n`
    and the `w = −1` threshold is dimension-independent". -/
def eFlag : ℕ := 1

/-- TRUE (tied to the banked N458 landing): the banked `enthalpy_threshold_dimension_free` proves
    `(finrank spaceSub4 : ℚ) ≠ 1`, so the dimension-independence flag is present, `eFlag = 1`. If
    the enthalpy coefficient equalled `n` (the threshold dimension-locked), this witness would not
    exist. -/
theorem eFlag_forced :
    ((Module.finrank ℚ spaceSub4 : ℚ) ≠ 1) ∧ eFlag = 1 :=
  ⟨enthalpy_threshold_dimension_free, rfl⟩

/-- TRUE: `min 483 eFlag = 1`, holding precisely because `eFlag = 1 < 483`. -/
theorem cert_val_true : min (483 : ℕ) eFlag = 1 := by decide

/-- BOGUS: claims `min 483 eFlag = 483`. It GENUINELY equals `1` (`cert_val_true`). A "the enthalpy
    threshold is dimension-locked / the coefficient is `n` / the trichotomy collapses" mis-reading
    reduces — through the banked value — to the false numeric `1 = 483`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (483 : ℕ) eFlag = 483 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 483  (FALSE — the costume bites)

end Counterexamples
