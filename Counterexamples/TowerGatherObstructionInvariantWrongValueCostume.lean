/-
  Counterexamples.TowerGatherObstructionInvariantWrongValueCostume — N221 anti-vacuity (C253).
  ===========================================================================
  W8 ANTI-VACUITY. The N221 node banks that THE GLUING-OBSTRUCTION COCYCLE IS g₂-EQUIVARIANT
  and its CALIBRATION FORMS ARE g₂-INVARIANT: over the banked octonion rung `O Q` the N219
  gluing obstruction `gluingDefect = [·,·,·]` (= the banked associator) is EQUIVARIANT under the
  banked derivation Lie algebra `Der(O Q) = g₂` (N16–N207), and consequently the coassociative
  4-form `ψ` (N210) and the associative 3-form `φ` (N209) have vanishing total infinitesimal
  g₂-variation — AND, the anti-vacuity anchor, the obstruction cocycle is a genuinely NONZERO
  trilinear map (`obstruction_invariance_nonvacuous`, banked `assoc_nonvanishing`).

  THE GENUINE VALUE. At the cascade's own non-associating triple the obstruction cocycle's
  `im.im.im` coordinate is genuinely 2:

      (assoc (i(iJ)) (i(e2)) e2).im.im.im  =  2   (`obstr_witness_coord_true`, TRUE),

  the banked `assoc_witness_coord`. If the g₂-equivariant obstruction cocycle were trivial /
  vanishing / its calibration invariance vacuous, this coordinate would be 0 — it is NOT.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the gluing obstruction is g₂-trivial / the
  calibration-form g₂-invariance is vacuous / the obstruction cocycle vanishes / the gather
  obstruction does not carry the exceptional symmetry): that this coordinate equals (253 : Q).
  Rewriting the banked witness shows the bogus claim reduces to the false numeric 2 = 253 in Q.
  The kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape
  O Q = CD (H Q), the associator coordinate (assoc a b e2).im.im.im at the witness triple equals
  2 (banked `assoc_witness_coord`), so claiming it is 253 is genuinely FALSE (2 /= 253).

  DISTINCT from the banked battery (... C251 = 0=251, C252 = 2=252): the pair (253, 2) is fresh
  (RHS 253 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherObstructionInvariant

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the g₂-equivariant gluing-obstruction cocycle coordinate at the cascade's non-associating
    triple is genuinely `2` (the banked associator witness `assoc_witness_coord`). The obstruction
    cocycle is a NONZERO trilinear map — the g₂-invariance is not vacuous. -/
theorem obstr_witness_coord_true :
    (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im
      = (2 : ℚ) :=
  Phys.Algebra.assoc_witness_coord

/-- BOGUS: claims the g₂-equivariant obstruction cocycle coordinate is `253`. It GENUINELY equals
    `2` (`obstr_witness_coord_true`). The WRONG claim (the obstruction is g₂-trivial / the
    calibration invariance is vacuous / the cocycle vanishes) reduces — through the banked value —
    to the false numeric `2 = 253`, so this must NOT compile. -/
theorem obstr_witness_coord_wrong_BOGUS :
    (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im
      = (253 : ℚ) := by
  rw [obstr_witness_coord_true]
  -- ⊢ (2 : ℚ) = 253  (FALSE — the costume bites)

end Counterexamples
