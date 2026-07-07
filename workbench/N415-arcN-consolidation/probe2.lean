import Phys.Algebra.TowerGatherPhysicalState
import Phys.Algebra.GatherFoldGroundGenerativity
import Mathlib.Tactic

namespace Probe2

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

theorem monad_nonstrict_iff_locus :
    (∃ a b : O ℚ, barMultDefect a b ≠ 0) ↔ AssocLocusNonempty := by
  constructor
  · rintro ⟨a, b, hab⟩
    rw [o_barMultDefect_eq_assoc] at hab
    obtain ⟨x, hx⟩ := Function.ne_iff.mp hab
    exact ⟨a, b, x, hx⟩
  · rintro ⟨a, b, c, h⟩
    refine ⟨a, b, ?_⟩
    rw [o_barMultDefect_eq_assoc]
    exact Function.ne_iff.mpr ⟨c, h⟩

theorem state_selection_iff_locus :
    (∃ a : O ℚ, ¬ GluesGlobally a) ↔ AssocLocusNonempty := by
  rw [← confines_iff_some_unphysical, confinement_is_obstruction]

-- THE GRAND TFAE: six O-level readings of the ONE obstruction are all equivalent.
theorem gather_all_levels_tfae :
    List.TFAE
      [ AssocLocusNonempty,                                  -- (0) the locus
        SectorConfines (O ℚ),                                -- (1) confinement (arc I)
        ¬ SectorAssoc (O ℚ),                                 -- (2) cascade stop (N2)
        (∃ a b : O ℚ, ¬ WorldsGlue a b),                     -- (3) curvature (arc E)
        (∃ a b : O ℚ, barMultDefect a b ≠ 0),               -- (4) monad non-strict (N411)
        (∃ a : O ℚ, ¬ GluesGlobally a) ] := by               -- (5) state selection (N412)
  tfae_have 1 ↔ 2 := confinement_is_obstruction.symm
  tfae_have 1 ↔ 3 := cascade_stop_is_obstruction.symm
  tfae_have 1 ↔ 4 := curvature_somewhere_is_obstruction.symm
  tfae_have 1 ↔ 5 := monad_nonstrict_iff_locus.symm
  tfae_have 1 ↔ 6 := state_selection_iff_locus.symm
  tfae_finish

end Probe2
