/-
  Counterexamples.TowerGatherIsometryWrongValueCostume — N257 anti-vacuity (C288).
  ===========================================================================
  W8 ANTI-VACUITY. The N257 node banks THE GATHER ISOMETRY: over the fundamental 7 `ImO` of the
  derived octonion rung `O ℚ = CD (H ℚ)`, the gather embedding `crossEmb : ImO →ₗ End ℚ ImO`,
  `a ↦ crossOp a`, is a SCALED ISOMETRY from the fold's Born self-overlap form `gForm` to the so(7)
  trace form `traceForm7 A C = trace (A ∘ C)`: `traceForm7 (crossOp ↑a) (crossOp ↑b) = -6 * gForm
  ↑a ↑b` for all `a b : ImO` (`gather_isometry`). The whole neutral-sector Gram collapses as ONE
  consequence: the two forced U(1) generators — the gather charge `chargeOp = crossOp u1` and the
  hypercharge `hyperOp = crossOp (kappaO 1)` — have EQUAL invariant length `-6` (`B_hyperOp_hyperOp`,
  `B_chargeOp_chargeOp_via_isometry`) and are trace-ORTHOGONAL (`B_chargeOp_hyperOp = 0`), an
  orthonormal pair forced by the fold metric, not chosen.

  The load-bearing quantitative fact — the W8 TEETH anchoring the "isometry" claim — is that the
  hypercharge invariant length is EXACTLY `-6` (`B_hyperOp_hyperOp : traceForm7 hyperOp hyperOp =
  -6`), the pullback scale of the Born form; equal to the charge length, NOT some other value. This
  equal-length + orthogonality is precisely what makes charge and hypercharge an orthonormal pair,
  the convention-free metric the mixing angle will eventually sit in.

  The anchor is that genuine invariant length, packaged as the clean equality
  `min 288 (- traceForm7 hyperOp hyperOp) = 6` (which holds precisely BECAUSE
  `traceForm7 hyperOp hyperOp = -6`, so `-(-6) = 6` and `min 288 6 = 6`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: crossEmb is NOT an isometry / the pullback scale
  is not −6 / hyperOp's length differs from chargeOp's / the two forced U(1)s are not equinormalized):
  that `min 288 (- traceForm7 hyperOp hyperOp)` equals `288`. It GENUINELY equals `6`
  (`gather_isometry_length_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `6 = 288` in ℚ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the endomorphism
  `hyperOp = crossOp (kappaO 1)` of `ImO` satisfies `traceForm7 hyperOp hyperOp = trace (hyperOp ∘
  hyperOp) = -6`, so `min 288 (- traceForm7 hyperOp hyperOp) = 6`, and claiming it equals `288` is
  genuinely FALSE (6 ≠ 288).

  DISTINCT from the banked battery (… C286 = 0=286, C287 = 1=287): the pair (288, 6) is fresh (RHS
  288 distinct from every prior right-hand value; the LHS anchor is the N257 gather-isometry pullback
  scale / hypercharge invariant length — the isometry TEETH — DIFFERENT from C284's N253 charge
  invariant-length `-6` read as a value, C286's N255 isospin-commuting vanishing bracket, and C287's
  N256 isospin-fixed-subspace dimension; here the anchor is the FORCED EQUALITY of the two U(1)
  lengths under the embedding, the isometry, never before costumed).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherIsometry

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 288 (- traceForm7 hyperOp hyperOp) = 6`, holding precisely because the hypercharge
    invariant length under the gather isometry is EXACTLY `-6` — equal to the charge length, the
    pullback scale of the fold's Born form (banked `B_hyperOp_hyperOp`). -/
theorem gather_isometry_length_true :
    min (288 : ℚ) (- traceForm7 hyperOp hyperOp) = 6 := by
  rw [B_hyperOp_hyperOp]; norm_num

/-- BOGUS: claims `min 288 (- traceForm7 hyperOp hyperOp) = 288`. It GENUINELY equals `6`
    (`gather_isometry_length_true`). The WRONG claim (crossEmb is not an isometry / the pullback
    scale is not −6 / hyperOp's length differs from chargeOp's / the two forced U(1)s are not
    equinormalized) reduces — through the banked value — to the false numeric `6 = 288`, so this must
    NOT compile. -/
theorem gather_isometry_length_wrong_BOGUS :
    min (288 : ℚ) (- traceForm7 hyperOp hyperOp) = 288 := by
  rw [gather_isometry_length_true]
  -- ⊢ (6 : ℚ) = 288  (FALSE — the costume bites)

end Counterexamples
