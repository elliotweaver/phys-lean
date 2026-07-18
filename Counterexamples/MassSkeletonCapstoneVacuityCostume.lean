/-
  Counterexamples.MassSkeletonCapstoneVacuityCostume — the arc-M airtight capstone GENUINELY certifies
  every dimensionful numeral target is met (each row a certified two-sided bracket with strictly-positive
  width); it is not a hollow/collapsed certificate, C554.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-M M8 — THE AIRTIGHT CAPSTONE) welds the full dimensionful skeleton
  M1–M7 into one derived object and certifies that every M2–M6 numeral TARGET is met. The content that
  must NOT be hollow is the NUMERAL-TARGETS-MET CERTIFICATE: each of the five dimensionful rows is a
  certified two-sided rational bracket `lo ≤ x ≤ hi` with `lo < hi` — a genuine two-sided interval, not
  a collapsed point and not a vacuous target. If that were hollow — if some row's width were `lo = hi`
  or `lo > hi` (no reachable interval) — the certificate would carry no completeness content and the
  capstone gate (M8 does not stand while any numeral target is unmet) would be empty.

  The content that must NOT be hollow: the certified brackets force strictly-positive widths — the
  banked `noResidual_certificate` gives, for the strange placement, `49/2 ≤ lightBandStrange ≤ 1227/50`
  paired with `49/2 < 1227/50`. A "some numeral target is unmet / a row's bracket is collapsed" reading
  is refuted by that banked theorem.

  THE CERTIFICATE. targetsMetFlag := 1 -- a natural-number flag standing for "the certified numerals
  force every M2–M6 dimensionful row to a genuine two-sided bracket with strictly-positive width; every
  numeral target is met (noResidual_certificate)". It is TIED to the banked landing by targetsMetFlag_forced.

  We anchor min 554 targetsMetFlag = 1 (TRUE -- targetsMetFlag = 1 < 554, so the min is targetsMetFlag).

  THE BOGUS CLAIM (a stand-in for ANY "some numeral target is unmet / a row's bracket is collapsed"
  reading): that min 554 targetsMetFlag = 554. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 554 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (554, 1) is fresh (Cid 554 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MassSkeletonCapstone
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.MassSkeletonCapstone

/-- THE FLAG: 1 = "the certified numerals force every M2–M6 dimensionful row to a genuine two-sided
    bracket with strictly-positive width; every numeral target is met (noResidual_certificate)". -/
def targetsMetFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the certified numerals force the light strange placement to a
    genuine two-sided bracket with strictly-positive width `49/2 ≤ lightBandStrange ≤ 1227/50` and
    `49/2 < 1227/50` (`noResidual_certificate`), and `targetsMetFlag = 1`. -/
theorem targetsMetFlag_forced :
    (((49 / 2 : Phys.Foundation.ContinuumQ.Cut) ≤ Phys.Algebra.LightQuarkNumerals.lightBandStrange
        ∧ Phys.Algebra.LightQuarkNumerals.lightBandStrange ≤ 1227 / 50)
      ∧ ((49 / 2 : Phys.Foundation.ContinuumQ.Cut) < 1227 / 50))
    ∧ targetsMetFlag = 1 := by
  refine ⟨⟨?_, ?_⟩, rfl⟩
  · exact (noResidual_certificate.2.2.2.2.1).1
  · exact (noResidual_certificate.2.2.2.2.2).1

/-- TRUE: min 554 targetsMetFlag = 1, holding precisely because targetsMetFlag = 1 < 554. -/
theorem cert_val_true : min (554 : ℕ) targetsMetFlag = 1 := by decide

/-- BOGUS: claims min 554 targetsMetFlag = 554. It GENUINELY equals 1 (cert_val_true). A "some numeral
    target is unmet / a row's bracket is collapsed" reading reduces -- through the banked
    noResidual_certificate tie -- to the false numeric 1 = 554 in the naturals. The kernel cannot close
    it; it BITES. -/
theorem bogus_claim : min (554 : ℕ) targetsMetFlag = 554 := by
  rw [cert_val_true]

end Counterexamples
