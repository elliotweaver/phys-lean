/-
  N414 measure-first probe (arc-N N4): the GENERATIVITY WITNESS. (v2 — mechanics fixed)
-/
import Phys.Algebra.TowerGatherObstructionUnification
import Mathlib.Tactic

namespace Probe414

open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- banked fold-root seed (N2). -/
example : IsFoldRoot (fun z : Dbl ℚ => Dbl.J * z) := Dbl.mulJ_isFoldRoot

/-- self-opposition from the SAME 2-torsion-free seed self-blindness (N1) needs. -/
example {R : Type*} [CommRing R] [Nontrivial R]
    (htf : ∀ y : R, y + y = 0 → y = 0) : (Dbl.J : Dbl R) ≠ star Dbl.J := by
  refine Dbl.J_ne_star_J ?_
  intro h2
  refine one_ne_zero (α := R) (htf 1 ?_)
  rw [one_add_one_eq_two]; exact h2

example : (Dbl.J : Dbl ℚ) ≠ star Dbl.J := Dbl.J_ne_star_J (by norm_num)

/-- ★ THE KEY CROSS-LEVEL TIE. -/
example :
    assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0
      ↔ (Dbl.J : Dbl ℚ) ≠ star Dbl.J := by
  unfold assoc
  rw [sub_ne_zero]
  exact not_congr (associativity_cause (R := ℚ))

/-- the locus is nonempty BECAUSE of the fold-root self-opposition. -/
example : (Dbl.J : Dbl ℚ) ≠ star Dbl.J → AssocLocusNonempty := by
  intro hJ
  have hwit : assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) ≠ 0 := by
    unfold assoc; rw [sub_ne_zero]; exact (not_congr (associativity_cause (R := ℚ))).mpr hJ
  exact ⟨_, _, _, hwit⟩

end Probe414
