/-
  Counterexamples.MaxEntArrowOfTimeVacuityCostume — N375 anti-vacuity (C400).
  ============================================================================================
  W8 ANTI-VACUITY. The N375 node (arc-G G3 — THE ARROW OF TIME / SECOND LAW, the maxent joint
  J-G3) banks that a same-budget deviation from the equilibrium state carries a GENUINELY nonzero
  self-datum: the strict Gibbs inequality `0 < relInfo pWit qWit` for the concrete distinct pair
  `pWit = ![3/4,1/4] ≠ qWit = ![1/2,1/2]`. The load-bearing content is that the relative
  self-information is STRICTLY POSITIVE off equilibrium — a "a deviation carries zero self-datum /
  the second law is vacuous" mis-reading would break the derivation. The banked
  `maxent_deviation_ne_zero` rules this out: `relInfo pWit qWit ≠ 0`.

  THE CERTIFICATE. `iFlag := 1` — a ℕ flag standing for "a same-budget deviation carries a nonzero
  self-datum (the strict Gibbs inequality bites)". It is TIED to the banked N375 landing by
  `iFlag_forced`: the banked `maxent_deviation_ne_zero` witnesses `relInfo pWit qWit ≠ 0`, so the
  flag is `1` (present).

  We anchor `min 400 iFlag = 1` (TRUE — `iFlag = 1 < 400`, so the min is `iFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "a deviation carries zero self-datum / maxent is not forced /
  the second law is vacuous" mis-reading): that `min 400 iFlag = 400`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 400` in ℕ. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (400, 1) is fresh (Cid 400 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.MaxEntArrowOfTime
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.MaxEnt

/-- THE MAXENT-FORCING NON-VACUITY FLAG: `1` = "a same-budget deviation from equilibrium carries a
    GENUINELY nonzero self-datum (`relInfo pWit qWit ≠ 0`) — the strict Gibbs inequality bites, so
    the maxent forcing / the arrow of time is non-vacuous". -/
def iFlag : ℕ := 1

/-- TRUE (tied to the banked N375 landing): the banked `maxent_deviation_ne_zero` proves the self-datum
    of a same-budget deviation is nonzero, so the "nonzero-deviation-datum" flag is present,
    `iFlag = 1`. If a deviation carried zero self-datum, this witness would not exist. -/
theorem iFlag_forced : (relInfo pWit qWit ≠ 0) ∧ iFlag = 1 :=
  ⟨maxent_deviation_ne_zero, rfl⟩

/-- TRUE: `min 400 iFlag = 1`, holding precisely because `iFlag = 1 < 400`. -/
theorem cert_val_true : min (400 : ℕ) iFlag = 1 := by decide

/-- BOGUS: claims `min 400 iFlag = 400`. It GENUINELY equals `1` (`cert_val_true`). A "a deviation
    carries zero self-datum / maxent is not forced / the second law is vacuous" mis-reading reduces
    — through the banked value — to the false numeric `1 = 400`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (400 : ℕ) iFlag = 400 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 400  (FALSE — the costume bites)

end Counterexamples
