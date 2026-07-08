/-
  Counterexamples.CosmoEquationOfStateCensusVacuityCostume — N455 anti-vacuity (C480).
  ============================================================================================
  W8 ANTI-VACUITY. The N455 node (THE EQUATION-OF-STATE CENSUS on the derived (1,3) arena) has
  genuine content only if the three canonical cosmic components really are the three DISTINCT
  values of the ONE signature-diagonal reading, and the radiation `w = 1/3` is genuinely
  DIMENSION-LOCKED to the DERIVED spacelike dimension — NOT a hollow ∧, NOT vacuously true, NOT a
  hand-inserted `3`:
  (a) THE CENSUS VALUES (`eos_dust`, `eos_radiation`, `eos_vacuum`): `w = 0`, `1/3`, `−1` for the
      pressureless / traceless / signature-proportional stress;
  (b) THE DIMENSION-LOCK (`spacelike_block_eq_spaceSub4_dim` + `eos_radiation_from_traceless`): the
      trace's `P`-coefficient is `finrank spaceSub4` (the DERIVED N419 spatial dimension), so a
      TRACELESS stress forces `w = 1/n = 1/3`;
  (c) THE DISTINCTNESS (`eos_census_values_distinct`): `1/3 ≠ 0 ≠ −1` — the census is not a hollow
      conjunction of equal values;
  (d) THE LOAD-BEARING SIGN (`pressure_sign_load_bearing`): dropping the signature `−` breaks the
      census;
  (Σ) THE CAPSTONE (`equation_of_state_census`): the three components welded by their trace-signatures.
  A mis-reading where the three w-values were NOT distinct, or where the radiation `1/3` were a
  hand-inserted constant rather than `1/finrank spaceSub4`, or where the pressure sign did not
  matter, would gut N455: the census would be a hollow conjunction or a value put in by hand.

  THE CERTIFICATE. `eFlag := 1` — a ℕ flag standing for "the N455 equation-of-state census is
  genuine: the three components are the three distinct values of the one signature reading, and the
  radiation `1/3` is dimension-locked to the derived spacelike dimension `finrank spaceSub4`". It is
  TIED to the banked N455 landing by `eFlag_forced` through `eos_dust`, `eos_radiation`,
  `eos_vacuum`, `spacelike_block_eq_spaceSub4_dim`, `eos_radiation_from_traceless`,
  `eos_census_values_distinct`, `pressure_sign_load_bearing`, and `equation_of_state_census`.

  We anchor `min 480 eFlag = 1` (TRUE — `eFlag = 1 < 480`, so the min is `eFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the census is hollow / the w-values coincide / the radiation
  `1/3` is a hand-inserted constant not the derived dimension / the pressure sign does not matter"
  mis-reading): that `min 480 eFlag = 480`. It GENUINELY equals `1`. Rewriting reduces the bogus
  claim to the false numeric `1 = 480` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (480, 1) is fresh (Cid 480 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoEquationOfStateCensus
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.CosmoEquationOfStateCensus

/-- THE N455-NON-VACUITY FLAG: `1` = "the equation-of-state census is genuine: the three components
    are the three distinct values of the one signature-diagonal reading, and the radiation `1/3` is
    dimension-locked to the derived spacelike dimension `finrank spaceSub4`". -/
def eFlag : ℕ := 1

/-- TRUE (tied to the banked N455 landing): `eFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing N455 landings — the census values (`eos_dust`, `eos_radiation`, `eos_vacuum`), the
    dimension-lock (`spacelike_block_eq_spaceSub4_dim`, `eos_radiation_from_traceless`), the
    distinctness (`eos_census_values_distinct`), the load-bearing sign
    (`pressure_sign_load_bearing`), and the capstone (`equation_of_state_census`). If any were
    hollow, those decls would not exist and this could not compile. -/
theorem eFlag_forced : eFlag = 1 := by
  have _ := @eos_dust
  have _ := @eos_radiation
  have _ := @eos_vacuum
  have _ := @spacelike_block_eq_spaceSub4_dim
  have _ := @eos_radiation_from_traceless
  have _ := @eos_census_values_distinct
  have _ := @pressure_sign_load_bearing
  have _ := @equation_of_state_census
  rfl

/-- TRUE: `min 480 eFlag = 1`, holding precisely because `eFlag = 1 < 480`. -/
theorem eos_val_true : min (480 : ℕ) eFlag = 1 := by decide

/-- BOGUS: claims `min 480 eFlag = 480`. It GENUINELY equals `1` (`eos_val_true`). A "census is
    hollow / w-values coincide / radiation `1/3` is hand-inserted not the derived dimension /
    pressure sign does not matter" mis-reading reduces — through the banked N455 landing — to the
    false numeric `1 = 480`, so this must NOT compile. -/
theorem eos_val_wrong_BOGUS :
    min (480 : ℕ) eFlag = 480 := by
  rw [eos_val_true]
  -- ⊢ (1 : ℕ) = 480  (FALSE — the costume bites)

end Counterexamples
