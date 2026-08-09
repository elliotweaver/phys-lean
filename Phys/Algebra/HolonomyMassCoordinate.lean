import Phys.Algebra.OctonionJordanGenerationCyclePhase
import Phys.Algebra.HolonomyCircleRep
import Mathlib.Tactic

/-!
  # N698 — HOLONOMY MASS COORDINATE (referee task 3: the DERIVED weld)
  ================================================================================
  THE OBJECTION (external referee): N683's `pB_is_rep_coord` is rfl-shallow —
  `pB := cutCos (2/9)` upstream and `R`'s (0,0)-entry is *defined* as `cutCos`,
  so `cutCos (2/9) = R (2/9) 0 0` consumes nothing. The `2/9` must be DERIVED
  from the banked generation-cycle object and THEN connected to the mass conic.

  THE ANSWER: define `deltaB` from the banked generation-cycle projector trace —
    `deltaB := ((tr Poth / 3) · (1 − tr Poth / 3) : ℚ)` cast into the derived
    line `Cut` — the per-edge Born self↔other interference at the banked
    self-seen fraction, NOT a literal. Then:
    * `deltaB_eq : deltaB = 2/9` — by casting the banked ℚ-level crux landing
      `cyclephase_delta_B` through the (ring-hom) coercion `ℚ → Cut`;
    * `pB_is_holonomy_coordinate : pB = R deltaB 0 0` — NOW NON-TRIVIAL: needs
      `deltaB_eq` + `holonomy_real_coord` + `pB`'s definition. The mass conic's
      cosine parameter IS the circle-representation coordinate of THE DERIVED
      holonomy object;
    * `mass_conic_parameter_derived` — all three conic points `b0/b1/b2`
      restated through `R deltaB 0 0`;
    * teeth: `deltaB_ne_zero`, `R_deltaB_ne_one` — the holonomy is nontrivial
      (from the banked bracket `pB ≤ 975411/1000000 < 1`);
    * capstone `holonomy_mass_coordinate_welded` — conjunction including the
      representation property `R (deltaB + deltaB) = R deltaB * R deltaB` AT
      the derived value (`circle_rep_hom`), so the object lives in the derived
      representation, not just numerically.

  Consumes ONLY banked modules: OctonionJordanGenerationCycleBornSplit (`Poth`),
  OctonionJordanGenerationCyclePhase (`cyclephase_delta_B`), HolonomyCircleRep
  (`R`, `circle_rep_hom`, `holonomy_real_coord`), GenerationMassRatiosNumeric
  (`pB`, `wB`, `rB`, `b0/b1/b2`, `pB_hi` from `cutCos_two_ninths_bracket`).
-/

namespace Phys.Algebra
namespace HolonomyMassCoordinate

open Phys.Foundation.ContinuumQ
open Phys.Algebra.HJ
open Phys.Algebra.HolonomyCircleRep
open Phys.Algebra.GenerationMassRatios
open Matrix

noncomputable section

/-! ## §1 — the DERIVED holonomy object. -/

/-- ★ THE DERIVED HOLONOMY: the per-edge Born self↔other interference
    `T(1 − T)` at the banked self-seen fraction `T = tr Poth / 3`, computed in
    the cascade's ground ring ℚ from the banked generation-cycle projector
    `Poth = 1 − (1/3)·Jall`, and carried into the derived line `Cut` by the
    canonical coercion. NOT a numeral — the `2/9` is downstream, not upstream. -/
def deltaB : Cut :=
  (((Matrix.trace Poth / 3) * (1 - Matrix.trace Poth / 3) : ℚ) : Cut)

/-- ★★ THE DERIVED VALUE: `deltaB = 2/9` — the banked ℚ-level crux landing
    `cyclephase_delta_B` cast through the coercion `ℚ → Cut`. This theorem is
    the ONLY way the numeral enters this file. -/
theorem deltaB_eq : deltaB = (2 / 9 : Cut) := by
  unfold deltaB
  rw [cyclephase_delta_B]
  push_cast
  ring

