/-
  Counterexamples.TowerGatherForcedSecondNeutralWrongValueCostume — N254 anti-vacuity (C285).
  ===========================================================================
  W8 ANTI-VACUITY. The N254 node banks THE FORCED SECOND NEUTRAL DIRECTION: over the fundamental
  7 = `ImO` of the derived octonion rung `O ℚ = CD (H ℚ)`, the gather charge operator
  `chargeOp = crossOp u1` and the doubling weak-isospin Cartan `imRep DI` COMMUTE, are ℚ-linearly
  independent (a rank-2 abelian torus of `so(7)`), and — the load-bearing crux — grade the 7
  DIFFERENTLY: the isospin singlet `kap1 = κO 1` is isospin-NEUTRAL (`imRep DI kap1 = 0`) yet
  charge-NONZERO (`chargeOp kap1 ≠ 0`). The two gradings MISALIGN, so a second independent neutral
  generator is FORCED, not posited.

  The load-bearing quantitative fact — the W8 TEETH anchoring the "misaligned gradings" claim — is
  that the isospin singlet's CHARGE coordinate is EXACTLY `1`, not `0` (`chargeOp_kappaO_coord`:
  `(chargeOp kap1).im.re.im = 1`). A wrong reading (the two gradings COINCIDE / weak isospin already
  determines the charge grading / the isospin singlet is charge-neutral / no second neutral
  generator is forced) would give the charge coordinate `0`.

  The anchor is that genuine charge coordinate `1`, packaged as the clean equality
  `min 285 ((chargeOp kap1 : ImO) : O ℚ).im.re.im = 1` (which holds precisely BECAUSE the coordinate
  is `1`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the gradings coincide / the isospin singlet is
  charge-neutral / no hypercharge is forced): that `min 285 (…).im.re.im` equals `285`. It GENUINELY
  equals `1` (`misalignment_coord_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `1 = 285` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the skew-adjoint
  endomorphism `crossOp u1` of the fundamental 7 `ImO` sends the vector `⟨0,1⟩` (annihilated by
  `imRep DI`) to a vector with `c5`-coordinate `1`, so `min 285 (crossOp u1 ⟨0,1⟩).c5 = 1`, and
  claiming it equals `285` is genuinely FALSE (1 ≠ 285).

  DISTINCT from the banked battery (… C283 = 1=283, C284 = 6=284): the pair (285, 1) is fresh (LHS
  285 distinct from every prior left-hand value; the anchor is the N254 grading-MISALIGNMENT charge
  coordinate — the forced-second-neutral TEETH — DIFFERENT from C284's N253 charge invariant length
  and C283's N252 colour-fixed-subspace dimension).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedSecondNeutral

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min (285 : ℚ) ((chargeOp kap1 : ImO) : O ℚ).im.re.im = 1`, holding precisely because the
    isospin singlet's charge coordinate is `1` — the anchor of the misaligned-gradings claim (banked
    `chargeOp_kappaO_coord`). -/
theorem misalignment_coord_true :
    min (285 : ℚ) (((chargeOp kap1 : ImO) : O ℚ).im.re.im) = 1 := by
  rw [chargeOp_kappaO_coord]; norm_num

/-- BOGUS: claims `min (285 : ℚ) (…).im.re.im = 285`. It GENUINELY equals `1`
    (`misalignment_coord_true`). The WRONG claim (the two gradings coincide / the isospin singlet is
    charge-neutral / no second neutral generator is forced) reduces — through the banked value — to
    the false numeric `1 = 285`, so this must NOT compile. -/
theorem misalignment_coord_wrong_BOGUS :
    min (285 : ℚ) (((chargeOp kap1 : ImO) : O ℚ).im.re.im) = 285 := by
  rw [misalignment_coord_true]
  -- ⊢ (1 : ℚ) = 285  (FALSE — the costume bites)

end Counterexamples
