import Phys.Algebra.ProtonStabilitySelectionRule
import Phys.Quantum.PrimitiveFibre
import Mathlib.Tactic

open scoped BigOperators
namespace Phys.Algebra.WindingProbe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Phys.Quantum Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- (1) THE OFFSET-1 WINDING GRID: rung index k ↦ `1 + n_gen·k`, grounded on the banked
    generation count `finrank ℚ Uhol`. -/
def windingRung (k : ℤ) : ℤ := 1 + (Module.finrank ℚ Uhol : ℤ) * k

theorem windingRung_eq (k : ℤ) : windingRung k = 1 + 3 * k := by
  unfold windingRung; rw [finrank_Uhol]; push_cast; ring

-- (3) spacing = finrank Uhol
theorem windingRung_spacing (k : ℤ) :
    windingRung (k+1) - windingRung k = (Module.finrank ℚ Uhol : ℤ) := by
  unfold windingRung; ring

-- (4) residue 1
theorem windingRung_residue (k : ℤ) :
    windingRung k % (Module.finrank ℚ Uhol : ℤ) = 1 := by
  rw [windingRung_eq, finrank_Uhol]; omega

-- (5) never a generation multiple (2 ≤ finrank Uhol needed)
theorem windingRung_not_dvd (k : ℤ) :
    ¬ (Module.finrank ℚ Uhol : ℤ) ∣ windingRung k := by
  rw [windingRung_eq, finrank_Uhol]; omega

-- (6) cross-tie: disjoint from N368's baryon grid `n_gen·ℤ`
theorem windingRung_ne_baryonGrid (k m : ℤ) :
    windingRung k ≠ baryonShift (Module.finrank ℚ Uhol) m := by
  rw [windingRung_eq, baryonShift_eq, finrank_Uhol]; omega

-- (7) ground rung
theorem groundRung : windingRung 0 = 1 := by rw [windingRung_eq]; ring

-- (8) boundary index
def boundaryRungIndex : ℤ := -1

-- (9) boundary value = 1 - n_gen (= −2)
theorem windingRung_boundary :
    windingRung boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ) := by
  unfold windingRung boundaryRungIndex; ring

-- (10) first descent below ground
theorem boundary_is_first_descent :
    windingRung boundaryRungIndex < windingRung 0
    ∧ ∀ k : ℤ, k < 0 → windingRung k ≤ windingRung boundaryRungIndex := by
  constructor
  · rw [windingRung_eq, windingRung_eq]; unfold boundaryRungIndex; omega
  · intro k hk
    rw [windingRung_eq, windingRung_eq]; unfold boundaryRungIndex; omega

-- (11) CANDIDATE (isolated, hard-flagged): 9/4 expressible via banked counts
theorem candidate_boundary_expressible :
    (9:ℚ)/4 = ((Module.finrank ℚ Uhol : ℚ)/(Module.finrank ContinuumQ.Cut StateFibre : ℚ))^2 := by
  rw [finrank_Uhol, fibre_finrank]; norm_num

-- (12) W8 non-vacuity
theorem windingRung_spacing_ne_one :
    windingRung 1 - windingRung 0 ≠ 1 := by rw [windingRung_eq, windingRung_eq]; omega

theorem boundaryRungIndex_ne_ground : boundaryRungIndex ≠ 0 := by
  unfold boundaryRungIndex; omega

-- (13) capstone (structural only, NOT the candidate value)
theorem winding_quantization :
    (∀ k : ℤ, windingRung k % (Module.finrank ℚ Uhol : ℤ) = 1)
    ∧ (∀ k : ℤ, ¬ (Module.finrank ℚ Uhol : ℤ) ∣ windingRung k)
    ∧ (∀ k m : ℤ, windingRung k ≠ baryonShift (Module.finrank ℚ Uhol) m)
    ∧ windingRung 0 = 1
    ∧ (windingRung boundaryRungIndex < windingRung 0) :=
  ⟨windingRung_residue, windingRung_not_dvd, windingRung_ne_baryonGrid, groundRung,
   boundary_is_first_descent.1⟩

end
end Phys.Algebra.WindingProbe
