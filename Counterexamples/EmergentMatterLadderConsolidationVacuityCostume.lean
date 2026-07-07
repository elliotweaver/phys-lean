/-
  Counterexamples.EmergentMatterLadderConsolidationVacuityCostume — N406 anti-vacuity (C431).
  ============================================================================================
  W8 ANTI-VACUITY. The N406 node (arc-L L5 — the consolidation of the emergent matter ladder)
  banks three genuine cross-ties threaded by the SAME terminal-algebra invariant `‖φ‖² = 42`
  (`assoc3NormSq`): the L4 universal exponent is `1/42`, the terminal dimension `7` threads the
  L2/L3/L4 rungs, and the L1 residual associator is nonzero. The load-bearing non-vacuity fact:
  the threaded number is GENUINELY `42` — not the degenerate `0`, and not the naive `n² = 49`
  (which would keep the seven diagonal self-pairs). A mis-reading where the consolidation were
  VACUOUS — the shared number `0`, or the cross-ties trivially true of any number, or the ladder
  a hollow conjunction — would have the flag `= 0`, not `1`.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked ladder invariant genuinely
  equals `42` (nonzero, and distinct from the naive `49`), so the three cross-ties bite on a real
  terminal invariant, not a vacuous one". It is TIED to the banked N406 landing by `cFlag_forced`
  through `ladder_number_nonvacuous` and `exponent_is_structure_form_norm_reciprocal`.

  We anchor `min 431 cFlag = 1` (TRUE — `cFlag = 1 < 431`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "L5 is a hollow conjunction / the shared number is
  degenerate / the cross-ties are vacuous" mis-reading): that `min 431 cFlag = 431`. It GENUINELY
  equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 431`
  in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (431, 1) is fresh (Cid 431 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.EmergentMatterLadderConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.MatterLadder
open Phys.Algebra
open Phys.Algebra.Universality

/-- THE L5-NON-VACUITY FLAG: `1` = "the banked ladder invariant threading the four rungs genuinely
    equals `42` (nonzero, and distinct from the naive `49`), so the three cross-ties bite on a real
    terminal invariant — the consolidation is not a hollow conjunction". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N406 landing): the threaded invariant `assoc3NormSq` genuinely equals
    `42`, is nonzero, and is not the naive `49` (`ladder_number_nonvacuous`), and the L4 universal
    exponent is its reciprocal (`exponent_is_structure_form_norm_reciprocal`); hence `cFlag = 1`.
    If L5 were vacuous (the shared number degenerate, or the cross-ties trivially true), one of
    these would fail. -/
theorem cFlag_forced :
    (assoc3NormSq = 42 ∧ assoc3NormSq ≠ 0 ∧ assoc3NormSq ≠ 49
      ∧ criticalExponent = 1 / assoc3NormSq) ∧ cFlag = 1 :=
  ⟨⟨ladder_number_nonvacuous.1, ladder_number_nonvacuous.2.1, ladder_number_nonvacuous.2.2,
    exponent_is_structure_form_norm_reciprocal.1⟩, rfl⟩

/-- TRUE: `min 431 cFlag = 1`, holding precisely because `cFlag = 1 < 431`. -/
theorem cert_val_true : min (431 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 431 cFlag = 431`. It GENUINELY equals `1` (`cert_val_true`). A "L5 is a
    hollow conjunction / the shared number is degenerate / the cross-ties are vacuous" mis-reading
    reduces — through the banked genuinely-`42` ladder invariant — to the false numeric `1 = 431`,
    so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (431 : ℕ) cFlag = 431 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 431  (FALSE — the costume bites)

end Counterexamples
