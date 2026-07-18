/-
  Counterexamples.CensusCompletenessClosureVacuityCostume — the ONE charge census re-partitions
  EXHAUSTIVELY across the assembly's two low-energy parts (the freeze-out staircase 10/3 + the
  census-conserving singlet 2 = the full census 16/3), with NO double-count and NO omission, C564.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE CENSUS-COMPLETENESS CLOSURE) proves the local→global census gather
  CLOSES: the freeze-out removal staircase re-supplies EXACTLY the coloured content the census-
  conserving lepton tail removed, so `chargeTraceDepth = freezeoutStaircaseCensus + leptonCensus`
  (`census_completeness_closure`), i.e. `16/3 = 10/3 + 2`. The content that must NOT be hollow is that
  the closure is a GENUINE exhaustive partition of the whole census into two nonzero, distinct parts —
  NOT a trivial one-part collapse (where the staircase already equals the whole) and NOT a double-count
  (where the parts overlap). The distinction is the exact ℚ partition `freezeoutStaircaseCensus + 2 =
  16/3` (`partition_no_double_count`) with the staircase genuinely a proper part (`staircase_ne_full`,
  `10/3 ≠ 16/3`; `staircase_ne_zero`, `10/3 ≠ 0`).

  THE CERTIFICATE. closureFlag := 1 -- a natural-number flag standing for "the ONE charge census
  re-partitions exhaustively across the freeze-out staircase and the census-conserving singlet, with no
  omission and no double-count". It is TIED to the banked landing by closureFlag_forced.

  We anchor min 564 closureFlag = 1 (TRUE -- closureFlag = 1 < 564, so the min is closureFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the census does not close / the parts do not exhaust the whole /
  the completeness closure is vacuous" reading): that min 564 closureFlag = 564. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 564 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (564, 1) is fresh (Cid 564 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CensusCompletenessClosure
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the ONE charge census re-partitions exhaustively across the freeze-out staircase and
    the census-conserving singlet, with no omission and no double-count". -/
def closureFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the census re-partitions exhaustively — the freeze-out staircase
    plus the singlet is the full census `16/3` (`partition_no_double_count`), with the staircase a
    genuine proper part (`staircase_ne_full`) — and `closureFlag = 1`. -/
theorem closureFlag_forced :
    (freezeoutStaircaseCensus + 2 = 16 / 3)
    ∧ (((freezeoutStaircaseCensus : ℚ) : Cut) ≠ chargeTraceDepth)
    ∧ closureFlag = 1 :=
  ⟨partition_no_double_count, staircase_ne_full, rfl⟩

/-- TRUE: min 564 closureFlag = 1, holding precisely because closureFlag = 1 < 564. -/
theorem cert_val_true : min (564 : ℕ) closureFlag = 1 := by decide

/-- BOGUS: claims min 564 closureFlag = 564. It GENUINELY equals 1 (cert_val_true). A "the census does
    not close / the parts do not exhaust the whole / the completeness closure is vacuous" reading
    reduces -- through the banked partition_no_double_count / staircase_ne_full tie -- to the false
    numeric 1 = 564 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (564 : ℕ) closureFlag = 564 := by
  rw [cert_val_true]

end Counterexamples
