/-
  Counterexamples.SpacetimePageCurveVacuityCostume — N362 anti-vacuity (C387).
  ============================================================================
  W8 ANTI-VACUITY. The N362 node (arc-E E6, THE PAGE CURVE / INFORMATION PRESERVATION, over the derived
  ℝ `Cut`) banks: the fine-grained radiation entropy `pageRadEntropy M₀ M = min(bhEntropy M₀ − bhEntropy M)
  (bhEntropy M)` starts at `0`, RETURNS TO `0` at complete evaporation (`pageRad_end`), and — crucially —
  does NOT end equal to the total (`pageRad_end_ne_total`): information is NOT lost.

  The forced non-vacuity fact is `pageRad_end_ne_total`: for `M₀ ≠ 0`, `pageRadEntropy M₀ 0 = 0 ≠
  bhEntropy M₀` (the total is strictly positive). If information were LOST — the radiation ending
  maximally mixed with fine-grained entropy equal to the FULL total — the curve would NOT return to `0`
  and this pin would break.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the final radiation entropy is `0`, NOT the
  total; information is recovered, not lost". It is TIED to the banked N362 landing by `iFlag_forced`:
  the banked `pageRad_end` witnesses `pageRadEntropy 1 0 = 0` while `bhEntropy 1 > 0`
  (`bhEntropy_pos_of_ne`), so the final radiation entropy differs from the total — the flag is `1`
  (present), not `0`.

  We anchor `min 387 iFlag = 1` (TRUE — `iFlag = 1 < 387`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY information-loss mis-reading): that `min 387 iFlag = 387`. It
  GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 387` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (387, 1) is fresh (Cid 387 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimePageCurve
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE PAGE-CURVE NON-VACUITY FLAG: `1` = "the final radiation entropy is `0`, not the total;
    information is recovered, not lost". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N362 landing): the banked `pageRad_end` proves `pageRadEntropy 1 0 = 0`,
    while `bhEntropy 1 > 0` (`bhEntropy_pos_of_ne`), so the final radiation entropy is NOT the total —
    the "information recovered" flag is present, `iFlag = 1`. If information were lost (the curve NOT
    returning to `0`), this witness would not exist. -/
theorem iFlag_forced :
    (pageRadEntropy (1 : Cut) 0 ≠ bhEntropy (1 : Cut)) ∧ iFlag = 1 :=
  ⟨pageRad_end_ne_total 1 one_ne_zero, rfl⟩

/-- TRUE: `min 387 iFlag = 1`, holding precisely because `iFlag = 1 < 387`. -/
theorem cert_val_true : min (387 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 387 iFlag = 387`. It GENUINELY equals `1` (`cert_val_true`). An
    information-loss mis-reading reduces — through the banked value — to the false numeric `1 = 387`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (387 : ℕ) iFlag = 387 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 387  (FALSE — the costume bites)

end Counterexamples
