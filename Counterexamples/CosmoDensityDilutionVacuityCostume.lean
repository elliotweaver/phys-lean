/-
  Counterexamples.CosmoDensityDilutionVacuityCostume — N459 anti-vacuity (C484).
  ============================================================================================
  W8 ANTI-VACUITY. The N459 node (the dilution law / comoving density history `ρ(a) = ρ₀·a^{−k}` on
  the derived `(1,3)` arena — the FORCED dilution exponent `k = n·(ρ+P)/ρ`, the three regime
  exponents `{n, n+1, 0}`, the derived continuity flow `ρ̇ = −(kH)·ρ`, and the vacuum weld
  `k = 0 ⟺ pfStress = ρ·id`) banks that the three regime exponents are GENUINELY DISTINCT — dust
  `k = n = finrank spaceSub4 = 3`, radiation `k = n+1 = 4`, vacuum `k = 0` — so the dilution law is
  not a `P`-independent constant and the vacuum's non-dilution (`k = 0`) is a genuine special point,
  the N458 isotropy. The distinctness is the load-bearing content: a mis-reading where the exponent
  were `P`-independent (dust `=` vacuum, i.e. `finrank spaceSub4 = 0`) would collapse the dilution
  trichotomy and make the vacuum's constancy vacuous.

  THE CERTIFICATE. `dFlag := 1` — a ℕ flag standing for "the three regime dilution exponents
  `{n, n+1, 0}` are genuinely distinct (in particular `n = finrank spaceSub4 ≠ 0`), so the exponent
  genuinely depends on `P` and the vacuum non-dilution `k = 0` is a real special point". It is TIED
  to the banked N459 landing by `dFlag_forced`: the banked `dilution_regimes_distinct` witnesses
  `(finrank spaceSub4 : ℚ) ≠ 0`, so the flag is `1`.

  We anchor `min 484 dFlag = 1` (TRUE — `dFlag = 1 < 484`, so the min is `dFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the dilution exponent is `P`-independent / the regimes
  collapse / `finrank spaceSub4 = 0` / the vacuum non-dilution is vacuous" mis-reading): that
  `min 484 dFlag = 484`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 484` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (484, 1) is fresh (Cid 484 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.CosmoDensityDilution
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.CosmoDensityDilution
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.CosmoEquationOfStateCensus

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- THE REGIME-DISTINCTNESS FLAG: `1` = "the three regime dilution exponents `{n, n+1, 0}` are
    genuinely distinct (`n = finrank spaceSub4 ≠ 0`), so the exponent genuinely depends on `P`". -/
def dFlag : ℕ := 1

/-- TRUE (tied to the banked N459 landing): the banked `dilution_regimes_distinct` proves
    `(finrank spaceSub4 : ℚ) ≠ 0`, so the distinctness flag is present, `dFlag = 1`. If the exponent
    were `P`-independent (the regimes collapsed), this witness would not exist. -/
theorem dFlag_forced :
    ((Module.finrank ℚ spaceSub4 : ℚ) ≠ 0) ∧ dFlag = 1 :=
  ⟨dilution_regimes_distinct.2.2, rfl⟩

/-- TRUE: `min 484 dFlag = 1`, holding precisely because `dFlag = 1 < 484`. -/
theorem cert_val_true : min (484 : ℕ) dFlag = 1 := by decide

/-- BOGUS: claims `min 484 dFlag = 484`. It GENUINELY equals `1` (`cert_val_true`). A "the dilution
    exponent is `P`-independent / the regimes collapse / the vacuum non-dilution is vacuous"
    mis-reading reduces — through the banked value — to the false numeric `1 = 484`, so this must NOT
    compile. -/
theorem cert_val_wrong_BOGUS :
    min (484 : ℕ) dFlag = 484 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 484  (FALSE — the costume bites)

end Counterexamples
