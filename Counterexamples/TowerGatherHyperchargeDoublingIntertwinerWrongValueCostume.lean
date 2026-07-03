/-
  Counterexamples.TowerGatherHyperchargeDoublingIntertwinerWrongValueCostume — N278 anti-vacuity (C309).
  ===========================================================================
  W8 ANTI-VACUITY. The N278 node banks THE FORCED HYPERCHARGE OPERATOR IS THE CAYLEY–DICKSON
  DOUBLING INTERTWINER: the banked forced hypercharge `hyperOp = crossOp (κO 1)` (N255), on N277's
  weak-isospin multiplet decomposition `ImO = TL ⊕ Sg ⊕ TR = 3 ⊕ 1 ⊕ 3`, SWAPS the two triplets
  (`TL_map_hyperOp_eq_TR : TL.map hyperOp = TR`), KILLS the fixed doubling axis Sg, and induces a
  genuine su(2)_L-module isomorphism `TL ≃ TR`. The load-bearing NEW value is the dimension of the
  IMAGE of the un-doubled triplet `TL` under the doubling intertwiner:

      `Module.finrank ℚ (TL.map hyperOp) = 3`   (via N278 `TL_map_hyperOp_eq_TR` + `finrank_TR`)

  — the doubling intertwiner carries the un-doubled 3-dim triplet ONTO a genuine 3-dim image (the
  doubled triplet `TR`), NOT a lower-dimensional / collapsed / degenerate image. The value `3`
  certifies (i) the swap is NON-DEGENERATE (a wrong reading in which `hyperOp` collapses `TL` to a
  smaller subspace, or fails to be injective on it, would give a value `< 3`), and (ii) it is
  DISTINCT from N277's `finrank_TL = 3` costume (C308): THIS anchor is the dimension of the IMAGE
  `TL.map hyperOp` — the fingerprint of the SWAP theorem `TL_map_hyperOp_eq_TR`, not of `TL` alone.

  We anchor `Module.finrank ℚ (TL.map hyperOp) = 3` (TRUE via `TL_map_hyperOp_eq_TR` + `finrank_TR`),
  packaged as `min 309 (finrank ℚ (TL.map hyperOp)) = 3`, TIED to the node via the headline swap
  theorem.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the intertwiner collapses / is not injective on
  the triplet / the swap is degenerate): that `min 309 (…) = 309`. It GENUINELY equals `3`
  (`witness_scale_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `3 = 309` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (309, 3) is fresh (RHS 309 distinct from every prior
  right-hand value: …, 305, 306, 307, 308). The LHS anchor is the N278 doubling-intertwiner IMAGE
  dimension `3` — a NEW role for the value `3` (the dimension of `TL.map hyperOp`, the swapped
  triplet), tied to the node via `TL_map_hyperOp_eq_TR`.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherHyperchargeDoublingIntertwiner
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE (tied to the node's headline swap): the image of the un-doubled triplet `TL` under the
    doubling intertwiner `hyperOp` is a genuine 3-space — `dim (TL.map hyperOp) = 3` (it equals
    `TR`, N278 `TL_map_hyperOp_eq_TR` + `finrank_TR`). -/
theorem witness_true : Module.finrank ℚ (TL.map hyperOp) = 3 := by
  rw [TL_map_hyperOp_eq_TR, finrank_TR]

/-- TRUE: `min 309 (dim (TL.map hyperOp)) = 3`, holding precisely because the forced-hypercharge
    doubling intertwiner carries the un-doubled triplet ONTO a genuine 3-dim image. -/
theorem witness_scale_true : min (309 : ℕ) (Module.finrank ℚ (TL.map hyperOp)) = 3 := by
  rw [witness_true]; decide

/-- BOGUS: claims `min 309 (dim (TL.map hyperOp)) = 309`. It GENUINELY equals `3`
    (`witness_scale_true`). The WRONG reading (the doubling intertwiner collapses the triplet / is
    degenerate / the swap fails) reduces — through the banked value — to the false numeric
    `3 = 309`, so this must NOT compile. -/
theorem witness_scale_wrong_BOGUS :
    min (309 : ℕ) (Module.finrank ℚ (TL.map hyperOp)) = 309 := by
  rw [witness_scale_true]
  -- ⊢ (3 : ℕ) = 309  (FALSE — the costume bites)

end Counterexamples
