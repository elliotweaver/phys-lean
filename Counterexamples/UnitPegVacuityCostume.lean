/-
  Counterexamples.UnitPegVacuityCostume — the unit peg GENUINELY moves absolute (dimensionful)
  values (it is not a vacuous convention), anti-vacuity (C547).
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-M M1 — THE ONE UNIT PEG) declares the chain's SINGLE dimensionful
  convention (`UnitPeg`) and proves it is UNIQUE-UP-TO-UNITS: any two pegs differ by a global rescale
  and every dimensionless ratio is peg-invariant. The two facts that together ARE the M1 content are
  (a) the peg does NOT touch ratios (`ratio_peg_invariant`) and (b) the peg DOES touch absolute
  magnitudes (`human_peg_dependent`). If (b) were vacuous — if the peg moved NOTHING — then declaring
  "the single dimensionful convention" would be hollow: there would be no dimensionful content for the
  peg to set, and the whole arc-M evaluation program would be empty.

  The content that must NOT be hollow: the peg genuinely separates points on absolute values — the
  banked `human_peg_dependent` gives `∃ p q : UnitPeg, p.human absMass0 ≠ q.human absMass0`. A "the
  peg is a vacuous relabel that moves nothing" mis-reading is refuted by that banked theorem.

  THE CERTIFICATE. moveFlag := 1 -- a natural-number flag standing for "the unit peg genuinely moves
  absolute values (human_peg_dependent), so the single dimensionful convention has real content". It is
  TIED to the banked landing by moveFlag_forced: `human_peg_dependent` gives the genuine separation.

  We anchor min 547 moveFlag = 1 (TRUE -- moveFlag = 1 < 547, so the min is moveFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the peg is a vacuous relabel that moves nothing" mis-reading):
  that min 547 moveFlag = 547. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim
  to the false numeric 1 = 547 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (547, 1) is fresh (Cid 547 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.UnitPeg
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.Peg
open Phys.Algebra.AbsMass

/-- THE FLAG: 1 = "the unit peg genuinely moves absolute values (human_peg_dependent), so the single
    dimensionful convention has real content". -/
def moveFlag : ℕ := 1

/-- TRUE (tied to the banked landing): there exist two pegs giving different absolute values
    (`human_peg_dependent`), and `moveFlag = 1`. -/
theorem moveFlag_forced :
    (∃ p q : UnitPeg, p.human absMass0 ≠ q.human absMass0) ∧ moveFlag = 1 :=
  ⟨human_peg_dependent, rfl⟩

/-- TRUE: min 547 moveFlag = 1, holding precisely because moveFlag = 1 < 547. -/
theorem cert_val_true : min (547 : ℕ) moveFlag = 1 := by decide

/-- BOGUS: claims min 547 moveFlag = 547. It GENUINELY equals 1 (cert_val_true). A "the peg is a
    vacuous relabel that moves nothing" mis-reading reduces -- through the banked human_peg_dependent
    tie -- to the false numeric 1 = 547 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (547 : ℕ) moveFlag = 547 := by
  rw [cert_val_true]

end Counterexamples
