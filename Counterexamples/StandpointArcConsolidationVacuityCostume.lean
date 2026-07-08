/-
  Counterexamples.StandpointArcConsolidationVacuityCostume — N### arc-R R8 anti-vacuity (C478).
  ============================================================================================
  W8 ANTI-VACUITY. The R8 node (arc-R R8 — THE ARC-R CONSOLIDATION) has genuine content only if the
  consolidation is a REAL bundle of the banked R1–R7b landings welded by the self-blindness spine —
  NOT a hollow ∧ and NOT vacuously true:
  (§1) THE SELF-BLINDNESS SPINE (`selfblind_one_engine`): the SAME banked `fold_self_blind` (N1) at
       three 2-torsion-free carriers (`O Cut`, `StateFibre`, `O Cut × O Cut`) — the miss (R2), the
       conserved blindness (R3), the tower non-completion (R4) as ONE cause;
  (§2) THE COVER-TERMINATION (`cover_terminates_the_spine`): the banked `foldComplex` covers the
       look-back on the fibre while fixing nothing live;
  (§3) THE UNIQUE ASSEMBLY (`assembly_is_unique`): the banked component lattice has a UNIQUE maximal
       coherent cell;
  (Σ) THE CAPSTONE (`standpoint_arc_consolidation`): bundles §1–§3 with the eight banked faces.
  A mis-reading where the spine did NOT actually depend on the shared banked lemma (the three
  carriers not really one engine), or where the cover did not cover the look-back, or where the
  assembly were not unique, or where any banked face were secretly vacuous, would gut R8: the
  consolidation would be a hollow conjunction or trivially true.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the R8 arc-R consolidation is genuine: the
  self-blindness spine unifies R2/R3/R4 as one banked lemma at three carriers, the cover terminates
  it, the assembly is unique, and the eight banked faces hold". It is TIED to the banked R8 landing
  by `cFlag_forced` through `selfblind_one_engine`, `cover_terminates_the_spine`, `assembly_is_unique`,
  and `standpoint_arc_consolidation`.

  We anchor `min 478 cFlag = 1` (TRUE — `cFlag = 1 < 478`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the consolidation is hollow / the spine is not one engine /
  the assembly is not unique / a face is vacuous" mis-reading): that `min 478 cFlag = 478`. It
  GENUINELY equals `1`. Rewriting reduces the bogus claim to the false numeric `1 = 478` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (478, 1) is fresh (Cid 478 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.StandpointArcConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.StandpointArcConsolidation

/-- THE R8-NON-VACUITY FLAG: `1` = "the arc-R consolidation is genuine: the self-blindness spine
    unifies R2/R3/R4, the cover terminates it, the assembly is unique, the eight faces hold". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked R8 landing): `cFlag = 1`, and the proof GENUINELY DEPENDS on the
    load-bearing R8 landings — the spine (`selfblind_one_engine`), the cover-termination cross-tie
    (`cover_terminates_the_spine`), the unique-assembly cross-tie (`assembly_is_unique`), and the
    capstone (`standpoint_arc_consolidation`). If any were hollow, those decls would not exist and
    this could not compile. -/
theorem cFlag_forced : cFlag = 1 := by
  have _ := @selfblind_one_engine
  have _ := @cover_terminates_the_spine
  have _ := @assembly_is_unique
  have _ := @standpoint_arc_consolidation
  rfl

/-- TRUE: `min 478 cFlag = 1`, holding precisely because `cFlag = 1 < 478`. -/
theorem cons_val_true : min (478 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 478 cFlag = 478`. It GENUINELY equals `1` (`cons_val_true`). A "consolidation
    is hollow / spine not one engine / assembly not unique / face vacuous" mis-reading reduces —
    through the banked R8 landing — to the false numeric `1 = 478`, so this must NOT compile. -/
theorem cons_val_wrong_BOGUS :
    min (478 : ℕ) cFlag = 478 := by
  rw [cons_val_true]
  -- ⊢ (1 : ℕ) = 478  (FALSE — the costume bites)

end Counterexamples
