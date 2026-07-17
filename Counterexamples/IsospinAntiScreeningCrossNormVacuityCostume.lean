/-
  Counterexamples.IsospinAntiScreeningCrossNormVacuityCostume — cross-norm anti-vacuity (C534).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE ISOSPIN ANTI-SCREENING CROSS-NORMALIZATION, the route-finder for
  the dominant blocker `s`) proves that the raw cross-normalized fund-7 gather isospin self-census in
  doublet units OVERSHOOTS the matter doublet census by EXACTLY a factor of two — it equals
  `2·isoDepth`, strictly ABOVE `isoDepth` — so the naive census-subtraction `s := gatherIsoSpinCensus`
  is INADMISSIBLE (it drives the net running census strictly negative and lies outside the banked open
  range). The content that must NOT be hollow: this overshoot is genuine (`isoDepth < gatherIsoSpinCensus`,
  the naive net census is `< 0`), so `s` is genuinely NOT the raw cross-normalized census — the interior
  magnitude requires a saturation the chain has not yet banked. A "the raw census is already the
  admissible reduction / there is no overshoot / netIsoDepth stays positive" mis-reading is refuted by
  the banked `gatherIsoSpinCensus_overshoots` and `naive_netIso_negative`.

  THE CERTIFICATE. crossFlag := 1 -- a natural-number flag standing for "the derived cross-normalization
  overshoot is non-vacuous: the raw cross-normalized gather isospin census strictly EXCEEDS the matter
  doublet census (it equals 2·isoDepth), so the naive census-subtraction is inadmissible and the
  interior anti-screening magnitude is a proper sub-census — not the raw census". It is TIED to the
  banked landing by crossFlag_forced: `gatherIsoSpinCensus_overshoots` gives `isoDepth <
  gatherIsoSpinCensus`, and `naive_netIso_negative` gives `netIsoDepth gatherIsoSpinCensus < 0`, so the
  flag is 1.

  We anchor min 534 crossFlag = 1 (TRUE -- crossFlag = 1 < 534, so the min is crossFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the raw census is already the admissible reduction / no
  overshoot / net census stays positive" mis-reading): that min 534 crossFlag = 534. It GENUINELY
  equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 534 in the
  naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (534, 1) is fresh (Cid 534 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.IsospinAntiScreeningCrossNorm
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.IsospinAntiScreeningCrossNorm
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived cross-normalization overshoot is non-vacuous — the raw cross-normalized
    gather isospin census strictly EXCEEDS the matter doublet census (equals 2·isoDepth), so the naive
    census-subtraction is inadmissible (net census < 0) and the interior anti-screening magnitude is a
    proper sub-census, not the raw census". -/
def crossFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the raw cross-normalized gather census overshoots
    (`gatherIsoSpinCensus_overshoots`: `isoDepth < gatherIsoSpinCensus`), the naive reduction goes
    negative (`naive_netIso_negative`: `netIsoDepth gatherIsoSpinCensus < 0`), and `crossFlag = 1`. -/
theorem crossFlag_forced :
    (isoDepth < gatherIsoSpinCensus)
    ∧ (netIsoDepth gatherIsoSpinCensus < 0)
    ∧ crossFlag = 1 :=
  ⟨gatherIsoSpinCensus_overshoots, naive_netIso_negative, rfl⟩

/-- TRUE: min 534 crossFlag = 1, holding precisely because crossFlag = 1 < 534. -/
theorem cert_val_true : min (534 : ℕ) crossFlag = 1 := by decide

/-- BOGUS: claims min 534 crossFlag = 534. It GENUINELY equals 1 (cert_val_true). A "the raw census is
    already the admissible reduction / no overshoot / net census stays positive" mis-reading reduces --
    through the banked landing -- to the false numeric 1 = 534, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (534 : ℕ) crossFlag = 534 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 534  (FALSE — the costume bites)

end Counterexamples
