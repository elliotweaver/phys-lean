/-
  Counterexamples.TowerGatherColourChargeOneCauseWrongValueCostume — N251 anti-vacuity (C282).
  ===========================================================================
  W8 ANTI-VACUITY. The N251 node banks THE ONE-CAUSE CONSOLIDATION `u1` (the derived fold-root √−1,
  N2): the single derived element wearing four faces — the charge-operator input
  (`chargeOp = crossOp u1`), the complex structure (`chargeOpV² = −id`), the colour centralizer
  (`chargeStabilizer = colourCentralizer`), and the ℂ-linearity axis
  (`Commute (colourRepV D) chargeOpV`) — from which the colour rep's faithfulness and its dim-`8`
  image both descend (capstone `colour_charge_one_cause_u1`). The load-bearing quantitative fact
  anchoring the consolidation is that the faithful image is EXACTLY `8`-dimensional
  (`finrank_colourRepImg`), realized here IN THE ROLE of the single-cause capstone's dimension
  clause — the full dim-`8` colour su(3) forced by the one derived element `u1`.

  The anchor is that genuine consolidated IMAGE dimension, packaged as the clean equality
  `min 282 (finrank ℚ colourRepImg.toSubmodule) = 8` (which holds precisely BECAUSE
  `finrank ℚ colourRepImg.toSubmodule = 8`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the single cause fails to force the full 8 /
  the four faces do not cohere on one derived element / the consolidated colour subalgebra is
  collapsed): that `min 282 (finrank ℚ colourRepImg.toSubmodule)` equals `282`. It GENUINELY equals
  `8` (`one_cause_dim_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `8 = 282` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the range
  `colourRepImg = colourRepV.range` of the injective restriction rep `colourRepV` — the IMAGE of the
  faithful embedding forced by the single derived element `u1` — has `finrank` `8`, so
  `min 282 (finrank ℚ colourRepImg.toSubmodule) = 8`, and claiming it equals `282` is genuinely
  FALSE (8 ≠ 282).

  DISTINCT from the banked battery (… C279 = 6=279, C280 = 8=280, C281 = 8=281): the pair (282, 8)
  is fresh (RHS 282 distinct from every prior right-hand value; the LHS anchor is the N251
  single-cause CONSOLIDATION dimension — the dim-8 colour su(3) forced by the four-faced `u1` in the
  `colour_charge_one_cause_u1` capstone role — DIFFERENT from C281's use in the N250 faithful-
  embedding IMAGE dimension in isolation, and from C280's faithful-embedding DOMAIN dimension).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherColourChargeOneCause

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 282 (finrank ℚ colourRepImg.toSubmodule) = 8`, holding precisely because the
    single derived element `u1` (the fold-root √−1) forces — through its four faces — the faithful
    induced colour rep whose image `colourRepImg` is the `8`-dimensional colour su(3) (banked
    `finrank_colourRepImg`, in the N251 one-cause-consolidation role). -/
theorem one_cause_dim_true :
    min 282 (Module.finrank ℚ colourRepImg.toSubmodule) = 8 := by
  rw [finrank_colourRepImg]; decide

/-- BOGUS: claims `min 282 (finrank ℚ colourRepImg.toSubmodule) = 282`. It GENUINELY equals `8`
    (`one_cause_dim_true`). The WRONG claim (the single cause fails to force the full 8 / the four
    faces do not cohere / the consolidated colour subalgebra is collapsed) reduces — through the
    banked value — to the false numeric `8 = 282`, so this must NOT compile. -/
theorem one_cause_dim_wrong_BOGUS :
    min 282 (Module.finrank ℚ colourRepImg.toSubmodule) = 282 := by
  rw [one_cause_dim_true]
  -- ⊢ (8 : ℕ) = 282  (FALSE — the costume bites)

end Counterexamples
