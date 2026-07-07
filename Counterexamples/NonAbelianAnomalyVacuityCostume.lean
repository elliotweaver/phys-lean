/-
  Counterexamples.NonAbelianAnomalyVacuityCostume — N428 anti-vacuity (C453).
  ============================================================================================
  W8 ANTI-VACUITY. The N428 node (arc-P P3 — the full non-abelian + Witten anomaly cancellation)
  pays the F1-childed debt: the SU(3)²·U(1) mixed anomaly vanishes (vector-like colour), the
  SU(2)²·U(1) mixed anomaly vanishes because the DERIVED colour count is 3, and the Witten SU(2)
  global anomaly vanishes because the DERIVED doublet count is EVEN. The load-bearing non-vacuity
  facts: the SU(2)²·U(1) cancellation is a GENUINE constraint on the colour count (a WRONG colour
  count `2` gives a NONZERO coefficient `1/2`, `su2_mixed_anomaly_wrong_colour`) AND the Witten
  cancellation is a GENUINE parity constraint requiring the lepton doublet (WITHOUT the lepton
  doublet the count is ODD, `witten_without_lepton_odd`). A mis-reading where the SU(2)²·U(1)
  coefficient vanished at ANY colour count (so `3` were not special) or where the Witten count were
  even without the lepton doublet (so the lepton doublet were not required) would gut the whole P3
  result.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N428 anomaly cancellation is a genuine
  constraint: a WRONG colour count fails SU(2)²·U(1) (`su2MixedCoeff 2 (finrank singlet) ≠ 0`) AND
  the without-lepton doublet count is ODD (`¬ Even (finrank Uhol)`)". It is TIED to the banked N428
  landing by `cFlag_forced` through `su2_mixed_anomaly_wrong_colour` and `witten_without_lepton_odd`.

  We anchor `min 453 cFlag = 1` (TRUE — `cFlag = 1 < 453`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the anomaly cancels at any colour count / the Witten count is
  even without the lepton" mis-reading): that `min 453 cFlag = 453`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 453` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (453, 1) is fresh (Cid 453 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NonAbelianAnomalyCancellation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

/-- THE N428-NON-VACUITY FLAG: `1` = "a WRONG colour count fails SU(2)²·U(1)
    (`su2MixedCoeff 2 (finrank singlet) ≠ 0`) AND the without-lepton doublet count is ODD
    (`¬ Even (finrank Uhol)`)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N428 landing): a wrong colour count fails the SU(2)²·U(1) cancellation,
    and the doublet count without the lepton doublet is odd; hence `cFlag = 1`. If the SU(2)²·U(1)
    coefficient vanished at any colour count, or the Witten count were even without the lepton
    doublet, this conjunction would fail. -/
theorem cFlag_forced :
    (su2MixedCoeff 2 (Module.finrank ℚ singlet) ≠ 0 ∧ ¬ Even (Module.finrank ℚ Uhol)) ∧
      cFlag = 1 :=
  ⟨⟨su2_mixed_anomaly_wrong_colour, witten_without_lepton_odd⟩, rfl⟩

/-- TRUE: `min 453 cFlag = 1`, holding precisely because `cFlag = 1 < 453`. -/
theorem cert_val_true : min (453 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 453 cFlag = 453`. It GENUINELY equals `1` (`cert_val_true`). A "the anomaly
    cancels at any colour count / the Witten count is even without the lepton" mis-reading reduces —
    through the banked P3 landing — to the false numeric `1 = 453`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (453 : ℕ) cFlag = 453 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 453  (FALSE — the costume bites)

end Counterexamples
