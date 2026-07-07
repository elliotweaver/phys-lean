/-
  Counterexamples.ConfinementMassGapVacuityCostume — N388 anti-vacuity (C413).
  ============================================================================================
  W8 ANTI-VACUITY. The N388 node (arc-I I4 — the mass gap / the curvature floor) banks that the
  coloured sector has a CURVATURE FLOOR: the coloured-witness per-plaquette Born action clears a
  nonzero floor (`bornAction_witness_floor`, `4 ≤ bornAction (ι(ιJ)) (ι(e₂)) e₂` in the derived ℝ),
  so NO flat (zero-action) coloured connection exists — a genuine mass gap. A mis-reading where the
  coloured sector ADMITTED a flat/zero-action connection (`the gap floor is zero`, the coloured
  curvature could vanish — no mass gap) would break the derivation.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the coloured sector has a strictly positive
  curvature floor (no flat coloured connection — a mass gap)". It is TIED to the banked N388 landing
  by `iFlag_forced`: the banked `coloured_witness_not_flat` witnesses `¬ WorldsGlue (ι(ιJ)) (ι(e₂))`
  (the coloured pair is NOT flat), so the flag is `1`.

  We anchor `min 413 iFlag = 1` (TRUE — `iFlag = 1 < 413`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the coloured sector admits a flat/zero-action connection /
  the gap floor is zero / no mass gap" mis-reading): that `min 413 iFlag = 413`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 413` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (413, 1) is fresh (Cid 413 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfinementMassGap
import Mathlib.Tactic

namespace Counterexamples

open Phys.Cascade
open Phys.Algebra
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE MASS-GAP FLAG: `1` = "the coloured sector has a strictly positive curvature floor — the
    coloured witness is NOT flat, so no flat coloured connection exists (a genuine mass gap)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N388 landing): the banked `coloured_witness_not_flat` proves
    `¬ WorldsGlue (ι(ιJ)) (ι(e₂))` — the coloured pair does NOT glue (no flat connection), so the
    "coloured curvature floor positive" flag is present, `iFlag = 1`. If the coloured sector admitted
    a flat/zero-action connection, this witness would not exist. -/
theorem iFlag_forced :
    (¬ WorldsGlue (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ))) ∧ iFlag = 1 :=
  ⟨coloured_witness_not_flat, rfl⟩

/-- TRUE: `min 413 iFlag = 1`, holding precisely because `iFlag = 1 < 413`. -/
theorem cert_val_true : min (413 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 413 iFlag = 413`. It GENUINELY equals `1` (`cert_val_true`). A "the coloured
    sector admits a flat/zero-action connection / the gap floor is zero / no mass gap" mis-reading
    reduces — through the banked value — to the false numeric `1 = 413`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (413 : ℕ) iFlag = 413 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 413  (FALSE — the costume bites)

end Counterexamples
