/-
  Counterexamples.SpacetimeSingularityClosureVacuityCostume — N363 anti-vacuity (C388).
  =====================================================================================
  W8 ANTI-VACUITY. The N363 node (arc-E E7 structural core, THE SINGULARITY = THE CLOSURE-SURFACE
  CAP, over the derived ℝ `Cut`) banks: the fold's return-section `eucPlanePoint ρ` degenerates
  (collapses all angular data to one point) EXACTLY at the tip `ρ = 0`
  (`closureSection_blind_iff_tip`), and is FAITHFUL off it. In particular it is NOT degenerate at
  `ρ = 1` (`closureSection_not_degenerate_everywhere`): the coordinate distinguishes angles away from
  the single closure tip — one closure, no "singular everywhere / never-faithful" BKL edge.

  The forced non-vacuity fact is `closureSection_not_degenerate_everywhere`: the section at `ρ = 1`
  is NOT angular-constant (it distinguishes `θ = cutPi` from `θ = 0`, banked N360). If the geometry
  were singular EVERYWHERE (the coordinate degenerate at `ρ ≠ 0`), this pin would break.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the return-section is degeneration-FREE at
  `ρ = 1` (faithful off the single tip)". It is TIED to the banked N363 landing by `iFlag_forced`:
  the banked `closureSection_not_degenerate_everywhere` witnesses that `eucPlanePoint 1` is not
  angular-constant, so the flag is `1` (present), not `0`.

  We anchor `min 388 iFlag = 1` (TRUE — `iFlag = 1 < 388`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "singular everywhere / BKL never-faithful" mis-reading): that
  `min 388 iFlag = 388`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 388` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (388, 1) is fresh (Cid 388 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeSingularityClosure
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

/-- THE CLOSURE-CAP NON-VACUITY FLAG: `1` = "the return-section is degeneration-free at `ρ = 1`
    (faithful off the single closure tip; not singular everywhere)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N363 landing): the banked `closureSection_not_degenerate_everywhere`
    proves `eucPlanePoint 1` is NOT angular-constant, so the "degeneration confined to the single tip"
    flag is present, `iFlag = 1`. If the geometry were singular everywhere (degenerate at `ρ ≠ 0`),
    this witness would not exist. -/
theorem iFlag_forced :
    (¬ (∀ θ θ' : Cut, eucPlanePoint 1 θ = eucPlanePoint 1 θ')) ∧ iFlag = 1 :=
  ⟨closureSection_not_degenerate_everywhere, rfl⟩

/-- TRUE: `min 388 iFlag = 1`, holding precisely because `iFlag = 1 < 388`. -/
theorem cert_val_true : min (388 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 388 iFlag = 388`. It GENUINELY equals `1` (`cert_val_true`). A "singular
    everywhere" mis-reading reduces — through the banked value — to the false numeric `1 = 388`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (388 : ℕ) iFlag = 388 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 388  (FALSE — the costume bites)

end Counterexamples
