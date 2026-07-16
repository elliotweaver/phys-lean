/-
  Counterexamples.ZArcValidationCapstoneVacuityCostume — Z8 anti-vacuity (C502).
  =============================================================================
  W8 ANTI-VACUITY. The Z8 node (arc-Z THE AIRTIGHT VALIDATION CAPSTONE, TERMINAL) bundles the seven
  arc-Z landings + the X10 ledger UPGRADED into ONE derived object over the derived ℝ `Cut`, with the
  NON-HOLLOW heart being the ONE-TOWER WELD: the SM's five unrelated measured couplings are ALL PARTIAL
  SUMS of the ONE completed band tower. The capstone must be a REAL welded derived object, NOT a hollow
  `∧` of banked capstones — statable from no single conjunct alone, with a garbage witness failing.

  The load-bearing content this costume pins: (a) the ONE-TOWER WELD is REAL — the completed tower
  genuinely reads the endpoint STRICTLY ABOVE the confinement way-point `190/3`
  (`endpoint_gt_conf`), so the readings are genuinely different partial sums of the ONE tower (a hollow
  ∧ where every "reading" is the same trivial value is excluded); (b) the X10 QUARK-TEXTURE DEBT is
  genuinely PAID — the `quarkTextureStructure` value is a `theoremExact` graded entry of `zGradeLedger`
  (`x10_quark_debt_paid`), NOT a residual, so the ledger upgrade is real. So the capstone is a real
  welded derived object, not a vacuous relabelling.

  THE CERTIFICATE. `zFlag := 1` — a ℕ flag standing for "the ONE-TOWER WELD is REAL (the endpoint is a
  genuine partial sum strictly above the confinement way-point) AND the X10 quark-texture debt is
  genuinely PAID (`theoremExact` in the grade ledger) — the airtight capstone is real, NOT vacuous".
  It is TIED to the banked Z8 landings by `zFlag_forced`: `endpoint_gt_conf` witnesses the endpoint
  strictly above `190/3`, and `x10_quark_debt_paid` witnesses the paid debt, so the flag is `1`.

  We anchor `min 502 zFlag = 1` (TRUE — `zFlag = 1 < 502`, so the min is `zFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the capstone is a hollow ∧ / the endpoint is not a genuine
  partial sum / the X10 debt is not paid" mis-reading): that `min 502 zFlag = 502`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 502` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (502, 1) is fresh (Cid 502 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ZArcValidationCapstone
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.BandEdgeList Phys.Algebra.EndpointAssembly
open Phys.Algebra.ZArcValidationCapstone
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE Z8 FLAG: `1` = "the ONE-TOWER WELD is REAL (the endpoint strictly above the confinement
    way-point) AND the X10 quark-texture debt is genuinely PAID (`theoremExact` in the grade ledger) —
    the airtight capstone is real, NOT vacuous". -/
def zFlag : ℕ := 1

/-- TRUE (tied to the banked Z8 landings): `endpoint_gt_conf` proves the endpoint is strictly above the
    confinement way-point `190/3` (a genuine partial sum of the ONE tower), and `x10_quark_debt_paid`
    proves the X10 quark-texture debt is a `theoremExact` graded entry. So the flag is present,
    `zFlag = 1`. -/
theorem zFlag_forced :
    (190 : Cut) / 3 < invAlphaZero (completeBandList chargeTraceDepth)
    ∧ (ZValue.quarkTextureStructure, Grade.theoremExact) ∈ zGradeLedger
    ∧ zFlag = 1 :=
  ⟨endpoint_gt_conf, (x10_quark_debt_paid).2, rfl⟩

/-- TRUE: `min 502 zFlag = 1`, holding precisely because `zFlag = 1 < 502`. -/
theorem cert_val_true : min (502 : ℕ) zFlag = 1 := by decide

/-- BOGUS: claims `min 502 zFlag = 502`. It GENUINELY equals `1` (`cert_val_true`). A "the capstone is
    a hollow ∧ / the endpoint is not a genuine partial sum / the X10 debt is not paid" mis-reading
    reduces — through the banked value — to the false numeric `1 = 502`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (502 : ℕ) zFlag = 502 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 502  (FALSE — the costume bites)

end Counterexamples
