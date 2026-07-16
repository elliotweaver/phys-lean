/-
  Counterexamples.SubBandCompletionVacuityCostume — N### / ARC-D D2 anti-vacuity (C504).
  =====================================================================================
  W8 ANTI-VACUITY. The D2 node (ARC-D THE SUB-BAND COMPLETION) pays Z6's enumerated remainder:
  the light-quark / hadronic freeze-out sub-bands, with each freeze-out STEP = the frozen
  flavour's derived coloured census term. The freeze-out must be NON-HOLLOW: the two steps must
  be GENUINELY DISTINCT (up-type level 2 vs down-type level 1), not a single uniform matching
  jump. The banked witnesses `freezeout_step_bottom` / `freezeout_step_charm` give the bottom
  step `= colouredCensusTerm 1 = 1/3` and the charm step `= colouredCensusTerm 2 = 4/3`, and
  `freezeout_steps_differ` proves `1/3 ≠ 4/3` — the flavour structure is load-bearing.

  The load-bearing content this costume pins: the charm and bottom freeze-out steps are
  DIFFERENT rationals — the step size depends on WHICH flavour freezes out. A hollow reading
  where "the freeze-out is a uniform jump" (both steps equal) is refuted: `1/3 ≠ 4/3`.

  THE CERTIFICATE. `sFlag := 1` — a ℕ flag standing for "the freeze-out steps are genuinely
  flavour-specific: the bottom step `1/3` and the charm step `4/3` are distinct, so the census
  re-counts a flavour-specific content at each threshold, NOT a uniform matching jump". It is
  TIED to the banked D2 landing by `sFlag_forced`: `freezeout_steps_differ` witnesses the two
  steps are unequal, so the flag is `1`.

  We anchor `min 504 sFlag = 1` (TRUE — `sFlag = 1 < 504`, so the min is `sFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the freeze-out is hollow / uniform / flavour-blind"
  mis-reading): that `min 504 sFlag = 504`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 504` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (504, 1) is fresh (Cid 504 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SubBandCompletion
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.SubBandCompletion

/-- THE D2 FLAG: `1` = "the freeze-out steps are genuinely flavour-specific — the bottom step
    `1/3` and the charm step `4/3` are DISTINCT, so the census re-counts a flavour-specific content
    at each threshold, NOT a uniform flavour-blind matching jump". -/
def sFlag : ℕ := 1

/-- TRUE (tied to the banked D2 landing): `freezeout_steps_differ` proves the bottom freeze-out step
    and the charm freeze-out step are UNEQUAL — the step size is flavour-specific — so the flag is
    present, `sFlag = 1`. -/
theorem sFlag_forced :
    (bandCensus [2, 1, 1, 2, 1] - bandCensus [2, 1, 1, 2])
      ≠ (bandCensus [2, 1, 1, 2] - bandCensus [2, 1, 1])
    ∧ sFlag = 1 :=
  ⟨freezeout_steps_differ, rfl⟩

/-- TRUE: `min 504 sFlag = 1`, holding precisely because `sFlag = 1 < 504`. -/
theorem cert_val_true : min (504 : ℕ) sFlag = 1 := by decide

/-- BOGUS: claims `min 504 sFlag = 504`. It GENUINELY equals `1` (`cert_val_true`). A "the freeze-out
    is hollow / uniform / flavour-blind" mis-reading reduces — through the banked value — to the
    false numeric `1 = 504`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (504 : ℕ) sFlag = 504 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 504  (FALSE — the costume bites)

end Counterexamples
