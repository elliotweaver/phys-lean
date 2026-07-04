/-
  Counterexamples.OctonionJordanSpectrumMovingSectorGradingWrongValueCostume — N297 anti-vacuity (C326).
  ===========================================================================
  W8 ANTI-VACUITY. The N297 node banks the DILATION/TRACELESS-SPLIT GRADING of the spectrum-moving
  sector `L₀` of the reduced structure algebra `e₆ = f₄ ⊕ L₀`, acting on the maximally-degenerate
  identity `1 = diag(1,1,1)`:
    · the DILATION `Lmul 1 = 2·id` is pure scaling — the `f₄`-central direction — and MOVES ALONG
      THE TRACE: `jTr (Lmul 1 1) = ocR 6` (`dilation_moves_trace`), a genuinely NONZERO trace weight;
    · the diagonal movers SPLIT the degeneracy, trace-graded, with genuine splitting on the
      trace-zero hyperplane.

  The load-bearing NON-TRIVIALITY is that the grading is real: the dilation carries a NONZERO trace
  weight (`ocR 6`), so the split/no-split dichotomy is not vacuous — the movers genuinely displace
  the spectrum, and the dilation direction is genuinely trace-charged (weight 6 = 2·trace(1)), in
  contrast to the traceless splitters.

  The certificate is the `re.re.re` coordinate of `jTr (Lmul 1 1)`:

      `(jTr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1)).re.re.re = 6`.

  Since `jTr (Lmul 1 1) = ocR 6` (banked `dilation_moves_trace`) and `(ocR r).re.re.re = r`
  (`ocR_reQ`), the coordinate is `6`, certifying the dilation moves along the trace with a nonzero
  weight — the grading is non-vacuous.

  We anchor `dilaVal.num.natAbs = 6` (TRUE), packaged as `min 326 (dilaVal.num.natAbs) = 6`, TIED to
  the node via `dilation_moves_trace` (`jTr (Lmul 1 1) = ocR 6`) + `ocR_reQ`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the dilation carries no trace weight / the
  spectrum-moving sector does not move / `L₀` carries no trace grading / the split/no-split dichotomy
  is vacuous): that `min 326 (…) = 326`. It GENUINELY equals `6` (`dila_scale_true`). Rewriting the
  banked value reduces the bogus claim to the false numeric `6 = 326` in ℕ. The kernel cannot close
  it; it BITES.

  DISTINCT from the banked battery: the pair (326, 6) is fresh (RHS 326 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanSpectrumMovingSectorGrading
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-- THE DILATION-TRACE CERTIFICATE: the `re.re.re` coordinate of `jTr (Lmul 1 1)`. Since
    `jTr (Lmul 1 1) = ocR 6` (banked `dilation_moves_trace`) and `(ocR r).re.re.re = r` (`ocR_reQ`),
    the coordinate is `6`, certifying the dilation moves along the trace with a NONZERO weight — the
    spectrum-moving sector genuinely moves, the trace grading is non-vacuous. -/
noncomputable def dilaVal : ℚ :=
  (jTr (Lmul (1 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1)).re.re.re

/-- TRUE (tied to the banked N297 law `dilation_moves_trace` + `ocR_reQ`): the certificate is `6`. -/
theorem dilaVal_eq : dilaVal = 6 := by
  unfold dilaVal
  rw [dilation_moves_trace, ocR_reQ]

/-- TRUE: the magnitude of the dilation-trace certificate is `6`. -/
theorem dilaNum_true : dilaVal.num.natAbs = 6 := by rw [dilaVal_eq]; decide

/-- TRUE: `min 326 (magnitude of the certificate) = 6`, holding precisely because
    `jTr (Lmul 1 1) = ocR 6 ≠ 0` — the dilation moves along the trace, so the grading is
    non-vacuous. -/
theorem dila_scale_true : min (326 : ℕ) dilaVal.num.natAbs = 6 := by
  rw [dilaNum_true]; decide

/-- BOGUS: claims `min 326 (magnitude of the certificate) = 326`. It GENUINELY equals `6`
    (`dila_scale_true`). The WRONG reading (the dilation carries no trace weight / the
    spectrum-moving sector does not move / `L₀` carries no trace grading / the dichotomy is vacuous)
    reduces — through the banked value — to the false numeric `6 = 326`, so this must NOT compile. -/
theorem dila_scale_wrong_BOGUS :
    min (326 : ℕ) dilaVal.num.natAbs = 326 := by
  rw [dila_scale_true]
  -- ⊢ (6 : ℕ) = 326  (FALSE — the costume bites)

end Counterexamples
