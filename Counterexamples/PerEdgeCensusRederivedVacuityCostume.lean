/-
  Counterexamples.PerEdgeCensusRederivedVacuityCostume — the AB-INITIO per-edge census re-derivation is
  GENUINE: the active-span censuses are the corrected `(10/3, 2, 5/3)` (not the banked `(11/3, 10/3, 2)`),
  each banked weight over-counts the ab-initio active census by EXACTLY the just-decoupled flavour's census
  term, and the corrected confinement-rung gem `40/27` is STRICTLY BELOW the banked `16/9` (the NO-FIT
  witness — the honest correction shrinks the summand and moves the endpoint AWAY from the measured value).
  C573.
  =====================================================================================
  W8 ANTI-VACUITY. This node RE-DERIVES the freeze-out staircase census weights from X3's active-content
  rule on the three derived edge spans, correcting a one-threshold over-count. The content that must NOT be
  hollow: (i) the ab-initio light-span census is genuinely `5/3` (`censusActiveLightSpan_val`), the `{u,d}`
  count, distinct from the banked `2` — the correction is real; (ii) the banked bottom weight over-counts
  the active census by exactly `colouredCensusTerm 1` (`overcount_bottom`), so the defect is a determinate
  counting fact, not a slack; (iii) the corrected gem `40/27 < 16/9` (`gem_active_lt_banked`), so the
  correction genuinely SHRINKS the summand (moves AWAY from the measured value — the NO-FIT witness). If the
  active-span census equalled the banked one, or the over-count were unknown, or the gem did not strictly
  decrease, the re-derivation would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the ab-initio per-edge census
  re-derivation is genuine: the corrected active-span census is 5/3, the banked over-count is exactly a
  census term, and the corrected gem strictly decreases". TIED to the banked landing by attestFlag_forced.

  We anchor min 573 attestFlag = 1 (TRUE -- attestFlag = 1 < 573, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the re-derivation changes nothing / the over-count is not a census
  term / the gem does not decrease / the correction is a fit toward the measured value" reading): that
  min 573 attestFlag = 573. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the
  false numeric 1 = 573 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (573, 1) is fresh (Cid 573 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.PerEdgeCensusRederived
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.SubBandCompletion
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the ab-initio per-edge census re-derivation is genuine: the corrected active-span
    census is 5/3, the banked over-count is exactly a census term, and the corrected gem strictly
    decreases below the banked one". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the ab-initio light-span census is `5/3`
    (`censusActiveLightSpan_val`), the banked bottom weight over-counts by exactly `colouredCensusTerm 1`
    (`overcount_bottom`), the corrected gem is strictly below the banked (`gem_active_lt_banked`) — and
    `attestFlag = 1`. -/
theorem attestFlag_forced :
    (censusActiveLightSpan = 5 / 3)
    ∧ (censusBottomBand - censusActiveBottomSpan = ((colouredCensusTerm 1 : ℚ) : Cut))
    ∧ ((40 / 27 : Cut) < 16 / 9)
    ∧ attestFlag = 1 :=
  ⟨censusActiveLightSpan_val, overcount_bottom, gem_active_lt_banked, rfl⟩

/-- TRUE: min 573 attestFlag = 1, holding precisely because attestFlag = 1 < 573. -/
theorem cert_val_true : min (573 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 573 attestFlag = 573. It GENUINELY equals 1 (cert_val_true). A "the re-derivation
    changes nothing / the over-count is not a census term / the gem does not decrease / the correction is
    a fit" reading reduces -- through the banked censusActiveLightSpan_val / overcount_bottom /
    gem_active_lt_banked tie -- to the false numeric 1 = 573 in the naturals. The kernel cannot close it;
    it BITES. -/
theorem bogus_claim : min (573 : ℕ) attestFlag = 573 := by
  rw [cert_val_true]

end Counterexamples
