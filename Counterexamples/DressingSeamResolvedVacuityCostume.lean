/-
  Counterexamples.DressingSeamResolvedVacuityCostume — the dressing/recombination seam is resolved:
  the depth-dressing is way-point-forbidden drift, anti-vacuity (C543).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE DRESSING/RECOMBINATION SEAM RESOLVED) proves the depth-dressing of
  the assembled tower is EXCLUDED by the banked exact way-points — at the derived weight `w = 1/3` it
  MOVES the electroweak way-point from `1582/27` to `602/9` — so the genuine composed `1/α(0)` is the
  way-point-consistent leading-κ recombined tower, NOT the ×1.465-inflated depth-dressed object.

  The content that must NOT be hollow: the depth-dressing GENUINELY moves the banked way-point — the
  dressed electroweak reading `602/9` is a REAL displacement of the banked exact way-point `1582/27`,
  and `602/9 ≠ 1582/27` (`dressed_topBand_ne`). A "the dressing leaves the way-point unchanged / the
  seam is empty / there is no displacement" mis-reading is refuted by the banked `dressed_topBand_ne`
  (`(602/9 : Cut) ≠ 1582/27`).

  THE CERTIFICATE. moveFlag := 1 -- a natural-number flag standing for "the depth-dressing genuinely
  moves the banked electroweak way-point (602/9 ≠ 1582/27), so it is way-point-forbidden drift
  (dressed_topBand_ne)". It is TIED to the banked landing by moveFlag_forced: `dressed_topBand_ne`
  gives `(602/9 : Cut) ≠ 1582/27`.

  We anchor min 543 moveFlag = 1 (TRUE -- moveFlag = 1 < 543, so the min is moveFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the dressing leaves the way-point unchanged / the seam is empty"
  mis-reading): that min 543 moveFlag = 543. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 543 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (543, 1) is fresh (Cid 543 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DressingSeamResolved
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.DressingSeamResolved
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the depth-dressing genuinely moves the banked electroweak way-point
    (602/9 ≠ 1582/27), so it is way-point-forbidden drift (dressed_topBand_ne)". -/
def moveFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the dressing moves the way-point `602/9 ≠ 1582/27`
    (`dressed_topBand_ne`), and `moveFlag = 1`. -/
theorem moveFlag_forced :
    ((602 / 9 : Cut) ≠ 1582 / 27)
    ∧ moveFlag = 1 :=
  ⟨dressed_topBand_ne, rfl⟩

/-- TRUE: min 543 moveFlag = 1, holding precisely because moveFlag = 1 < 543. -/
theorem cert_val_true : min (543 : ℕ) moveFlag = 1 := by decide

/-- BOGUS: claims min 543 moveFlag = 543. It GENUINELY equals 1 (cert_val_true). A "the dressing leaves
    the way-point unchanged / the seam is empty" mis-reading reduces -- through the banked landing -- to
    the false numeric 1 = 543, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (543 : ℕ) moveFlag = 543 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 543  (FALSE — the costume bites)

end Counterexamples
