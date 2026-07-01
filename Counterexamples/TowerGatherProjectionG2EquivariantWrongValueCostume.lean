/-
  Counterexamples.TowerGatherProjectionG2EquivariantWrongValueCostume — N226 anti-vacuity (C258).
  ===========================================================================
  W8 ANTI-VACUITY. The N226 node banks the g2-EQUIVARIANT PROJECTION `so(7) -> crossEmb(7)` ALONG
  `imRep(g2)`: over the banked octonion rung `O Q` with the banked fundamental 7-module `ImO` (N22),
  the Born form `bornBil` (N223), and the N225 complement `so(7) = 14 (+) 7`, the idempotent linear
  endomorphism `projFun` onto the fundamental 7 along the adjoint 14 has image the FULL fundamental
  representation:

      finrank Q (LinearMap.range projFun) = 7   (`finrank_projFun_range`, TRUE),

  the projector is neither the zero map nor a degenerate collapse — its image is genuinely the
  7-dimensional fundamental (banked N224 `finrank_crossEmb_range` transported through
  `comapSubtypeEquivOfLe`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the projector is degenerate / its image is not
  the full fundamental 7 / the g2-equivariant retraction collapses / the range has some dimension
  other than 7): that this dimension equals (258 : N). Rewriting the banked value shows the bogus
  claim reduces to the false numeric `7 = 258` in N. The kernel cannot close it; the costume BITES
  (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the octonion shape O Q = CD (H Q), the
  dimension `finrank Q (LinearMap.range projFun)` is genuinely 7 (banked `finrank_projFun_range`), so
  claiming it is 258 is genuinely FALSE (7 /= 258).

  DISTINCT from the banked battery (... C256 = 7=256, C257 = 21=257): the pair (258, 7) is fresh
  (RHS 258 distinct from every prior right-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherProjectionG2Equivariant

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: the g2-equivariant projector's image is the full 7-dimensional fundamental (the banked
    `finrank_projFun_range`). -/
theorem projFun_range_dim_true :
    Module.finrank ℚ (LinearMap.range projFun) = 7 :=
  Phys.Algebra.finrank_projFun_range

/-- BOGUS: claims the projector's image has dimension `258`. It GENUINELY equals `7`
    (`projFun_range_dim_true`). The WRONG claim (the projector is degenerate / its image is not the
    full fundamental 7) reduces — through the banked value — to the false numeric `7 = 258`, so this
    must NOT compile. -/
theorem projFun_range_dim_wrong_BOGUS :
    Module.finrank ℚ (LinearMap.range projFun) = 258 := by
  rw [projFun_range_dim_true]
  -- ⊢ (7 : ℕ) = 258  (FALSE — the costume bites)

end Counterexamples
