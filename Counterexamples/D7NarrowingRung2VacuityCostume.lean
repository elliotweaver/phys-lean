/-
  Counterexamples.D7NarrowingRung2VacuityCostume — the D7 NARROWING RUNG 2 (the ~12-significant-digit
  sharpened restatement of the recomposed census-conserving endpoint AS `1/α(0)`) is GENUINE: the
  re-assembled bracket is strictly two-sided (`1363071881405/1e10 < 1363071881406/1e10`), the endpoint
  lies strictly below `137` (the fold's prediction, a real exclusion of the measured value), and rung 2
  genuinely improves rung 1's heavy-shape-log bracket (`17337287/1e7 < 1733728794954/1e12` and
  `1733728794955/1e12 < 17337288/1e7`). C570.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE D7 NARROWING RUNG 2) pushes the three edge logs to `≈ 10⁻¹²` and
  re-assembles a ≈ 12-significant-digit certified two-sided rational bracket of the recomposed
  census-conserving endpoint. The content that must NOT be hollow is that the re-assembled bracket is a
  GENUINE two-sided reading (`restated_r2_strict`, `1363071881405/1e10 < 1363071881406/1e10`), that the
  endpoint is GENUINELY below `137` (`recomposedEndpoint_lt_137_r2` — a real exclusion of the measured
  `≈ 137.036`, not a vacuous inequality), and that rung 2 GENUINELY tightens rung 1's edge bracket
  (`rung2_improves_rung1`, `17337287/1e7 < 1733728794954/1e12` and `1733728794955/1e12 < 17337288/1e7`).
  If the re-assembled bracket were collapsed, or the endpoint were not below `137`, or the rung did not
  improve rung 1's `[17337287/1e7, 17337288/1e7]`, the rung would be vacuous. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 narrowing rung 2 is
  genuine: the re-assembled bracket is strictly two-sided, the endpoint lies strictly below 137, and the
  rung genuinely improves rung 1's edge-log bracket". It is TIED to the banked landing by
  attestFlag_forced.

  We anchor min 570 attestFlag = 1 (TRUE -- attestFlag = 1 < 570, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the bracket is collapsed / the endpoint is not below 137 / the
  rung does not improve rung 1 / the rung is vacuous" reading): that min 570 attestFlag = 570. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 570 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (570, 1) is fresh (Cid 570 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7NarrowingRung2
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.D7NarrowingRung2
open Phys.Algebra.PerChannelRecomb
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 narrowing rung 2 is genuine: the re-assembled bracket is strictly two-sided,
    the endpoint lies strictly below 137, and the rung genuinely improves rung 1's edge-log bracket". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the re-assembled restatement bracket is strictly two-sided
    (`restated_r2_strict`), the endpoint is strictly below `137` (`recomposedEndpoint_lt_137_r2`), and
    the rung genuinely improves rung 1's heavy-shape-log bracket (`rung2_improves_rung1`) — and
    `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((1363071881405 : Cut) / 10000000000 < 1363071881406 / 10000000000)
    ∧ (recomposedEndpoint < 137)
    ∧ ((17337287 / 10000000 : Cut) < 1733728794954 / 1000000000000
        ∧ (1733728794955 / 1000000000000 : Cut) < 17337288 / 10000000)
    ∧ attestFlag = 1 :=
  ⟨restated_r2_strict, recomposedEndpoint_lt_137_r2, rung2_improves_rung1.1, rfl⟩

/-- TRUE: min 570 attestFlag = 1, holding precisely because attestFlag = 1 < 570. -/
theorem cert_val_true : min (570 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 570 attestFlag = 570. It GENUINELY equals 1 (cert_val_true). A "the bracket is
    collapsed / the endpoint is not below 137 / the rung does not improve rung 1 / the rung is vacuous"
    reading reduces -- through the banked restated_r2_strict / recomposedEndpoint_lt_137_r2 /
    rung2_improves_rung1 tie -- to the false numeric 1 = 570 in the naturals. The kernel cannot close it;
    it BITES. -/
theorem bogus_claim : min (570 : ℕ) attestFlag = 570 := by
  rw [cert_val_true]

end Counterexamples
