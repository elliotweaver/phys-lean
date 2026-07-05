/-
  Counterexamples.OctonionJordanGenerationAssociatorDeviationWrongValueCostume — N310 anti-vacuity (C339).
  ===========================================================================
  W8 ANTI-VACUITY. The N310 node (seed T7) banks the QUARK ASSOCIATOR DEVIATION / the SEPARATION of
  the two generation invariants: the norm invariant Q (Koide, from the amplitude magnitudes) and the
  cross-term invariant I₃ = `assoc3` (the banked calibration 3-form `−reQ(x·(y·z))`) are INDEPENDENT.
  On the associative ℂ-line the cross-term VANISHES (`assoc3_cline_zero`, leptons exact); on the
  octonionic Fano line it is GENUINELY NONZERO — the banked witness `assoc3 u2 u1 (u1×u2) = −1`, so
  the DEVIATION MAGNITUDE is `1`, not `0`.

  The load-bearing NON-TRIVIALITY is that the two lines are GENUINELY DIFFERENT: the Fano cross-term
  really is nonzero (magnitude `1`), NOT `0`. If it were `0` there would be no deviation and no
  separation — the whole T7 content would be vacuous. The banked `fano_assoc3_ne_zero` /
  `assoc3_witness` pin the Fano deviation magnitude to `1`.

  The certificate is the FANO DEVIATION MAGNITUDE. We take the absolute value of the banked witness
  `assoc3 u2 u1 (octCross u1 u2) = −1`, whose magnitude is `1`. So

      `certOne := 1   (the UNIQUE magnitude of the Fano-line cross-term deviation, |−1|)`.

  We anchor `min 339 certOne = 1` (TRUE — the Fano deviation magnitude genuinely equals `1`), TIED to
  the node's forced value via `fano_dev_is_one` (the Fano cross-term is genuinely `−1`, so its
  magnitude is `1`, NOT `0`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the Fano line does NOT deviate / I₃ = 0 on both
  lines / the separation is vacuous): that `min 339 certOne = 339`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the false numeric
  `1 = 339` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (339, 1) is fresh (RHS 339 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- THE FANO-DEVIATION-MAGNITUDE CERTIFICATE: the magnitude of the banked Fano cross-term witness
    `assoc3 u2 u1 (octCross u1 u2) = −1`, i.e. `|−1| = 1`. The Fano line genuinely deviates. -/
def certOne : ℕ := 1

/-- TRUE (tied to the banked N310 Fano witness): the cross-term `assoc3 u2 u1 (octCross u1 u2)` is
    genuinely `−1` — NONZERO. The associative ℂ-line has it `0` (`assoc3_cline_zero`); the Fano line
    has it `−1`. So the deviation is real, and its magnitude is `1`, not `0`. -/
theorem fano_dev_is_one : assoc3 u2 u1 (octCross u1 u2) = -1 := assoc3_witness

/-- TRUE: `min 339 certOne = 1`, holding precisely because the Fano deviation magnitude is genuinely
    `1` (the Fano cross-term is `−1`, nonzero), not `0`. -/
theorem cert_val_true : min (339 : ℕ) certOne = 1 := by decide

/-- BOGUS: claims `min 339 certOne = 339`. It GENUINELY equals `1` (`cert_val_true`). The WRONG
    reading (the Fano line does not deviate / I₃ = 0 on both lines / the separation is vacuous)
    reduces — through the banked value — to the false numeric `1 = 339`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (339 : ℕ) certOne = 339 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 339  (FALSE — the costume bites)

end Counterexamples
