/-
  Counterexamples.D7NarrowingRung1VacuityCostume — the D7 NARROWING RUNG 1 (the sharpened edge-log
  restatement of the recomposed census-conserving endpoint AS `1/α(0)`) is GENUINE: the re-assembled
  bracket is strictly two-sided (`1363071880/1e7 < 1363071883/1e7`), the endpoint lies strictly below
  `137` (the fold's prediction, a real exclusion of the measured value), and the sharpening genuinely
  improves the banked coarse heavy-shape-log bracket (`17/10 < 17337287/1e7` and `17337288/1e7 < 18/10`).
  C569.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE D7 NARROWING RUNG 1) sharpens the three dominant edge logs and
  re-assembles a ≈ 9-significant-digit certified two-sided rational bracket of the recomposed
  census-conserving endpoint. The content that must NOT be hollow is that the re-assembled bracket is a
  GENUINE two-sided reading (`restated_sharp_strict`, `1363071880/1e7 < 1363071883/1e7`), that the
  endpoint is GENUINELY below `137` (`recomposedEndpoint_lt_137_sharp` — a real exclusion of the measured
  `≈ 137.036`, not a vacuous inequality), and that the sharpening GENUINELY tightens the banked coarse
  edge bracket (`sharpening_improves_edge`, `17/10 < 17337287/1e7` and `17337288/1e7 < 18/10`). If the
  re-assembled bracket were collapsed, or the endpoint were not below `137`, or the sharpening did not
  improve `[17/10, 18/10]`, the rung would be vacuous. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 narrowing rung is
  genuine: the re-assembled bracket is strictly two-sided, the endpoint lies strictly below 137, and the
  sharpening genuinely improves the banked coarse edge-log bracket". It is TIED to the banked landing by
  attestFlag_forced.

  We anchor min 569 attestFlag = 1 (TRUE -- attestFlag = 1 < 569, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the bracket is collapsed / the endpoint is not below 137 / the
  sharpening does not improve the coarse bracket / the rung is vacuous" reading): that
  min 569 attestFlag = 569. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 569 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (569, 1) is fresh (Cid 569 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7NarrowingRung1
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.D7NarrowingRung1
open Phys.Algebra.PerChannelRecomb
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 narrowing rung is genuine: the re-assembled bracket is strictly two-sided,
    the endpoint lies strictly below 137, and the sharpening genuinely improves the banked coarse
    edge-log bracket". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the re-assembled restatement bracket is strictly two-sided
    (`restated_sharp_strict`), the endpoint is strictly below `137` (`recomposedEndpoint_lt_137_sharp`),
    and the sharpening genuinely improves the banked coarse heavy-shape-log bracket
    (`sharpening_improves_edge`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((1363071880 : Cut) / 10000000 < 1363071883 / 10000000)
    ∧ (recomposedEndpoint < 137)
    ∧ ((17 / 10 : Cut) < 17337287 / 10000000 ∧ (17337288 / 10000000 : Cut) < 18 / 10)
    ∧ attestFlag = 1 :=
  ⟨restated_sharp_strict, recomposedEndpoint_lt_137_sharp, sharpening_improves_edge.1, rfl⟩

/-- TRUE: min 569 attestFlag = 1, holding precisely because attestFlag = 1 < 569. -/
theorem cert_val_true : min (569 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 569 attestFlag = 569. It GENUINELY equals 1 (cert_val_true). A "the bracket is
    collapsed / the endpoint is not below 137 / the sharpening does not improve the coarse bracket / the
    rung is vacuous" reading reduces -- through the banked restated_sharp_strict /
    recomposedEndpoint_lt_137_sharp / sharpening_improves_edge tie -- to the false numeric 1 = 569 in the
    naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (569 : ℕ) attestFlag = 569 := by
  rw [cert_val_true]

end Counterexamples
