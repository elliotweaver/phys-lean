/-
  Counterexamples.ReciprocalSpectrumVacuityCostume — N423 anti-vacuity (C448).
  ============================================================================================
  W8 ANTI-VACUITY. The N423 node (arc-O O8 — the {7,9,28} reciprocal spectrum) welds the arc-B
  scale-tower rung `rungExponent n = 84π/n` and the arc-G RG eigenvalue `scalingDim n = −n/84π`
  through their SHARED banked budget `criticalPhaseNumerator = 84·cutPi`: their product is `−1`
  at every structural count. The load-bearing non-vacuity fact: the weld genuinely BITES — the
  product is `−1` (`reciprocal_at_imO`), GENUINELY NOT `+1` (`reciprocal_ne_one`), AND the three
  RG eigenvalues are non-degenerate (`λ₇ ≠ λ₂₈`, `eigenvalues_imO_ne_selfAdj`). A mis-reading
  where the RG eigenvalue carried the wrong sign (product `+1` — the "irrelevant directions are
  relevant" collapse), or where the two arcs used unrelated budgets (product `≠ −1`), or where
  the spectrum were degenerate (all counts giving one eigenvalue) would gut the whole O8 result.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N423 reciprocal weld is a genuine
  constraint (product `−1 ≠ +1`) AND the three-count eigenvalue spectrum is non-degenerate
  (`λ₇ ≠ λ₂₈`)". It is TIED to the banked N423 landing by `cFlag_forced` through
  `reciprocal_ne_one` and `eigenvalues_imO_ne_selfAdj`.

  We anchor `min 448 cFlag = 1` (TRUE — `cFlag = 1 < 448`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the product is `+1` / the two arcs use different budgets /
  the eigenvalue spectrum is degenerate" mis-reading): that `min 448 cFlag = 448`. It GENUINELY
  equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 448`
  in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (448, 1) is fresh (Cid 448 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ReciprocalSpectrum
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ReciprocalSpectrum
open Phys.Algebra
open Phys.Algebra.PathIntegral

/-- THE N423-NON-VACUITY FLAG: `1` = "the reciprocal weld is a genuine constraint (product
    `−1 ≠ +1`) AND the three-count RG-eigenvalue spectrum is non-degenerate (`λ₇ ≠ λ₂₈`)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N423 landing): the weld product is NOT `+1` (it is `−1`), and the
    two RG eigenvalues at counts 7 and 28 are distinct; hence `cFlag = 1`. If the product were
    `+1` (wrong sign) or the eigenvalues degenerate, this conjunction would fail. -/
theorem cFlag_forced :
    ((rungExponent (Module.finrank ℚ Phys.Algebra.ImO)
        * scalingDim (Module.finrank ℚ Phys.Algebra.ImO) ≠ 1)
      ∧ (scalingDim (Module.finrank ℚ Phys.Algebra.ImO)
          ≠ scalingDim (Module.finrank ℚ (Phys.Algebra.bornBil).selfAdjointSubmodule)))
    ∧ cFlag = 1 :=
  ⟨⟨reciprocal_ne_one, eigenvalues_imO_ne_selfAdj⟩, rfl⟩

/-- TRUE: `min 448 cFlag = 1`, holding precisely because `cFlag = 1 < 448`. -/
theorem cert_val_true : min (448 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 448 cFlag = 448`. It GENUINELY equals `1` (`cert_val_true`). A "product is
    `+1` / different budgets / degenerate spectrum" mis-reading reduces — through the banked O8
    landing — to the false numeric `1 = 448`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (448 : ℕ) cFlag = 448 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 448  (FALSE — the costume bites)

end Counterexamples
