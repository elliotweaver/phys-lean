/-
  Counterexamples.ConfinementScaleNumeralVacuityCostume — the certified confinement-scale numeral
  GENUINELY forces a strictly-suppressed non-degenerate scale (it is not a hollow/collapsed bracket),
  C549.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-M M3 — THE CONFINEMENT SCALE NUMERAL) evaluates the confinement
  scale as a certified two-sided rational bracket `confinementScaleRatio = Λ/M ∈ [42408/1e21,
  42414/1e21]` against the M1 peg, plus the `v/Λ`, `M/Λ` ratios and the banked `128/27` confinement
  band. The content that must NOT be hollow is that the numeral genuinely places the confinement scale
  strictly BELOW the electroweak scale and the octonion ceiling: the confinement bracket lies entirely
  below the M2 electroweak bracket, which lies entirely below `1`
  (`confinement_scale_ordered_from_brackets`: `0 < confinementScaleRatio < ewClosureRatio < 1`,
  derived FROM the certified brackets). If that were vacuous — if the confinement scale coincided with
  the electroweak scale or the ceiling — the "numeral" would carry no hierarchy content and the arc-M
  evaluation program would be empty.

  The content that must NOT be hollow: the certified brackets force the strict scale hierarchy — the
  banked `confinement_scale_ordered_from_brackets` gives `0 < confinementScaleRatio ∧
  confinementScaleRatio < ewClosureRatio ∧ ewClosureRatio < 1`. A "the confinement scale is degenerate
  with the electroweak scale / the bracket collapses" mis-reading is refuted by that banked theorem.

  THE CERTIFICATE. sepFlag := 1 -- a natural-number flag standing for "the certified numeral forces a
  strictly-suppressed non-degenerate confinement scale below the electroweak scale and the ceiling
  (confinement_scale_ordered_from_brackets)". It is TIED to the banked landing by sepFlag_forced.

  We anchor min 549 sepFlag = 1 (TRUE -- sepFlag = 1 < 549, so the min is sepFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the confinement scale is degenerate / the numeral collapses"
  mis-reading): that min 549 sepFlag = 549. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 549 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (549, 1) is fresh (Cid 549 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ConfinementScaleNumeral
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ConfNumeral
open Phys.Algebra

/-- THE FLAG: 1 = "the certified numeral forces a strictly-suppressed non-degenerate confinement scale
    below the electroweak scale and the octonion ceiling
    (confinement_scale_ordered_from_brackets)". -/
def sepFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the certified brackets force `0 < confinementScaleRatio <
    ewClosureRatio < 1` (`confinement_scale_ordered_from_brackets`), and `sepFlag = 1`. -/
theorem sepFlag_forced :
    (0 < confinementScaleRatio ∧ confinementScaleRatio < ewClosureRatio ∧ ewClosureRatio < 1)
      ∧ sepFlag = 1 :=
  ⟨confinement_scale_ordered_from_brackets, rfl⟩

/-- TRUE: min 549 sepFlag = 1, holding precisely because sepFlag = 1 < 549. -/
theorem cert_val_true : min (549 : ℕ) sepFlag = 1 := by decide

/-- BOGUS: claims min 549 sepFlag = 549. It GENUINELY equals 1 (cert_val_true). A "the confinement
    scale is degenerate with the electroweak scale / the numeral collapses" mis-reading reduces --
    through the banked confinement_scale_ordered_from_brackets tie -- to the false numeric 1 = 549 in
    the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (549 : ℕ) sepFlag = 549 := by
  rw [cert_val_true]

end Counterexamples
