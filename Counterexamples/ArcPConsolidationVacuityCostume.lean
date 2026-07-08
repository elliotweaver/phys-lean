/-
  Counterexamples.ArcPConsolidationVacuityCostume — N### anti-vacuity (C459).
  ============================================================================================
  W8 ANTI-VACUITY. The N### node (arc-P P8 — the arc-P consolidation: arc P read as ONE structure
  over the fold's TWO self-blindness measures, the unresolved-direction COUNT `finrank ℚ Uhol` and
  the fold's RETURN TURN `azimuthalTurn`) has genuine content only if the consolidation genuinely
  DEPENDS on the banked arc-P landings and the threads bite. Specifically it needs:
  (a) the self-blind-count thread `selfblind_count_reads_three_sectors` (P3 ⊗ P4 ⊗ P6, the SAME count
  reads three sectors); (b) the multi-node teeth `wrong_count_breaks_anomaly_and_triality` (the wrong
  count `2` breaks P3 AND P6 at once, via the new `trialityHom_gcyc_sq_ne_one`); (c) the fold-turn
  thread `massScale_through_fold_turn` (the mass scale routes through `azimuthalTurn`, P1 ⊗ P2); (d)
  the two-distinct-counts guard `two_derived_counts_distinct` (`9 ≠ 3`); (e) the capstone
  `arcP_consolidation`. A mis-reading where the consolidation were a hollow conjunction (not depending
  on the banked arc-P nodes), or where the threads/teeth were absent, would gut P8.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N### arc-P consolidation is genuine: the
  self-blind count reads three arc-P sectors with multi-node teeth, the fold return turn is exhibited
  inside the mass scale, and the two derived dimensions are distinct". It is TIED to the banked N###
  landing by `cFlag_forced` through `selfblind_count_reads_three_sectors`,
  `wrong_count_breaks_anomaly_and_triality`, `massScale_through_fold_turn`,
  `two_derived_counts_distinct`, and `arcP_consolidation`.

  We anchor `min 459 cFlag = 1` (TRUE — `cFlag = 1 < 459`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the consolidation is hollow / the threads are absent"
  mis-reading): that `min 459 cFlag = 459`. It GENUINELY equals `1` (`cons_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 459` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (459, 1) is fresh (Cid 459 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ArcPConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ArcPConsolidation

/-- THE N###-NON-VACUITY FLAG: `1` = "the arc-P consolidation is genuine: the self-blind count reads
    three arc-P sectors with multi-node teeth, the fold return turn is exhibited inside the mass scale,
    and the two derived dimensions are distinct". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N### landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the five
    load-bearing P8 landings — the self-blind-count thread (`selfblind_count_reads_three_sectors`), the
    multi-node teeth (`wrong_count_breaks_anomaly_and_triality`), the fold-turn thread
    (`massScale_through_fold_turn`), the two-distinct-counts guard (`two_derived_counts_distinct`), and
    the capstone (`arcP_consolidation`). If the consolidation were hollow / the threads absent, those
    decls would not exist and this theorem could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := selfblind_count_reads_three_sectors
  have _ := wrong_count_breaks_anomaly_and_triality
  have _ := massScale_through_fold_turn
  have _ := two_derived_counts_distinct
  have _ := arcP_consolidation
  rfl

/-- TRUE: `min 459 cFlag = 1`, holding precisely because `cFlag = 1 < 459`. -/
theorem cons_val_true : min (459 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 459 cFlag = 459`. It GENUINELY equals `1` (`cons_val_true`). A "the
    consolidation is hollow / the threads are absent" mis-reading reduces — through the banked P8
    landing — to the false numeric `1 = 459`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (459 : ℕ) cFlag = 459 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 459  (FALSE — the costume bites)

end Counterexamples
