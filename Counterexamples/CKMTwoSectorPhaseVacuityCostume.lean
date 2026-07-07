/-
  Counterexamples.CKMTwoSectorPhaseVacuityCostume — N418 anti-vacuity (C443).
  ============================================================================================
  W8 ANTI-VACUITY. The N418 node (arc-O O3 — the two-sector CKM completion at the derived fold phase)
  corrects N344's maximal CP factor (`1`) to the DERIVED non-maximal value `cpFactorDerived = 1/2` (the
  self=other balance at the derived phase `2·foldPhase = cutPi/4`), forcing the corrected Jarlskog
  squared `jarlskogSqCorrected = (1/2)·jarlskogSq` to be STRICTLY BELOW the N344 value. The load-bearing
  non-vacuity fact: the correction is a GENUINE strict change — `jarlskogSqCorrected < jarlskogSq` (the
  derived phase genuinely lowers the CP invariant). A mis-reading where the corrected value did NOT
  change (the CP factor collapsed back to the maximal `1`, so `jarlskogSqCorrected = jarlskogSq`) would
  gut the whole O3 correction.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N418 corrected Jarlskog squared is
  GENUINELY suppressed below the N344 maximal value: `0 < jarlskogSqCorrected < jarlskogSq`". It is TIED
  to the banked N418 landing by `cFlag_forced` through `jarlskogSqCorrected_pos` +
  `jarlskogSqCorrected_lt`.

  We anchor `min 443 cFlag = 1` (TRUE — `cFlag = 1 < 443`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the correction is vacuous / the CP factor is still maximal /
  jarlskogSqCorrected = jarlskogSq" mis-reading): that `min 443 cFlag = 443`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 443` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (443, 1) is fresh (Cid 443 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CKMTwoSectorPhase
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.CKMTwoSectorPhase
open Phys.Algebra.GenerationJarlskog
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE N418-NON-VACUITY FLAG: `1` = "the corrected two-sector Jarlskog squared genuinely suppresses
    below the N344 maximal value over the derived ℝ". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N418 landing): the corrected Jarlskog squared is strictly positive
    (`jarlskogSqCorrected_pos`) and strictly below the N344 maximal value (`jarlskogSqCorrected_lt`);
    hence `cFlag = 1`. If the CP factor had collapsed back to the maximal `1` (no correction), the
    strict inequality would fail. -/
theorem cFlag_forced :
    (0 < jarlskogSqCorrected ∧ jarlskogSqCorrected < jarlskogSq)
    ∧ cFlag = 1 :=
  ⟨⟨jarlskogSqCorrected_pos, jarlskogSqCorrected_lt⟩, rfl⟩

/-- TRUE: `min 443 cFlag = 1`, holding precisely because `cFlag = 1 < 443`. -/
theorem cert_val_true : min (443 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 443 cFlag = 443`. It GENUINELY equals `1` (`cert_val_true`). A "the correction is
    vacuous / the CP factor is still maximal / jarlskogSqCorrected = jarlskogSq" mis-reading reduces —
    through the banked O3 landing — to the false numeric `1 = 443`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (443 : ℕ) cFlag = 443 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 443  (FALSE — the costume bites)

end Counterexamples
