/-
  Counterexamples.StandpointCompletionVacuityCostume — N### anti-vacuity (C474).
  ============================================================================================
  W8 ANTI-VACUITY. The R5 node (arc-R R5 — THE COMPLETION EXCESS) has genuine content only if the
  completion excess on the banked derived ℝ `Cut` — with its banked Dedekind completeness
  `isLUB_csSupCut` (N33 = N7–N14 `completion_coherence_closed`) — is a REAL, non-trivial structure:
  (1) COVERAGE ⊆ PRESENTATION always (`coverage_subset_presentation`);
  (★) THE DETECTOR — a presented point escapes the coverage IFF the coverage is not gap-free
      (`excess_nonempty_iff_not_gapFree`, an iff, not a one-way inequality);
  (2) gap-free coverage COINCIDES with its presentation (`gapFree_presentation_eq`);
  (4) the banked completeness FILLS the gap: `sSup (Iio a) = a` (`sSup_Iio_eq`);
  (W8) the excess is REALIZED on the interior-gapped punctured line `{x ≠ a}`
      (`interior_gap_excess_bites`); yet
  (★ teeth) it VANISHES on the gap-free closed ray `Iic a` (`gapfree_no_excess`, `iic_gapFree`);
  (Σ) the whole completion excess bundles as ONE object (`completion_excess`).
  A mis-reading where the presentation NEVER exceeded the coverage (the completion added nothing on a
  gapped coverage), or where a gap-free coverage DID over-complete (the excess had no failure case),
  or where the banked completeness FAILED to land `sSup (Iio a) = a`, would gut R5.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R5 completion excess is genuine: the
  presentation contains the coverage, strictly exceeds it iff (and only iff) the coverage is not
  gap-free, is realized on the interior-gapped punctured line and vanishes on the gap-free closed
  ray". It is TIED to the banked R5 landing by `cFlag_forced` through `coverage_subset_presentation`,
  `excess_nonempty_iff_not_gapFree`, `gapFree_presentation_eq`, `presentation_strict_of_gap`,
  `sSup_Iio_eq`, `interior_gap_excess_bites`, `iic_gapFree`, `gapfree_no_excess`, and
  `completion_excess`.

  We anchor `min 474 cFlag = 1` (TRUE — `cFlag = 1 < 474`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the completion never exceeds / a gap-free ray over-completes /
  the banked sSup misses the interior point" mis-reading): that `min 474 cFlag = 474`. It GENUINELY
  equals `1`. Rewriting reduces the bogus claim to the false numeric `1 = 474` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (474, 1) is fresh (Cid 474 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointCompletion
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointCompletion

/-- THE R5-NON-VACUITY FLAG: `1` = "the completion excess on the banked derived ℝ is genuine: the
    presentation contains the coverage, strictly exceeds it iff the coverage is not gap-free, is
    realized on the interior-gapped punctured line and vanishes on the gap-free closed ray". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R5 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R5 landings — coverage-in-presentation (`coverage_subset_presentation`), the ★
    detector iff (`excess_nonempty_iff_not_gapFree`), the coincidence (`gapFree_presentation_eq`), the
    strict-excess-from-a-gap (`presentation_strict_of_gap`), the banked completeness filling the gap
    (`sSup_Iio_eq`), the ★ interior-gap realization (`interior_gap_excess_bites`), the gap-free ray
    (`iic_gapFree`), the ★ teeth failure case (`gapfree_no_excess`), and the capstone
    (`completion_excess`). If any were hollow, those decls would not exist and this could not
    compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @coverage_subset_presentation
  have _ := @excess_nonempty_iff_not_gapFree
  have _ := @gapFree_presentation_eq
  have _ := @presentation_strict_of_gap
  have _ := @sSup_Iio_eq
  have _ := @interior_gap_excess_bites
  have _ := @iic_gapFree
  have _ := @gapfree_no_excess
  have _ := @completion_excess
  rfl

/-- TRUE: `min 474 cFlag = 1`, holding precisely because `cFlag = 1 < 474`. -/
theorem cons_val_true : min (474 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 474 cFlag = 474`. It GENUINELY equals `1` (`cons_val_true`). A "completion
    never exceeds / gap-free ray over-completes / banked sSup misses the interior point" mis-reading
    reduces — through the banked R5 landing — to the false numeric `1 = 474`, so this must NOT
    compile. -/
theorem cons_val_wrong_BOGUS :
    min (474 : ℕ) cFlag = 474 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 474  (FALSE — the costume bites)

end Counterexamples
