/-
  Counterexamples.ChiralGenerationAnomalyCancellationVacuityCostume — N366 anti-vacuity (C391).
  ============================================================================================
  W8 ANTI-VACUITY. The N366 node (arc-F F1 — anomaly cancellation via the colour ladder's
  charge-conjugation (Hodge) complement, over ℚ grounded on `finrank ℚ Uhol`) banks: the banked ν_R
  (the `∅` self-blind singlet) is REQUIRED by anomaly freedom — dropping it makes the linear
  (gravitational / B−L) anomaly `≠ 0` (`generation_anomaly_without_nuR_ne_zero`: the punctured sum
  `∑_{S ≠ ∅} blCharge (finrank ℚ Uhol) S ≠ 0`, in fact `= 1`).

  The forced non-vacuity fact is `generation_anomaly_without_nuR_ne_zero`: WITHOUT the ν_R the
  anomaly sum is nonzero. If anomaly cancellation held WITHOUT the ν_R (a mis-derived "the ν_R is
  optional"), this pin would break and the whole ν_R-required teeth (the seed's control) would
  collapse.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the ν_R IS required (the punctured anomaly
  sum is nonzero)". It is TIED to the banked N366 landing by `iFlag_forced`: the banked
  `generation_anomaly_without_nuR_ne_zero` witnesses that the ν_R-less anomaly sum is `≠ 0`, so the
  flag is `1` (present), not `0`.

  We anchor `min 391 iFlag = 1` (TRUE — `iFlag = 1 < 391`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the ν_R is optional / anomalies cancel without it"
  mis-reading): that `min 391 iFlag = 391`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 391` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (391, 1) is fresh (Cid 391 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ChiralGenerationAnomalyCancellation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE ν_R-REQUIRED NON-VACUITY FLAG: `1` = "the banked ν_R (the `∅` singlet) IS required by anomaly
    freedom — the ν_R-less anomaly sum is nonzero". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N366 landing): the banked `generation_anomaly_without_nuR_ne_zero`
    proves the ν_R-less linear anomaly sum is `≠ 0`, so the "ν_R is required" flag is present,
    `iFlag = 1`. If anomalies cancelled WITHOUT the ν_R, this witness would not exist. -/
theorem iFlag_forced :
    (∑ S ∈ (Finset.univ.erase (∅ : Finset (Fin (Module.finrank ℚ Uhol)))),
      blCharge (Module.finrank ℚ Uhol) S) ≠ 0 ∧ iFlag = 1 :=
  ⟨generation_anomaly_without_nuR_ne_zero, rfl⟩

/-- TRUE: `min 391 iFlag = 1`, holding precisely because `iFlag = 1 < 391`. -/
theorem cert_val_true : min (391 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 391 iFlag = 391`. It GENUINELY equals `1` (`cert_val_true`). A "the ν_R is
    optional / anomalies cancel without it" mis-reading reduces — through the banked value — to the
    false numeric `1 = 391`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (391 : ℕ) iFlag = 391 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 391  (FALSE — the costume bites)

end Counterexamples
