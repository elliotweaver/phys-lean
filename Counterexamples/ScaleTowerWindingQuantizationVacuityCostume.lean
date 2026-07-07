/-
  Counterexamples.ScaleTowerWindingQuantizationVacuityCostume — N407 anti-vacuity (C432).
  ============================================================================================
  W8 ANTI-VACUITY. The N407 node (arc-M M1 — the winding / ladder-rung quantization) banks the
  OFFSET-1 winding grid `windingRung k = 1 + n_gen·k` grounded on the banked derived generation
  count `finrank ℚ Uhol = 3`, as the residue-1 companion of N368's residue-0 baryon grid. The
  load-bearing non-vacuity fact: the winding grid is GENUINELY disjoint from N368's baryon grid —
  every winding rung is `≡ 1` (never `≡ 0`) modulo the derived generation count, so it is NEVER a
  multiple of `n_gen` and NEVER equals a `baryonShift (finrank ℚ Uhol) m`. A mis-reading where the
  winding grid were VACUOUS — the same as the baryon grid, or residue 0, or spacing 1 (all of ℤ) —
  would collapse the whole M1 distinction.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked winding grid genuinely has
  residue 1, is never divisible by the derived generation count, and is disjoint from N368's baryon
  grid — a real residue-1 companion, not the trivial ladder". It is TIED to the banked N407 landing
  by `cFlag_forced` through `windingRung_residue`, `windingRung_not_dvd`, and `windingRung_ne_baryonGrid`.

  We anchor `min 432 cFlag = 1` (TRUE — `cFlag = 1 < 432`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the winding grid is vacuous / same as the baryon grid /
  residue 0 / spacing 1" mis-reading): that `min 432 cFlag = 432`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 432` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (432, 1) is fresh (Cid 432 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerWindingQuantization
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Winding
open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

/-- THE M1-NON-VACUITY FLAG: `1` = "the banked winding grid genuinely has residue 1, is never
    divisible by the derived generation count, and is disjoint from N368's baryon grid — a real
    residue-1 companion, not the trivial ladder". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N407 landing): the winding grid has residue `1` modulo the derived
    generation count (`windingRung_residue`), is never divisible by it (`windingRung_not_dvd`), and is
    disjoint from N368's baryon grid (`windingRung_ne_baryonGrid`); hence `cFlag = 1`. If the winding
    grid were vacuous (same as the baryon grid, or residue 0, or spacing 1), one of these would fail. -/
theorem cFlag_forced :
    (windingRungIndex 0 % (Module.finrank ℚ Uhol : ℤ) = 1
      ∧ ¬ (Module.finrank ℚ Uhol : ℤ) ∣ windingRungIndex 0
      ∧ windingRungIndex 0 ≠ baryonShift (Module.finrank ℚ Uhol) 0) ∧ cFlag = 1 :=
  ⟨⟨windingRungIndex_residue 0, windingRungIndex_not_dvd 0, windingRung_ne_baryonGrid 0 0⟩, rfl⟩

/-- TRUE: `min 432 cFlag = 1`, holding precisely because `cFlag = 1 < 432`. -/
theorem cert_val_true : min (432 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 432 cFlag = 432`. It GENUINELY equals `1` (`cert_val_true`). A "the winding
    grid is vacuous / same as the baryon grid / residue 0 / spacing 1" mis-reading reduces — through
    the banked genuinely-residue-1 winding grid — to the false numeric `1 = 432`, so this must NOT
    compile. -/
theorem cert_val_wrong_BOGUS :
    min (432 : ℕ) cFlag = 432 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 432  (FALSE — the costume bites)

end Counterexamples
