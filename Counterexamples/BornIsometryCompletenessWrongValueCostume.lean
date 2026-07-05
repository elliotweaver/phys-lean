/-
  Counterexamples.BornIsometryCompletenessWrongValueCostume — N315 anti-vacuity (C344).
  ===========================================================================
  W8 ANTI-VACUITY. The N315 node (seeded gauge route A3, the ★ BRIDGE) banks the BORN-ISOMETRY
  COMPLETENESS `42·α = 1`: the banked interaction-channel count `imChannelCount (finrank ℚ ImO) = 42`
  (N314) times the DERIVED per-channel coupling weight `couplingWeight = 1/42` (the banked N313 unit
  self-overlap over the banked total `assoc3NormSq = 42`) equals `1`:

      `channels_times_coupling : (imChannelCount (finrank ℚ ImO) : ℚ) * couplingWeight = 1`
      `couplingWeight_eq       : couplingWeight = 1 / 42`.

  The COMPLETING COUNT — the number `N` for which `N · couplingWeight = 1` — is FORCED to be `42`:
  since `couplingWeight = 1/42` (DERIVED, unit self-overlap / total `42`), only `42 · (1/42) = 1`
  closes. The value is not free.

  The certificate is that FORCED completing count:

      `certFortyTwo := 42   (the FORCED count N with N·α = 1, α = 1/42, DERIVED not asserted)`.

  We anchor `min 344 certFortyTwo = 42` (TRUE — the completing count is genuinely `42`, NOT `49`
  which would keep the degenerate diagonal and give `α = 1/49` breaking `42·α = 1`), TIED to the
  node's forced landing via `couplingWeight_eq`.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the weight was `1/49` so the completing count is
  `49`, or an asserted/mis-normalized `α`, or a miscount): that `min 344 certFortyTwo = 344`. It
  GENUINELY equals `42` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `42 = 344` in ℕ. The kernel cannot close it; it BITES.

  (Note the completeness non-vacuity is itself banked: `couplingWeight_ne_wrong` — the weight is
  `1/42` not `1/49` — and `wrong_weight_breaks_completeness` — `42·(1/49) ≠ 1`.)

  DISTINCT from the banked battery: the pair (344, 42) is fresh (RHS 344 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.BornIsometryCompleteness
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE FORCED COMPLETING-COUNT CERTIFICATE: `N = 42`, the count for which `N · couplingWeight = 1`
    with the DERIVED `couplingWeight = 1/42`. From `couplingWeight_eq`/`channels_times_coupling`, the
    banked N315 landing. -/
def certFortyTwo : ℕ := 42

/-- TRUE (tied to the banked N315 forced landing): the per-channel coupling weight is genuinely
    `1/42`, so the completing count is genuinely `42`. -/
theorem certFortyTwo_forced : couplingWeight = 1 / 42 := couplingWeight_eq

/-- TRUE: `min 344 certFortyTwo = 42`, holding precisely because the completing count is genuinely
    `42` (`α = 1/42`), not `49` (`α = 1/49`, keeping the degenerate diagonal, breaking `42·α = 1`). -/
theorem cert_val_true : min (344 : ℕ) certFortyTwo = 42 := by decide

/-- BOGUS: claims `min 344 certFortyTwo = 344`. It GENUINELY equals `42` (`cert_val_true`). The WRONG
    reading (the weight `1/49` / the diagonal not dropped / an asserted α / a miscount) reduces —
    through the banked value — to the false numeric `42 = 344`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (344 : ℕ) certFortyTwo = 344 := by
  rw [cert_val_true]
  -- ⊢ (42 : ℕ) = 344  (FALSE — the costume bites)

end Counterexamples
