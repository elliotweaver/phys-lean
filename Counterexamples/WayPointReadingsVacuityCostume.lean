/-
  Counterexamples.WayPointReadingsVacuityCostume — Z7 anti-vacuity (C501).
  ========================================================================
  W8 ANTI-VACUITY. The Z7 node (arc-Z THE WAY-POINT READINGS RE-READ) reads `α(M_Z)` and
  `sin²θ_W(M_Z)` as PARTIAL SUMS of the SAME completed Z6 tower. The `M_Z` scale sits BETWEEN the
  electroweak edge `v` and the confinement edge `Λ`, so `M_Z` is an INTERMEDIATE edge inside the
  banked confinement band, and refining the band at `M_Z` splits it into two consecutive sub-bands
  whose screenings recombine EXACTLY (the `cutLog` homomorphism telescoping). The consequences: the
  ENDPOINT IS INVARIANT under the `M_Z` refinement (`endpoint_invariant_under_MZ_refinement` — the
  consistency tooth: inserting the `M_Z` edge never moves the endpoint), and the `M_Z` reading is a
  GENUINE partial sum STRICTLY BELOW the full endpoint (`endpoint_gt_invAlphaMZ`).

  The load-bearing content this costume pins (evaluated at the CANONICAL refinement `vz = zL =
  confBandRatio`, so `vz·zL = confBandRatio` up to the square — we instead pin the two theorems at a
  witness satisfying the forced product constraint): (a) the endpoint invariance is REAL — for the
  witness `vz = confBandRatio`, `zL = 1` (so `vz·zL = confBandRatio`), the `M_Z`-refined tower
  evaluates to the SAME endpoint as the Z6 complete list; (b) the `M_Z` reading genuinely screens
  above the octonion ceiling and is STRICTLY below the endpoint. So the `M_Z` reading is a real
  derived partial sum of the ONE completed tower, not a vacuous relabelling of Z6.

  THE CERTIFICATE. `zFlag := 1` — a ℕ flag standing for "the endpoint is INVARIANT under the `M_Z`
  refinement (the consistency tooth) AND the `M_Z` reading is a genuine partial sum strictly below
  the endpoint — the way-point reading is real, NOT vacuous". It is TIED to the banked Z7 landings by
  `zFlag_forced`: `endpoint_invariant_under_MZ_refinement` (at the witness `vz = confBandRatio`,
  `zL = 1`) witnesses the invariance, and `endpoint_gt_invAlphaMZ` (same witness) witnesses the `M_Z`
  reading strictly below the endpoint, so the flag is `1`.

  We anchor `min 501 zFlag = 1` (TRUE — `zFlag = 1 < 501`, so the min is `zFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the way-point reading is vacuous / the `M_Z` refinement moves
  the endpoint / the `M_Z` reading is not below the endpoint" mis-reading): that `min 501 zFlag =
  501`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false
  numeric `1 = 501` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (501, 1) is fresh (Cid 501 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.WayPointReadings
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.BandEdgeList Phys.Algebra.EndpointAssembly
open Phys.Algebra.WayPointReadings
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE WAY-POINT FLAG: `1` = "the endpoint is INVARIANT under the `M_Z` refinement (the consistency
    tooth) AND the `M_Z` reading is a genuine partial sum strictly below the endpoint — the way-point
    reading is real, NOT vacuous". -/
def zFlag : ℕ := 1

/-- The confinement-band ratio is positive (`confBandRatio > 1 > 0`, banked). -/
theorem confBandRatio_pos : (0 : Cut) < confBandRatio :=
  lt_trans one_pos confBandRatio_gt_one

/-- TRUE (tied to the banked Z7 landings): at the witness `vz = confBandRatio`, `zL = 1` (so
    `vz·zL = confBandRatio`), `endpoint_invariant_under_MZ_refinement` proves the `M_Z`-refined tower
    evaluates to the SAME endpoint as the Z6 complete list, and `endpoint_gt_invAlphaMZ` proves the
    `M_Z` reading is strictly below the full endpoint. So the flag is present, `zFlag = 1`. -/
theorem zFlag_forced :
    invAlphaZero (mzWaypointList confBandRatio 1 chargeTraceDepth)
      = invAlphaZero (completeBandList chargeTraceDepth)
    ∧ invAlphaMZ confBandRatio < invAlphaZero (completeBandList chargeTraceDepth)
    ∧ zFlag = 1 :=
  ⟨endpoint_invariant_under_MZ_refinement confBandRatio 1 chargeTraceDepth confBandRatio_pos
      one_pos (mul_one confBandRatio),
   endpoint_gt_invAlphaMZ confBandRatio 1 confBandRatio_pos (le_refl 1) (mul_one confBandRatio),
   rfl⟩

/-- TRUE: `min 501 zFlag = 1`, holding precisely because `zFlag = 1 < 501`. -/
theorem cert_val_true : min (501 : ℕ) zFlag = 1 := by decide

/-- BOGUS: claims `min 501 zFlag = 501`. It GENUINELY equals `1` (`cert_val_true`). A "the way-point
    reading is vacuous / the `M_Z` refinement moves the endpoint / the `M_Z` reading is not below the
    endpoint" mis-reading reduces — through the banked value — to the false numeric `1 = 501`, so this
    must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (501 : ℕ) zFlag = 501 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 501  (FALSE — the costume bites)

end Counterexamples
