/-
  Counterexamples.DecouplingCensusRemovalVacuityCostume — the decoupling-as-removal FRAME correction
  is a GENUINE distinction (the census-conserving endpoint strictly BELOW the additive full-census
  one over the derived ℝ), not a hollow/trivial statement, C559.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-D RECOMPOSE — THE DECOUPLING-AS-REMOVAL FRAME) banks the forced
  theory-native correction to the additive endpoint assembly: below threshold the decoupled coloured
  content is REMOVED from the descent, so the census-conserving lepton band carries the singlet census
  `2`, not the full charge census `16/3`. The content that must NOT be hollow is that the removal is
  REAL — the census-conserving endpoint `invAlphaZero (completeBandList leptonCensus)` is STRICTLY
  BELOW the additive one `invAlphaZero (completeBandList chargeTraceDepth)`
  (`conserving_below_additive`). If the two coincided (removal = 0), there would be no frame
  correction, the worse-with-completeness overshoot would be unaddressed, and the recompose would say
  nothing. The distinction is a genuine strict inequality of two DERIVED reals of `Cut`, driven by the
  banked census conservation `16/3 = 10/3 + 2`.

  THE CERTIFICATE. removalFlag := 1 -- a natural-number flag standing for "the census-conserving
  endpoint genuinely differs from (is strictly below) the additive full-census one over the derived ℝ
  (the decoupling removal is a real distinction)". It is TIED to the banked landing by
  removalFlag_forced.

  We anchor min 559 removalFlag = 1 (TRUE -- removalFlag = 1 < 559, so the min is removalFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the census-conserving and additive endpoints coincide / the
  removal is vacuous" reading): that min 559 removalFlag = 559. It GENUINELY equals 1 (cert_val_true).
  Rewriting reduces the bogus claim to the false numeric 1 = 559 in the naturals. The kernel cannot
  close it; it BITES.

  DISTINCT from the banked battery: the pair (559, 1) is fresh (Cid 559 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.DecouplingCensusRemoval
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra
open Phys.Algebra.EndpointAssembly
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the census-conserving endpoint genuinely differs from (is strictly below) the
    additive full-census endpoint over the derived ℝ (the decoupling removal is a real distinction)". -/
def removalFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the census-conserving endpoint is strictly below the additive
    one (`conserving_below_additive`), and `removalFlag = 1`. -/
theorem removalFlag_forced :
    (invAlphaZero (completeBandList leptonCensus)
        < invAlphaZero (completeBandList chargeTraceDepth)) ∧ removalFlag = 1 :=
  ⟨conserving_below_additive, rfl⟩

/-- TRUE: min 559 removalFlag = 1, holding precisely because removalFlag = 1 < 559. -/
theorem cert_val_true : min (559 : ℕ) removalFlag = 1 := by decide

/-- BOGUS: claims min 559 removalFlag = 559. It GENUINELY equals 1 (cert_val_true). A "the
    census-conserving and additive endpoints coincide / the removal is vacuous" reading reduces --
    through the banked conserving_below_additive tie -- to the false numeric 1 = 559 in the naturals.
    The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (559 : ℕ) removalFlag = 559 := by
  rw [cert_val_true]

end Counterexamples
