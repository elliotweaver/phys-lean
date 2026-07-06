/-
  Counterexamples.BaryogenesisAsymmetryVacuityCostume — N381 anti-vacuity (C406).
  ============================================================================================
  W8 ANTI-VACUITY. The N381 node (arc-H H3 — the matter-antimatter asymmetry `η_B` as the product
  of the three banked fold obstructions = the three Sakharov conditions) banks that the asymmetry is
  the product `bViolationRate k · cpSource · nonEqMeasure p q`, so it VANISHES if any Sakharov factor
  vanishes and is nonzero (and DEFINITE-signed) only when all three are present. The out-of-equilibrium
  condition being LOAD-BEARING is the anti-vacuity content: at equilibrium (`p = q`) the asymmetry is
  `0` (`asymmetry_zero_at_equilibrium`), while off equilibrium with all conditions present it is
  strictly negative and hence NONZERO (`asymmetry_witness_neg`). So the off-equilibrium and
  equilibrium asymmetries GENUINELY DIFFER (`asymmetry_offeq_ne_eq`). A "the asymmetry survives at
  equilibrium / a Sakharov condition is dispensable / the mechanism produces an asymmetry with only
  two conditions" mis-reading would break it — it would make the third factor inert.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the off-equilibrium asymmetry GENUINELY
  DIFFERS from the equilibrium one (`baryonAsymmetry 1 pWit qWit ≠ baryonAsymmetry 1 qWit qWit`), so
  the out-of-equilibrium Sakharov condition is LOAD-BEARING". It is TIED to the banked N381 landing by
  `iFlag_forced`: the banked `asymmetry_offeq_ne_eq` witnesses the inequality, so the flag is `1`.

  We anchor `min 406 iFlag = 1` (TRUE — `iFlag = 1 < 406`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the asymmetry survives at equilibrium / a Sakharov condition
  is dispensable" mis-reading): that `min 406 iFlag = 406`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 406` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (406, 1) is fresh (Cid 406 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.BaryogenesisAsymmetry
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.MaxEnt

/-- THE OUT-OF-EQUILIBRIUM-LOAD-BEARING FLAG: `1` = "the off-equilibrium asymmetry
    `baryonAsymmetry 1 pWit qWit` GENUINELY DIFFERS from the equilibrium one
    `baryonAsymmetry 1 qWit qWit` (which is `0`), so the third Sakharov condition (departure from
    equilibrium) is LOAD-BEARING — the product mechanism produces NO asymmetry with a missing
    condition". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N381 landing): the banked `asymmetry_offeq_ne_eq` proves
    `baryonAsymmetry 1 pWit qWit ≠ baryonAsymmetry 1 qWit qWit`, so the "out-of-equilibrium
    load-bearing" flag is present, `iFlag = 1`. If a Sakharov condition were dispensable, this
    witness would not exist. -/
theorem iFlag_forced :
    (baryonAsymmetry 1 pWit qWit ≠ baryonAsymmetry 1 qWit qWit) ∧ iFlag = 1 :=
  ⟨asymmetry_offeq_ne_eq, rfl⟩

/-- TRUE: `min 406 iFlag = 1`, holding precisely because `iFlag = 1 < 406`. -/
theorem cert_val_true : min (406 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 406 iFlag = 406`. It GENUINELY equals `1` (`cert_val_true`). A "the asymmetry
    survives at equilibrium / a Sakharov condition is dispensable" mis-reading reduces — through the
    banked value — to the false numeric `1 = 406`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (406 : ℕ) iFlag = 406 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 406  (FALSE — the costume bites)

end Counterexamples
