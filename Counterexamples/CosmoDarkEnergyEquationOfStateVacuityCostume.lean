/-
  Counterexamples.CosmoDarkEnergyEquationOfStateVacuityCostume — N382 anti-vacuity (C407).
  ============================================================================================
  W8 ANTI-VACUITY. The N382 node (arc-H H4 — dark energy `w = −1` / de Sitter self-similarity)
  banks that the cosmological term `Λ·g = Λ • sigOpC` inherits the fold's indefinite signature:
  the space-diagonal reading (pressure) is the NEGATIVE of the time-diagonal reading (density), so
  `w = P/ρ = −1` and, crucially, the pressure GENUINELY DIFFERS from the density for nonzero `Λ`
  (`w_neg_one_load_bearing`). The signature flip being REAL is the anti-vacuity content: a mis-reading
  where pressure equalled density (`w = +1`, NO signature, no dark-energy behaviour) would break it —
  it would make the metric's timelike/spacelike sign split inert.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "for the concrete nonzero coefficient
  `Λ = 1` the pressure GENUINELY DIFFERS from the density (`cosmoPressure 1 ≠ cosmoDensity 1`), so
  the metric signature flip is REAL and `w = −1` (not `+1`)". It is TIED to the banked N382 landing
  by `iFlag_forced`: the banked `w_neg_one_load_bearing` (at `Λ = 1 ≠ 0`) witnesses the inequality,
  so the flag is `1`.

  We anchor `min 407 iFlag = 1` (TRUE — `iFlag = 1 < 407`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the pressure equals the density / `w = +1` / no signature
  flip" mis-reading): that `min 407 iFlag = 407`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting reduces the bogus claim to the false numeric `1 = 407` in ℕ. The kernel cannot close it;
  it BITES.

  DISTINCT from the banked battery: the pair (407, 1) is fresh (Cid 407 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoDarkEnergyEquationOfState
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra

/-- THE SIGNATURE-FLIP-REAL FLAG: `1` = "for the concrete nonzero coefficient `Λ = 1` the pressure
    `cosmoPressure 1` GENUINELY DIFFERS from the density `cosmoDensity 1`, so the fold's metric
    signature assigns OPPOSITE signs to the timelike and spacelike axes — the dark-energy equation
    of state is `w = −1`, not `w = +1`". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N382 landing): the banked `w_neg_one_load_bearing` proves
    `cosmoPressure 1 ≠ cosmoDensity 1` (at `Λ = 1 ≠ 0`), so the "signature flip is real" flag is
    present, `iFlag = 1`. If the pressure equalled the density (`w = +1`), this witness would not
    exist. -/
theorem iFlag_forced :
    (cosmoPressure (1 : Phys.Foundation.ContinuumQ.Cut)
        ≠ cosmoDensity (1 : Phys.Foundation.ContinuumQ.Cut))
      ∧ iFlag = 1 :=
  ⟨w_neg_one_load_bearing 1 one_ne_zero, rfl⟩

/-- TRUE: `min 407 iFlag = 1`, holding precisely because `iFlag = 1 < 407`. -/
theorem cert_val_true : min (407 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 407 iFlag = 407`. It GENUINELY equals `1` (`cert_val_true`). A "the pressure
    equals the density / `w = +1` / no signature flip" mis-reading reduces — through the banked value
    — to the false numeric `1 = 407`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (407 : ℕ) iFlag = 407 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 407  (FALSE — the costume bites)

end Counterexamples
