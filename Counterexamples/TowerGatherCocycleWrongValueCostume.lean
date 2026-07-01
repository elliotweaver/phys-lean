/-
  Counterexamples.TowerGatherCocycleWrongValueCostume — N220 anti-vacuity (C252).
  ===========================================================================
  W8 ANTI-VACUITY. The N220 node banks THE GLUING-OBSTRUCTION COCYCLE STRUCTURE: on
  the banked octonion rung `O Q` the N219 gluing obstruction `gluingDefect = [·,·,·]`
  is a genuine Hochschild 3-COCYCLE that is EXACT (the coboundary of multiplication),
  whose `End`-valued 2-cochain incarnation is NOT closed (coboundary = the level-up
  associator), whose cyclic antisymmetrization is `6·` itself = the banked Jacobiator,
  AND — the anti-vacuity anchor — is a genuinely NONZERO cochain (`gluing_cocycle_nonzero_O`).

  THE GENUINE VALUE. On `O Q` the gluing obstruction IS the banked associator
  (`gluingDefect a b = assoc a b`, definitional / `gluingDefect_is_assoc_O`). At the
  cascade's own non-associating triple its `im.im.im` coordinate is genuinely 2:

      (gluingDefect (i(iJ)) (i(e2)) e2).im.im.im  =  2   (`gd_witness_coord_true`, TRUE),

  because `gluingDefect a b x = assoc a b x` and `(assoc (i(iJ)) (i(e2)) e2).im.im.im = 2`
  (the banked `assoc_witness_coord`). If the obstruction cocycle were trivial / vanishing /
  cohomologically vacuous, this coordinate would be 0 — it is NOT.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the gluing-obstruction cocycle is
  trivial / vanishes / has no cohomological content / the 3-cocycle is a zero cochain /
  the Jacobiator connection is vacuous): that this coordinate equals (252 : Q). Rewriting
  the banked witness shows the bogus claim reduces to the false numeric 2 = 252 in Q. The
  kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape
  O Q = CD (H Q), the gluing-defect coordinate (gluingDefect a b e2).im.im.im at the
  witness triple equals 2 (it is the associator, `assoc_witness_coord`), so claiming it is
  252 is genuinely FALSE (2 /= 252).

  DISTINCT from the banked battery (... C250 = 2=217, C251 = 0=251): the pair (252, 2) is
  fresh (RHS 252 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherCocycle

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the gluing-obstruction cocycle coordinate at the cascade's non-associating triple is
    genuinely `2` — on `O Q` the obstruction IS the banked associator (`gluingDefect = assoc`),
    and its witness coordinate is `2` (`assoc_witness_coord`). The cocycle is a NONZERO cochain. -/
theorem gd_witness_coord_true :
    (gluingDefect (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im
      = (2 : ℚ) := by
  show (Phys.Algebra.assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im
      = (2 : ℚ)
  exact Phys.Algebra.assoc_witness_coord

/-- BOGUS: claims the gluing-obstruction cocycle coordinate is `252`. It GENUINELY equals `2`
    (`gd_witness_coord_true`). The WRONG claim (the cocycle is trivial / vanishes / has no
    cohomological content / the Jacobiator connection is vacuous) reduces — through the banked
    value — to the false numeric `2 = 252`, so this must NOT compile. -/
theorem gd_witness_coord_wrong_BOGUS :
    (gluingDefect (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im
      = (252 : ℚ) := by
  rw [gd_witness_coord_true]
  -- ⊢ (2 : ℚ) = 252  (FALSE — the costume bites)

end Counterexamples
