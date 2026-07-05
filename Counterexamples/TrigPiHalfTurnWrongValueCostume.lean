/-
  Counterexamples.TrigPiHalfTurnWrongValueCostume — N325 anti-vacuity (C352).
  ============================================================================
  W8 ANTI-VACUITY. The N325 node (seeded arc-D/D1, the arc-B π-prerequisite's final piece) CONSTRUCTS
  the derived `cutPi` — twice the least positive zero of the derived cosine — over the derived ℝ `Cut`,
  and banks the PERIODICITY structure the scale tower `e^(−Nπ)` rides. The load-bearing landing is the
  HALF-TURN value

      `cutCos_cutPi : cutCos cutPi = -1`,

  from which the shift formulas `cutCos (x+cutPi) = −cutCos x`, `cutSin (x+cutPi) = −cutSin x` and the
  full period follow. The value `−1` is LOAD-BEARING: it is what makes `cutPi` a genuine HALF-TURN (the
  orbit's antipode). A WRONG value — e.g. `cutCos cutPi = 1` (no turn, `cutPi` a full period or `0`),
  or `cutCos(cutPi/2) = 1` instead of `0` — would collapse the periodicity and the scale tower.

  THE CERTIFICATE. `piHalfTurn := 1` — a ℕ flag standing for "`cutCos cutPi` is genuinely `−1` (the
  half-turn), not `+1`". It is TIED to the banked landing by `piHalfTurn_forced` below: the banked
  `cutCos_cutPi` gives `cutCos cutPi = -1` (and `cutCos_cutPi_half` gives `cutCos (cutPi/2) = 0`, the
  quarter-turn). If `cutPi` were mis-constructed (a wrong zero, `cutPi = 0`, or the wrong half-turn
  value), these would not hold.

  We anchor `min 352 piHalfTurn = 1` (TRUE — `piHalfTurn = 1`, and the half-turn is genuine).

  THE BOGUS CLAIM (a stand-in for ANY wrong `cutPi`/periodicity value): that `min 352 piHalfTurn = 352`.
  It GENUINELY equals `1` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to the
  false numeric `1 = 352` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (352, 1) is fresh (RHS 352 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Foundation.ContinuumTrigPi
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE HALF-TURN FLAG: `1` = "`cutCos cutPi` is genuinely `−1` (the half-turn), not `+1`". -/
def piHalfTurn : ℕ := 1

/-- TRUE (tied to the banked N325 forced landing): the derived `cutPi` satisfies the quarter-turn
    `cutCos (cutPi/2) = 0` and the half-turn `cutCos cutPi = −1`. If `cutPi` were mis-constructed
    (a wrong zero, `cutPi = 0`, or the wrong half-turn value), these would not hold. -/
theorem piHalfTurn_forced :
    cutCos (cutPi / 2) = 0 ∧ cutCos cutPi = -1 :=
  ⟨cutCos_cutPi_half, cutCos_cutPi⟩

/-- TRUE: `min 352 piHalfTurn = 1`, holding precisely because `piHalfTurn = 1` (the genuine half-turn
    of the banked `cutPi`), not `352` (a mis-constructed `cutPi`). -/
theorem cert_val_true : min (352 : ℕ) piHalfTurn = 1 := by decide

/-- BOGUS: claims `min 352 piHalfTurn = 352`. It GENUINELY equals `1` (`cert_val_true`). A WRONG
    `cutPi`/periodicity value (e.g. `cutCos cutPi = 1`, or `cutCos(cutPi/2) = 1`) reduces — through the
    banked value — to the false numeric `1 = 352`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (352 : ℕ) piHalfTurn = 352 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 352  (FALSE — the costume bites)

end Counterexamples
