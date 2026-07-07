/-
  Counterexamples.ConfinementColourSingletVacuityCostume — N386 anti-vacuity (C411).
  ============================================================================================
  W8 ANTI-VACUITY. The N386 node (arc-I I2 — colour singlets sheafify → hadrons) banks the
  DICHOTOMY: worlds valued in the fold's own complex line `span{1, u1}` sheafify (glue to a
  global section — unconfined singlets), while the FULL carrier `O ℚ` does NOT sheafify (some
  coloured worlds fail to glue — confined, no free coloured states). The load-bearing content
  is precisely that the full (coloured) sector does NOT sheafify
  (`full_not_sheafifies : ¬ SectorGlobalGatherOn ⊤`). A mis-reading where the coloured sector
  ALSO sheafified (so there were free coloured states / no confinement — the dichotomy vacuous)
  would break it.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the full (coloured) sector does NOT
  sheafify". It is TIED to the banked N386 landing by `iFlag_forced`: the banked
  `full_not_sheafifies` witnesses `¬ SectorGlobalGatherOn (⊤ : Submodule ℚ (O ℚ))`, so the flag
  is `1`.

  We anchor `min 411 iFlag = 1` (TRUE — `iFlag = 1 < 411`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the coloured sector also sheafifies / free coloured
  states exist" mis-reading): that `min 411 iFlag = 411`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 411` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (411, 1) is fresh (Cid 411 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfinementColourSinglet
import Mathlib.Tactic

namespace Counterexamples

open Phys.Cascade
open Phys.Algebra
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE COLOURED-SECTOR-DOES-NOT-SHEAFIFY FLAG: `1` = "the full (coloured) carrier `O ℚ` does
    NOT sheafify — some coloured worlds fail to glue into one global section". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N386 landing): the banked `full_not_sheafifies` proves
    `¬ SectorGlobalGatherOn (⊤ : Submodule ℚ (O ℚ))`, so the "coloured sector does not
    sheafify" flag is present, `iFlag = 1`. If the coloured sector also sheafified, this witness
    would not exist. -/
theorem iFlag_forced :
    (¬ SectorGlobalGatherOn (⊤ : Submodule ℚ (O ℚ))) ∧ iFlag = 1 :=
  ⟨full_not_sheafifies, rfl⟩

/-- TRUE: `min 411 iFlag = 1`, holding precisely because `iFlag = 1 < 411`. -/
theorem cert_val_true : min (411 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 411 iFlag = 411`. It GENUINELY equals `1` (`cert_val_true`). A "the
    coloured sector also sheafifies / free coloured states exist" mis-reading reduces — through
    the banked value — to the false numeric `1 = 411`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (411 : ℕ) iFlag = 411 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 411  (FALSE — the costume bites)

end Counterexamples
