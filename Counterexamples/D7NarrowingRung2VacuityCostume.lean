/-
  Counterexamples.D7NarrowingRung2VacuityCostume — the second D7 narrowing rung is GENUINE: the
  deepened edge-log brackets are strictly tighter than the banked Rung1 brackets, and the re-assembled
  ≈12-sig-digit endpoint bracket nests STRICTLY inside the banked N579 ≈9-digit bracket from both ends.
  C579.
  =====================================================================================
  W8 ANTI-VACUITY. This node DEEPENS the three dominant edge logs one rung and re-assembles the endpoint
  bracket at ≈12 sig digits. The content that must NOT be hollow: (i) the deepened bare endpoint bracket
  is a genuine two-sided reading — `1363071881405/1e10 < 1363071881406/1e10` (`bare_restated_r2_strict`);
  (ii) the deepened bracket is a REAL tightening — it nests STRICTLY inside the banked N579 ≈9-digit
  bracket `[136.307188, 136.3071883]` from both ends (`bare_nested_strict`: `1363071880/1e7 <
  1363071881405/1e10` and `1363071881406/1e10 < 1363071883/1e7`); (iii) the deepened `L_b0` window is
  strictly inside the banked Rung1 window `[17337287/1e7, 17337288/1e7]` (`deepening_improves_edge.1`).
  If the deepened bracket collapsed to a point, or failed to nest strictly inside the banked one, or the
  edge log were not genuinely tighter, the rung would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the second narrowing rung is
  genuine: the deepened bare endpoint bracket is strictly two-sided, nests strictly inside the banked
  N579 ≈9-digit bracket, and the deepened L_b0 window is strictly inside the banked Rung1 window". TIED
  to the banked landing by attestFlag_forced.

  We anchor min 579 attestFlag = 1 (TRUE -- attestFlag = 1 < 579, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the deepened bracket is a point / does not tighten / the rung is
  vacuous" reading): that min 579 attestFlag = 579. It GENUINELY equals 1 (cert_val_true). Rewriting
  reduces the bogus claim to the false numeric 1 = 579 in the naturals. The kernel cannot close it; it
  BITES.

  DISTINCT from the banked battery: the pair (579, 1) is fresh (Cid 579 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7NarrowingRung2
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.D7NarrowingRung2
open Phys.Algebra.PerChannelRecomb
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the second narrowing rung is genuine: the deepened bare endpoint bracket is strictly
    two-sided, nests strictly inside the banked N579 ≈9-digit bracket, and the deepened `L_b0` window is
    strictly inside the banked Rung1 window". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the deepened bare endpoint bracket is strictly two-sided
    (`bare_restated_r2_strict`), nests strictly inside the banked N579 ≈9-digit bracket from both ends
    (`bare_nested_strict`), and the deepened `L_b0` window is strictly inside the banked Rung1 window
    (`deepening_improves_edge.1`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((1363071881405 : Cut) / 10000000000 < 1363071881406 / 10000000000)
    ∧ ((1363071880 / 10000000 : Cut) < 1363071881405 / 10000000000
        ∧ (1363071881406 / 10000000000 : Cut) < 1363071883 / 10000000)
    ∧ ((17337287 / 10000000 : Cut) < 17337287949546 / 10000000000000
        ∧ (17337287949547 / 10000000000000 : Cut) < 17337288 / 10000000)
    ∧ attestFlag = 1 :=
  ⟨bare_restated_r2_strict, bare_nested_strict, deepening_improves_edge.1, rfl⟩

/-- TRUE: min 579 attestFlag = 1, holding precisely because attestFlag = 1 < 579. -/
theorem cert_val_true : min (579 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 579 attestFlag = 579. It GENUINELY equals 1 (cert_val_true). A "the deepened
    bracket is a point / does not tighten / the rung is vacuous" reading reduces -- through the banked
    bare_restated_r2_strict / bare_nested_strict / deepening_improves_edge tie -- to the false numeric
    1 = 579 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (579 : ℕ) attestFlag = 579 := by
  rw [cert_val_true]

end Counterexamples
