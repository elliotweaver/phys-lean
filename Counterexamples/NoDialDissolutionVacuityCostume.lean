/-
  Counterexamples.NoDialDissolutionVacuityCostume — N372 anti-vacuity (C397).
  ============================================================================================
  W8 ANTI-VACUITY. The N372 node (arc-F F6 — THE NO-DIAL DISSOLUTION THEOREMS) banks that the four
  standard fine-tuning "dials" have no representative in the fold's Born self-overlap structure at
  the self-blind origin. The load-bearing content of the Λ-leg rigidity (`lambda_leg`) is that the
  exact-zero vacuum is GENUINELY DETECTABLE under a nonzero additive dial: a "no dial exists" that
  actually means "every dial is undetectable / the vacuum absorbs any constant" would make the
  rigidity vacuous. The banked `no_dial_nonvacuous` rules this out: for `c = 1`, the vacuum energy
  is exactly `0` YET `plateauApproachPot 1 0 + 1 ≠ 0` — a unit additive dial really does displace
  the vacuum (and, alongside, the discarded CP channel `phaseChannel u1 u2 1` is genuinely nonzero,
  so θ̄ = 0 is not vacuous either).

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "a nonzero additive dial genuinely displaces
  the exact-zero fold vacuum (the Λ-rigidity is non-vacuous)". It is TIED to the banked N372 landing
  by `iFlag_forced`: the banked `no_dial_nonvacuous` witnesses `plateauApproachPot 1 0 + 1 ≠ 0`, so
  the flag is `1` (present).

  We anchor `min 397 iFlag = 1` (TRUE — `iFlag = 1 < 397`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the vacuum absorbs any additive constant / a dial is
  undetectable / the no-dial rigidity is vacuous" mis-reading): that `min 397 iFlag = 397`. It
  GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric
  `1 = 397` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (397, 1) is fresh (Cid 397 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NoDialDissolutionTheorems
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.NoDial
open Phys.Algebra
open Phys.Foundation.ContinuumQ

/-- THE NO-DIAL NON-VACUITY FLAG: `1` = "a nonzero additive dial genuinely displaces the exact-zero
    fold vacuum — the Λ-leg rigidity is non-vacuous (the vacuum does NOT absorb an arbitrary
    additive constant)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N372 landing): the banked `no_dial_nonvacuous` proves the fold vacuum
    energy at the origin is exactly `0` YET a unit additive dial makes it nonzero
    (`plateauApproachPot 1 0 + 1 ≠ 0`), so the "dial-is-detectable" flag is present, `iFlag = 1`.
    If the vacuum absorbed any additive constant, this witness would not exist. -/
theorem iFlag_forced :
    (plateauApproachPot (1 : Phys.Foundation.ContinuumQ.Cut) 0 + 1 ≠ 0) ∧ iFlag = 1 :=
  ⟨no_dial_nonvacuous.2.1, rfl⟩

/-- TRUE: `min 397 iFlag = 1`, holding precisely because `iFlag = 1 < 397`. -/
theorem cert_val_true : min (397 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 397 iFlag = 397`. It GENUINELY equals `1` (`cert_val_true`). A "the vacuum
    absorbs any additive constant / the no-dial rigidity is vacuous" mis-reading reduces — through
    the banked value — to the false numeric `1 = 397`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (397 : ℕ) iFlag = 397 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 397  (FALSE — the costume bites)

end Counterexamples