/-! ## §2 — the weld: the mass conic's parameter is the circle-representation
    coordinate of the DERIVED object. -/

/-- ★★★ THE NON-TRIVIAL WELD (referee task 3): the mass conic's cosine
    parameter `pB` IS the (0,0) real coordinate of the circle representation
    evaluated at the DERIVED holonomy `deltaB`. Unlike N683's `pB_is_rep_coord`
    (which evaluated `R` at a literal), this consumes `deltaB_eq` — i.e. the
    banked `cyclephase_delta_B` — before the entry lemma can fire. -/
theorem pB_is_holonomy_coordinate :
    GenerationMassRatios.pB = R deltaB 0 0 := by
  rw [deltaB_eq, holonomy_real_coord]
  rfl

/-- ★★ THE MASS CONIC RUNS ON THE DERIVED COORDINATE: all three conic points
    `b0/b1/b2` (which feed `mass0/mass1 → cInner → F0`, hence alpha) restated
    with the parameter as `R deltaB 0 0` — the masses' parameter is the
    circle-representation coordinate of the derived holonomy object. -/
theorem mass_conic_parameter_derived :
    b0 = 1 + wB * (R deltaB 0 0) ∧
    b1 = 1 - wB * (R deltaB 0 0 + rB) / 2 ∧
    b2 = 1 - wB * (R deltaB 0 0 - rB) / 2 := by
  rw [← pB_is_holonomy_coordinate]
  exact ⟨rfl, rfl, rfl⟩

/-! ## §3 — teeth: the derived holonomy is NONTRIVIAL. -/

/-- ★ TOOTH 1: the derived holonomy is not the zero phase. -/
theorem deltaB_ne_zero : deltaB ≠ 0 := by
  rw [deltaB_eq]
  intro h
  have h2 := congrArg (fun x : Cut => x * 9) h
  simp at h2

/-- The derived coordinate is strictly below `1`: from the banked bracket
    `pB ≤ 975411/1000000` (N339/N340 `cutCos_two_ninths_bracket`). -/
theorem holonomy_coord_lt_one : R deltaB 0 0 < 1 := by
  rw [← pB_is_holonomy_coordinate]
  exact lt_of_le_of_lt GenerationMassRatios.pB_hi (by norm_num)

/-- ★ TOOTH 2: the representation at the derived holonomy is NOT the identity —
    the (0,0) entry is `< 1` while the identity's is `= 1`. The generation
    cycle genuinely rotates. -/
theorem R_deltaB_ne_one : R deltaB ≠ 1 := by
  intro h
  have h00 : R deltaB 0 0 = (1 : Matrix (Fin 2) (Fin 2) Cut) 0 0 := by rw [h]
  rw [Matrix.one_apply_eq] at h00
  exact absurd h00 (ne_of_lt holonomy_coord_lt_one)

/-! ## §4 — capstone. -/

/-- ★★★ CAPSTONE — THE HOLONOMY MASS COORDINATE, WELDED: (1) the holonomy is
    DERIVED from the banked generation-cycle trace and equals `2/9`; (2) the
    mass conic's parameter is the circle-representation coordinate of that
    derived object; (3) all three conic points run on it; (4) the
    representation property holds AT the derived value —
    `R (deltaB + deltaB) = R deltaB * R deltaB` — the object lives in the
    derived representation, not just numerically. -/
theorem holonomy_mass_coordinate_welded :
    deltaB = (2 / 9 : Cut) ∧
    GenerationMassRatios.pB = R deltaB 0 0 ∧
    (b0 = 1 + wB * (R deltaB 0 0) ∧
     b1 = 1 - wB * (R deltaB 0 0 + rB) / 2 ∧
     b2 = 1 - wB * (R deltaB 0 0 - rB) / 2) ∧
    R (deltaB + deltaB) = R deltaB * R deltaB :=
  ⟨deltaB_eq, pB_is_holonomy_coordinate, mass_conic_parameter_derived,
    circle_rep_hom deltaB deltaB⟩

end

end HolonomyMassCoordinate
end Phys.Algebra
