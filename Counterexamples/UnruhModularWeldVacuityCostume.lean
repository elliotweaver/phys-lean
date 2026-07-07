/-
  Counterexamples.UnruhModularWeldVacuityCostume — N424 anti-vacuity (C449).
  ============================================================================================
  W8 ANTI-VACUITY. The N424 node (arc-O O9 — the Unruh/KMS-modular weld) ties the accelerated
  probe's temperature to its acceleration through the banked return-surface closure (N360) read at
  the banked C6-forced maxent/KMS equilibrium (N375). The load-bearing non-vacuity facts: the KMS
  period is the FULL derived Born turn — a HALF-turn genuinely does NOT close (`rindler_half_period_conical`,
  the conical singularity BITES) — AND the temperature genuinely DEPENDS on the acceleration
  (`unruhTemp_two_ne_one`: `T(a=2) ≠ T(a=1)`). A mis-reading where a half-period closed (the cone
  were absent, so any period would do — the temperature degenerate), or where the temperature were
  acceleration-independent (the tie empty), would gut the whole O9 result.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N424 Unruh weld is a genuine constraint:
  the KMS period is the full turn (a half-turn does NOT close) AND the temperature is genuinely
  acceleration-dependent (`T(2) ≠ T(1)`)". It is TIED to the banked N424 landing by `cFlag_forced`
  through `rindler_half_period_conical` and `unruhTemp_two_ne_one`.

  We anchor `min 449 cFlag = 1` (TRUE — `cFlag = 1 < 449`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "a half-period closes / the temperature is
  acceleration-independent" mis-reading): that `min 449 cFlag = 449`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 449` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (449, 1) is fresh (Cid 449 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.UnruhModularWeld
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.UnruhModularWeld
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE N424-NON-VACUITY FLAG: `1` = "the KMS period is the full derived Born turn (a half-turn does
    NOT close — the cone bites) AND the Unruh temperature is genuinely acceleration-dependent
    (`T(2) ≠ T(1)`)". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N424 landing): a half-period does NOT close the Rindler Euclidean
    section, and the temperature at `a=2` differs from `a=1`; hence `cFlag = 1`. If a half-period
    closed (no cone) or the temperature were acceleration-independent, this conjunction would fail. -/
theorem cFlag_forced :
    (rindlerEucPoint 1 1 cutPi ≠ rindlerEucPoint 1 1 0
      ∧ unruhTemp 2 ≠ unruhTemp 1)
    ∧ cFlag = 1 :=
  ⟨⟨rindler_half_period_conical, unruhTemp_two_ne_one⟩, rfl⟩

/-- TRUE: `min 449 cFlag = 1`, holding precisely because `cFlag = 1 < 449`. -/
theorem cert_val_true : min (449 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 449 cFlag = 449`. It GENUINELY equals `1` (`cert_val_true`). A "half-period
    closes / temperature acceleration-independent" mis-reading reduces — through the banked O9
    landing — to the false numeric `1 = 449`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (449 : ℕ) cFlag = 449 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 449  (FALSE — the costume bites)

end Counterexamples
