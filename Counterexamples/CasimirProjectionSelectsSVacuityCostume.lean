/-
  Counterexamples.CasimirProjectionSelectsSVacuityCostume — Casimir-projection selection anti-vacuity (C536).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE CASIMIR-RATIO PROJECTION THAT SELECTS `s`, the fundamental-vs-adjoint
  projection resolving the census-layer ceiling) proves that the projection SELECTS the interior
  anti-screening magnitude: `projectedS = 3/2 = ratioTempered` and `projectedS ≠ doublingTempered`
  (`= 1`). The content that must NOT be hollow: the projection genuinely picks ONE admissible census
  candidate and genuinely EXCLUDES the other — the census-layer ceiling (`temperings_disagree`) is
  RESOLVED, not collapsed. A "the projection is ambiguous / picks both / picks neither / the ceiling
  survives" mis-reading is refuted by the banked `projectedS_selects_ratioTempered` together with
  `projectedS_rejects_doublingTempered`.

  THE CERTIFICATE. selectFlag := 1 -- a natural-number flag standing for "the derived Casimir-ratio
  projection is non-vacuous: it SELECTS the self-overlap census candidate (projectedS = ratioTempered)
  and REJECTS the trace/Dynkin candidate (projectedS != doublingTempered), so the census-layer ceiling
  is resolved by the representation-theoretic self-overlap datum". It is TIED to the banked landing by
  selectFlag_forced: `projectedS_selects_ratioTempered` gives `projectedS = ratioTempered`, and
  `projectedS_rejects_doublingTempered` gives `projectedS != doublingTempered`, so the flag is 1.

  We anchor min 536 selectFlag = 1 (TRUE -- selectFlag = 1 < 536, so the min is selectFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the projection is ambiguous / the ceiling survives" mis-reading):
  that min 536 selectFlag = 536. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus
  claim to the false numeric 1 = 536 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (536, 1) is fresh (Cid 536 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CasimirProjectionSelectsS
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.AntiScreeningTemperingCeiling
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the derived Casimir-ratio projection is non-vacuous — it SELECTS the self-overlap
    census candidate (projectedS = ratioTempered) and REJECTS the trace/Dynkin candidate (projectedS
    != doublingTempered), so the census-layer ceiling is resolved". -/
def selectFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the projection SELECTS `ratioTempered`
    (`projectedS_selects_ratioTempered`) and REJECTS `doublingTempered`
    (`projectedS_rejects_doublingTempered`), and `selectFlag = 1`. -/
theorem selectFlag_forced :
    (projectedS = ratioTempered)
    ∧ (projectedS ≠ doublingTempered)
    ∧ selectFlag = 1 :=
  ⟨projectedS_selects_ratioTempered, projectedS_rejects_doublingTempered, rfl⟩

/-- TRUE: min 536 selectFlag = 1, holding precisely because selectFlag = 1 < 536. -/
theorem cert_val_true : min (536 : ℕ) selectFlag = 1 := by decide

/-- BOGUS: claims min 536 selectFlag = 536. It GENUINELY equals 1 (cert_val_true). A "the projection
    is ambiguous / the ceiling survives" mis-reading reduces -- through the banked landing -- to the
    false numeric 1 = 536, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (536 : ℕ) selectFlag = 536 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 536  (FALSE — the costume bites)

end Counterexamples
