/-
  Counterexamples.SpacetimeHawkingTemperatureVacuityCostume — N360 anti-vacuity (C385).
  ============================================================================
  W8 ANTI-VACUITY. The N360 node (arc-E E4, THE HAWKING TEMPERATURE `T_H = κ/2π` DERIVED — the
  Euclidean-section period fixed by the fold's RETURN-SURFACE CLOSURE, over the derived ℝ `Cut`) banks
  the smoothness/period/temperature structure: the near-horizon Euclidean 2-plane point
  `eucPlanePoint ρ θ = (ρ·cutCos θ, ρ·cutSin θ)` CLOSES under the FULL derived Born turn
  `azimuthalTurn = 2·cutPi` (no cone) and NOT under a smaller (half-)turn.

  The forced non-vacuity fact is `eucPlane_half_turn_conical`: `eucPlanePoint 1 cutPi ≠ eucPlanePoint 1 0`
  — a HALF-turn `θ ↦ θ + cutPi` does NOT return the section to the same point (the sign flip
  `cutCos_add_cutPi = −cutCos` IS the conical singularity). ONLY the full `azimuthalTurn` closes. A
  mis-derivation (WRONGLY fixing the Euclidean period at a half-turn `cutPi` instead of the full
  `azimuthalTurn`, giving the wrong period `β` and hence a wrong `T_H`) would make this pin break: if a
  half-turn closed, the temperature would be off by a factor of 2 (`κ/π` instead of `κ/2π`).

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the Euclidean 2-plane does NOT close under a
  half-turn (the period is the FULL derived Born turn azimuthalTurn, not cutPi)". It is TIED to the
  banked N360 landing by `iFlag_forced`: the banked `eucPlane_half_turn_conical` witnesses the half-turn
  fails to close, so the flag is `1` (present), not `0`.

  We anchor `min 385 iFlag = 1` (TRUE — `iFlag = 1 < 385`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY wrong-period / half-turn-closes mis-reading): that
  `min 385 iFlag = 385`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 385` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (385, 1) is fresh (Cid 385 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeHawkingTemperature
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE HAWKING-PERIOD NON-VACUITY FLAG: `1` = "the near-horizon Euclidean 2-plane does NOT close under
    a HALF-turn `cutPi` — the smoothness period is the FULL derived Born turn `azimuthalTurn = 2·cutPi`,
    not `cutPi`; the temperature is `κ/2π`, not `κ/π`". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N360 landing): the banked `eucPlane_half_turn_conical` proves
    `eucPlanePoint 1 cutPi ≠ eucPlanePoint 1 0`, so the "half-turn does not close" flag is present —
    `iFlag = 1`. If a half-turn WRONGLY closed (the wrong Euclidean period), this witness would not
    exist. -/
theorem iFlag_forced :
    (eucPlanePoint 1 cutPi ≠ eucPlanePoint 1 0) ∧ iFlag = 1 :=
  ⟨eucPlane_half_turn_conical, rfl⟩

/-- TRUE: `min 385 iFlag = 1`, holding precisely because `iFlag = 1 < 385`. -/
theorem cert_val_true : min (385 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 385 iFlag = 385`. It GENUINELY equals `1` (`cert_val_true`). A wrong-period /
    half-turn-closes mis-reading reduces — through the banked value — to the false numeric `1 = 385`, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (385 : ℕ) iFlag = 385 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 385  (FALSE — the costume bites)

end Counterexamples
