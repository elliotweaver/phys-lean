/-
  Counterexamples.TowerGatherJointChargeIsospinWeightsWrongValueCostume — N276 anti-vacuity (C307).
  ===========================================================================
  W8 ANTI-VACUITY. The N276 node banks THE JOINT (CHARGE, WEAK-ISOSPIN-CARTAN) WEIGHT DECOMPOSITION
  of one generation's fundamental matter `ImO`: under the two BANKED COMMUTING derived operators
  `Q = chargeOp` (the gather tear on the fold-root `u1`, N240) and `T3 = imRep DI` (the doubling
  weak-isospin Cartan, N202), which COMMUTE (N254), the charged complement `Vsub = 3 ⊕ 3̄` splits
  into a CHARGED-but-isospin-Cartan-INERT block `Winert = span{e4O, e5O}` (dim 2) and an
  isospin-Cartan-ACTIVE block `Wactive` (dim 4). The load-bearing NEW dimension is

      `Module.finrank ℚ Winert = 2`     (N276 `finrank_Winert`)

  — the charged isospin-inert block is a GENUINE PLANE (two independent imaginary units `e4O`, `e5O`,
  both killed by the isospin Cartan `imRep DI` yet rotated into each other by the charge complex
  structure `chargeOp`). The value `2` certifies the block (i) is NOT collapsed (a wrong reading
  that the isospin-inert directions coincide / are spurious would give a smaller dimension), and
  (ii) is NOT the whole charged 6-space (the T3-active complement `Wactive` carries the other 4).

  We anchor `Module.finrank ℚ Winert = 2` (TRUE via `finrank_Winert`), packaged as
  `min 307 (finrank ℚ Winert) = 2`, TIED to the node via the headline `finrank_Winert`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the isospin-inert block is not a genuine
  2-plane / the joint grading is degenerate / a wrong dimension): that `min 307 (…) = 307`. It
  GENUINELY equals `2` (`witness_scale_true`). Rewriting the banked value reduces the bogus claim
  to the false numeric `2 = 307` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (307, 2) is fresh (RHS 307 distinct from every prior
  right-hand value: …, 303, 304, 305, 306). The LHS anchor is the N276 charged-isospin-inert block
  dimension `2` — a NEW role for the value `2` (the derived charged weight-block dimension), tied to
  the node via `finrank_Winert`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE (tied to the node's headline): the charged isospin-inert weight block `Winert` is a genuine
    2-plane — `dim Winert = 2` (N276 `finrank_Winert`). -/
theorem witness_true : Module.finrank ℚ Winert = 2 := finrank_Winert

/-- TRUE: `min 307 (dim Winert) = 2`, holding precisely because the joint grading gives the
    charged isospin-inert block a genuine plane of dimension 2. -/
theorem witness_scale_true : min (307 : ℕ) (Module.finrank ℚ Winert) = 2 := by
  rw [witness_true]

/-- BOGUS: claims `min 307 (dim Winert) = 307`. It GENUINELY equals `2` (`witness_scale_true`). The
    WRONG reading (the isospin-inert block is not a genuine 2-plane / the joint grading is
    degenerate / a wrong dimension) reduces — through the banked value — to the false numeric
    `2 = 307`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS : min (307 : ℕ) (Module.finrank ℚ Winert) = 307 := by
  rw [witness_scale_true]
  -- ⊢ (2 : ℕ) = 307  (FALSE — the costume bites)

end Counterexamples
