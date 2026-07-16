import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.TowerGatherBarMonad
import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.Alternative

namespace Phys.Algebra.Q7Probe2

open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- ARENA = coherent global transport (the gather glues everywhere). -/
def CoherentArena (A : Type*) [Mul A] : Prop := SectorGlobalGather A

/-- dichotomy re-exported in arena language. -/
theorem coherentArena_iff_assoc (A : Type*) [Mul A] :
    CoherentArena A ↔ SectorAssoc A := globalGather_iff_assoc A

/-- THE ONE-EVENT-TWO-READINGS IDENTITY: on any rung, "not an arena" and "confines"
    are literally the SAME proposition. -/
theorem nonarena_iff_confines (A : Type*) [Mul A] :
    ¬ CoherentArena A ↔ SectorConfines A := Iff.rfl

/-- arena rungs -/
theorem dbl_isArena : CoherentArena (Dbl ℚ) := dbl_worlds_glue
theorem h_isArena : CoherentArena (H ℚ) := h_worlds_glue

/-- the next doubling is NOT an arena -/
theorem doubled_h_not_arena : ¬ CoherentArena (CD (H ℚ)) := o_confines

/-- MAXIMALITY: H is an arena, its double CD(H)=O is not — the last coherent rung. -/
theorem arena_maximal_at_H : CoherentArena (H ℚ) ∧ ¬ CoherentArena (CD (H ℚ)) :=
  ⟨h_worlds_glue, o_confines⟩

/-- THE CROSS FACT (never co-stated): the same doubling that FAILS to extend the arena
    IS the one that produces the confinement (gauge/matter) obstruction — the same
    associator. Not lost extent: internalized content. -/
theorem excess_is_obstruction_not_extent :
    ¬ CoherentArena (CD (H ℚ)) ∧ SectorConfines (O ℚ)
      ∧ (∀ a b : O ℚ, gluingDefect a b = fun x => Phys.Algebra.assoc a b x)
      ∧ (∃ a b : O ℚ, gluingDefect a b ≠ 0) :=
  ⟨o_confines, o_confines_from_cascade_stop, o_confinement_obstruction_eq_associator,
    o_gluingDefect_ne_zero⟩

/-- THE ARENA BASE COHERES: the physical (1,3) embeds via the ℂ rung `Dbl ℚ`, which is a
    coherent-transport rung; its (1,9)-form restriction IS the (1,3) form. -/
theorem physical_arena_on_coherent_rung :
    CoherentArena (Dbl ℚ) ∧ (∀ p : STV4, Qv (emb4 p) = Q4v p) :=
  ⟨dbl_worlds_glue, emb4_preserves_form⟩

end Phys.Algebra.Q7Probe2
