/-
  Counterexamples.TowerGatherObstructionRep7WrongValueCostume — N222 anti-vacuity (C254).
  ===========================================================================
  W8 ANTI-VACUITY. The N222 node banks that THE GLUING-OBSTRUCTION COCYCLE IS A g₂-EQUIVARIANT
  MAP INTO THE FUNDAMENTAL 7-REPRESENTATION (ImO): over the banked octonion rung `O Q` the N219
  gluing obstruction `gluingDefect = [·,·,·]` (= the banked associator) is VALUED IN THE 7 —
  `reQ (assoc x y z) = 0` so `assoc x y z ∈ ImO` (the banked finrank-7 fundamental g₂-module,
  N22) — annihilates the trivial rep (unit) in each slot, and transforms as a g₂-intertwiner
  under the banked 7-rep `imRep`.

  THE GENUINE VALUE. The obstruction cocycle's trivial-rep (real) component genuinely VANISHES:

      reQ (assoc (i(iJ)) (i(e2)) e2)  =  0   (`obstr_reQ_zero_true`, TRUE),

  the banked `reQ_assoc_zero` — the obstruction has NO real part, it lands entirely in the
  fundamental 7 (ImO), never on the unit line (the trivial rep). If the obstruction cocycle had
  a nonzero trivial-rep component / were NOT valued in the 7 / spilled onto the unit line, this
  real part would be nonzero — it is NOT.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the obstruction has a trivial-rep component
  / is not valued in the fundamental 7 / carries a nonzero real part / spills onto the unit line):
  that this real part equals (254 : Q). Rewriting the banked witness shows the bogus claim
  reduces to the false numeric 0 = 254 in Q. The kernel cannot close it; the costume BITES (lean
  leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q),
  the associator's real part reQ (assoc x y z) is genuinely 0 (banked `reQ_assoc_zero`), so
  claiming it is 254 is genuinely FALSE (0 /= 254).

  DISTINCT from the banked battery (... C252 = 2=252, C253 = 2=253): the pair (254, 0) is fresh
  (RHS 254 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherObstructionRep7

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the gluing-obstruction cocycle's trivial-rep (real) component at the cascade's
    non-associating triple is genuinely `0` (the banked `reQ_assoc_zero`). The obstruction is
    VALUED IN THE FUNDAMENTAL 7 (ImO) — it has no real part, does not spill onto the unit line. -/
theorem obstr_reQ_zero_true :
    reQ (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) = (0 : ℚ) :=
  Phys.Algebra.reQ_assoc_zero _ _ _

/-- BOGUS: claims the obstruction cocycle's trivial-rep (real) component is `254`. It GENUINELY
    equals `0` (`obstr_reQ_zero_true`). The WRONG claim (the obstruction has a trivial-rep
    component / is not valued in the fundamental 7 / carries a nonzero real part) reduces —
    through the banked value — to the false numeric `0 = 254`, so this must NOT compile. -/
theorem obstr_reQ_zero_wrong_BOGUS :
    reQ (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)) = (254 : ℚ) := by
  rw [obstr_reQ_zero_true]
  -- ⊢ (0 : ℚ) = 254  (FALSE — the costume bites)

end Counterexamples
