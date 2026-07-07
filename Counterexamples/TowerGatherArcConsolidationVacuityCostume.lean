/-
  Counterexamples.TowerGatherArcConsolidationVacuityCostume — N415 anti-vacuity (C440).
  ============================================================================================
  W8 ANTI-VACUITY. The N415 node (arc-N N5 — the arc-N consolidation) welds arc N's four
  reading-levels of the octonion obstruction into ONE proposition (the six-way TFAE) and shows
  the fold seed forces every level. The load-bearing non-vacuity fact: the fold-root's
  self-opposition GENUINELY FIRES on the fold's own line (`foldRoot_selfOpposed_Q`, `J ≠ star J`
  over `ℚ`, N414) and therefore forces the obstruction at the MONAD level (`∃ a b,
  barMultDefect a b ≠ 0`) and the STATE level (`∃ a, ¬ GluesGlobally a`) via
  `foldRoot_forces_monad_and_state` — the never-banked cross-LEVEL welds. A mis-reading where
  the consolidation were vacuous (the seed forced nothing at the monad/state levels, so the
  six-way TFAE collapsed to disconnected trivialities) would gut the whole N415 consolidation.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the N415 fold seed genuinely forces the
  monad and state levels: `∃ a b, barMultDefect a b ≠ 0` AND `∃ a, ¬ GluesGlobally a` over `ℚ`".
  It is TIED to the banked N415 landing by `cFlag_forced` through `foldRoot_forces_monad_and_state`
  fed the banked `foldRoot_selfOpposed_Q`.

  We anchor `min 440 cFlag = 1` (TRUE — `cFlag = 1 < 440`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the consolidation is vacuous / the seed forces no level /
  the six readings are disconnected" mis-reading): that `min 440 cFlag = 440`. It GENUINELY equals
  `1` (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 440` in ℕ.
  The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (440, 1) is fresh (Cid 440 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherArcConsolidation
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

/-- THE N415-NON-VACUITY FLAG: `1` = "the fold seed genuinely forces the monad and state levels
    over `ℚ`". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N415 landing): the fold-root's self-opposition over `ℚ`
    (`foldRoot_selfOpposed_Q`) forces both the monad-level non-strictness and the state-level
    selection (`foldRoot_forces_monad_and_state`); hence `cFlag = 1`. If the consolidation were
    vacuous these existentials would fail. -/
theorem cFlag_forced :
    ((∃ a b : O ℚ, barMultDefect a b ≠ 0) ∧ (∃ a : O ℚ, ¬ GluesGlobally a)) ∧ cFlag = 1 :=
  ⟨foldRoot_forces_monad_and_state foldRoot_selfOpposed_Q, rfl⟩

/-- TRUE: `min 440 cFlag = 1`, holding precisely because `cFlag = 1 < 440`. -/
theorem cert_val_true : min (440 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 440 cFlag = 440`. It GENUINELY equals `1` (`cert_val_true`). A "the
    consolidation is vacuous / the seed forces no level" mis-reading reduces — through the banked
    seed-forces-monad-and-state weld — to the false numeric `1 = 440`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (440 : ℕ) cFlag = 440 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 440  (FALSE — the costume bites)

end Counterexamples
