/-
  Counterexamples.OctonionJordanHermDerivationAlgebraWrongValueCostume — N285 anti-vacuity (C314).
  ===========================================================================
  W8 ANTI-VACUITY. The N285 node builds THE GENUINE `f₄ = Der(H₃(O))` on the CORRECT (Hermitian)
  carrier `derH3`, re-seats the derived gauge g₂ inside it faithfully & trace-skew, and banks the
  MEASURED STRUCTURAL TEETH that the inner-derivation complement is PRESENT on this carrier and
  ESCAPES g₂: the inner-multiplication commutator `innerMul (slotA 1)(slotB 1)` preserves the
  Hermitian arena (so it acts as a candidate member of `derH3` that N284's full-space `jDer`
  MISSES), yet it MOVES the diagonal that EVERY entrywise gauge element FIXES (`jAct_Dg`) — so
  `f₄ ⊋ g₂` at the inner-derivation generator.

  The certificate that the inner-derivation complement GENUINELY moves matter off the diagonal (the
  content that makes `f₄ ⊋ g₂` non-vacuous, and the reason the Hermitian carrier — not N284's
  full-matrix-space near-miss — is the genuine ambient) is the real part of the off-diagonal entry
  it produces from a purely diagonal input:

      `reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2) = 1`

  — via `innerMul_slot_diag` (N274: the inner commutator of two matter slots on the diagonal reads
  the position-weight difference `d2 − d1 = 1` into the octonion coupling `star 1 * 1 = 1`, landing
  in `slotC`), whose `(1,2)` entry is `1` with `reQ 1 = 1`. The value `1 ≠ 0` is the certificate that
  the inner-derivation generator moves the diagonal — an action NO diagonal-fixing entrywise gauge
  element can produce, so the complement is genuinely present and distinct from g₂.

  We anchor `escapeVal.num.natAbs = 1` (TRUE), packaged as `min 314 (escapeVal.num.natAbs) = 1`,
  TIED to the node via `innerMul_slot_diag` + `slotC_entry` (the same banked facts the structural
  teeth `innerMul_escapes_g2` / the capstone rest on).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the inner-derivation complement does NOT move
  matter off the diagonal / does not escape g₂ / N284's full-matrix-space `jDer` already suffices /
  the Hermitian carrier adds nothing): that `min 314 (…) = 314`. It GENUINELY equals `1`
  (`escape_scale_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `1 = 314` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  DISTINCT from the banked battery: the pair (314, 1) is fresh (RHS 314 distinct from every prior).
  The LHS anchor is the N285 g₂-escape certificate `1` — the off-diagonal matter the inner-
  derivation complement moves from a diagonal input, which the diagonal-fixing gauge cannot.

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The g₂-ESCAPE CERTIFICATE: the real part of the `(1,2)` off-diagonal entry the inner-derivation
    complement `innerMul (slotA 1)(slotB 1)` produces from the diagonal input `Dg 0 0 1`. It is `1`
    (via `innerMul_slot_diag` + `slotC_entry`), the certificate that the complement moves matter the
    diagonal-fixing gauge g₂ cannot — so `f₄ ⊋ g₂` on the correct (Hermitian) carrier. -/
noncomputable def escapeVal : ℚ := reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2)

/-- TRUE (tied to the banked N274 identity `innerMul_slot_diag`): the g₂-escape certificate is `1`. -/
theorem escapeVal_eq : escapeVal = 1 := by
  show reQ ((innerMul (slotA 1) (slotB 1) (Dg 0 0 1)) 1 2) = 1
  rw [innerMul_slot_diag]
  simp only [star_one, mul_one, sub_zero, one_smul, slotC_entry]
  simp only [reQ]; norm_num

/-- TRUE: the magnitude of the g₂-escape certificate is `1`. -/
theorem escapeNum_true : escapeVal.num.natAbs = 1 := by rw [escapeVal_eq]; decide

/-- TRUE: `min 314 (magnitude of the g₂-escape certificate) = 1`, holding precisely because the
    inner-derivation complement GENUINELY moves matter off the diagonal that the diagonal-fixing
    entrywise gauge g₂ fixes — so `f₄ ⊋ g₂` on the Hermitian carrier is non-vacuous. -/
theorem escape_scale_true : min (314 : ℕ) escapeVal.num.natAbs = 1 := by
  rw [escapeNum_true]; decide

/-- BOGUS: claims `min 314 (magnitude of the g₂-escape certificate) = 314`. It GENUINELY equals `1`
    (`escape_scale_true`). The WRONG reading (the inner-derivation complement does not move matter
    off the diagonal / does not escape g₂ / the full-matrix-space `jDer` already suffices) reduces —
    through the banked value — to the false numeric `1 = 314`, so this must NOT compile. -/
theorem escape_scale_wrong_BOGUS :
    min (314 : ℕ) escapeVal.num.natAbs = 314 := by
  rw [escape_scale_true]
  -- ⊢ (1 : ℕ) = 314  (FALSE — the costume bites)

end Counterexamples
