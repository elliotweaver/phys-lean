/-
  Counterexamples.TowerGatherChargeIsospinRatioWrongValueCostume — N253 anti-vacuity (C284).
  ===========================================================================
  W8 ANTI-VACUITY. The N253 node banks THE CONVENTION-FREE CHARGE:ISOSPIN INVARIANT-LENGTH RATIO
  `3 : 8` in the ambient `so(7)`: over the fundamental 7 = `ImO` of the derived octonion rung
  `O ℚ = CD (H ℚ)`, with the trace form `B(A,C) = trace (A ∘ C)`, the gather charge operator
  `chargeOp = crossOp u1` and the weak-isospin Cartan image `imRep DI` have invariant lengths
  `B(chargeOp, chargeOp) = −6` and `B(imRep DI, imRep DI) = −16`, so `8·B(chargeOp,chargeOp) =
  3·B(imRep DI, imRep DI) = −48` — the convention-free ratio `3 : 8` (`charge_isospin_ratio`).

  The load-bearing quantitative fact — the W8 TEETH anchoring the "3:8 ratio" claim — is that the
  charge invariant length is EXACTLY `−6` (`B_chargeOp_chargeOp`). A wrong reading of the ratio (the
  charge and isospin lengths are equal / the ratio is not `3:8` / the two operators are not
  trace-orthogonal / the invariant form is degenerate on the charge) would give a DIFFERENT value.

  The anchor is that genuine charge invariant length `−6`, packaged as the clean equality
  `min 284 (- Phys.Algebra.traceForm7 Phys.Algebra.chargeOp Phys.Algebra.chargeOp).toNat = 6`
  (which holds precisely BECAUSE `B(chargeOp, chargeOp) = −6`, so `(−B).toNat = 6`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the ratio is not 3:8 / the charge length is
  not −6 / the two forced operators have equal invariant length / the anchor is degenerate): that
  `min 284 (- traceForm7 chargeOp chargeOp).toNat` equals `284`. It GENUINELY equals `6`
  (`charge_length_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `6 = 284` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the two skew-adjoint
  endomorphisms `crossOp u1` and `imRep DI` of the fundamental 7 `ImO` have trace-form self-lengths
  `−6` and `−16` (ratio `3:8`), so `min 284 (−B(chargeOp,chargeOp)).toNat = 6`, and claiming it
  equals `284` is genuinely FALSE (6 ≠ 284).

  DISTINCT from the banked battery (… C282 = 8=282, C283 = 1=283): the pair (284, 6) is fresh (LHS
  284 distinct from every prior left-hand value; the anchor is the N253 charge invariant length in
  the fundamental-7 trace form — the convention-free-ratio TEETH — DIFFERENT from C283's N252
  colour-fixed-subspace dimension and C282's N251 consolidated-image dimension).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherChargeIsospinRatio

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min (284 : ℚ) (- traceForm7 chargeOp chargeOp) = 6`, holding precisely because the gather
    charge operator's invariant length in the fundamental-7 trace form is `−6` — the anchor of the
    convention-free `3:8` ratio (banked `B_chargeOp_chargeOp`). -/
theorem charge_length_true :
    min (284 : ℚ) (- traceForm7 chargeOp chargeOp) = 6 := by
  rw [B_chargeOp_chargeOp]; norm_num

/-- BOGUS: claims `min (284 : ℚ) (− B(chargeOp,chargeOp)) = 284`. It GENUINELY equals `6`
    (`charge_length_true`). The WRONG claim (the ratio is not 3:8 / the charge length is not −6 /
    the two forced operators have equal invariant length) reduces — through the banked value — to
    the false numeric `6 = 284`, so this must NOT compile. -/
theorem charge_length_wrong_BOGUS :
    min (284 : ℚ) (- traceForm7 chargeOp chargeOp) = 284 := by
  rw [charge_length_true]
  -- ⊢ (6 : ℚ) = 284  (FALSE — the costume bites)

end Counterexamples
