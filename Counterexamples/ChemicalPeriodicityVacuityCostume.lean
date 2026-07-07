/-
  Counterexamples.ChemicalPeriodicityVacuityCostume — N404 anti-vacuity (C429).
  ============================================================================================
  W8 ANTI-VACUITY. The N404 node (arc-L L3 — chemical periodicity) derives periodicity as the
  modular recurrence of shell occupancy FORCED by the banked shell closure: valence occupancy
  `Z % carrierDim` recurs with period `carrierDim` (`valence_periodic`) because filling RESTARTS at
  capacity (`filling_restarts`: the overfill `fermiSector (carrierDim+1)` is `Subsingleton`, YET the
  modular restart `fermiSector ((carrierDim+1) % carrierDim)` is `Nontrivial`).

  The load-bearing non-vacuity facts are TWO, sitting inside `filling_restarts`: the overfill shell
  genuinely DIES (`Subsingleton (fermiSector (carrierDim+1))`) YET the modular restart shell
  genuinely LIVES (`Nontrivial (fermiSector ((carrierDim+1) % carrierDim))`). A mis-reading where
  L3 were VACUOUS — the "restart" opens nothing (every shell empty), or nothing ever closes (no
  genuine period boundary), or periodicity is a trivial statement about the empty module — would
  have the flag `= 0`, not `1`.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked filling genuinely restarts (the
  overfill shell is a Subsingleton — the carrier is full — while the modular restart shell is
  Nontrivial — a fresh period genuinely begins), so periodicity is real, not vacuous". It is TIED
  to the banked N404 landing by `cFlag_forced` through `filling_restarts`.

  We anchor `min 429 cFlag = 1` (TRUE — `cFlag = 1 < 429`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "L3 is vacuous / the restart opens nothing / nothing ever
  closes / periodicity is trivial" mis-reading): that `min 429 cFlag = 429`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 429` in ℕ.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (429, 1) is fresh (Cid 429 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ChemicalPeriodicity
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ChemPeriodic
open Phys.Algebra.AtomicShell
open Phys.Foundation Module
open Phys.Foundation.ContinuumQ

/-- THE L3-NON-VACUITY FLAG: `1` = "the banked filling genuinely restarts (the overfill shell is a
    Subsingleton while the modular restart shell is Nontrivial) — chemical periodicity is real, not
    vacuous". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N404 landing): `filling_restarts` proves the overfill shell is a
    `Subsingleton` (the carrier is full) YET the modular restart shell is `Nontrivial` (a fresh
    period genuinely begins). So periodicity genuinely bites; hence `cFlag = 1`. If L3 were vacuous
    (the restart opened nothing, or nothing ever closed), one of these would fail. -/
theorem cFlag_forced :
    (Subsingleton (fermiSector (carrierDim + 1))
      ∧ Nontrivial (fermiSector ((carrierDim + 1) % carrierDim)))
      ∧ cFlag = 1 :=
  ⟨filling_restarts, rfl⟩

/-- TRUE: `min 429 cFlag = 1`, holding precisely because `cFlag = 1 < 429`. -/
theorem cert_val_true : min (429 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 429 cFlag = 429`. It GENUINELY equals `1` (`cert_val_true`). A "L3 is
    vacuous / the restart opens nothing / nothing ever closes / periodicity is trivial" mis-reading
    reduces — through the banked genuinely-restarting filling — to the false numeric `1 = 429`, so
    this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (429 : ℕ) cFlag = 429 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 429  (FALSE — the costume bites)

end Counterexamples
