import Phys.Algebra.TowerGatherPhysicalState
import Phys.Algebra.GatherFoldGroundGenerativity
import Mathlib.Tactic

namespace Probe

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- NEW LEMMA A: monad-nonstrict level ⟺ locus
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

-- NEW LEMMA B: state-selection level ⟺ locus
theorem state_selection_iff_locus :
    (∃ a : O ℚ, ¬ GluesGlobally a) ↔ AssocLocusNonempty := by
  rw [← confines_iff_some_unphysical, confinement_is_obstruction]

-- NEW LEMMA D: fold seed forces monad + state levels
theorem foldRoot_forces_monad_and_state
    (hJ : (Dbl.J : Dbl ℚ) ≠ star Dbl.J) :
    (∃ a b : O ℚ, barMultDefect a b ≠ 0) ∧ (∃ a : O ℚ, ¬ GluesGlobally a) := by
  have hloc := foldRoot_selfOpposed_forces_locus hJ
  exact ⟨monad_nonstrict_iff_locus.mpr hloc, state_selection_iff_locus.mpr hloc⟩

-- NEW LEMMA E: the one witness realizes monad + state levels
theorem witness_monad_level :
    barMultDefect (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) ≠ 0 := by
  rw [o_barMultDefect_eq_assoc]
  exact Function.ne_iff.mpr ⟨(CD.e2 : O ℚ), assoc_nonvanishing⟩

theorem witness_state_level :
    ¬ GluesGlobally (CD.iota (ιJ ℚ) : O ℚ) := by
  intro h
  exact coloured_witness_not_flat (h (CD.iota (CD.e2 : H ℚ)))

end Probe
