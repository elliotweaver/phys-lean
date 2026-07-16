import Phys.Algebra.ConfinementCriterion
import Phys.Algebra.TowerGatherBarMonad
import Phys.Algebra.SpacetimeReduction
import Phys.Algebra.Alternative

namespace Phys.Algebra.Q7Probe

open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- Arena predicate = coherent global transport (the gather glues everywhere). -/
def CoherentArena (A : Type*) [Mul A] : Prop := SectorGlobalGather A

-- (a) the dichotomy: arena ⟺ associativity (banked)
example (A : Type*) [Mul A] : CoherentArena A ↔ SectorAssoc A :=
  globalGather_iff_assoc A

-- (b) Dbl coheres
example : CoherentArena (Dbl ℚ) := dbl_worlds_glue

-- (c) H coheres
example : CoherentArena (H ℚ) := h_worlds_glue

-- (d) O = CD(H) does NOT cohere (defeq SectorConfines)
example : ¬ CoherentArena (O ℚ) := o_confines
example : ¬ CoherentArena (CD (H ℚ)) := o_confines

-- (e) the break IS confinement (gauge/matter)
example : SectorConfines (O ℚ) := o_confines
example : SectorConfines (O ℚ) := o_confines_from_cascade_stop

-- (f) the non-arena obstruction IS the banked associator (one cause)
example (a b : O ℚ) : gluingDefect a b = fun x => Phys.Algebra.assoc a b x :=
  o_confinement_obstruction_eq_associator a b

-- (g) the μ-defect version (bar monad) is the associator too
example (a b : O ℚ) : barMultDefect a b = fun x => Phys.Algebra.assoc a b x :=
  o_barMultDefect_eq_assoc a b

-- (h) the (1,3) physical form sits form-isometrically in the (1,9) (O4 weld)
example (p : STV4) : Qv (emb4 p) = Q4v p := emb4_preserves_form p

-- (i) maximal arena rung: H coheres, its double CD(H) does not
example : CoherentArena (H ℚ) ∧ ¬ CoherentArena (CD (H ℚ)) :=
  ⟨h_worlds_glue, o_confines⟩

end Phys.Algebra.Q7Probe
