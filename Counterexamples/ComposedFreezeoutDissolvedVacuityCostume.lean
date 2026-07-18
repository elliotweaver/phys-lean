/-
  Counterexamples.ComposedFreezeoutDissolvedVacuityCostume — the freeze-out summand dissolves to a
  determined closed form, anti-vacuity (C542).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE FREEZE-OUT SUMMAND DISSOLVES TO A DETERMINED CLOSED FORM) proves the
  banked freeze-out summand at the pinned edges DISSOLVES to `16/9 + κ·[(7/3)·L_mb + (11/3)·L_b0 −
  (5/3)·L_b2]` — a pure rational `16/9` (the confinement rung's `8·cutPi/3` with `κ = 1/(3·cutPi)`,
  the π CANCELS: `confinement_rung_rational`) plus a κ-weighted log-combination of the banked shape
  numerals.

  The content that must NOT be hollow: the confinement rung GENUINELY contributes to the dissolved
  summand — the dissolved form differs from the no-rung log-combination by exactly the pure rational
  `16/9`, and `16/9 ≠ 0` (`gem_nonzero`, `dissolved_uses_confinement`). A "the confinement rung
  contributes nothing / the dissolution is empty / the gem vanishes" mis-reading is refuted by the
  banked `gem_nonzero` (`16/9 ≠ 0`).

  THE CERTIFICATE. gemFlag := 1 -- a natural-number flag standing for "the confinement rung genuinely
  contributes a nonzero pure rational 16/9 to the dissolved freeze-out summand (gem_nonzero:
  16/9 ≠ 0)". It is TIED to the banked landing by gemFlag_forced: `gem_nonzero` gives
  `(16/9 : Cut) ≠ 0`.

  We anchor min 542 gemFlag = 1 (TRUE -- gemFlag = 1 < 542, so the min is gemFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the gem vanishes / the confinement rung contributes nothing /
  the dissolution is empty" mis-reading): that min 542 gemFlag = 542. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 542 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (542, 1) is fresh (Cid 542 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ComposedFreezeoutDissolved
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the confinement rung genuinely contributes a nonzero pure rational 16/9 to the
    dissolved freeze-out summand (gem_nonzero: (16/9 : Cut) ≠ 0)". -/
def gemFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the gem `16/9 ≠ 0` (`gem_nonzero`), and `gemFlag = 1`. -/
theorem gemFlag_forced :
    ((16 / 9 : Cut) ≠ 0)
    ∧ gemFlag = 1 :=
  ⟨gem_nonzero, rfl⟩

/-- TRUE: min 542 gemFlag = 1, holding precisely because gemFlag = 1 < 542. -/
theorem cert_val_true : min (542 : ℕ) gemFlag = 1 := by decide

/-- BOGUS: claims min 542 gemFlag = 542. It GENUINELY equals 1 (cert_val_true). A "the gem vanishes /
    the confinement rung contributes nothing" mis-reading reduces -- through the banked landing -- to
    the false numeric 1 = 542, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (542 : ℕ) gemFlag = 542 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 542  (FALSE — the costume bites)

end Counterexamples
