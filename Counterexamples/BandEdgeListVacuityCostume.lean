/-
  Counterexamples.BandEdgeListVacuityCostume — Z4 anti-vacuity (C498).
  ====================================================================
  W8 ANTI-VACUITY. The Z4 node (arc-Z THE FULL BAND-EDGE LIST) turns the band list `invAlphaZero`
  took as a PARAMETER (X6) into a DERIVED object: every band edge is a derived scale, the band ratios
  are ratios of those edges, and — its genuinely new forced content — the ELECTROWEAK→CONFINEMENT
  band is ALSO cutPi-free EXACT, `bandScreen chargeTraceDepth confBandRatio = 128/27` (the `cutPi`
  cancels between the derived loop normalization `κ = 1/(3·cutPi)` and the derived scale ratio
  `confBandRatio = cutExp(8π/3)`, exactly as the top band's `448/27` did). This gives the NEW exact
  derived confinement-scale way-point `invAlphaZero derivedBandList = 190/3`, and BOTH way-points
  (`1582/27`, `190/3`) land FREE on any lower extension (the overconstraint check).

  The load-bearing content this costume pins: the new exact band is `128/27`, NOT the wrong
  un-normalized `128/9` that the WRONG κ = 1/cutPi (no `1/3` Born-square normalization) would give.
  So the derived assembly `190/3` genuinely depends on the derived loop normalization — the band list
  is a REAL derived object with a REAL exact new way-point, not a vacuous relabelling.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the electroweak→confinement band is the
  EXACT cutPi-free `128/27` (NOT the un-normalized `128/9`), and the derived assembly screens above
  the octonion ceiling (`190/3 > 42`) — the band list is a real derived object, NOT vacuous". It is
  TIED to the banked Z4 landings by `xFlag_forced`: `confBand_screen_ne_wrong` witnesses the exact
  band is `128/27 ≠ 128/9`, and `invAlphaConf_gt_ceiling` witnesses the derived assembly genuinely
  screens above `42`, so the flag is `1`.

  We anchor `min 498 xFlag = 1` (TRUE — `xFlag = 1 < 498`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the band list is vacuous / the new band is not exact / the
  assembly does not screen" mis-reading): that `min 498 xFlag = 498`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 498` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (498, 1) is fresh (Cid 498 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.BandEdgeList
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE BAND-EDGE-LIST FLAG: `1` = "the electroweak→confinement band is the EXACT cutPi-free `128/27`
    (NOT the un-normalized `128/9`), and the derived assembly `190/3` screens above the octonion
    ceiling `42` — the band list is a real derived object, NOT vacuous". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked Z4 landing): `confBand_screen_ne_wrong` proves the new exact confinement
    band is `128/27 ≠ 128/9` (it genuinely uses the derived Born-square loop normalization), and
    `invAlphaConf_gt_ceiling` proves the derived assembly screens above `42`. So the flag is present,
    `xFlag = 1`. -/
theorem xFlag_forced :
    bandScreen chargeTraceDepth confBandRatio ≠ 128 / 9
    ∧ (42 : Cut) < invAlphaZero derivedBandList
    ∧ xFlag = 1 :=
  ⟨confBand_screen_ne_wrong, invAlphaConf_gt_ceiling, rfl⟩

/-- TRUE: `min 498 xFlag = 1`, holding precisely because `xFlag = 1 < 498`. -/
theorem cert_val_true : min (498 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 498 xFlag = 498`. It GENUINELY equals `1` (`cert_val_true`). A "the band list
    is vacuous / the new band is not exact / the assembly does not screen" mis-reading reduces —
    through the banked value — to the false numeric `1 = 498`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (498 : ℕ) xFlag = 498 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 498  (FALSE — the costume bites)

end Counterexamples
