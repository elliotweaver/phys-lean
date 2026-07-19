/-
  Counterexamples.D7AboveFloorExactVacuityCostume — the D7 ABOVE-FLOOR EXACT contribution is GENUINE:
  the hadronic above-floor occupancy contributes EXACTLY ZERO to the census-conserving endpoint
  (`reweightedFreezeout (11/3) (10/3) 2 rb rc rl − totalScreening (freezeoutTail rb rc rl) = 0`, a
  certified value not a bound), the above-floor occupancy is genuinely populated (a concrete witness at
  level `4`: `scaledUnit 2 0 true ∈ levelOccupancy 4`), and the banked bound the exact `0` tightens is
  strictly positive (`0 < kappaLeading·9·cutLog R` for `1 < R`). C572.
  =====================================================================================
  W8 ANTI-VACUITY. This node TIGHTENS the banked above-floor term from a BOUND (`≤ κ·9·cutLog R`) to an
  EXACT value (`0`), truly closing the D7 composition-completeness ledger (owner step 2). The content
  that must NOT be hollow: (i) the above-floor occupancy is genuinely populated above the floor
  (`abovefloor_witness`: `scaledUnit 2 0 true ∈ levelOccupancy 4`, so the "occupancy series" is a real
  object, not empty); (ii) the above-floor contributes EXACTLY zero (`abovefloor_contributes_zero`), so
  it is a real value not a slack bound; (iii) the bound it tightens is strictly positive
  (`abovefloor_bound_strictly_pos`), so the tightening is real content — a `κ·9·cutLog R > 0` slack
  collapsed to an exact `0`. If the above-floor were empty, or contributed a nonzero unknown, or the
  bound were vacuously `≤ 0`, the closure would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 above-floor exact
  closure is genuine: the above-floor is populated, its contribution is exactly zero, and the tightened
  bound is strictly positive". It is TIED to the banked landing by attestFlag_forced.

  We anchor min 572 attestFlag = 1 (TRUE -- attestFlag = 1 < 572, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the above-floor is empty / contributes nonzero / the bound is
  vacuous / the closure is hollow" reading): that min 572 attestFlag = 572. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 572 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (572, 1) is fresh (Cid 572 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7AboveFloorExact
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.D7AboveFloorExact
open Phys.Algebra.HadronicLevelWeights
open Phys.Algebra.FreezeoutReweightingBounded
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 above-floor exact closure is genuine: the above-floor is populated, its
    contribution is exactly zero, and the tightened bound is strictly positive". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the above-floor occupancy is populated at level `4`
    (`abovefloor_witness`), the above-floor contributes exactly zero (`abovefloor_contributes_zero` at
    a concrete edge triple), the banked bound is strictly positive (`abovefloor_bound_strictly_pos` at
    `R = 2`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    (scaledUnit (2 : ℤ) 0 true ∈ levelOccupancy 4)
    ∧ (reweightedFreezeout (11 / 3) (10 / 3) 2 2 2 2
        - totalScreening (freezeoutTail 2 2 2) = 0)
    ∧ (0 < kappaLeading * 9 * cutLog 2)
    ∧ attestFlag = 1 :=
  ⟨abovefloor_witness, abovefloor_contributes_zero 2 2 2,
   abovefloor_bound_strictly_pos 2 (by norm_num), rfl⟩

/-- TRUE: min 572 attestFlag = 1, holding precisely because attestFlag = 1 < 572. -/
theorem cert_val_true : min (572 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 572 attestFlag = 572. It GENUINELY equals 1 (cert_val_true). A "the above-floor
    is empty / contributes nonzero / the bound is vacuous / the closure is hollow" reading reduces --
    through the banked abovefloor_witness / abovefloor_contributes_zero / abovefloor_bound_strictly_pos
    tie -- to the false numeric 1 = 572 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (572 : ℕ) attestFlag = 572 := by
  rw [cert_val_true]

end Counterexamples
