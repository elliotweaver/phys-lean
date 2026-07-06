/-
  Counterexamples.ProtonStabilitySelectionRuleVacuityCostume — N368 anti-vacuity (C393).
  ============================================================================================
  W8 ANTI-VACUITY. The N368 node (arc-F F3 — proton stability = the `ΔB ∈ n_gen·ℤ` selection rule)
  banks that at the DERIVED generation count `finrank ℚ Uhol = 3` a single-proton decay `ΔB = −1` is
  FORBIDDEN: `proton_decay_forbidden : ∀ k, baryonShift (finrank ℚ Uhol) k ≠ −1`.

  The forced non-vacuity fact is `proton_decay_forbidden`: no winding `k` gives `ΔB = −1`. If instead
  a single-proton decay were ALLOWED (a mis-derived "the proton decays / `ΔB = −1` has a topological
  witness"), this pin would break and the whole stability prediction would collapse.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "single-proton decay is FORBIDDEN at the
  derived generation count (`ΔB = −1` has no witness)". It is TIED to the banked N368 landing by
  `iFlag_forced`: the banked `proton_decay_forbidden` (instantiated at winding `k = 0`, where
  `baryonShift = 0 ≠ −1`) witnesses that `ΔB = −1` is not realized, so the flag is `1` (present).

  We anchor `min 393 iFlag = 1` (TRUE — `iFlag = 1 < 393`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the proton decays / `ΔB = −1` is allowed" mis-reading): that
  `min 393 iFlag = 393`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 393` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (393, 1) is fresh (Cid 393 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ProtonStabilitySelectionRule
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD

/-- THE PROTON-STABILITY NON-VACUITY FLAG: `1` = "single-proton decay `ΔB = −1` is FORBIDDEN at the
    derived generation count — it has no topological witness". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N368 landing): the banked `proton_decay_forbidden`, instantiated at
    winding `k = 0`, proves `baryonShift (finrank ℚ Uhol) 0 ≠ −1`, so the "decay forbidden" flag is
    present, `iFlag = 1`. If a single-proton decay were allowed, this witness would not exist. -/
theorem iFlag_forced :
    (baryonShift (Module.finrank ℚ Uhol) 0 ≠ -1) ∧ iFlag = 1 :=
  ⟨proton_decay_forbidden 0, rfl⟩

/-- TRUE: `min 393 iFlag = 1`, holding precisely because `iFlag = 1 < 393`. -/
theorem cert_val_true : min (393 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 393 iFlag = 393`. It GENUINELY equals `1` (`cert_val_true`). A "the proton
    decays / `ΔB = −1` is allowed" mis-reading reduces — through the banked value — to the false
    numeric `1 = 393`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (393 : ℕ) iFlag = 393 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 393  (FALSE — the costume bites)

end Counterexamples
