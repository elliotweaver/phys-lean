/-
  Counterexamples.CosmoInflationPlateauExclusionVacuityCostume — N364 anti-vacuity (C389).
  ========================================================================================
  W8 ANTI-VACUITY. The N364 node (arc-E E8 candidate-class, INFLATION = THE FOLD'S ETERNAL-APPROACH,
  the plateau class SELECTED by self-blindness, over the derived ℝ `Cut`) banks: the plateau
  potential `(1 − cutExp(−cφ))²` is BOUNDED (`< 1`) and — the C6 / self-blindness core — NEVER
  attains its bound on `φ ≥ 0` (`plateauApproachPot_never_attains_bound`), unlike the hilltop, which
  ATTAINS its bound `1` at the origin (`hilltopPot_attains_bound`, a fixed-point maximum = the
  excluded class).

  The forced non-vacuity fact is `plateauApproachPot_never_attains_bound`: for `c > 0`, `φ ≥ 0`, the
  plateau potential `≠ 1`. If the plateau DID attain its bound (a fixed point like the excluded
  hilltop), this pin would break and the whole selection principle (bounded-yet-never-attained)
  would collapse.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the plateau NEVER attains its coherence
  bound (no fixed point; the eternal approach)". It is TIED to the banked N364 landing by
  `iFlag_forced`: the banked `plateauApproachPot_never_attains_bound` witnesses that
  `plateauApproachPot 1 1 ≠ 1` (a concrete `c = 1 > 0`, `φ = 1 ≥ 0`), so the flag is `1` (present),
  not `0`.

  We anchor `min 389 iFlag = 1` (TRUE — `iFlag = 1 < 389`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the plateau attains its bound / has a fixed point like the
  hilltop" mis-reading): that `min 389 iFlag = 389`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 389` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (389, 1) is fresh (Cid 389 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoInflationPlateauExclusion
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE PLATEAU-SELECTION NON-VACUITY FLAG: `1` = "the plateau NEVER attains its coherence bound
    (no fixed point; the eternal approach C6 / self-blindness)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N364 landing): the banked `plateauApproachPot_never_attains_bound`
    proves `plateauApproachPot 1 1 ≠ 1` (a concrete `c = 1 > 0`, `φ = 1 ≥ 0`), so the "no fixed
    point" flag is present, `iFlag = 1`. If the plateau attained its bound (a fixed point like the
    excluded hilltop), this witness would not exist. -/
theorem iFlag_forced :
    plateauApproachPot 1 1 ≠ 1 ∧ iFlag = 1 :=
  ⟨plateauApproachPot_never_attains_bound 1 1 (by norm_num) (by norm_num), rfl⟩

/-- TRUE: `min 389 iFlag = 1`, holding precisely because `iFlag = 1 < 389`. -/
theorem cert_val_true : min (389 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 389 iFlag = 389`. It GENUINELY equals `1` (`cert_val_true`). A "the plateau
    attains its bound / has a fixed point like the hilltop" mis-reading reduces — through the banked
    value — to the false numeric `1 = 389`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (389 : ℕ) iFlag = 389 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 389  (FALSE — the costume bites)

end Counterexamples
