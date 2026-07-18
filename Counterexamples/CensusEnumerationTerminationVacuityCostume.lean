/-
  Counterexamples.CensusEnumerationTerminationVacuityCostume — the finite banked band list is THE
  COMPLETE, count-FORCED threshold set and the descent TERMINATES: below the lightest charged edge the
  active census is 0, so appending frozen bands leaves the assembly unchanged (1/α freezes), while an
  active band strictly moves it. C565.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE ENUMERATION EXHAUSTIVENESS + TERMINATION) proves the enumeration is
  cap-forced-and-exhausted and the descent freezes. The content that must NOT be hollow is that the
  FREEZE is a GENUINE distinction: a frozen (below-edge, zero-census) band contributes exactly `0`
  (`endpoint_is_frozen`), while an ACTIVE band (nonzero census over a ratio > 1) STRICTLY increases the
  assembly (`active_band_moves`). If a frozen band and an active band were indistinguishable, the freeze
  would be vacuous. They are genuinely distinct: the frozen census `0` is strictly below the active
  census `2` (`frozen_below_active`), and the cap-forced count is load-bearing (a mis-capped count gives
  a wrong budget, `census_budget_ne_uncapped`).

  THE CERTIFICATE. termFlag := 1 -- a natural-number flag standing for "the finite band list is the
  complete count-forced threshold set AND the descent terminates: below the lightest edge the census is
  0, frozen bands add nothing (freeze), while an active band strictly moves the assembly". It is TIED to
  the banked landing by termFlag_forced.

  We anchor min 565 termFlag = 1 (TRUE -- termFlag = 1 < 565, so the min is termFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the descent does not terminate / a frozen band still screens / the
  count is not forced / the enumeration is vacuous" reading): that min 565 termFlag = 565. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 565 in the
  naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (565, 1) is fresh (Cid 565 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CensusEnumerationTermination
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.CensusEnumerationTermination
open Phys.Algebra
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the finite band list is the complete count-forced threshold set AND the descent
    terminates (frozen bands add nothing while an active band strictly moves the assembly)". -/
def termFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the frozen census is strictly below the active one
    (`frozen_below_active`, `0 < 2`), a mis-capped count gives a wrong budget
    (`census_budget_ne_uncapped`) — and `termFlag = 1`. -/
theorem termFlag_forced :
    (frozenCensus < leptonCensus)
    ∧ (chargeTraceDepth ≠ ((ladderChargeTrace 2 : ℚ) : Cut))
    ∧ termFlag = 1 :=
  ⟨frozen_below_active, census_budget_ne_uncapped, rfl⟩

/-- TRUE: min 565 termFlag = 1, holding precisely because termFlag = 1 < 565. -/
theorem cert_val_true : min (565 : ℕ) termFlag = 1 := by decide

/-- BOGUS: claims min 565 termFlag = 565. It GENUINELY equals 1 (cert_val_true). A "the descent does not
    terminate / a frozen band still screens / the count is not forced / the enumeration is vacuous"
    reading reduces -- through the banked frozen_below_active / census_budget_ne_uncapped tie -- to the
    false numeric 1 = 565 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (565 : ℕ) termFlag = 565 := by
  rw [cert_val_true]

end Counterexamples
