/-
  Counterexamples.TowerGatherForcedHyperchargeDirectionWrongValueCostume — N255 anti-vacuity (C286).
  ===========================================================================
  W8 ANTI-VACUITY. The N255 node banks THE FORCED HYPERCHARGE DIRECTION: over the fundamental
  7 = `ImO` of the derived octonion rung `O ℚ = CD (H ℚ)`, the gather cross-product of the
  isospin-NEUTRAL branching singlet `hyperOp = crossOp (kappaO 1)` (the TWIN of the charge operator
  `chargeOp = crossOp u1`) COMMUTES with the WHOLE weak isospin su(2)_L = {DI, DJ, DK} —
  `⁅imRep D, hyperOp⁆ = 0` for every isospin generator — WHEREAS `chargeOp` does NOT
  (`⁅imRep DJ, chargeOp⁆ ≠ 0`, banked N240). The two U(1)s are GENUINELY DIFFERENT operators.

  The load-bearing HEADLINE — the W8 TEETH — is that `hyperOp` genuinely commutes with `imRep DJ`:
  the bracket `⁅imRep DJ, hyperOp⁆` is the ZERO endomorphism (`hyperOp_bracket_DJ`), so applied to
  ANY vector — in particular the singlet vector `kap1' = ⟨kappaO 1⟩` — it yields the zero vector,
  every coordinate `0`. A WRONG reading (the isospin-commuting direction is NOT `crossOp (kappaO 1)`
  / `hyperOp` does NOT commute with all su(2)_L / the two U(1)s COINCIDE / no distinct second neutral
  direction is pinned) would give a NONZERO bracket, hence a nonzero coordinate here.

  The anchor is that genuine vanishing coordinate `0`, packaged as the clean equality
  `min 286 ((⁅imRep DJ, hyperOp⁆ kap1' : ImO) : O ℚ).re.re.re = 0` (which holds precisely BECAUSE
  the bracket is the zero map, so the coordinate is `0` and `min 286 0 = 0`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: `hyperOp` fails to commute with all su(2)_L /
  the two U(1)s coincide / the hypercharge direction is not `crossOp (kappaO 1)`): that
  `min 286 (…).re.re.re` equals `286`. It GENUINELY equals `0` (`hyper_commute_coord_true`).
  Rewriting the banked vanishing bracket reduces the bogus claim to the false numeric `0 = 286` in
  ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the endomorphism
  `⁅imRep DJ, crossOp (kappaO 1)⁆` of the fundamental 7 `ImO` is the ZERO map, so sending the vector
  `⟨0,1⟩` through it gives `0`, `min 286 (…).re.re.re = 0`, and claiming it equals `286` is
  genuinely FALSE (0 ≠ 286).

  DISTINCT from the banked battery (… C284 = 6=284, C285 = 1=285): the pair (286, 0) is fresh (LHS
  286 distinct from every prior left-hand value; the anchor is the N255 isospin-COMMUTING vanishing
  bracket — the forced-hypercharge-direction TEETH — DIFFERENT from C285's N254 grading-misalignment
  charge coordinate and C284's N253 charge invariant length).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedHyperchargeDirection

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min (286 : ℚ) ((⁅imRep DJ, hyperOp⁆ kap1' : ImO) : O ℚ).re.re.re = 0`, holding precisely
    because `hyperOp` COMMUTES with `imRep DJ` (the bracket is the zero map, `hyperOp_bracket_DJ`) —
    the anchor of the isospin-commuting headline. -/
theorem hyper_commute_coord_true :
    min (286 : ℚ) (((⁅imRep DJ, hyperOp⁆ kap1' : ImO) : O ℚ).re.re.re) = 0 := by
  rw [hyperOp_bracket_DJ]
  simp

/-- BOGUS: claims `min (286 : ℚ) (…).re.re.re = 286`. It GENUINELY equals `0`
    (`hyper_commute_coord_true`). The WRONG claim (`hyperOp` does NOT commute with all su(2)_L / the
    two U(1)s coincide / the hypercharge direction is not `crossOp (kappaO 1)`) reduces — through the
    banked vanishing bracket — to the false numeric `0 = 286`, so this must NOT compile. -/
theorem hyper_commute_coord_wrong_BOGUS :
    min (286 : ℚ) (((⁅imRep DJ, hyperOp⁆ kap1' : ImO) : O ℚ).re.re.re) = 286 := by
  rw [hyper_commute_coord_true]
  -- ⊢ (0 : ℚ) = 286  (FALSE — the costume bites)

end Counterexamples
