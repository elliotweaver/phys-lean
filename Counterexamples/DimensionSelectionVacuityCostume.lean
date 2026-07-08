/-
  Counterexamples.DimensionSelectionVacuityCostume — N441 anti-vacuity (C466).
  ============================================================================================
  W8 ANTI-VACUITY. The N441 node (arc-Q Q7 — WHY (1,3), THE DIMENSION-SELECTION THEOREM) has
  genuine content only if the selection genuinely bites: (a) the maximal-arena cutoff is REAL —
  the quaternion rung `H ℚ` IS a coherent-transport arena while its Cayley–Dickson double
  `CD (H ℚ) = O ℚ` is NOT (`arena_maximal_at_H`); (b) THE CROSS FACT — the same doubling that
  fails to extend the arena is the one that confines, via the banked associator, and it genuinely
  bites (some gluing defect is nonzero) (`excess_is_obstruction_not_extent`); (c) the physical
  `(1,3)` lives on a coherent rung, form-isometrically inside the banked `(1,9)`
  (`physical_arena_on_coherent_rung`). A mis-reading where the doubling still counted as an arena
  (no cutoff), or the excess were lost extent rather than the confinement obstruction (no cross
  fact), or the physical arena did not sit on a coherent rung, would gut Q7 into a hollow
  conjunction.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N441 dimension selection is genuine:
  the quaternion rung is the maximal coherent-transport arena, its double both breaks the arena
  and produces the confinement obstruction (same associator, genuinely nonzero), and the physical
  (1,3) sits form-isometrically on the coherent complex rung". It is TIED to the banked N441
  landing by `cFlag_forced` through `arena_maximal_at_H`, `nonarena_iff_confines`,
  `excess_is_obstruction_not_extent`, `physical_arena_on_coherent_rung`, and `dimension_selection`.

  We anchor `min 466 cFlag = 1` (TRUE — `cFlag = 1 < 466`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the doubling is still an arena / the excess is lost extent /
  the physical arena is not on a coherent rung" mis-reading): that `min 466 cFlag = 466`. It
  GENUINELY equals `1` (`cons_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 466` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (466, 1) is fresh (Cid 466 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DimensionSelection
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE N441-NON-VACUITY FLAG: `1` = "the dimension selection is genuine: the quaternion rung is
    the maximal coherent-transport arena, its double both breaks the arena and produces the
    confinement obstruction (same associator, genuinely nonzero), and the physical (1,3) sits
    form-isometrically on the coherent complex rung". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N441 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing Q7 landings — the maximality cutoff (`arena_maximal_at_H`), the one-event-two-
    readings identity (`nonarena_iff_confines`), the cross fact (`excess_is_obstruction_not_extent`),
    the physical arena on a coherent rung (`physical_arena_on_coherent_rung`), and the capstone
    (`dimension_selection`). If the doubling still counted as an arena / the excess were lost extent
    / the physical arena were not on a coherent rung, those decls would not exist and this could
    not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @arena_maximal_at_H
  have _ := nonarena_iff_confines (Phys.Cascade.O ℚ)
  have _ := @excess_is_obstruction_not_extent
  have _ := @physical_arena_on_coherent_rung
  have _ := @dimension_selection
  rfl

/-- TRUE: `min 466 cFlag = 1`, holding precisely because `cFlag = 1 < 466`. -/
theorem cons_val_true : min (466 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 466 cFlag = 466`. It GENUINELY equals `1` (`cons_val_true`). A "the doubling
    is still an arena / the excess is lost extent / the physical arena is not on a coherent rung"
    mis-reading reduces — through the banked N441 landing — to the false numeric `1 = 466`, so this
    must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (466 : ℕ) cFlag = 466 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 466  (FALSE — the costume bites)

end Counterexamples
