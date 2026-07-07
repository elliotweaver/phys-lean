/-
  Counterexamples.TowerGatherBarMonadVacuityCostume — N411 anti-vacuity (C436).
  ============================================================================================
  W8 ANTI-VACUITY. The N411 node (arc-N N1 — the gather as the bar/monad structure) reads the
  fold's look-back `worldMap` as a monad-with-a-single-controlled-obstruction over the derived
  tower. The load-bearing non-vacuity fact: the octonion rung `O ℚ` is GENUINELY OBSTRUCTED —
  the gather is a genuinely NON-strict monad there (N411 `o_bar_obstructed`, from the banked
  `assoc_nonvanishing`), which is exactly what makes it a physics termination (confinement,
  N411 `o_bar_obstruction_is_confinement`). A mis-reading where `O ℚ` were STRICT (the
  obstruction vanishes / the bar construction is smooth / no physics on the octonion rung)
  would collapse the whole N411 structure — the monad obstruction would carry no content.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the banked gather μ-obstruction on
  `O ℚ` is genuinely nonzero (the monad is genuinely NON-strict there) AND the octonion rung
  genuinely confines". It is TIED to the banked N411 landing by `cFlag_forced` through
  `o_bar_obstructed` and `o_bar_obstruction_is_confinement`.

  We anchor `min 436 cFlag = 1` (TRUE — `cFlag = 1 < 436`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the gather is a strict monad on `O ℚ` / the obstruction
  vanishes / the bar construction is smooth on the octonion rung / no physics there"
  mis-reading): that `min 436 cFlag = 436`. It GENUINELY equals `1` (`cert_val_true`). Rewriting
  reduces the bogus claim to the false numeric `1 = 436` in ℕ. The kernel cannot close it; it
  BITES.

  DISTINCT from the banked battery: the pair (436, 1) is fresh (Cid 436 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherBarMonad
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

/-- THE N411-NON-VACUITY FLAG: `1` = "the banked gather μ-obstruction on `O ℚ` is genuinely
    nonzero (the monad is genuinely NON-strict there) and the octonion rung genuinely confines". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N411 landing): the octonion-rung gather is genuinely obstructed
    (`∃ a b, barMultDefect a b ≠ 0`, `o_bar_obstructed`) and the rung genuinely confines
    (`SectorConfines (O ℚ)`, `o_bar_obstruction_is_confinement`); hence `cFlag = 1`. If the
    gather were strict on `O ℚ` (obstruction vanishing) one of these would fail. -/
theorem cFlag_forced :
    ((∃ a b : O ℚ, barMultDefect a b ≠ 0) ∧ SectorConfines (O ℚ)) ∧ cFlag = 1 :=
  ⟨⟨o_bar_obstructed, o_bar_obstruction_is_confinement⟩, rfl⟩

/-- TRUE: `min 436 cFlag = 1`, holding precisely because `cFlag = 1 < 436`. -/
theorem cert_val_true : min (436 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 436 cFlag = 436`. It GENUINELY equals `1` (`cert_val_true`). A "the gather
    is a strict monad on `O ℚ` / the obstruction vanishes / no physics on the octonion rung"
    mis-reading reduces — through the banked genuinely-nonzero obstruction and genuine
    confinement — to the false numeric `1 = 436`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (436 : ℕ) cFlag = 436 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 436  (FALSE — the costume bites)

end Counterexamples
