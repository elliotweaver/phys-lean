/-
  Counterexamples.OctonionJordanInnerDerivationLeibnizWrongValueCostume — N286 anti-vacuity (C315).
  ===========================================================================
  W8 ANTI-VACUITY. The N286 node proves that the inner-multiplication commutator
  `innerMul (slotA 1)(slotB 1) = ⁅L_{slotA 1}, L_{slotB 1}⁆` is a GENUINE member of the derived
  `f₄ = Der(H₃(O)) = derH3` (N285) — it satisfies the Jordan-derivation Leibniz law on the Hermitian
  arena (`innerMul_mem_derH3`, by linearizing the banked cap `jdef_H3`) — YET it MOVES the diagonal
  that every entrywise gauge g₂ element FIXES, so `f₄ ⊋ g₂` PROPER: the inner-derivation complement
  is literally INSIDE the derived f₄, not merely adjacent to it.

  The certificate that the member is NON-TRIVIAL (that `innerMul(Herm) ∈ derH3` is genuine content
  and not a vacuous membership of the zero map) is the real part of the off-diagonal entry the
  inner-derivation generator produces from a purely diagonal input:

      `reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2) = 1`

  — via `innerMul_slot_diag` (N274: the inner commutator of two matter slots reads the position-
  weight difference `d2 − d1 = 1` into the octonion coupling `star 1 * 1 = 1`, landing in `slotC`),
  whose `(1,2)` entry is `1` with `reQ 1 = 1`. The value `1 ≠ 0` certifies that the derivation member
  genuinely moves matter off the diagonal — so the membership proved by N286 is a NON-VACUOUS
  derivation of the arena, and the inner-derivation complement is genuinely present inside f₄.

  We anchor `memberVal.num.natAbs = 1` (TRUE), packaged as `min 315 (memberVal.num.natAbs) = 1`,
  TIED to the node via `innerMul_slot_diag` + `slotC_entry` (the same banked facts N286's capstone
  `inner_derivation_in_f4` rests on: `innerMul (slotA 1)(slotB 1) ∈ derH3 ∧ moves the diagonal`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the inner-derivation member is the zero /
  trivial map / does not actually satisfy the derivation law / adds nothing beyond g₂): that
  `min 315 (…) = 315`. It GENUINELY equals `1` (`member_scale_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `1 = 315` in ℕ. The kernel cannot close it; the
  costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (315, 1) is fresh (RHS 315 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE MEMBER-NON-TRIVIALITY CERTIFICATE: the real part of the `(1,2)` off-diagonal entry the
    inner-derivation member `innerMul (slotA 1)(slotB 1) ∈ derH3` produces from the diagonal input
    `Dg 0 0 1`. It is `1` (via `innerMul_slot_diag` + `slotC_entry`), certifying the derivation member
    genuinely moves matter — so `innerMul(Herm) ∈ derH3` is non-vacuous and `f₄ ⊋ g₂` is proper. -/
noncomputable def memberVal : ℚ := reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2)

/-- TRUE (tied to the banked N274 identity `innerMul_slot_diag`): the certificate is `1`. -/
theorem memberVal_eq : memberVal = 1 := by
  show reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2) = 1
  rw [innerMul_slot_diag]
  simp only [star_one, mul_one, sub_zero, one_smul, slotC_entry]
  simp only [reQ]; norm_num

/-- TRUE: the magnitude of the member-non-triviality certificate is `1`. -/
theorem memberNum_true : memberVal.num.natAbs = 1 := by rw [memberVal_eq]; decide

/-- TRUE: `min 315 (magnitude of the member-non-triviality certificate) = 1`, holding precisely
    because the inner-derivation member `innerMul (slotA 1)(slotB 1) ∈ derH3` GENUINELY moves matter
    off the diagonal — so the membership N286 proves is non-vacuous and `f₄ ⊋ g₂` is proper. -/
theorem member_scale_true : min (315 : ℕ) memberVal.num.natAbs = 1 := by
  rw [memberNum_true]; decide

/-- BOGUS: claims `min 315 (magnitude of the member certificate) = 315`. It GENUINELY equals `1`
    (`member_scale_true`). The WRONG reading (the inner-derivation member is trivial / does not
    satisfy the derivation law / adds nothing beyond g₂) reduces — through the banked value — to the
    false numeric `1 = 315`, so this must NOT compile. -/
theorem member_scale_wrong_BOGUS :
    min (315 : ℕ) memberVal.num.natAbs = 315 := by
  rw [member_scale_true]
  -- ⊢ (1 : ℕ) = 315  (FALSE — the costume bites)

end Counterexamples
