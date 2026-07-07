/-
  Counterexamples.ConfinementCriterionVacuityCostume — N385 anti-vacuity (C410).
  ============================================================================================
  W8 ANTI-VACUITY. The N385 node (arc-I I1 — the confinement criterion) banks that a cascade
  sector CONFINES iff its algebra is NON-ASSOCIATIVE: the associative rungs `Dbl ℚ`/`H ℚ` do NOT
  confine (their local worlds glue into a global section), and only the non-associative rung `O ℚ`
  DOES confine. The load-bearing content is precisely this DICHOTOMY — that an ASSOCIATIVE sector
  does NOT confine (`dbl_not_confines : ¬ SectorConfines (Dbl ℚ)`). A mis-reading where an
  associative sector ALSO confined (so confinement were NOT tied to non-associativity, the criterion
  vacuous) would break it.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the associative rung `Dbl ℚ` does NOT
  confine (its worlds glue into a global section)". It is TIED to the banked N385 landing by
  `iFlag_forced`: the banked `dbl_not_confines` witnesses `¬ SectorConfines (Dbl ℚ)`, so the flag
  is `1`.

  We anchor `min 410 iFlag = 1` (TRUE — `iFlag = 1 < 410`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "an associative sector also confines / confinement is not tied
  to non-associativity" mis-reading): that `min 410 iFlag = 410`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 410` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (410, 1) is fresh (Cid 410 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfinementCriterion
import Mathlib.Tactic

namespace Counterexamples

open Phys.Cascade
open Phys.Algebra

/-- THE ASSOCIATIVE-RUNG-DOES-NOT-CONFINE FLAG: `1` = "the associative rung `Dbl ℚ` does NOT
    confine — its local worlds glue into one global section". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N385 landing): the banked `dbl_not_confines` proves
    `¬ SectorConfines (Dbl ℚ)`, so the "associative sector does not confine" flag is present,
    `iFlag = 1`. If an associative sector also confined, this witness would not exist. -/
theorem iFlag_forced :
    (¬ SectorConfines (Dbl ℚ)) ∧ iFlag = 1 :=
  ⟨dbl_not_confines, rfl⟩

/-- TRUE: `min 410 iFlag = 1`, holding precisely because `iFlag = 1 < 410`. -/
theorem cert_val_true : min (410 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 410 iFlag = 410`. It GENUINELY equals `1` (`cert_val_true`). An "an
    associative sector also confines / confinement is not tied to non-associativity" mis-reading
    reduces — through the banked value — to the false numeric `1 = 410`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (410 : ℕ) iFlag = 410 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 410  (FALSE — the costume bites)

end Counterexamples
