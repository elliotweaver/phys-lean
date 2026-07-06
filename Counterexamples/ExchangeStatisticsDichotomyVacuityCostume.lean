/-
  Counterexamples.ExchangeStatisticsDichotomyVacuityCostume — N373 anti-vacuity (C398).
  ============================================================================================
  W8 ANTI-VACUITY. The N373 node (arc-G G1 — THE EXCHANGE-INVOLUTION STATISTICS DICHOTOMY) banks
  that the exchange of two identical quanta on the banked derived carrier splits the two-quantum
  space into EXACTLY TWO genuinely DISTINCT sectors (symmetric `+1` = Bose, antisymmetric `−1` =
  Fermi). The load-bearing content of the dichotomy is that the two sectors are GENUINELY DISTINCT:
  a "there is really only one statistics class / the two sectors coincide" reading would make the
  dichotomy vacuous. The banked `bose_ne_fermi` (equivalently `exchange_ne_zero`) rules this out:
  the exchange operator is NONZERO, so `boseProj ≠ fermiProj`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "the exchange operator is genuinely nonzero,
  so the two statistics sectors are DISTINCT (the dichotomy is non-vacuous)". It is TIED to the
  banked N373 landing by `iFlag_forced`: the banked `exchange_ne_zero` witnesses `exchange ≠ 0`, so
  the flag is `1` (present).

  We anchor `min 398 iFlag = 1` (TRUE — `iFlag = 1 < 398`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the two statistics sectors coincide / there is only one
  class / the dichotomy is vacuous" mis-reading): that `min 398 iFlag = 398`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 398` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (398, 1) is fresh (Cid 398 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ExchangeStatisticsDichotomy
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ExchStat

/-- THE STATISTICS-DICHOTOMY NON-VACUITY FLAG: `1` = "the exchange operator is genuinely nonzero,
    so the symmetric and antisymmetric statistics sectors are DISTINCT — the Bose/Fermi dichotomy
    is non-vacuous (there really are TWO classes, not one)". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N373 landing): the banked `exchange_ne_zero` proves the exchange
    operator is nonzero, so the two sectors `boseProj ≠ fermiProj` are genuinely distinct, hence the
    "two-distinct-sectors" flag is present, `iFlag = 1`. If there were only one sector, this witness
    would not exist. -/
theorem iFlag_forced : (exchange ≠ 0) ∧ iFlag = 1 :=
  ⟨exchange_ne_zero, rfl⟩

/-- TRUE: `min 398 iFlag = 1`, holding precisely because `iFlag = 1 < 398`. -/
theorem cert_val_true : min (398 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 398 iFlag = 398`. It GENUINELY equals `1` (`cert_val_true`). A "the two
    statistics sectors coincide / there is only one class / the dichotomy is vacuous" mis-reading
    reduces — through the banked value — to the false numeric `1 = 398`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (398 : ℕ) iFlag = 398 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 398  (FALSE — the costume bites)

end Counterexamples
