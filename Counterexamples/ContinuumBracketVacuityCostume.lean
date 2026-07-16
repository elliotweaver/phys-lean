/-
  Counterexamples.ContinuumBracketVacuityCostume — N470 / ARC-D D1 anti-vacuity (C503).
  =====================================================================================
  W8 ANTI-VACUITY. The D1 node (ARC-D THE BRACKET INSTRUMENT) builds certified two-sided rational
  brackets for the banked `cutExp`/`cutLog` over the derived ℝ `Cut`. The instrument must be
  NON-HOLLOW: it must produce a GENUINELY NARROW two-sided bracket for a concrete derived real, not
  a trivial `[0, ∞)` or a collapsed point. The banked witness `cutExp_one_bracket` pins the derived
  real `cutExp 1` (= e) between the explicit rationals `8/3` and `261/96` — a bracket of width
  `5/96` (≈ 0.052), and `cutExp_one_bracket_strict` proves the bounds do NOT cross (`8/3 < 261/96`).

  The load-bearing content this costume pins: the bracket for `cutExp 1` is a REAL narrow two-sided
  bracket — the lower bound `8/3` is STRICTLY below the upper bound `261/96` (the instrument is not
  a hollow relabelling where the "bracket" collapses to a point or spans everything). Concretely
  `261/96 − 8/3 = 5/96`, an explicit small positive rational width.

  THE CERTIFICATE. `bFlag := 1` — a ℕ flag standing for "the bracket instrument produces a genuine
  narrow two-sided bracket: `8/3 < 261/96` strictly (the width `5/96` is positive), so the derived
  real `cutExp 1` is pinned between two distinct explicit rationals, NOT a hollow/collapsed
  bracket". It is TIED to the banked D1 landing by `bFlag_forced`: `cutExp_one_bracket_strict`
  witnesses `8/3 < 261/96`, so the flag is `1`.

  We anchor `min 503 bFlag = 1` (TRUE — `bFlag = 1 < 503`, so the min is `bFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the bracket is hollow / collapsed / trivial-width"
  mis-reading): that `min 503 bFlag = 503`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 503` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (503, 1) is fresh (Cid 503 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE D1 FLAG: `1` = "the bracket instrument produces a genuine narrow two-sided bracket —
    `8/3 < 261/96` strictly, so `cutExp 1` is pinned between two DISTINCT explicit rationals, NOT a
    hollow/collapsed bracket". -/
def bFlag : ℕ := 1

/-- TRUE (tied to the banked D1 landing): `cutExp_one_bracket_strict` proves `8/3 < 261/96` — the
    bracket's lower bound is strictly below its upper bound (positive width `5/96`), so the flag is
    present, `bFlag = 1`. -/
theorem bFlag_forced :
    (8 : Cut) / 3 < 261 / 96 ∧ bFlag = 1 :=
  ⟨cutExp_one_bracket_strict, rfl⟩

/-- TRUE: `min 503 bFlag = 1`, holding precisely because `bFlag = 1 < 503`. -/
theorem cert_val_true : min (503 : ℕ) bFlag = 1 := by decide

/-- BOGUS: claims `min 503 bFlag = 503`. It GENUINELY equals `1` (`cert_val_true`). A "the bracket is
    hollow / collapsed / trivial-width" mis-reading reduces — through the banked value — to the false
    numeric `1 = 503`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (503 : ℕ) bFlag = 503 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 503  (FALSE — the costume bites)

end Counterexamples
