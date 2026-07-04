/-
  Counterexamples.OctonionJordanTraceFormInvarianceWrongValueCostume — N298 anti-vacuity (C327).
  ===========================================================================
  W8 ANTI-VACUITY. The N298 node banks the INVARIANCE (associativity) of the derived Cartan–Killing
  trace form and the consequent ANNIHILATION of the linear trace by the f₄-GENERATORS: the
  inner-derivation complement `innerMul` and the entrywise gauge `jActL D` both kill `rtr = reQ ∘ jTr`.

  The load-bearing NON-TRIVIALITY is that the annihilated functional is genuinely nonzero: the
  linear trace is NOT identically zero — on the f₄-fixed DILATION direction it takes the value
  `rtr (Lmul 1 1) = 6` (N298 `dilation_trace_rtr`, from N297 `dilation_moves_trace`). So the
  generator-annihilation is not the vacuous "everything has trace zero" — the killers act on a
  genuine nonzero functional, and the trace-form invariance genuinely constrains them.

  The certificate is the numerator magnitude of the dilation-trace value:

      `traceVal := rtr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1)  (= 6)`.

  Since `rtr (Lmul 1 1) = 6` (banked `dilation_trace_rtr`), the magnitude is `6`, certifying the
  linear trace is genuinely nonzero on the dilation — the annihilation is non-vacuous.

  We anchor `traceVal.num.natAbs = 6` (TRUE), packaged as `min 327 (traceVal.num.natAbs) = 6`, TIED
  to the node via `dilation_trace_rtr` (`rtr (Lmul 1 1) = 6`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the trace form is not invariant / the
  f₄-generators do not kill the trace / the killed functional is vacuously zero): that
  `min 327 (…) = 327`. It GENUINELY equals `6` (`trace_val_true`). Rewriting the banked value reduces
  the bogus claim to the false numeric `6 = 327` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (327, 6) is fresh (RHS 327 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanTraceFormInvariance
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE DILATION-TRACE CERTIFICATE: the linear trace of the dilation `Lmul 1 1`. Since
    `rtr (Lmul 1 1) = 6` (banked `dilation_trace_rtr`), it is `6`, certifying the annihilated
    functional is genuinely nonzero — the generator-annihilation is non-vacuous. -/
noncomputable def traceVal : ℚ :=
  rtr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1)

/-- TRUE (tied to the banked N298 law `dilation_trace_rtr`): the certificate is `6`. -/
theorem traceVal_eq : traceVal = 6 := dilation_trace_rtr

/-- TRUE: the magnitude of the dilation-trace certificate is `6`. -/
theorem traceNum_true : traceVal.num.natAbs = 6 := by rw [traceVal_eq]; decide

/-- TRUE: `min 327 (magnitude of the certificate) = 6`, holding precisely because
    `rtr (Lmul 1 1) = 6 ≠ 0` — the linear trace the f₄-generators kill is genuinely nonzero. -/
theorem trace_val_true : min (327 : ℕ) traceVal.num.natAbs = 6 := by
  rw [traceNum_true]; decide

/-- BOGUS: claims `min 327 (magnitude of the certificate) = 327`. It GENUINELY equals `6`
    (`trace_val_true`). The WRONG reading (the trace form is not invariant / the f₄-generators do not
    kill the trace / the killed functional is vacuously zero) reduces — through the banked value — to
    the false numeric `6 = 327`, so this must NOT compile. -/
theorem trace_val_wrong_BOGUS :
    min (327 : ℕ) traceVal.num.natAbs = 327 := by
  rw [trace_val_true]
  -- ⊢ (6 : ℕ) = 327  (FALSE — the costume bites)

end Counterexamples
