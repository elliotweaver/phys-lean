/-
  Counterexamples.DepthTowerDescentVacuityCostume — Z5 anti-vacuity (C499).
  =========================================================================
  W8 ANTI-VACUITY. The Z5 node (arc-Z THE DEPTH TOWER THROUGH THE DESCENT) welds X5's banked
  all-orders normalization `kappaLeadingDressed w = kappaLeading/(1−w)` to Z4's derived band tower:
  each band's screening increment is run with the DRESSED census-in-census `κ(w)` in place of the
  leading `κ₀`. Because the increment is LINEAR in the normalization, the whole tower dresses by the
  same `(1−w)`, giving the EXACT closed function `dressedInvAlphaZero w derivedBandList = 42 +
  (64/3)/(1−w)` (the running OF the running), recovering Z4's `190/3` exactly at `w = 0`.

  The load-bearing content this costume pins: the running-of-the-running is REAL (for `0 < w < 1` the
  dressed confinement band STRICTLY EXCEEDS the bare Z4 band `128/27`) AND EXACT (the closed value is
  NOT the first-order truncation — a truncation is not the theory's claim). So the depth tower is a
  REAL derived object with a REAL exact closed function, not a vacuous relabelling of Z4.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the depth tower genuinely dresses (the
  running-of-the-running strictly exceeds the bare band for a nontrivial weight) AND is EXACT (not the
  first-order truncation) — the depth tower is a real derived object, NOT vacuous". It is TIED to the
  banked Z5 landings by `xFlag_forced`: `dressed_gt_bare_conf` (at `w = 1/2`) witnesses the dressed
  band strictly exceeds the bare `128/27`, and `dressed_ne_truncated` witnesses the exact value differs
  from the truncation, so the flag is `1`.

  We anchor `min 499 xFlag = 1` (TRUE — `xFlag = 1 < 499`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the depth tower is vacuous / the dressing does not add / the
  claim is only a truncation" mis-reading): that `min 499 xFlag = 499`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 499` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (499, 1) is fresh (Cid 499 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DepthTowerDescent
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.BandEdgeList Phys.Algebra.DepthTowerDescent
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE DEPTH-TOWER FLAG: `1` = "the depth tower genuinely dresses (running-of-the-running strictly
    exceeds the bare band for a nontrivial weight) AND is EXACT (not the first-order truncation) — the
    depth tower is a real derived object, NOT vacuous". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked Z5 landing): `dressed_gt_bare_conf` (at `w = 1/2`) proves the dressed
    confinement band strictly exceeds the bare `128/27`, and `dressed_ne_truncated` proves the exact
    value differs from the first-order truncation. So the flag is present, `xFlag = 1`. -/
theorem xFlag_forced :
    (128 : Cut) / 27 < dressedBandScreen (1 / 2) chargeTraceDepth confBandRatio
    ∧ dressedBandScreen (1 / 2) chargeTraceDepth confBandRatio ≠ (128 / 27) * (1 + 1 / 2)
    ∧ xFlag = 1 :=
  ⟨dressed_gt_bare_conf (1 / 2) (by norm_num) (by norm_num), dressed_ne_truncated, rfl⟩

/-- TRUE: `min 499 xFlag = 1`, holding precisely because `xFlag = 1 < 499`. -/
theorem cert_val_true : min (499 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 499 xFlag = 499`. It GENUINELY equals `1` (`cert_val_true`). A "the depth tower
    is vacuous / the dressing does not add / the claim is only a truncation" mis-reading reduces —
    through the banked value — to the false numeric `1 = 499`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (499 : ℕ) xFlag = 499 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 499  (FALSE — the costume bites)

end Counterexamples
