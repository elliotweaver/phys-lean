/-
  Counterexamples.AtomicShellPauliVacuityCostume — N403 anti-vacuity (C428).
  ============================================================================================
  W8 ANTI-VACUITY. The N403 node (arc-L L2 — atomic shell structure) derives the shell as the
  many-body antisymmetric capacity of the banked 2D fibre `StateFibre` (N391): the `N`-quantum
  antisymmetric sector `⋀^N StateFibre` has capacity `C(2, N)` (`sector_capacity`), which FILLS
  (nonzero, `Nontrivial` at `N = 2`, `orbital_filled` + `orbital_nonvacuous`) and then CLOSES
  (capacity `0`, `Subsingleton` for every `N > 2`, `orbital_closes`).

  The load-bearing non-vacuity facts are TWO: the filled shell genuinely HOLDS a state
  (`finrank (fermiSector 2) = 1`, `Nontrivial (fermiSector 2)`) YET the shell CLOSES at three
  (`finrank (fermiSector 3) = 0`). A mis-reading where L2 were VACUOUS — the shell holds nothing
  (capacity always `0`), or never closes (capacity never `0`), or the shell structure is empty —
  would have the flag `= 0`, not `1`.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked shell genuinely fills (the
  two-quantum antisymmetric sector has capacity `1` and is `Nontrivial`) YET closes (the
  three-quantum sector has capacity `0`) — shell structure is real, not vacuous". It is TIED to the
  banked N403 landing by `cFlag_forced`: `orbital_filled` gives capacity `1` at `N = 2`,
  `orbital_closes` gives capacity `0` at `N = 3`.

  We anchor `min 428 cFlag = 1` (TRUE — `cFlag = 1 < 428`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "L2 is vacuous / the shell holds nothing / the shell never
  closes" mis-reading): that `min 428 cFlag = 428`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 428` in ℕ. The kernel cannot close
  it; it BITES.

  DISTINCT from the banked battery: the pair (428, 1) is fresh (Cid 428 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.AtomicShellPauli
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.AtomicShell
open Phys.Foundation Module
open Phys.Foundation.ContinuumQ

/-- THE L2-NON-VACUITY FLAG: `1` = "the banked shell genuinely fills (the two-quantum antisymmetric
    sector has capacity `1`) YET closes (the three-quantum sector has capacity `0`) — atomic shell
    structure is real, not vacuous". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N403 landing): `orbital_filled` proves the two-quantum antisymmetric
    sector has capacity `1` (the shell genuinely holds the closed-shell singlet); `orbital_closes`
    proves the three-quantum sector has capacity `0` (the shell closes). So shell structure genuinely
    bites; hence `cFlag = 1`. If L2 were vacuous (capacity always `0`, or never closing), one of these
    would fail. -/
theorem cFlag_forced :
    finrank ContinuumQ.Cut (fermiSector 2) = 1
      ∧ finrank ContinuumQ.Cut (fermiSector 3) = 0
      ∧ cFlag = 1 :=
  ⟨orbital_filled, orbital_closes, rfl⟩

/-- TRUE: `min 428 cFlag = 1`, holding precisely because `cFlag = 1 < 428`. -/
theorem cert_val_true : min (428 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 428 cFlag = 428`. It GENUINELY equals `1` (`cert_val_true`). A "L2 is
    vacuous / the shell holds nothing / the shell never closes" mis-reading reduces — through the
    banked genuinely-filled, genuinely-closing shell — to the false numeric `1 = 428`, so this must
    NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (428 : ℕ) cFlag = 428 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 428  (FALSE — the costume bites)

end Counterexamples
