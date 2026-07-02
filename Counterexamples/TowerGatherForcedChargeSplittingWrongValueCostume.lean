/-
  Counterexamples.TowerGatherForcedChargeSplittingWrongValueCostume — N241 anti-vacuity (C272).
  ===========================================================================
  W8 ANTI-VACUITY. The N241 node banks THE FORCED CHARGE SPLITTING of the two triplets: the
  gather-obstruction charge operator `crossOpO u1` maps the `3` (`Uhol`) ONTO the `3̄` (`Uah`)
  and the `3̄` ONTO the `3` (`Uhol_map_crossOpO_eq_Uah` / `Uah_map_crossOpO_eq_Uhol`), and the
  swap is GENUINE — the image of `Uhol` is DISJOINT from `Uhol` itself
  (`Uhol_crossOpO_disj : Uhol.map (crossOpO u1) ⊓ Uhol = ⊥`). The load-bearing fact — the one
  that makes the splitting a real EXCHANGE (opposite charge) and not a fixed triplet — is exactly
  that the meet is `⊥`, equivalently that its dimension is `0`.

  A dimension `= 0` is not vacuous here (it certifies the DISJOINTNESS of the image from the
  source — the genuine swap), so the anchor is the genuine value itself, packaged as the clean
  equality `min 272 (finrank ℚ (Uhol.map (crossOpO u1) ⊓ Uhol)) = 0` (which holds precisely
  BECAUSE `Uhol.map (crossOpO u1) ⊓ Uhol = ⊥`, so its finrank is `0`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the charge operator FIXES a triplet / the
  two triplets are NOT exchanged / the image overlaps the source / the splitting is not a genuine
  particle-antiparticle swap): that `min 272 (finrank ℚ (Uhol.map (crossOpO u1) ⊓ Uhol))` equals
  `272`. It GENUINELY equals `0` (`splitting_meet_dim_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `0 = 272` in ℕ. The kernel cannot close it; the costume
  BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the image of
  `Uhol` under `crossOpO u1` genuinely meets `Uhol` in `⊥` (dimension `0`), so
  `min 272 (finrank ℚ (Uhol.map (crossOpO u1) ⊓ Uhol)) = 0`, and claiming it equals `272` is
  genuinely FALSE (0 ≠ 272).

  DISTINCT from the banked battery (… C270 = 27=270, C271 = 8=271): the pair (272, 0) is fresh
  (RHS 272 distinct from every prior right-hand value; the LHS anchor is the NEW N241
  forced-charge-splitting disjointness, the genuine-swap witness carried by the covariant
  gather-obstruction charge operator).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedChargeSplitting

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 272 (finrank ℚ (Uhol.map (crossOpO u1) ⊓ Uhol)) = 0`, holding precisely because the
    image of the `3` (`Uhol`) under the gather charge operator `crossOpO u1` meets `Uhol` in `⊥`
    — the genuine EXCHANGE with the `3̄` (banked `Uhol_crossOpO_disj`), so the meet has finrank
    `0`. -/
theorem splitting_meet_dim_true :
    min 272 (Module.finrank ℚ (Uhol.map (crossOpO u1) ⊓ Uhol : Submodule ℚ (O ℚ))) = 0 := by
  have h : (Uhol.map (crossOpO u1) ⊓ Uhol : Submodule ℚ (O ℚ)) = ⊥ := Uhol_crossOpO_disj
  rw [h, finrank_bot, Nat.min_zero]

/-- BOGUS: claims `min 272 (finrank ℚ (Uhol.map (crossOpO u1) ⊓ Uhol)) = 272`. It GENUINELY equals
    `0` (`splitting_meet_dim_true`). The WRONG claim (the charge operator FIXES a triplet / the
    two triplets are NOT exchanged) reduces — through the banked value — to the false numeric
    `0 = 272`, so this must NOT compile. -/
theorem splitting_meet_dim_wrong_BOGUS :
    min 272 (Module.finrank ℚ (Uhol.map (crossOpO u1) ⊓ Uhol : Submodule ℚ (O ℚ))) = 272 := by
  rw [splitting_meet_dim_true]
  -- ⊢ (0 : ℕ) = 272  (FALSE — the costume bites)

end Counterexamples
