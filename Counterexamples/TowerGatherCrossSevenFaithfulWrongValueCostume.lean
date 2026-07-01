/-
  Counterexamples.TowerGatherCrossSevenFaithfulWrongValueCostume — N224 anti-vacuity (C256).
  ===========================================================================
  W8 ANTI-VACUITY. The N224 node banks that THE CROSS PRODUCT'S EMBEDDING OF THE FUNDAMENTAL 7
  INTO so(7) IS FAITHFUL AND FULL: over the banked octonion rung `O Q` with the banked fundamental
  7-module `ImO` (N22), the linear map `crossEmb : ImO -> End Q ImO` (`a` mapsto `crossOp a`) is
  INJECTIVE, and its image has dimension EXACTLY 7 — the full fundamental 7 embeds without
  collapse:

      finrank Q (LinearMap.range crossEmb) = 7   (`finrank_crossEmb_range`, TRUE),

  from injectivity (banked contraction N206 + Born anisotropy N24) and `finrank ImO = 7` (N22).
  The embedded copy of the 7 inside so(7) is the WHOLE 7, not a degenerate/partial subspace.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the faithful image is degenerate / collapses
  / has dimension other than 7 / is not the full fundamental 7): that this dimension equals
  (256 : N). Rewriting the banked value shows the bogus claim reduces to the false numeric
  7 = 256 in N. The kernel cannot close it; the costume BITES (lean leaves the unsolved false
  goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q),
  the dimension `finrank Q (LinearMap.range crossEmb)` is genuinely 7 (banked
  `finrank_crossEmb_range`), so claiming it is 256 is genuinely FALSE (7 /= 256).

  DISTINCT from the banked battery (... C254 = 0=254, C255 = 0=255): the pair (256, 7) is fresh
  (RHS 256 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the faithful embedding's image has dimension exactly 7 (the banked
    `finrank_crossEmb_range`). The full fundamental 7 embeds into so(7) without collapse. -/
theorem crossEmb_range_dim_true :
    Module.finrank ℚ (LinearMap.range crossEmb) = 7 :=
  Phys.Algebra.finrank_crossEmb_range

/-- BOGUS: claims the faithful image's dimension is `256`. It GENUINELY equals `7`
    (`crossEmb_range_dim_true`). The WRONG claim (the image is degenerate / collapses / is not the
    full fundamental 7) reduces — through the banked value — to the false numeric `7 = 256`, so
    this must NOT compile. -/
theorem crossEmb_range_dim_wrong_BOGUS :
    Module.finrank ℚ (LinearMap.range crossEmb) = 256 := by
  rw [crossEmb_range_dim_true]
  -- ⊢ (7 : ℕ) = 256  (FALSE — the costume bites)

end Counterexamples
