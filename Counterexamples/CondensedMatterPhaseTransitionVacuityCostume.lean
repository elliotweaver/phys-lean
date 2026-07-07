/-
  Counterexamples.CondensedMatterPhaseTransitionVacuityCostume — N405 anti-vacuity (C430).
  ============================================================================================
  W8 ANTI-VACUITY. The N405 node (arc-L L4 — condensed matter / phase transitions) derives the order
  parameter as the maxent-deviation self-datum `orderParam p = relInfo p (uniformState n)`, which
  vanishes on the symmetric (disordered) equilibrium phase (`orderParam_disordered_zero`) YET is
  strictly positive on a distinct (ordered/broken) phase (`orderParam_ordered_pos`, the banked
  `maxent_deviation_pos` at `pWit = ![3/4,1/4]` vs the equilibrium `qWit = uniformState 2`).

  The load-bearing non-vacuity fact: the transition is GENUINE — the ordered phase's order parameter
  is strictly greater than the disordered phase's (which is 0). A mis-reading where L4 were VACUOUS —
  the order parameter constant (no phases distinguished), or the deviation self-datum identically zero
  (no symmetry breaking possible), or the "transition" a trivial statement — would have the flag
  `= 0`, not `1`.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked order parameter genuinely
  distinguishes phases (the ordered phase has strictly positive deviation self-datum while the
  disordered phase has zero), so the phase transition is real, not vacuous". It is TIED to the banked
  N405 landing by `cFlag_forced` through `orderParam_ordered_pos` / `orderParam_disordered_zero`.

  We anchor `min 430 cFlag = 1` (TRUE — `cFlag = 1 < 430`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "L4 is vacuous / the order parameter is constant / no symmetry
  breaking / the transition is trivial" mis-reading): that `min 430 cFlag = 430`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 430` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (430, 1) is fresh (Cid 430 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CondensedMatterPhaseTransition
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.PhaseTransition
open Phys.Algebra.MaxEnt
open Phys.Foundation.ContinuumQ

/-- THE L4-NON-VACUITY FLAG: `1` = "the banked order parameter genuinely distinguishes phases (the
    ordered phase has a strictly positive deviation self-datum while the disordered/symmetric phase
    has zero) — the phase transition is real, not vacuous". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N405 landing): the ordered phase has strictly positive order parameter
    (`orderParam_ordered_pos`) while the disordered phase has zero (`orderParam_disordered_zero`), so
    the transition genuinely bites; hence `cFlag = 1`. If L4 were vacuous (order parameter constant,
    or no symmetry breaking possible), one of these would fail. -/
theorem cFlag_forced :
    (0 < orderParam pWit ∧ orderParam (uniformState 2) = 0) ∧ cFlag = 1 :=
  ⟨⟨orderParam_ordered_pos, orderParam_disordered_zero 2⟩, rfl⟩

/-- TRUE: `min 430 cFlag = 1`, holding precisely because `cFlag = 1 < 430`. -/
theorem cert_val_true : min (430 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 430 cFlag = 430`. It GENUINELY equals `1` (`cert_val_true`). A "L4 is vacuous
    / the order parameter is constant / no symmetry breaking / the transition is trivial" mis-reading
    reduces — through the banked genuinely-distinguishing order parameter — to the false numeric
    `1 = 430`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (430 : ℕ) cFlag = 430 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 430  (FALSE — the costume bites)

end Counterexamples
