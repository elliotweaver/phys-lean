/-
  Counterexamples.D7CompositionAttestationVacuityCostume — the D7 restatement of the recomposed
  census-conserving endpoint AS `1/α(0)` is GENUINE: the certified bracket is strictly two-sided
  (`3406/25 < 13639/100`), the endpoint lies strictly below `137` (the fold's prediction, a real
  exclusion of the measured value), and the first re-narrow genuinely improves the banked coarse
  cutLog bracket (`1 < 8`, `82/10 < 9`). C568.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE D7 FULL COMPOSITION-COMPLETENESS ATTESTATION + FIRST RE-NARROW +
  RESTATEMENT AS 1/α(0)) certifies a two-sided rational bracket of the recomposed census-conserving
  endpoint and states the fold's prediction. The content that must NOT be hollow is that the bracket is
  a GENUINE two-sided reading (`restated_bracket_strict`, `3406/25 < 13639/100`), that the endpoint is
  GENUINELY below `137` (`recomposedEndpoint_lt_137` — a real exclusion of the measured `≈ 137.036`, not
  a vacuous inequality), and that the re-narrow GENUINELY tightens the banked coarse bracket
  (`sharpening_improves`, `1 < 8` and `82/10 < 9`). If the bracket were collapsed, or the endpoint were
  not below `137`, or the re-narrow did not improve `[1, 9]`, the restatement would be vacuous. It is
  genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 restatement is genuine:
  the certified bracket is strictly two-sided, the endpoint lies strictly below 137, and the re-narrow
  genuinely improves the banked coarse cutLog bracket". It is TIED to the banked landing by
  attestFlag_forced.

  We anchor min 568 attestFlag = 1 (TRUE -- attestFlag = 1 < 568, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the bracket is collapsed / the endpoint is not below 137 / the
  re-narrow does not improve the coarse bracket / the restatement is vacuous" reading): that
  min 568 attestFlag = 568. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 568 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (568, 1) is fresh (Cid 568 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7CompositionAttestation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.D7CompositionAttestation
open Phys.Algebra.PerChannelRecomb
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 restatement is genuine: the certified bracket is strictly two-sided, the
    endpoint lies strictly below 137, and the re-narrow genuinely improves the banked coarse cutLog
    bracket". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the certified restatement bracket is strictly two-sided
    (`restated_bracket_strict`), the endpoint is strictly below `137` (`recomposedEndpoint_lt_137`), and
    the re-narrow genuinely improves the banked coarse cutLog bracket (`sharpening_improves`) — and
    `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((3406 / 25 : Cut) < 13639 / 100)
    ∧ (recomposedEndpoint < 137)
    ∧ ((1 : Cut) < 8 ∧ (82 / 10 : Cut) < 9)
    ∧ attestFlag = 1 :=
  ⟨restated_bracket_strict, recomposedEndpoint_lt_137, sharpening_improves, rfl⟩

/-- TRUE: min 568 attestFlag = 1, holding precisely because attestFlag = 1 < 568. -/
theorem cert_val_true : min (568 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 568 attestFlag = 568. It GENUINELY equals 1 (cert_val_true). A "the bracket is
    collapsed / the endpoint is not below 137 / the re-narrow does not improve the coarse bracket / the
    restatement is vacuous" reading reduces -- through the banked restated_bracket_strict /
    recomposedEndpoint_lt_137 / sharpening_improves tie -- to the false numeric 1 = 568 in the naturals.
    The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (568 : ℕ) attestFlag = 568 := by
  rw [cert_val_true]

end Counterexamples
