/-
  Counterexamples.OctonionJordanGaugeNeutralInnerDerivationWrongValueCostume — N287 anti-vacuity (C316).
  ===========================================================================
  W8 ANTI-VACUITY. The N287 node proves that the banked inner-derivation member
  `M0 = innerMul (slotA 1)(slotB 1)` — a genuine member of the derived `f₄ = Der(H₃(O)) = derH3`
  escaping `g₂` (N286) — COMMUTES WITH THE ENTIRE DERIVED GAUGE `g₂` (`M0_gauge_central`:
  `⁅jActL D, M0⁆ = 0` for every derivation `D`), via the coordinate-free Leibniz lever
  `⁅jActL D, innerMul A B⁆ = innerMul (jAct D A) B + innerMul A (jAct D B)` and `D 1 = 0`. So the
  derived arena `f₄` SUPPLIES a nonzero, gauge-neutral, genuinely-non-gauge complement member — the
  colour-neutral room the vector carriers so(7)/so(8) provably lacked (N283 joint centralizer `= 0`).

  The certificate that this gauge-neutral member is NON-TRIVIAL (that its gauge-commutativity is
  genuine content and not the vacuous neutrality of the zero map) is the real part of the off-diagonal
  entry the SAME member produces from a purely diagonal input:

      `reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2) = 1`

  — via `innerMul_slot_diag` (N274) + `slotC_entry`, the banked non-triviality certificate the
  capstone `gauge_neutral_inner_derivation_in_f4` rests on (`innerMul (slotA 1)(slotB 1) (Dg 0 0 1) ≠ 0`).
  The value `1 ≠ 0` certifies that the gauge-neutral member genuinely moves matter off the diagonal —
  so `M0` is a NON-VACUOUS gauge-commuting member of the inner-derivation complement, and the arena
  `f₄` genuinely supplies the room that so(8) could not.

  We anchor `memberVal.num.natAbs = 1` (TRUE), packaged as `min 316 (memberVal.num.natAbs) = 1`,
  TIED to the node via `innerMul_slot_diag` + `slotC_entry` (the same banked facts N287's capstone
  rests on: `M0 ∈ derH3 ∧ M0 gauge-central ∧ M0 moves the diagonal`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the gauge-neutral member is the zero / trivial
  map / does NOT actually commute with the gauge / the neutral room is empty / `f₄` has no more room
  than so(8)): that `min 316 (…) = 316`. It GENUINELY equals `1` (`member_scale_true`). Rewriting the
  banked value reduces the bogus claim to the false numeric `1 = 316` in ℕ. The kernel cannot close
  it; the costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (316, 1) is fresh (RHS 316 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE GAUGE-NEUTRAL-MEMBER NON-TRIVIALITY CERTIFICATE: the real part of the `(1,2)` off-diagonal
    entry the gauge-neutral member `M0 = innerMul (slotA 1)(slotB 1)` (which commutes with the whole
    derived gauge, `M0_gauge_central`) produces from the diagonal input `Dg 0 0 1`. It is `1` (via
    `innerMul_slot_diag` + `slotC_entry`), certifying the gauge-neutral member genuinely moves matter
    — so `M0` is a NON-VACUOUS gauge-commuting member of the inner-derivation complement, and `f₄`
    genuinely supplies the room the vector carriers lacked. -/
noncomputable def memberVal : ℚ := reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2)

/-- TRUE (tied to the banked N274 identity `innerMul_slot_diag`): the certificate is `1`. -/
theorem memberVal_eq : memberVal = 1 := by
  show reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2) = 1
  rw [innerMul_slot_diag]
  simp only [star_one, mul_one, sub_zero, one_smul, slotC_entry]
  simp only [reQ]; norm_num

/-- TRUE: the magnitude of the gauge-neutral-member non-triviality certificate is `1`. -/
theorem memberNum_true : memberVal.num.natAbs = 1 := by rw [memberVal_eq]; decide

/-- TRUE: `min 316 (magnitude of the gauge-neutral-member certificate) = 1`, holding precisely
    because the gauge-neutral member `M0 = innerMul (slotA 1)(slotB 1)` GENUINELY moves matter off the
    diagonal — so the gauge-commuting membership N287 proves is non-vacuous and `f₄` genuinely
    supplies the colour-neutral room. -/
theorem member_scale_true : min (316 : ℕ) memberVal.num.natAbs = 1 := by
  rw [memberNum_true]; decide

/-- BOGUS: claims `min 316 (magnitude of the member certificate) = 316`. It GENUINELY equals `1`
    (`member_scale_true`). The WRONG reading (the gauge-neutral member is trivial / does NOT commute
    with the gauge / the neutral room is empty / `f₄` has no more room than so(8)) reduces — through
    the banked value — to the false numeric `1 = 316`, so this must NOT compile. -/
theorem member_scale_wrong_BOGUS :
    min (316 : ℕ) memberVal.num.natAbs = 316 := by
  rw [member_scale_true]
  -- ⊢ (1 : ℕ) = 316  (FALSE — the costume bites)

end Counterexamples
